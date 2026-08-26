#!smake
# Universal IRIX smake Skeleton
# -----------------------------

# Toolchain Definitions (Adjust for MIPSpro or GCC)
# For IRIX MIPSpro, CC is usually 'cc', CXX is 'CC'
CC       = cc
CXX      = CC
LD       = cc
AR       = ar

# Configuration
DEBUG    = 0

# Global Flags
# -I.: Include current directory
CPPFLAGS = -I. -I../include -I../src -D_SGI_MP_SOURCE

ABI_FLAGS = -mips3 -n32

#if $(DEBUG) == "1"
    OPT_FLAGS = -g -DDEBUG -D_DEBUG
#else
    OPT_FLAGS = -O2 -DNDEBUG
#endif

CFLAGS   = $(ABI_FLAGS) $(OPT_FLAGS) -c99 -woff 1185,1209,3968,3970
CXXFLAGS = $(ABI_FLAGS) $(OPT_FLAGS)
LDFLAGS  = $(ABI_FLAGS)
LIBS     = -lm -laudio -lpthread

# --- User Customization Section ---

# Define per-directory flags here (format: DIR_NAME_FLAGS, replace ./- with _)
# Example: core_CFLAGS = -DDEBUG_CORE
# core_CFLAGS = 

# Define per-target flags here
# Example: myapp_LDFLAGS = -L/usr/local/lib
# myapp_LDFLAGS = 

# ----------------------------------

# Default target must be first
default: all

# Include the generated object definitions and rules
include objs.mk

../include/SDL_revision.h:
	@if [ ! -f ../include/SDL_revision.h ]; then \
		echo "#define SDL_REVISION \"IRIX-Port\"" > ../include/SDL_revision.h; \
		echo "#define SDL_REVISION_NUMBER 0" >> ../include/SDL_revision.h; \
	fi

# Main Targets
all: ../include/SDL_revision.h $(ALL_TARGETS)

clean:
	rm -f $(ALL_TARGETS) $(ALL_CLEAN_OBJS)
	rm -rf objs
	rm -f ../include/SDL_revision.h

# Force regeneration if project.def changes
objs.mk: project.def gen.sh
	./gen.sh

.PHONY: all clean default
