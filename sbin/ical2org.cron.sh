#!/bin/bash

# customize these
WGET=/usr/local/bin/wget
ICS2ORG=/Users/ambirdsall/.dotfiles/sbin/ical2org.awk
ICSFILE=/tmp/ambirdsall.calendar.ics
ORGFILE=/Users/ambirdsall/notes/ical-entries.org
URL=https://calendar.google.com/calendar/ical/e2hb7k2r0liinp6jhdnoou1eec%40group.calendar.google.com/private-f9a922ec8be207a3aef2a1c00dd103c0/basic.ics

# no customization needed below

$WGET -O $ICSFILE $URL
$ICS2ORG < $ICSFILE > $ORGFILE
