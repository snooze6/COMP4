import os

if __name__=='__main__':
    flags = ['-O0', '-O1', '-O2', '-O3', '-Os']
    name = 'main'

    for flag in flags:
        os.system('gcc '+name+'.c '+flag)
        os.system('a.exe')
        os.system('mv a.exe '+name+flag)
        break