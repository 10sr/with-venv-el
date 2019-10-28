# -*- Makefile -*-

EMACS = emacs

PROJECT_ROOT_DIR = $(CURDIR)
ERT_TESTS = $(wildcard $(PROJECT_ROOT_DIR)/tests/*.el)

# Compile with noninteractive and relatively clean environment.
BATCHFLAGS = -batch -q --no-site-file -L $(PROJECT_ROOT_DIR) -L $(PROJECT_ROOT_DIR)/tests/lib

SRCS := with-venv.el
OBJS := $(SRCS:.el=.elc)

$(OBJS): %.elc: %.el
	$(EMACS) $(BATCHFLAGS) -f batch-byte-compile $^

.PHONY: all clean check test test-ert

all: $(OBJS)

clean:
	-rm -f $(OBJS)

check: test

test: test-ert $(OBJS)


# ert test
test-ert: $(ERT_TESTS) $(OBJS)
	$(EMACS) $(BATCHFLAGS) \
		--eval "(setq debug-on-error t)" \
		--eval "(require 'ert)" \
		--eval "(setq tests-target-files '($(SRC:%=\"%\")))" \
		$(ERT_TESTS:%=-l "%") \
		-f ert-run-tests-batch-and-exit
