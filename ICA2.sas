***********;
* Amulya Bollapragada
* 1/22/25
* ICA 2
************;

libname ica_lib '/home/u64121671/My SAS Programs';

**Let's import the crabs file;
FILENAME REFFILE '/home/u64121671/my_shared_file_links/u424592/01-ProgrammingInSASReadingData/crabs.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=ica_lib.crabs replace;
	GETNAMES=YES;
RUN;

**We are reading in a .xlsx (Excel) file. The DBMS corresponds
**to the type of raw file;

**Let's import the insurance file;
FILENAME REFFILE '/home/u64121671/my_shared_file_links/u424592/01-ProgrammingInSASReadingData/insurance.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=ICA_LIB.insurance replace;
	GETNAMES=YES;
RUN;

**The type of file is a csv file and the DBMS corresponds to this

**Let's sort crabs by weight;
PROC SORT DATA = ica_lib.crabs out = work.sorted_crabs;
	BY weight;
RUN;

*Print the crabs sorted by weight;
proc print data = sorted_crabs;
run;

*Let's print out summary statistics about the crabs data;
PROC FREQ DATA = ica_lib.crabs;
	TABLES color*spine;
RUN;

*Print out summary statistics about the insurance data;
PROC UNIVARIATE DATA = ica_lib.insurance;
	VAR AGE BMI Children;
RUN;






