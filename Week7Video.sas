***********;
* Amulya Bollapragada
* 2/17/25
* Week 7 Videos: Creating New Variables
************;

*Get the libname statement from your snippets;

LIBNAME NCSU '/home/u64121671/myLib';

proc import datafile = '/home/u64121671/my_shared_file_links/u424592/02-ManipulatingData/cafe.xlsx'
	dbms = xlsx
	out = NCSU.cafedata;
	getnames= yes;
run;

*The following code uses a set statement to create a new temporary dataset in the 
work library called cafe that is a copy of NCSU.cafedata. We use the Year() and Month() functions to 
create new variables that display the year and month of the date in that row.

The if statement creates a new variable called season and assigns it the value of 'Winter' if 
the month is <= 2. If month is not <= 2, then there is no directions given. SAS will leave this as 
a missing character variable - a blank space;

data cafe;
	set NCSU.cafedata;
	Year = Year(date);
	Month = Month(date);
	if month <= 2 then season = "Winter";
run;

*The following code will center the sales variable. It will overwrite the sales variable bc we 
did not do the prefix thing;

proc stdize data = cafe method = mean;
	var sales;
run;

*utilize the missing() function - tells us if there is something missing from the season variable
*if it is missing there is a 0
*if it is not missing there is a 1
;

data cafe;
	set cafe;
	ObsMissing = missing(season);
run; 