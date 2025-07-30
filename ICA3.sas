***********;
* Amulya Bollapragada
* 1/29/25
* ICA 3
************;

LIBNAME ica3 '/home/u64121671/My SAS Programs';
Filename REFILLE '/home/u64121671/My SAS Programs/ionosphere.data';


PROC IMPORT Datafile = REFILLE
	DBMS = CSV
	replace
	OUT = ica3.ionosphere;
	GETNAMES = NO;
	GUESSINGROWS=max;
RUN;



PROC PRINT data = '/home/u64121671/My SAS Programs/house.sas7bdat';

Filename REFILLE '/home/u64121671/My SAS Programs/banks.csv';

PROC IMPORT Datafile= REFILLE
	DBMS = DLM
	replace
	OUT = ica3.banks;
	Delimiter= '>';
	GETNAMES = YES;
	Guessingrows= max;
RUN;

*The delimiter is a comma;
	


	