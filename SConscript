Import('RTT_ROOT')
Import('rtconfig')
from building import *

cwd = GetCurrentDir()

src = Glob('core/*.cpp')

if GetDepend('NAXOS_USING_SEND_MORE_MONEY_EXAMPLE'):
    src += Glob('examples/send_more_money.cpp')

if GetDepend('NAXOS_USING_N_QUEENS_EXAMPLE'):
    src += Glob('examples/nqueens.cpp')

CPPPATH = [cwd, ]
CPPPATH += [cwd + '/core']

LOCAL_CPPFLAGS = ''
if rtconfig.CROSS_TOOL == 'gcc':
    LOCAL_CPPFLAGS += ' -std=c++11'

group = DefineGroup('naxos', src, depend = ['PKG_USING_NAXOS'], CPPPATH = CPPPATH, LOCAL_CCFLAGS=LOCAL_CPPFLAGS )

Return('group')






