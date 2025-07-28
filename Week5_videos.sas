***********;
* Amulya Bollapragada
* 2/10/25
* Week 5 Videos
************;

*Get the libname statement from your snippets;

LIBNAME NCSU '/home/u64121671/myLib';

proc import datafile= '/home/u64121671/my_shared_file_links/u424592/02-ManipulatingData/winequality-full.csv'
	dbms = csv 
	replace
	out = NCSU.myWine;
	getnames= yes;
run;

*You'll notice that the variable names have spaces in them. This makes it hard to reference because you would
need to put it in quotes every time. We can rename them to make it easier. Since we renamed them using the 
dataset option, we can use the new names in the label statement. We are labeling them with their original
spaced names because it looks better.;

DATA NCSU.formattedwine;
	set NCSU.myWine (RENAME = ('fixed acidity'n = fixed_acidity 'volatile acidity'n = volatile_acidity 
	'citric acid'n = citric_acid 'residual sugar'n = residual_sugar 
	'free sulfur dioxide'n = free_sulfur_dioxide 'total sulfur dioxide'n = total_sulfur_dioxide)
			drop = type Ph);
	label fixed_acidity = 'fixed acidity' volatile_acidity = 'Volatile Acidity' 
	citric_acid = 'Citric Acid' residual_sugar = 'Residual Sugar' 
	free_sulfur_dioxide = 'Free Sulfur Dioxide' total_sulfur_dioxide = "Total Sulfur Dioxide";
run;

*Let's print with labels;
proc print DATA = NCSU.formattedwine LABEL;
run;


filename fandango '/home/u64121671/myLib/fandango_scrape.csv';

proc import datafile= fandango
	dbms = csv
	replace
	out = NCSU.fandango;
	getnames= yes;
run;

***Drop statements! Let's make a new data set that removes some variables;

data NCSU.fandangoDrop;
	set NCSU.fandago;
	drop Voting Rating;
run;

*The above code copies the fandango dataset to a new dataset called
fandango.drop. Then it gets rid of the voting and rating columns in the new dataset;

*You can also use a different syntax shown below;

data NCSU.fandangoDrop2;
	set NCSU.fandango (drop = voting rating);
run;

*The first option copies the dataset and then drops the variables. The second option drops 
the variables before it copies - which requires less computer memory;

*****Keep statements!;

data NCSU.fandangoKeep;
	set NCSU.fandango;
	keep film rating;
run;

*OR;

data NCSU.fandangoKeep2;
	set NCSU.fandango (keep = film rating);
run;

*The differences in those syntax is the same as stated above for the drop statements;

*Use drop or keep based on convenience! Which one will require less typing?;



	
	
	