************************************************;
*Author: Amulya Bollapragada  
*Collaborators: N/A                                                                                                                                                           
*Program Purpose: ICA 5   
*Date: 3/4/2025                                                                                     
************************************************;

LIBNAME NCSU '/home/u64121671/myLib';

filename REFFILE URL'https://www4.stat.ncsu.edu/~online/datasets/StudentData.txt';

proc import datafile = REFFILE
	dbms = dlm
	replace
	out = NCSU.student;
	getnames= yes;
	guessingrows= max;
	delimiter= ";";
run;

*The table below shows the distribution of where people work;
* The fjob variable gives the father's job for each student.;
* This table counts the number of students whose fathers have each
* job;

proc freq data = NCSU.student;
	tables Fjob;
run;

*Shows whether students have a romantic relationship and whether they have internet in their home;

proc freq data = NCSU.student;
	tables romantic*internet / expected deviation;
run;

data NCSU.studentlabels;
	set NCSU.student;
	label G1 = 'Grades at first time point'
		  G2 = 'Grades at second time point'
		  G3 = 'Final Grade';
run;

proc print data = NCSU.studentlabels blankline = (count = 10) label noobs;
run;

