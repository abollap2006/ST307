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

proc sgplot data = NCSU.student;
	histogram age/
		fillattrs = (Color = Red)
		datalabel= count;
run; 

proc means data = NCSU.student mean;
	var age;
run;


proc sgplot data = NCSU.student;
	histogram age/
		fillattrs = (Color = Red)
		datalabel= count;
	refline 16.6962025/axis = x
		lineattrs= (pattern = 4
					thickness = 3);
run; 

proc sgplot data = NCSU.student;
	vbox age/category=Mjob;
	scatter x = Mjob
			y = age/jitter;
run;

proc sgpanel data = NCSU.student;
 	panelby studytime;
	vbox age/category=Mjob;
	scatter x = Mjob
			y = age/jitter;
run;

*7.	Thought exercise: Why does it make sense to summarize the age 
variable with a histogram or boxplot, and not a bar plot?

Because age is a numeric variable, not a categoric variable 
;

proc sgplot data = NCSU.student;
	vbar Pstatus/group = sex
		groupdisplay=cluster;
run; 

proc sgplot data= NCSU.student;
	scatter x = studytime y = age / markerattrs= (color = red); 
	loess x = studytime y = age / markerattrs= (color = red);
run; 

