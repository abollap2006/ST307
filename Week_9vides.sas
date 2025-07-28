************************************************;
*Author: Amulya Bollapragada  
*Collaborators: N/A                                                                                                                                                           
*Program Purpose: Week 9 Videos   
*Date: 3/4/2025                                                                                     
************************************************;

*Contingency Tables;

*First, let's create a permanent library and import the online news popularity data into SAS. 
 We will put the online news popularity data in the permanent library we created;
 
LIBNAME NCSU '/home/u64121671/myLib';

proc import datafile = '/home/u64121671/my_shared_file_links/u424592/03-SummarizingData/OnlineNewsPopularity.csv'
	dbms = csv
	replace
	out = NCSU.news;
	getnames = yes;
run; 

*After you run that proc import, you'll notice that most of our variables are read into SAS as numeric
 However, they are not truly numeric. They are actually representing categories;
 
*The data step below creates a copy of the data we just loaded into SAS.
 It places this copy in the permanent library we created.
 
 In this copy, we create a new variable called Type. 
 This type is determined by the values in the other columns that indicate whether or not 
 the new source falls into a certain category;
 
data NCSU.mynews;
	set NCSU.news;
	length Type $16;
	if ' data_channel_is_bus'n = 1 then Type = "Business";
	else if ' data_channel_is_entertainment'n = 1 then Type = "Entertainment";
	else if ' data_channel_is_lifestyle'n = 1 then Type = "Lifestyle";
	else if ' data_channel_is_socmed'n = 1 then Type = "SocMed";
	else if ' data_channel_is_tech'n = 1 then Type = "Tech";
	else Type = "World";
run;

*Then, we print the first 10 observations of the modified data copy;

proc print data = NCSU.mynews (OBS = 10);
run;

*Then we create a one way contingency table for the Type variable, 
 a one way contingency table for the ' is_weekend'n variable,
 and a two way table for the Type variable and ' is_weekend'n variable;

proc freq data = NCSU.mynews;
	tables Type ' is_weekend'n Type*' is_weekend'n;
run;


**********************************;

*SAS Options;

*We are using the list option which displays two-way and multiway tables by using a list format instead of the default crosstabulation 
cell format. This option displays an entire multiway table in one table, instead of displaying a 
separate two-way table for each stratum;

*We can use the Chi-Squared option - chisq
 We can also change the df associated with the test;

proc freq data = NCSU.mynews;
	tables Type ' is_weekend'n Type*' is_weekend'n/list chisq (df=10);
run;

