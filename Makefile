# Based on the Universal C Makefile,
# originally for MCU targets

ROOT=.

# Include common aspects of this project
-include $(ROOT)/common.mk

.PHONY: all clean test _force_look

all: $(BINDIR) $(OUT)

clean:
	-rm -f $(OUT)
	-rm -rf $(BINDIR)
	-rm -rf $(BINDIR_TEST)

test: $(SRCDIR_TEST)

_force_look:
	@true

$(SRCDIR_TEST): %: _force_look
	@$(MAKE) --no-print-directory -C $@

$(BINDIR):
	-@mkdir -p $(BINDIR)

$(OUT): $(COBJ)
	@echo LN $(BINDIR)/*.$(OEXT) to $@
	@$(CC) $(LDFLAGS) $(BINDIR)/*.$(OEXT) -o $@

$(COBJ): $(BINDIR)/%.o: $(SRCDIR)/%.$(CEXT) $(HEADERS)
	@echo CC $(INCLUDE) $<
	@$(CC) $(INCLUDE) $(CFLAGS) -o $@ $<
