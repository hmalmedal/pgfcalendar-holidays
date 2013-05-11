Holidays for the PGF calendar
=============================

Introduction
------------

The PGF bundle includes a calendar package, `pgfcalendar`, described in
chapter 57 of the PGF manual (version 2.10). This package adds date
checks for Easter and Advent.

Usage
-----

Load the package with `\usepackage{pgfcalendar-holidays}` in the
preamble.

The test `Easter` is true if the date being checked is Easter Sunday.
The test can take an optional argument, e.g. `Easter=-2` is true if the
date being checked is Good Friday.

The test `Advent` is true if the date being checked is Advent Sunday,
the fourth Sunday before Christmas Day. The test can take an optional
argument, e.g. `Advent=7` is true if the date being checked is the
second Sunday of Advent.

License
-------

Copyright © 2013 by Håkon Malmedal

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License (LPPL), either
version 1.3c of this license or (at your option) any later
version.  The latest version of this license is in the file:

http://www.latex-project.org/lppl.txt

This work is "maintained" (as per LPPL maintenance status) by
Håkon Malmedal.

Visit https://github.com/hmalmedal/pgfcalendar-holidays
