/***Marshall Grady
	3/3/2015
	ST 555
	Homework 7
	Goal: Merging and manipulating datasets in the SAS Programming 2 course ***/

ods pdf file="C:\Users\Marshall\Documents\My SAS Files\9.4\homework7results.pdf";

libname orion "C:\Users\Marshall\Documents\ecprg193";
run;

/*2a. Write any procedure other than PRINT that will create a report with the variable
names of each dataset.*/


%let path=C:\Users\Marshall\Desktop\STAT\New_prog2;

libname Prog2 "C:\Users\Marshall\Desktop\STAT\New_prog2";

proc contents data=Prog2.Sales121999;
run;

proc contents data=Prog2.Target121999;
run;


/*2b. Sort both datasets based on flight number and save the sorted datasets in the
Work library with new dataset names. In the sorted datasets, do not include the
variables associated with Business Passengers. Only include observations with
Start Point values of 'BHM' and flights scheduled for Christmas Day. Do not use
a DATA step to do any of these tasks in part b.*/

proc sort data=Prog2.Sales121999
	out=work.Sales2;
by FlightID;
run;

proc sort data=Prog2.Target121999
	out=work.tar_get;
by FlightID;
run;

proc print data=work.tar_get;
	where Origin='BHM' or Date=mdy(12,25,1999);
run;

proc print data=work.Sales2;
	where Origin='BHM' or Date=mdy(12,25,1999);
run;

/*2c. Utilize the two original datasets 'Sales121999.sas7bdat' and 'Target121999', do
the following in one DATA step:

i. Merge the two datasets based on flight number */

data Targetsales;
	merge tar_get (in=FIDT)
		  Sales2 (in=FIDS);
	by FlightID;
	if FIDT=1 and FIDS=1 then output TargetSales; 
run;
proc print data=work.Targetsales;
run;

/*
ii. Create a dataset that contains all observations with Start Point values of
‘BHM’, call this dataset ‘BHM’. How long did it take you to complete this
question? 3 minutes
*/

data BHM;
	merge tar_get
		  Sales2;
	if Origin='BHM' then output BHM; 
run;
proc print data=work.BHM;
run;

/*
iii. Output all observations with Start Point values different than ‘BHM’ into
one dataset and call this dataset ‘NonBHM’. How long did it take you to
complete this question? 1 minutes
*/
data NonBHM;
	merge tar_get
		  Sales2;
	if Origin~='BHM' then output NonBHM; 
	TotalTar=sum(BClassRev+CargoRev)DOLLAR15.2;
run;
proc print data=work.NonBHM;
run;



