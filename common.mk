# Based on the Universal C Makefile,
# originally for MCU targets

BINDIR = $(ROOT)/bin
SRCDIR = $(ROOT)/src
INCDIR = $(ROOT)/include
SRCDIR_TEST = $(ROOT)/tests
BINDIR_TEST = $(ROOT)/tests/bin
LIBDIR_TEST = $(ROOT)/tests/libtap

LIBSRC_TEST = $(LIBDIR_TEST)/tap.c
LIBOBJ_TEST = $(BINDIR_TEST)/tap.o

# Advanced options
CEXT = c
HEXT = h
OEXT = o
CEXT_TEST = test.c
OEXT_TEST = test.o
ifeq ($(OS),Windows_NT)
	EXESUFFIX = .exe
else
	EXESUFFIX =
endif

HEADERS := \
	$(wildcard $(SRCDIR)/*.$(HEXT)) \
	$(wildcard $(INCDIR)/*.$(HEXT)) \
	$(wildcard $(LIBDIR_TEST)/*.$(HEXT))

CSRC = $(wildcard $(SRCDIR)/*.$(CEXT))
COBJ:= $(patsubst $(SRCDIR)/%.$(CEXT), $(BINDIR)/%.$(OEXT), $(CSRC))

TESTSRC = $(wildcard $(SRCDIR_TEST)/*.$(CEXT_TEST))
TESTOBJ:= $(patsubst $(SRCDIR_TEST)/%.$(CEXT_TEST), $(BINDIR_TEST)/%.$(OEXT_TEST), $(TESTSRC))

INCLUDE = \
	-I$(INCDIR) \
	-I$(SRCDIR) \
	-I$(LIBDIR_TEST)

OUTNAME = foobar$(EXESUFFIX)
OUT := $(BINDIR)/$(OUTNAME)
OUT_TEST := $(patsubst %.$(OEXT_TEST), %$(EXESUFFIX), $(TESTOBJ))

# Flags for programs
CCFLAGS:=-c -Wall -Os -ffunction-sections -fsigned-char -fomit-frame-pointer -fsingle-precision-constant
CFLAGS:=$(CCFLAGS) -std=gnu99 -Werror=implicit-function-declaration
LDFLAGS:=-Wall -Wl,--gc-sections

# Tools
CC:=gcc
