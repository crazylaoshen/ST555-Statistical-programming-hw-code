
/** Question 4 **/
libname orionx excel path="&path\Football.xls"; 	/** a. Use LIBNAME statement to read two worksheets into SAS **/
proc print data=orionx.'Colleges$'n (obs=10);		/** print the first 10 observations of each worksheet **/
run;
proc print data=orionx.'footballrecruiting$'n (obs=10);
run;

data work.Colleges;					/** b. Create two SAS datasets in the Work library and name them 'Colleges' and 'Recruit' **/
	set orionx.'Colleges$'n;
run;
data work.Recruit;
	set orionx.'footballrecruiting$'n;
run;

proc contents data=work.Colleges;	/** c. Write an appropriate procedure to display the descriptive portion of the 'Colleges' dataset. **/
run;								/** What format does the 'Address' variable have? ___$98.____ **/

data work.collegestmp;		/** d. Create a new temporary SAS dataset based on 'Colleges' **/
	set work.Colleges;				
	where Type contains 'Private' and  /** 1) only private schools in Texas **/ 
		Address contains 'Texas';
	Drop Address Type;		/** 2) Drop the 'Address' and 'Type' variables **/
	format Students Undergrads COMMA12.2;	/** 3) Format 'Students' and 'Undergrads'**/
run;			/** 4) From the Log window, Observations ___59____ Variables ___6____  **/				

data work.recruittmp;		/** e. Create a new SAS temporary dataset based on 'Recruit' **/
	set work.Recruit;
	drop Points;			/** 1) Do not include the variable 'Points' in this new dataset ***/
	label Conf='Conference' Off='Offense'  	/**2) Apply the labels **/
		Def='Defense' SpT='Special Teams';
	where Rank<=20; 		/** 3) Only include schools ranked in the top 20 and in conferences that end in 'C' **/
	where same and Conf like '%C';
run;				/** 4) How many observations and variables are there? Observations ___8____ Variables __7_____ **/

proc print data=work.recruittmp label; 	/** f. Print the dataset in (e) with the labels. Which school is ranked number 1? __Florida____ **/
run;

libname orionx clear;		/** g. Use a LIBNAME statement to deassign the library created in (a) **/
