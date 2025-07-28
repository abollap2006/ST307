************************************************;
*Author: Amulya Bollapragada  
*Collaborators: N/A                                                                                ;                                                                            ;
*Program Purpose: Homework 1   ;
*Date: 3/4/2025                                                                                     ;
************************************************;

*Task 1;

*Question 1;

*The code below creates a permanent library called homework;

libname homework '/home/u64121671/My SAS Programs/homework';

*Below, I downloaded the beans dataset from Moodle and assigned it the nickname beans.;

filename beans '/home/u64121671/My SAS Programs/homework/beans.xlsx';

*I then uploaded the beans dataset to SAS and put it in the permanent homework library;

proc import datafile= beans
	dbms = xlsx
	replace
	out = homework.beans;
	getnames= yes;
run;

*Question 2;

*Now, we are going to copy the dataset from our permanent library to a temporary dataset
 
 We are making some modifications though...
 - We are dropping the AspectRatio and Extent variables
 - We are renaming the ShapeFactor1, ShapeFactor2, ShapeFactor3 and ShapeFactor4
   variables to SF1, SF2, SF3, and SF4 respectively 
 - We are adding descriptive labels to the Roundness, Eccentricity, and Area variables
 - We removed any observations in which the bean class is not one of SIRA, DERMASON,
   CALI, HOROZ and BOMBAY
 - We created a new variable called "average" that is the average of the newly renamed variables (SF1, SF2, SF3, SF4)
 - We created a new variable called eccen_cat which bins the Eccentricity variable into bins based on its value
;

data question_two;
	set homework.beans (rename = (ShapeFactor1 = SF1 ShapeFactor2 = SF2 
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

*Now, let's sort the temporary dataset we created in the last question!

 We are sorting it descending by the Roundness variable;

proc sort data = work.question_two;
	by descending Roundness;
run; 

*Then, I printed the first 50 observations of the dataset with the labels that we added in question 2
 
 The only variables I printed were Class, eccen_cat, Roundness, Eccentricity, and Area
 
 Also, note that only the observations that have "Middle" or "Low" for its eccen_cat variable are shown

;
proc print data = work.question_two (obs = 50) label;
	var Class eccen_cat Roundness Eccentricity Area;
	where (eccen_cat = "Middle") OR (eccen_cat = "Low");
run;

*The first printed value of Class variable: DERMASON
 
 The first printed value of Roundness variable: 0.9666027972;
 
***************************************************************;

*Task 2;

*
I chose a dataset about Lungs Diseases because I am interested in pursuing a career in 
biostatistics, which is the application of statistics in healthcare. 
I find this interdisciplinary study fascinating because I am passionate about Statistics 
and Mathematics as a subject and Healthcare as a purpose. 
Analyzing datasets like this one directly aligns with this career path.

Below is the URL where I found the dataset:
https://www.kaggle.com/datasets/samikshadalvi/lungs-diseases-dataset?resource=download

;

*Below, I assigned a nickname 'lung' to the lung disease dataset I found online. 
 I will later use this nickname to refer to this dataset;
 
filename lung '/home/u64121671/My SAS Programs/homework/lung_disease_data.csv';

*Then, I read the lung disease dataset into SAS;

proc import datafile= lung
	dbms = csv
	replace
	out = homework.lung;
	getnames= yes;
	guessingrows= max;
run;
