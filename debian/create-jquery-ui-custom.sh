#!/bin/sh
#
# The program/js/jquery-ui-1.10.4.custom.js can't be shipped
# because we don't have the source for it.  So construct that
# works the way roundcude wants it from the original sources.
#
# We actually just mung the minified source because it's closest
# to what we want.
#
# We just append jquery-ui-accessible-datepicker.js

cat \
    /usr/share/javascript/jquery-ui/jquery-ui.min.js \
    plugins/jqueryui/js/jquery-ui-accessible-datepicker.js
