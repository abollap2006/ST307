***********;
* Amulya Bollapragada
* 2/23/25
* Week 8 Videos: Combining Datasets
************;

***Let's first read in our two data sets
   We are reading in mosquito.txt and mosquito2.txt
   If you open them individually, 
   you see that mosquito.txt is a & delimited file 
   and mosquito.txt2 is a tab delimited file with no variable names;
   
LIBNAME NCSU '/home/u64121671/myLib';

proc import datafile = '/home/u64121671/my_shared_file_links/u424592/02-ManipulatingData/mosquito.txt'
	dbms = dlm 
	replace
	out = NCSU.mosq1;
	getnames= yes;
	delimiter= "&";
run;

*For the following code:
 
 You might think you could say dbms = tsv because it is tab a seperate file, 
 but the file extention is noy tsv, so that would cause issues.

 Get names should be no because we saw earlier that there are no column names
 
 Delimiter should be '09'x because that means a tab is the delimiter;

proc import datafile = '/home/u64121671/my_shared_file_links/u424592/02-ManipulatingData/mosquito2.txt'
	dbms = dlm 
	replace
	out = NCSU.mosq2;
	getnames= no;
	delimiter= '09'x;
run;

*Let's try to vertically join both those mosquito files using a data step;

*You cannot just do this:

 data NCSU.mosq
	set NCSU.mosq1 NCSU.mosq2
 run
 
(didn't include semicolons bc that would end the comment)

 This is because SAS joins things based on the variable names 
 and these datasets don't share var names
 
 Thus, we must rename the variables before combining the datasets;

data NCSU.mosq;
	set NCSU.mosq1 NCSU.mosq2 (Rename = (Var1 = Cage Var2 = Day Var3 = trt Var4 = Response));
run;
