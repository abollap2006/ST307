************************************************;
*Author: Amulya Bollapragada  
*Collaborators: N/A                                                                                                                                                           
*Program Purpose: ICA 5   
*Date: 3/4/2025                                                                                     
************************************************;

*Read in the data and print it out;

libname CO2data XLSX '/home/u64121671/my_shared_file_links/u424592/03-SummarizingData/CO2.xlsx';

data CO2data;
	set CO2data.CO2;
run; 

proc print data = CO2data (obs=5);
run;

proc contents data = CO2data;
run;

*Reporting center and spread;

proc univariate data = CO2data;
	var uptake;
run;

proc means data = CO2data mean var stddev min q1 median q3 max maxdec=2;
	var uptake; 
run; 

*Summaries on subgroups;

*Let's use a by statement to do this first;

*The CO2data dataset is being overwritten because we are not specifies an out = ;


proc sort data = CO2data;
	by Treatment;
run;

proc means data = CO2data mean var stddev min q1 median q3 max maxdec=2;
	by treatment;
	var uptake; 
run; 

*Now, let's do it using a class statement;

proc means data = CO2data mean var stddev min q1 median q3 max maxdec=2;
	class treatment;
	var uptake; 
run; 


*Summaries on multiple subgroups;

proc means data = CO2data mean var stddev min q1 median q3 max maxdec=2;
	class treatment Conc;
	var uptake; 
run;

******************************;

*Summarize the online news dataset;

proc means data = NCSU.mynews mean median stddev;
	class ' is_weekend'n Type;
	var ' shares'n;
run;

****************************;

*Measuring Linear Associations - Summaries for Two Linear Variables; 

LIBNAME NCSU '/home/u64121671/myLib';

proc import datafile = '/home/u64121671/my_shared_file_links/u424592/03-SummarizingData/titanic.csv'
	dbms = csv
	out = NCSU.titanic;
	getnames= yes;
	guessingrows=max;
run;

proc corr data = NCSU.titanic spearman;
	var age fare pclass survived;
run; 

proc corr data = NCSU.mynews;
	var ' shares'n ' avg_negative_polarity'n ' avg_positive_polarity'n;
run;