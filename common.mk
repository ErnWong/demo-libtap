# Universal C Makefile for MCU targets
# Top-level template file to configure build

# Based on the Universal C Makefile,
# originally for MCU targets

# Advanced options
CEXT=c
HEXT=h
INCLUDE=-I$(ROOT)/include -I$(ROOT)/src
OUTNAME=foobar.exe

# Flags for programs
CCFLAGS:=-c -Wall -Os -ffunction-sections -fsigned-char -fomit-frame-pointer -fsingle-precision-constant
CFLAGS:=$(CCFLAGS) -std=gnu99 -Werror=implicit-function-declaration
LDFLAGS:=-Wall -Wl,--gc-sections

# Tools
CC:=gcc
