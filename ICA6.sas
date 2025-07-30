************************************************;
*Author: Amulya Bollapragada  
*Collaborators: N/A                                                                                                                                                           
*Program Purpose: ICA 6 
*Date: 3/19/2025                                                                                     
************************************************;

*1.	Create a permanent library using a LIBNAME statement.;

LIBNAME NCSU '/home/u64121671/myLib';

*Create code to import the StudentData.txt file from the URL above into your permanent library created in question 1. Note: This is a ‘;’ delimited file.;

filename REFFILE URL'https://www4.stat.ncsu.edu/~online/datasets/StudentData.txt';

proc import datafile = REFFILE
	dbms = dlm
	replace
	out = NCSU.student;
	getnames= yes;
	guessingrows= max;
	delimiter= ";";
run;

*Copy and paste the code below;

DATA NCSU.student1;
  SET NCSU.student;
  numG1 = input(G1, 8.);
  numG2 = input(G2, 8.);
RUN;

*4.	Use a PROC to produce the following summary statistics about the age and numG1 variables (and no other summary statistics): mean, sd, and maximum;
proc means data = NCSU.student1 mean stddev max;
	var age numG1; 
run;

*5.	Use a PROC to produce the same summary statistics about the age and numG1 variables (and no other summary statistics) at every level of the Mjob variable.;

proc means data = NCSU.student1 mean stddev max;
	class Mjob;
	var age numG1; 
run;

*6.	Use PROC UNIVARIATE to produce summary statistics about the numG1 and numG2 variables at every level of the Mjob variable.;

proc univariate data = NCSU.student1;
	class Mjob;
	var age numG1; 
run;

*Use a PROC step to find the correlation between the age, numG1, and numG2 variables for every setting (or level) of the Mjob variable.;
proc sort data = NCSU.student1;
	by Mjob;
run;

proc corr data = NCSU.student1;
	by Mjob;
	var age numG1 numG2;
run; 
