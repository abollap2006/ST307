***********;
* Amulya Bollapragada
* 2/19/25
* ICA 4 - Week 7
************;

*Question 1;
*We are creating a permanent library called ica4;

*Question 2;
libname ica4 '/home/u64121671/My SAS Programs';

*We downloaded the banks.csv file and are assigning 
 the data a nickname - bank_raw;

filename bank_raw '/home/u64121671/banks (1).csv';


*We are now reading the bank data into SAS. 
 Even though the data is called banks.csv, we notice that
 the true delimiter is a semicolon;
 
proc import datafile= bank_raw 
	dbms = dlm
	replace 
	out = ica4.banks;
	guessingrows= max;
	delimiter= ";";
run; 

*Question 3;

*The following code copies our ica4.banks data that 
 we read in using proc import
 We name is banks. 
 Since this is a one level name, 
 we know it is in the work library.;
data banks;
	set ica4.banks;
	ratio = balance/age;
run;

*print the first 50 rows. Use the obs = shown below
 it is good to only print a certain 
 number of observations so you don't 
 overload the computer;

proc print data = banks (obs = 50);
run; 

*Question 4;

*Create indiator for balance;
*You took the data that you made in your previous 
 data step, not what you read in from proc import;
 
data banks2;
	set banks;
	length balance_ind $10;
	if balance <0 then balance_ind = "negative";
	else if balance = 0 then balance_ind = "neither";
	else if balance > 0 then balance_ind = "positive";
	else balance_ind = "ERROR";
run;

*Question 5;
*Originally for values larger than 0, SAS left balance_ind blank;

data banks3;
	set banks2;
	length bday $20;
	if month = "jun" then bday = "birthday";
	else bday = "not birthday";
run;

*******************;
*Question 6;

data banks4;
	set ica4.banks;
	length balance_ind $10 bday $20;
	
	*Make ratio;
	ratio = balance/age;
	
	*Make balance_int;
	if balance <0 then balance_ind = "negative";
	else if balance = 0 then balance_ind = "neither";
	else if balance > 0 then balance_ind = "positive";
	else balance_ind = "ERROR";
	
	*Make bday;
	if month = "jun" then bday = "birthday";
	else bday = "not birthday";
run;


	

	