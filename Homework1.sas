************************************************;
*Author: Amulya Bollapragada  
*Collaborators: N/A                                                                                ;                                                                            ;
*Program Purpose: Homework 1   ;
*Date: 2/11/2025                                                                                     ;
************************************************;

*Question 1: Create a permanent library called named after your unityID using a LIBNAME statement;

libname asbollap '/home/u64121671/asbollap';

*Question 2;

*The following code reads a data set directly from a URL using PROC IMPORT. The filename 
statement assigns the nickname 'REFFILE' to the dataset. We refer to the dataset using that 
nickname in the folloing proc import step. The proc import step takes this raw dataset
and reads it into SAS;

filename REFFILE URL 'https://www4.stat.ncsu.edu/~online/ST307/Data/jbpost2_yeast.csv';

proc import datafile= REFFILE
	dbms = csv
	replace
	out = asbollap.yeast;
	getnames= yes;
	guessingrows= max;
run;

*The proc sort step below sorts the asbollap.yeast dataset (outputted in the proc import step)
by the alm variable;	

proc sort data = asbollap.yeast out = asbollap.sortedyeast;
	by alm;
run;

*The proc print step below prints the sorted dataset;
proc print data = asbollap.sortedyeast;
run;

*The first value of the alm variable displayed in the UNSORTED data is 0.51;
*The first value of the alm variable displayed in the SORTED data is 0.21;

*Question 3;

*The following line of code assigns the nickname "BUPA" to a downloaded dataset.
This nickname is how the dataset is referred to later; 

filename BUPA '/home/u64121671/jbpost2_bupa.csv';

*The proc import step below takes the BUPA dataset and reads it into SAS;
proc import datafile = BUPA
	dbms = CSV
	replace
	out = asbollap.bupa;
	getnames = yes;
	guessingrows= max;
run; 

*The following line of code makes a copy of the asbollap.bupa dataset 
created in the proc import step and names it asbollap.newbupa.
It renames the variable name alkphos to alkaline_phosphatase in the new dataset;

data asbollap.newbupa;
	set asbollap.bupa (rename = (alkphos = alkaline_phosphatase));
run; 

*Question 4;

*The following line of code assigns the nickname "BEANS" to a downloaded dataset.
This nickname is how the dataset is referred to later;

filename BEANS '/home/u64121671/jbpost2_beans.xlsx';

*The proc import step below takes the BEANS dataset and reads it into SAS;
proc import datafile = BEANS
	dbms = XLSX
	replace
	out = asbollap.beans;
	getnames = yes;
run; 

*The following code copies the asbollap.beans datset we outputted in the proc import step.
It keeps only the Area and Class columns;

data asbollap.beanskeep;
	set asbollap.beans;
	keep Area Class;
run;

*
To include only certain columns, you can use a keep statement or drop statement. 
In the keep statement, you specify which columns you want to keep.
In the drop statement, you specify which columns you want to drop.
In this case, I am dropping more columns than I am keeping. 
Thus, I used the keep statement because it requires less typing and is more convenient.

There are two ways to only keep certain columns: using a statement or using the dataset option.
The statement copies the data first and then keeps only the specified columns.
The dataset option keeps only the specified columns before copying the dataset. 
I used the statement option because the instructions state to "Be sure to write your code in a way 
that copies over the entire data set in the data step, and then only include the variables Area 
and Class." implying that the copy should take place before keeping only certain variables;
