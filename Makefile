
# Makefile to build ben-jose git pages web site.

BASE_DIR = .

HTM_DIR = $(BASE_DIR)/html_snippets
MKD_DIR = $(BASE_DIR)/mkd_snippets
DOX_DIR = $(BASE_DIR)/doxy_doc

DOXY = doxygen
MKD = markdown
CAT = cat
RM = rm
SED = sed

SED_MINI_LOGO = 's?<!-- PUT_HERE_MINI_LOGO -->?<a class="navbar-brand" href="index.html"><img src="images/bj-mix-mini.png" alt=""></a>?'

SED_HOME_MENU = 's?<!-- PUT_HERE_HOME_MENU -->?<li class="active"> <a href="index.html">Home</a> </li>?'


ALL_BUILT_HTML = \
$(BASE_DIR)/doxy_generated_doc\
$(BASE_DIR)/index.html\
$(BASE_DIR)/hello_world.html\
$(BASE_DIR)/bj-phi.html\
$(BASE_DIR)/proofs.html\
$(BASE_DIR)/about.html

default_rule: $(ALL_BUILT_HTML)
	@echo "Finished building ben-jose git pages web site."

#---------------------------------------------------------
# executables
#

$(BIN_DIR)/$(EXE_NAM): $(ALL_OBJS) 
	@echo "Building executable "$(EXE_NAM)" ..."
	$(CPP) $(ALL_OBJS) $(LNK_FLAGS) -o $(BIN_DIR)/$(EXE_NAM)

help:
	@echo "Type 'make'"

#---------------------------------------------------------
# clean rule
#

clean: 
	find . -name "*~" -type f | xargs $(RM)
	$(RM) $(ALL_BUILT_HTML)
	$(RM) $(HTM_DIR)/top_normal.txt
	$(RM) $(HTM_DIR)/top_home.txt
	$(RM) -rf $(BASE_DIR)/doxy_generated_doc

#---------------------------------------------------------
# generate each html
#

$(BASE_DIR)/doxy_generated_doc: $(DOX_DIR)/doxy_config.txt $(DOX_DIR)/bj_tmpl_header.html
	$(DOXY) $(DOX_DIR)/doxy_config.txt

$(BASE_DIR)/index.html: \
	$(HTM_DIR)/top_home.txt \
	$(HTM_DIR)/index.txt \
	$(HTM_DIR)/bottom_normal.txt \

	$(CAT) \
	$(HTM_DIR)/top_home.txt \
	$(HTM_DIR)/index.txt \
	$(HTM_DIR)/bottom_normal.txt \
	> $(BASE_DIR)/index.html

$(BASE_DIR)/hello_world.html: \
	$(HTM_DIR)/top_normal.txt \
	$(HTM_DIR)/hello_world.txt \
	$(HTM_DIR)/bottom_normal.txt \

	$(CAT) \
	$(HTM_DIR)/top_normal.txt \
	$(HTM_DIR)/hello_world.txt \
	$(HTM_DIR)/bottom_normal.txt \
	> $(BASE_DIR)/hello_world.html

$(BASE_DIR)/bj-phi.html: \
	$(HTM_DIR)/top_normal.txt \
	$(HTM_DIR)/bj-phi.txt \
	$(HTM_DIR)/bottom_normal.txt \

	$(CAT) \
	$(HTM_DIR)/top_normal.txt \
	$(HTM_DIR)/bj-phi.txt \
	$(HTM_DIR)/bottom_normal.txt \
	> $(BASE_DIR)/bj-phi.html

$(BASE_DIR)/proofs.html: \
	$(HTM_DIR)/top_normal.txt \
	$(HTM_DIR)/proofs.txt \
	$(HTM_DIR)/bottom_normal.txt \

	$(CAT) \
	$(HTM_DIR)/top_normal.txt \
	$(HTM_DIR)/proofs.txt \
	$(HTM_DIR)/bottom_normal.txt \
	> $(BASE_DIR)/proofs.html

$(HTM_DIR)/top_home.txt: \
	$(HTM_DIR)/top_common.txt \
	$(HTM_DIR)/top_home_rest.txt \

	$(CAT) \
	$(HTM_DIR)/top_common.txt \
	$(HTM_DIR)/top_home_rest.txt \
	> $(HTM_DIR)/top_home.txt

$(HTM_DIR)/top_normal.txt: \
	$(HTM_DIR)/top_common.txt \
	$(HTM_DIR)/top_normal_rest.txt \

	$(CAT) \
	$(HTM_DIR)/top_common.txt \
	$(HTM_DIR)/top_normal_rest.txt \
	> $(HTM_DIR)/top_normal.txt\

	$(SED) -i $(SED_MINI_LOGO) $(HTM_DIR)/top_normal.txt\

	$(SED) -i $(SED_HOME_MENU) $(HTM_DIR)/top_normal.txt

$(BASE_DIR)/about.html: \
	$(HTM_DIR)/top_normal.txt \
	$(HTM_DIR)/about.txt \
	$(HTM_DIR)/bottom_normal.txt \

	$(CAT) \
	$(HTM_DIR)/top_normal.txt \
	$(HTM_DIR)/about.txt \
	$(HTM_DIR)/bottom_normal.txt \
	> $(BASE_DIR)/about.html

