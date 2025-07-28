*Bar Plots and Attributes;

LIBNAME NCSU '/home/u64121671/myLib';

proc sgplot data = NCSU.mynews;
	vbar Type/group = ' is_weekend'n groupdisplay=stack datalabel
			fillattrs=(transparency = 0.2)
			datalabelattrs=(color = brown Family = 'Arial' Size = 8 Style = Italic Weight = bold);
run; 

*Histograms/Density Plots/Box Plots;

*If you run this without the where statement, you see that the histogram is greatly affected by a large outlier;


proc sgplot data = NCSU.mynews;
	where ' shares'n < 20000;
	histogram ' shares'n;
	density ' shares'n/Type = Kernel;
run;


proc sgpanel data = NCSU.mynews;
	where ' shares'n < 20000;
	panelby type;
	histogram ' shares'n;
	density ' shares'n/Type = Kernel;
run;

*Scatterplots;

*We need to pick two numeric variables;

proc sgplot data = NCSU.mynews;
	scatter x = ' num_imgs'n y = ' shares'n;
run;

proc sgpanel data = NCSU.mynews;
	panelby type;
	scatter x = ' num_imgs'n y = ' shares'n;
run;

proc sgpanel data = NCSU.mynews;
	panelby type;
	reg x = ' num_imgs'n y = ' shares'n;
run;

*Quiz work;

PROC SGPLOT DATA = sashelp.cars;
    VBAR origin/GROUP = drivetrain GROUPDISPLAY=cluster;
RUN;

PROC SGPLOT DATA = sashelp.cars;
    VBAR drivetrain/GROUP = origin GROUPDISPLAY=cluster;
RUN;

PROC SGPLOT DATA = sashelp.cars;
    VBAR drivetrain/GROUP = origin;
RUN;

PROC SGPLOT DATA = sashelp.cars;
    VBAR origin/GROUP = drivetrain GROUPDISPLAY=stack;
RUN;

PROC SGPLOT DATA = NCSU.mynews;
    VBOX ' avg_positive_polarity'n/CATEGORY=type;
    Scatter x = ' shares'n 
    		y = ' num_imgs'n/jitter;
RUN;

