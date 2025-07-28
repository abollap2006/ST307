***********;
* Amulya Bollapragada
* 1/15/25
* ICA 1
************;

*The following code imports data from different formats and moves it to the SAS format. Imports crabs!;

FILENAME REFFILE '/home/u64121671/my_shared_file_links/u424592/01-ProgrammingInSASReadingData/crabs.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX replace
	OUT=WORK.IMPORT; 
	*Replace is important because it replaces the data each time. If you want to change the name of the file, change the name 'WORK.IMPORT';
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;
*The line above has 2 semicolons, so there are 2 statements. You 
may be confused because all the statements are in one line.
This is actually bad pratice!;

*The following code prints the top 20 data values;

PROC PRINT DATA = import (obs = 20);
RUN;

