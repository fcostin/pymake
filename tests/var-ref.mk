VAR = value
VAR2 == value

VAR5 = $(NULL) $(NULL)

$(VAR3)
  $(VAR4)  
$(VAR5)

VAR6$(VAR5) = val6

all:
	test "$( VAR)" = ""
	test "$(VAR2)" = "= value"
	test "$(VAR6 )" = "val6"
	@echo TEST-PASS
