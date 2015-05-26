
/***Your Name Ji Shen
	Date 3/4/2015
	ST 555
	Homework number 8
	Goal: 
    To apply concepts from the chapters 4 5 6 like reading raw data and data transform
    ***/
libname hw8 "D:\google drive\NC semester 6\st555\HW8";  *create hw7 libarary;
libname Orion "D:\google drive\NC semester 6\st555\prog2";  *create orion libarary;
%let path=D:\google drive\NC semester 6\st555\prog2;

ods pdf file='st555_hw6_result_JISHEN.pdf';

/*Quetion 1*/
/* Part g. The cre8data.sas created 56 datasets.*/


/*a) Create a new SAS data sets called 'Sales' that contain the fields indicated by ** in the*/
/*tables above. Format the Salary variable so that is displays the $ and comma, but no*/
/*decimals, and format the Hire Date so that it dispays like 01APR2014.*/

/*i. From the log, how many records were read from Sales3.dat? _330__*/
/*ii. How many observations are in Sales? __165__*/

data hw8.sales;
   infile "&path\sales3.dat"; 
   input  @1 Employee_ID 6.
         @8 First_Name $12.  
         @21 Last_Name $18.
         @43 Job_Title $20.;
   input @24 Hire_Date ddmmyy10.
         @10 Country $2.@; 
		 
	if Country = 'AU' then do;
      input @1 Salary dollarx8.;
	  end;
    else if Country = 'US' then do;
      input @1 Salary dollar8.;
	  end;
    format salary dollar8.  Hire_Date date9.;
	run;


/*	b) Create two new datasets called 'AUJobTotals' and 'USJobTotals' with the following:*/

/*iv. Format the total salary to display the $ and commas.*/

proc sort data= hw8.sales;
	by country job_title;
run;


data hw8.USJobTotals (keep=job_title total_salary total_number country)
     hw8.AUJobTotals (keep=job_title total_salary total_number country);  
/*ii. Only keep the job title, the total salary, and the total number of employees in each dataset.*/
  set hw8.sales;
  by Country Job_Title;
  /*i. Calculate the total salary and number of employees of each job title in each*/
/*country.*/
    if first.job_title=1 then do;
    Total_Salary=0;
	Total_Number=0;
  end;
  Total_salary+Salary;
  Total_Number+1;
  if last.job_Title=1;
  label job_title='Job Title' Total_Number='Number of Employees'; *iii. Add the labels; 
  format Total_Salary dollar10.; /*iv. Format the total salary to display the $ and commas.*/
  if country='US' then output hw8.USJobTotals;  *ii. Output the US totals to 'USJobTotals';
  else if country='AU' then output hw8.AUJobTotals;  *ii.output the Australian totals to 'AUJobTotals'.;
run; 


/*c) Print the two datasets in (b).*/
proc print data = hw8.USJobTotals label;
run;
proc print data = hw8.AUJobTotals label;
run;
/*i. What is the total salary paid to US Sales Rep. I's?__$1,113,650_____*/
/*ii. How many Australian Sales Managers are there?___$196,230____*/



/*d) create a new dataset called “Reps4” that only contains*/
/*employees whose Job Title is “Sales Rep. IV” with the following variables:*/



/*Add First_name and Birth_date into dataset sales2 from raw data*/
data hw8.sales2;
   infile "&path\sales3.dat"; 
   input  @1 Employee_ID 6.
         @8 First_Name $12.  
         @21 Last_Name $18.
         @43 Job_Title $20.;
   input 
         @24 Hire_Date ddmmyy10.
         @10 Country $2.@; 
		 
	if Country = 'AU' then do;
      input @1 Salary dollarx8.
	        @13 Birth_Date ddmmyy10.;
	  end;
    else if Country = 'US' then do;
      input @1 Salary dollar8.
	         @13 Birth_Date mmddyy10.;
	  end;
    format salary dollar8.  Hire_Date date9.;
	run;


data hw8.Reps4(drop=Hire_Day);
set hw8.sales2(rename=(Hire_Date=Hire_Day));
if job_title ='Sales Rep. IV';
Full_name= cat(' ',First_Name,Last_Name); *i. Create a variable full name that combines each employee’s First Name and last name;
Age = round(('19oct2014'd-Birth_Date)/365); *ii. Create a variable age that gives the Age of each employee as of October 19, 2014;
Hire_Date = put(Hire_day, date9.);  /*iii. Convert Hire Date to a character variable. */
run;

/*e) Provide a proc contents for Reps4 dataset created in d)*/
proc contents data=hw8.Reps4;
run;
/*i. How many employees are in the Reps4 dataset? ___16_____*/







ods pdf close;
