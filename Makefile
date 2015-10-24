# Based on the Universal C Makefile,
# originally for MCU targets

ROOT=.
# Binary output directory
BINDIR=$(ROOT)/bin
SRCDIR=$(ROOT)/src

# Include common aspects of this project
-include $(ROOT)/common.mk

HEADERS:=$(wildcard *.$(HEXT))
CSRC=$(wildcard $(SRCDIR)/*.$(CEXT))
COBJ:=$(patsubst $(SRCDIR)/%.o,$(BINDIR)/%.o,$(CSRC:.$(CEXT)=.o))
OUT:=$(BINDIR)/$(OUTNAME)

.PHONY: all clean

all: $(BINDIR) $(OUT)

clean:
	-rm -f $(OUT)
	-rm -rf $(BINDIR)

$(BINDIR):
	-@mkdir -p $(BINDIR)

$(OUT): $(COBJ)
	@echo LN $(BINDIR)/*.o to $@
	@$(CC) $(LDFLAGS) $(BINDIR)/*.o -o $@

$(COBJ): $(BINDIR)/%.o: $(SRCDIR)/%.$(CEXT) $(HEADERS)
	@echo CC $(INCLUDE) $<
	@$(CC) $(INCLUDE) $(CFLAGS) -o $@ $<
