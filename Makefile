#the compiler: gcc for C program, define as g++ for C++
CC = g++

# compiler flags:
#  -g: this flag adds debugging information to the executable file
#  -Wall: this flag is used to turn on most compiler warnings
#  -Wextra: additional warnings beyond -Wall.
#  -Werror: Treats warnings as errors, causing the build to fail if any warnings
#  -Wshadow: warn about variable shadowing. 
#            This occurs when a variable with the same name as a previously 
#            declared variable is declared within a nested scope, potentially obscuring the outer variable. 
#  -Wformat-security: ??
CFLAGS  = -g -H -v -Wall -Werror -Wextra -Wpedantic -Wunused -Wshadow -Wformat-security

# The build target 
TARGET = main

# all target has a prerequisite "main". Command "make" looks for a rule to create main
#all: main
all: $(TARGET)

# the rule "main" has two prequisite main.o and Solution.o
$(TARGET): main.o Solution.o
	$(CC) $(CFLAGS) -o main main.o Solution.o

# the target Solution.o depeneds on Soluiton.cpp
Solution.o: Solution.cpp Solution.h
	$(CC) $(CFLAGS) -c Solution.cpp

# the target main.o depends on main.cpp
main.o: main.cpp
	$(CC) $(CFLAGS) -c main.cpp

# it prevents make from confusing the phony target with the file name "clean" 
.PHONY: clean

clean:
	rm -rf *.o
