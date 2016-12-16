import os

if __name__ == "__main__":
    print('Hello world')
    name = 'new.c'
    os.system('gcc -c '+name+' -O0 -o '+name+'00.exe')
    os.system('gcc -c '+name+' -O1 -o '+name+'01.exe')
    os.system('gcc -c '+name+' -O2 -o '+name+'02.exe')
    os.system('gcc -c '+name+' -O3 -o '+name+'03.exe')
    os.system('gcc -c '+name+' -Os -o '+name+'0s.exe')

    os.system(name+'00.exe')
    os.system(name+'01.exe')
    os.system(name+'02.exe')
    os.system(name+'03.exe')
    os.system(name+'0s.exe')