***********;
* Amulya Bollapragada
* 1/21/25
* Week 3 Video - Import Wizard
************;

LIBNAME NCSU '/home/u64121671/myLib';

*Pulled the above line from snippets because
we need a library setup;
*Make sure you run that code so you will have access to the library;

FILENAME REFFILE '/home/u64121671/my_shared_file_links/u424592/01-ProgrammingInSASReadingData/forestfires.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=NCSU.myFires;
	GETNAMES=YES;
RUN;
*The above code will appear under NCSU if you go to My Libraries;

*Now, we will read in the same data but temporarily;

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=myFires;
	GETNAMES=YES;
RUN;
*We just renames it to a one level name. The above code will appear under WORK if you go to My Libraries;

