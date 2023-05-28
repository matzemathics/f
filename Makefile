# this file references the design from
# https://stackoverflow.com/questions/42357101/how-to-create-and-run-a-make-file-for-c

# The name of the source files
SOURCES = main.c

# The name of the executable
EXE = build/f

# Flags for compilation (adding warnings are always good)
CFLAGS = -Wall

# Flags for linking (none for the moment)
LDFLAGS =

# Libraries to link with (none for the moment)
LIBS =

# Use the gcc frontend when linking
LD = gcc

# Use gcc for compiling
CC = gcc

# This creates a list of object files from the source files
OBJECTS = $(SOURCES:%.c=build/%.o)

# Directory, to build in

# The first target, this will be the default target if none is specified
# This target tells "make" to make the "all" target
default: all

# Having an "all" target is customary, so one could write "make all"
# It depends on the executable program
all: $(EXE)

# This will link the executable from the object files
$(EXE): $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) -o $(EXE) $(LIBS)

# This is a target that will compile all needed source files into object files
# We don't need to specify a command or any rules, "make" will handle it automatically
build/%.o: %.c
	mkdir -p ${dir $@}
	$(CC) $(CFLAGS) -o $@ -c $<

# Target to clean up after us
clean:
	-rm -f $(EXE)      # Remove the executable file
	-rm -f $(OBJECTS)  # Remove the object files

# Install into $HOME/.local/bin
install: $(EXE)
	-cp $(EXE) $(HOME)/.local/bin
