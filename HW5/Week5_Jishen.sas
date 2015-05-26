libname orion "D:\google drive\NC semester 6\st555\data";  *create orion libarary;

proc format;
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



/* This is my Qulaity Control Portion;*/

* Create 3 individual data corresponding to the levels set in tier format;
* Then check the log how many observations in each dataset;
data work.sales1;
set orion.sales;
where salary < 50000;
run;
/*There were 159 observations read from the data set ORION.SALES.*/
/*WHERE salary<50000;*/


data work.sales2;
set orion.sales;
where salary >= 50000 and 
      salary < 100000;
run;
/*There were 4 observations read from the data set ORION.SALES.*/
/*WHERE (salary>=50000 and salary<100000);*/


data work.sales3;
set orion.sales;
where salary >=  100000;
run;
/* There were 2 observations read from the data set ORION.SALES.*/
/* WHERE salary>=100000;*/


* Then use proc freq with nlevels option to check the number of variable levels from the formatted variable values;
* Then compare the frequencies in each level with the observations we got in the log for the 3 individual set to see if there is any differences;
* If they are same then we are sure the tier format is correctly used.;
Proc Freq data=orion.sales nlevels; 
	tables Salary/ nocum nopercent;
	format salary tiers.;
run;

