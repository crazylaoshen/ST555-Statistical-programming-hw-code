/***Your Name Ji Shen
	Date 1/21/2015
	ST 555
	Homework number 3
	Goal: 
    To apply concepts from the chapters to a set of problems
    ***/

libname orion "D:\google drive\NC semester 6\st555\data";  *create orion libarary;
libname HW "D:\google drive\NC semester 6\st555\HW3"; *create HW libarary;

/* Question 1 */
/* part b */

proc print data=HW.ffprez noobs; *print out all the data;
run;


/* part c */
proc print data=HW.ffprez noobs; 
where gender='Female';  *print out all the observation of female respondents;
run;


/* part d */
proc print data=HW.ffprez noobs; 
where gender='Male'and resp_party = 'Republican';  *print out all the observation of Male republican respondents;
run;

/* part e */
proc print data=HW.ffprez noobs; 
where resp_party in('Democrat', 'Republican') and 
year >2032;  *print out all the observation from respondents of either democrat
or republican, and do not think a woman will be president until after 2032 ;
run;

/* part f */
proc print data=HW.ffprez noobs; 
where year=.;  *print out all the observation which year is missing value;
run;

/*Question 2 */

/* part a*/
Data Sales; * correct dta to data;
set orion.Sales; 
where Country='US' AND Salary <= 26000;  * variable name corrected as salary missing semicolon;
RUN;
PROC PRINT data=Sales; * data name corrected from salse to sales;
RUN;

/*part b*/

PROC PRINT data=Sales;
format hire_date year.; * set the format of date into year;
id Employee_id;  * use employee_id as indentifier;
where hire_date>='01jan1998'd; * select employees hired after Jan,1998;
RUN;

/*Question 3*/

/*part a*/
proc sort data = orion.employee_payroll  out = salary;
by employee_gender decending salary; * sort the data by Employee_Gender, and within gender by Salary in descending order;
run;

/*part b*/
proc print data = salary noobs;
var employee_id salary marital_status; *display only the variables Employee_ID, Salary, and Marital_Status;
where employee_term_date ~= . and salary>50000; *only for former employees earn more than 50000 salary;
sum salary; * include a total and subtotals for Salary;
by employee_gender;
run;


/*Question 4*/

ods trace on;
*ods select ExtremeObs;  * select the output only with ExtremeObs;
proc univariate data = orion.shoes_tracker;
var product_id;   *select only the variable product_id;
run;
ods trace off;



