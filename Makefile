current_dir = $(shell pwd)

PROJECT = best-practices-experiments

# Including ci Makefile
CI_REPOSITORY ?= https://github.com/src-d/ci.git
CI_BRANCH ?= v1
CI_PATH ?= .ci
MAKEFILE := $(CI_PATH)/Makefile.main
$(MAKEFILE):
	git clone --quiet --depth 1 -b $(CI_BRANCH) $(CI_REPOSITORY) $(CI_PATH);
-include $(MAKEFILE)

.ONESHELL:
.POSIX:
check:
	python3 -m "flake8" --count
	python3 -m "pylint" best_practices