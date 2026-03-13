## Compile helloworld.c
gcc -O0 -S -m32 helloworld.c

## Compile helloworld.c
gcc -O4 -S -m32 helloworld.c -o helloworld_O4.s

# Compile HelloWorld.c
gcc -O0 -S -m32 HelloWorld.c -o HelloWorld_c.s

# Compile HelloWorldCpp.cpp
g++ -O0 -S -m32 HelloWorldCpp.cpp -o HelloWorld_cpp.s

## Compile while.c
gcc -O0 -S while.c -o while.s

## Compile max_array.s
gcc -m32 -no-pie max_array.s -o max_array

## Run max_array.s
./max_array