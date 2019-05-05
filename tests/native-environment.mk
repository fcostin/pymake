#T gmake skip
export EXPECTED := some data

PYCOMMANDPATH = $(TESTPATH)

all:
	%pycmd writeenvtofile results1 EXPECTED
	test "$$(cat results1)" = "$(EXPECTED)"
	%pycmd writesubprocessenvtofile results2 EXPECTED
	test "$$(cat results2)" = "$(EXPECTED)"
	@echo TEST-PASS # need to revert when this works
