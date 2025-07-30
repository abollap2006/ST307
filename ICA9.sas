************************************************;
*Author: Amulya Bollapragada  
*Collaborators: N/A                                                                                ;                                                                            ;
*Program Purpose: ICA 9   ;
*Date: 4/16/2025                                                                                     ;
************************************************;


LIBNAME NCSU '/home/u64121671/myLib';

filename abalone url'https://www4.stat.ncsu.edu/~online/datasets/abalone.csv';

proc import datafile= abalone
	dbms = csv
	replace
	out = NCSU.abalone;
	getnames = yes;
run; 

PROC GLM data = NCSU.abalone plots = all;
	CLASS Sex;
	MODEL ShuckedWeight = Sex / solution;
	LSMEANS Sex/pdiff adjust = tukey cl;
RUN;
QUIT;
*We look at the ANOVA table to see that the p value is very tiny. 
 Thus, we reject the null hypothesis that all three means of shucked weight are the same;
 
PROC TTEST DATA = NCSU.abalone ALPHA = 0.05 PLOTS = all;
	VAR ShuckedWeight;
RUN;

*We are 95% confident that the true mean Shucked weight is between 0.3527 and 0.3661;

PROC TTEST data = NCSU.abalone plots = all;
	Where Sex = 'F' or Sex = 'M';
	Class Sex;
	Var ShuckedWeight;
Run;
