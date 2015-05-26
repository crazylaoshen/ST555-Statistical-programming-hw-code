/***Rongjin Wang
	2/5/2015
	ST 555  ***/

/* first thing here is to uncomment code below to define orion library */
%let path=X:\Academic\Graduate\ST 555\SAS Doc\Data;
libname orion "X:\Academic\Graduate\ST 555\SAS Doc\Data";

proc format; 		/**  apply the user defined formats tiers to Salary   **/
   value tiers low-<50000 ='Tier 1'                  
             50000-<100000='Tier 2'
               100000-high='Tier 3';
run;

proc print data=orion.sales;
   var Employee_ID Job_Title Salary 
       Country Birth_Date Hire_Date;
   format Birth_Date Hire_Date monyy7.
          Salary tiers.;
run;


/** perform quality control (QC) validation to make sure the tiers format is applied correctly to the salary **/
proc freq data=orion.sales nlevels; /** using proc freq with nlevels option will show overall statistics for each variable*/
	tables Salary / nopercent; 
	format Salary tiers.;	
run;

proc sort data=orion.sales;			/** use proc sort to see whether people who is making 5000 is in this tier **/ 		
	out=work.sales;	
	where Salary between 0 and 50000;
	by decending Salary;
run;

proc print data=orion.sales;	/** check tier 2 subset**/
	where Salary between 50000 and 100000;
run;		/** program returns no observation, therefore, this is correct **/
