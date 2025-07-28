***********;
* Amulya Bollapragada
* 1/21/25
* Week 3 Video - SAS Libraries
************;
*The following code sets up a library using code
If you run it, it should set up a library;

LIBNAME NCSU '/home/u64121671/myLib';

*Don't forget your semicolon to end that statement and successfully set up
your library;

*If you go over to your libraries after running this code,
you will see that you now have an NCSU library;

*Creating a temporary dataset;

DATA temporary;
	SET sashelp.baseball;
RUN;

*temporary is the name of the dataset
we are creating;
*set statement copies an existing dataset, in this
case that is sashelp.baseball;

*after running code #2, the temporary dataset
should exist in your work library;

PROC SGPLOT DATA = sashelp.baseball;
	HISTOGRAM CRATBAT;
RUN;

*The data above creates a file of the histogram of the specified data.
CRATBAT specifies the variable to use. Variables with 123 are numeric and variables with A are
categorical;
	