***********;
* Amulya Bollapragada
* 1/27/25
* Week 4 Video - PROC IMPORT
************;


LIBNAME NCSU '/home/u64121671/myLib';

PROC IMPORT DATAFILE= '/home/u64121671/my_shared_file_links/u424592/01-ProgrammingInSASReadingData/crabs.xlsx'
	DBMS= xlsx
	out= NCSU.myCrabs;
	GETNAMES = YES;
RUN;
	
	
	
*****;

LIBNAME NCSU '/home/u64121671/myLib';

*Creating instream data;
*The variables are name, cost, and fee. we put $ before name bc it's a character var;
*The first time you set the length for a character variable, it sets the length. So in this 
case we can't do any name longer than 4 letters because of John;

DATA NCSU.instream;
	INPUT name $ cost fee;
	DATALINES;
	John 12 3
	Noah 10 4
	Jane 4 1
	;
RUN;

