************************************************;
*Author: Amulya Bollapragada                                                                                                                                                         
Correlation and Regression Video Programs                                                                                    
************************************************;

*Proc Corr;

LIBNAME NCSU '/home/u64121671/myLib';

proc corr data = NCSU.mywine fisher;
	var alcohol 'citric acid'n pH quality;
run;


*SLR;

proc glm data = NCSU.mywine plots(MAXPOINTS = 10000) = all;
	model quality = pH/CLm;
run;
quit;

proc glm data = NCSU.mywine plots(MAXPOINTS = 10000) = all;
	model quality = pH alcohol 'citric acid'n ph*ph;
run;
quit;

PROC GLM data = sashelp.bweight;
	MODEL weight = MomWtGain;
RUN;
QUIT;
