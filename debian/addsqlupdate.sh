#!/bin/sh
# Copyright: 2015 Sandro Knauß <bugs@sandroknauss.de>

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# Use to move a new update part to the dbcommon sql file
# for all databases and alo update the system table

# example to add SQL/$DB/$V.sql to debian/sql/$DB/1.0.5-1
# V=2015030800 version="1.0.5-1" debian/addsqlupdate.sh

for DB in mysql pgsql sqlite3; do
	from=SQL/$DB/$V.sql
	if [ $DB = "pgsql" ]; then
		from=SQL/postgres/$V.sql
	fi
	if [ $DB = "sqlite3" ]; then
		from=SQL/sqlite/$V.sql
	fi
	to=debian/sql/$DB/$version

	echo "/* $V */" >> $to
	cat $from >> $to
	echo "\n/* update system table */" >> $to
	echo "UPDATE system SET value='$V' WHERE name='roundcube-version';\n" >> $to
done
