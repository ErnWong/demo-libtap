# Based on the Universal C Makefile,
# originally for MCU targets

ROOT=..

# Include common aspects of this project
-include $(ROOT)/common.mk

.PHONY: all run

all: $(BINDIR) $(BINDIR_TEST) $(OUT_TEST) run

run: $(OUT_TESTS)
	$(foreach test, $(OUT_TEST), @$(test))

$(BINDIR_TEST):
	-@mkdir -p $(BINDIR_TEST)

$(BINDIR):
	-@mkdir -p $(BINDIR)

$(OUT_TEST): $(BINDIR_TEST)/%$(EXESUFFIX): $(BINDIR)/%.$(OEXT) $(BINDIR_TEST)/%.$(OEXT_TEST) $(LIBOBJ_TEST)
	@echo LN $^ to $@
	@$(CC) $(LDFLAGS) $^ -o $@

$(COBJ): $(BINDIR)/%.$(OEXT): $(SRCDIR)/%.$(CEXT) $(HEADERS)
	@echo CC $(INCLUDE) $<
	@$(CC) $(INCLUDE) $(CFLAGS) -o $@ $<

$(TESTOBJ): $(BINDIR_TEST)/%.$(OEXT_TEST): $(SRCDIR_TEST)/%.$(CEXT_TEST) $(HEADERS)
	@echo CC $(INCLUDE) $<
	@$(CC) $(INCLUDE) $(CFLAGS) -o $@ $<

$(LIBOBJ_TEST): $(LIBSRC_TEST) $(HEADERS)
	@echo CC $(INCLUDE) $<
	@$(CC) $(INCLUDE) $(CFLAGS) -o $@ $<
