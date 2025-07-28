************************************************;
*Author: Amulya Bollapragada  
*Collaborators: N/A                                                                                ;                                                                            ;
*Program Purpose: Homework 3   ;
*Date: 4/4/2025                                                                                     ;
************************************************;

*Question 1;

*The code below creates a permanent library called AB;

libname ABHW3 '/home/u64121671/My SAS Programs/homework3';

*Question 2;

*The code from question 2 is copied from questions 1 and 2 of Homework 2;

*Below, I downloaded the beans dataset from Moodle and assigned it the nickname beans.;

filename beans '/home/u64121671/My SAS Programs/homework/beans.xlsx';

*I then uploaded the beans dataset to SAS and put it in the permanent homework library called AB 
that I created in question 1;

proc import datafile= beans
	dbms = xlsx
	replace
	out = ABHW3.beans;
	getnames= yes;
run;

*In the following chunk of code I added some modifications to a temporary version of the beans dataset;

data question_two;
	set ABHW3.beans (rename = (ShapeFactor1 = SF1 ShapeFactor2 = SF2 
	ShapeFactor3 = SF3 ShapeFactor4 = SF4));
	drop AspectRatio Extent;
	label Roundness = 'Roundness calculated with the following formula: (4piA)/(P^2)'
	 	  Eccentricity = 'Eccentricity of the ellipse having the same moments as the region'
	 	  Area = 'The area of a bean zone and the number of pixels within its boundaries';
	where CLASS in("SIRA" "DERMASON" "CALI" "HOROZ" "BOMBAY"); 
	average = (SF1 + SF2 + SF3 + SF4)/4;
	length eccen_cat $10;
	if Eccentricity > 0.7949 then eccen_cat = "Large";
	if (Eccentricity > 0.7947) and (Eccentricity <= 0.7949) then eccen_cat = "Middle";
	else eccen_cat = "Low";
run;

*Question 3;

*Below, I used a proc freq step to make a two-way contingency table for the 
Class variable and the eccen_cat variable (the binned Eccentricity variable that I created in the 
copied code in question 2). I also included the expected counts for the frequency of each combination of these variables
using a SAS tables option;

proc freq data = question_two;
	tables Class*eccen_cat/ expected;
run; 

*The top left cell of this contingency table is in conjunction with the Bombay class and the Low eccent_cat.
 
 The numbers in this cell:
 - 355: Observed count of observations that fall in the Bombay class and Low eccent_cat
 - 354.8: Expected count of observations that fall in the Bombay class and Low eccent_cat
 - 4.95: Percent of all observations that fall in the Bombay class and Low eccent_cat
 - 100.00: Percent of all observations in the Bombay row that fall in the Low eccent_cat
 - 4.96: Percent of all observations in the Low eccent_cat column that fall in the Bombay class;

*Question 4;

*Below, I used a PROC step to produce only the Skewness, Sample Size, Mode, and 5th percentile summary statistics 
for the Perimeter and MajorAxisLength variables for each Class of bean;

proc means data = question_two mode skewness P5 N;
	class Class;
	var Perimeter MajorAxisLength;
run; 

*Question 5;

*Below, I used a PROC step to create a correlation matrix between the 
Perimeter, MajorAxisLength, MinorAxisLength, and Eccentricity variables;

proc corr data = question_two;
	var Perimeter MajorAxisLength MinorAxisLength Eccentricity;
run; 

*Question 6;

*The code below creates a side-by-side bar plot using the Class variable and the eccen_cat variable;

proc sgplot data = question_two;
	vbar eccen_cat/group = Class groupdisplay= cluster;
run; 

*Question 7;

*The code below creates a histogram of the ConvexArea variable. 
It also display the counts for each histogram bin at the top of each bar by using the datalabel option.
Additionally, it overlays a density plot on top of the histogram;

proc sgplot data = question_two;
		histogram ConvexArea/
			Datalabel = count;
		density ConvexArea;
run; 

*Question 8;

*Below, I create the same plot from the previous question, but for every level of the Class variable;

proc sgpanel data = question_two;
		panelby Class;
		histogram ConvexArea/
			Datalabel = count;
		density ConvexArea;
run;


