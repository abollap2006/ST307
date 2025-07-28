************************************************;
*Author: Amulya Bollapragada  
*Collaborators: N/A                                                                                                                                                            
*Program Purpose: Final Project   
*Date: 4/20/2025                                                                                     
************************************************;

*Prescriptive Tasks;

*Question 1: Create a permanent library called proj using a LIBNAME statement;

libname proj '/home/u64121671/My SAS Programs/proj';

*Question 2: Read in the house data into SAS directly from the URL and save it 
in the permanent library from question 1;

filename house url'https://www4.stat.ncsu.edu/~online/ST307/Data/npujani_house.csv';

proc import datafile = house
	dbms = csv
	replace
	out = proj.house;
	getnames = yes;
run;

*Question 3: Copy the data set read in question 2 into a temporary data set 
called myhouse a few alterations;

data myhouse;
	set proj.house;
	if (MSZoning = "Other") or (YearBuilt <= 1950) then delete;
	Div_Price = SalePrice/100000;
	drop OverallQual RoofMatl;
run;

*
The alterations we included were...
- Removing observations where the MSZoning variable takes on the value of 
  Other or observations where YearBuilt is <= 1950
- Create a new variable that is the SalePrice variable divided by 100000
- Remove OverallQual and RoofMatl variables
;

*Question 4: Create a two-way contingency table between the KitchenQual 
and SaleCondition variable;

proc freq data = myhouse;
	tables KitchenQual*SaleCondition;
run; 

*The upper leftmost value in the contingency table produced from the code above is 37.
This number represents the number of observations that have Ex kitchen quality and 
normal sale condition;

*Question 5: Using the temporary myhouse dataset, produce the summary statistics 
about the SalePrice, YearBuilt, and GarageArea variables at each level of SaleCondition;

proc means data = myhouse mean stddev q1 q3;
	class SaleCondition;
	var SalePrice YearBuilt GarageArea;
run; 
	
*Question 6: Create a scatter plot using SalePrice on the y-axis and FirstFlrSF on the x-axis. 
Color the points by the Exterior2nd variable;

proc sgplot data = myhouse;
	scatter x = FirstFlrSF y = SalePrice/
								group = Exterior2nd;
run; 

*In the plot produced above, I see some fanning as the x values increase. 
 This indicates heteroskedasticity, which is an uneven variance of error/residuals;
 
*Question 7: Fit a multiple linear regression model using SalePrice as the response 
variable and FirstFlrSF and TotalBsmtSF as predictors.
Produce confidence intervals for the regression coefficient and diagnostic plots
that could be used to check assumptions;

proc glm data = myhouse plots = all;
	model SalePrice = FirstFlrSF TotalBsmtSF/clparm;
run;

* 

Estimated regression line:
y = 58.99379x_1 + 53.67872x_2 + 64976.27128	

x_1 is the value of the FirstFlrSF variable
x_2 is the value of the TotalBsmtSF variable

95% confidence interval for the FirstFlrSF slope:
(36.16120, 81.82639)

;

***************************************************************;

*Open-ended Tasks;

*
Below is the URL where I found the dataset:
https://www.kaggle.com/datasets/samikshadalvi/lungs-diseases-dataset?resource=download
;

*Question 1;

*
Explanatory Variable: Age
Response Variable: Lung Capacity
 
Is there a linear association between Age and someone's Lung Capacity?
;

*Question 2: Read in the chosen dataset into the proj library created earlier in this code;

filename lung '/home/u64121671/My SAS Programs/proj/lung_disease_data.csv';

proc import datafile= lung
	dbms = csv
	replace
	out = proj.lung;
	getnames= yes;
	guessingrows= max;
run;

*Question 3: Create a plot that is related to your question of interest;

proc sgplot data = proj.lung;
	scatter x = Age y = 'Lung Capacity'n;
run; 

*Question 4: Prdouce a linear regression model to investigate your question.
Produce confidence intervals, plots, etc. to help answer your question;

proc glm data = proj.lung plots= all;
	model 'Lung Capacity'n = Age/clparm;
run;
quit;

*When testing the following hypotheses:
 Ho: Beta_1 EQ 0 	Ha: Beta_1 NE 0
 
 Before checking the values to test if the results were significant, I examined the plots
 to see if the tests are appropriate. The residual plot does seem to be randomly scattered, 
 which is good. However, the qq plot does not show a straight line and Histogram doesn't look
 quite normal. Thus, we will proceed with caution.
 
 We obtain the p value 0.1929 from the  output from the above proc glm step. 
 Specifically, the p value for the slope and the p value for the F statistic test 
 these hypotheses.
 
 Because the p value is not < 0.05, we cannot reject Ho. There is not enough 
 evidence  to suggest that Beta_1 doesn't equal zero. Thus, we do not have sufficient 
 evidence that there is a linear relationship between someone's age and their lung capacity.
 
 Another way to confirm this is by looking at the 95% confidence interval that we produced 
 for the value of the slope. This interval was (-0.000703484, 0.003486179). This interval 
 includes 0, showing that there is not significant evidence at the alpha = 0.05 level that 
 the slope (beta_1) is not 0. Thus, we do not have evidence of a linear relationship between 
 Age and Lung Capacity of an individual.
;