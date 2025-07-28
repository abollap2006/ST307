************************************************;
*Author: Amulya Bollapragada  
*Collaborators: N/A                                                                                ;                                                                            ;
*Program Purpose: Week 15   ;
*Date: 4/16/2025                                                                                     ;
************************************************;

LIBNAME NCSU '/home/u64121671/myLib';

filename apple url'https://www4.stat.ncsu.edu/online/datasets/apple_orchard.csv';

proc import datafile=apple
	out= NCSU.apple
	dbms = csv
	replace;
	getnames = yes;
run;

*one sample ttest;

proc ttest data = NCSU.apple alpha = 0.1 plots = all;
	where Type = 'Type I';
	var Growth;
run;

*two sample ttest;

proc ttest data = NCSU.apple plots = all;
	where Type = 'Type II' OR Type = 'Type IV';
	class Type;
	var Growth;
run; 

*One way ANOVA table;

proc glm data = NCSU.apple plots = all;
	class Type;
	Model Growth = Type;
	lsmeans Type/pdiff adjust = tukey cl;
run;