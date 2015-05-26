

/***Your Name Ji Shen
	Date 1/27/2015
	ST 555
	Homework number 4
	Goal: 
    To apply concepts from the chapters such as ad label format and import excel files to a set of problems
    ***/
libname orion "D:\google drive\NC semester 6\st555\data";  *create orion libarary;
ods pdf file='st555_hw4_result_JISHEN.pdf';
/* Question 1 */

/* part a */
/*Create a character format*/
proc format;
value $GENDER  'F' = 'Female'
               'M' = 'Male'
			   other = 'Invalid code';
run;
/* part b */
proc freq data = orion.nonsales;
table gender / missing nocum ;   * select variable gender as catogory showed in the table;
format gender $GENDER.;  * set format as created before;
run;


/* part c */
/*Create a numeric format*/
proc format;
value SALRANGE  20000 - < 50000 = 'Below $50000'
               50000 - < 100000 = 'Between $50000 to $100000'
			   100000 - < 500000 = '$100000 or more'
                . = 'Missing salary'
               other = 'Invalid salary';
run;
/* part d */
proc freq data = orion.nonsales;
table salary;   * select variable salary as catogory showed in the table;
format salary SALRANGE.; * set format as created before;
run;


/* part e */
/*There are 43 emplyees meet this criterion.*/
data orion.Asst;
set orion.nonsales;
where Job_title contains 'Assistant';
run;



/* part f */
proc print data=orion.Asst noobs split=' '; 
format gender $GENDER. salary SALRANGE.;   * set format as created before;
id Employee_ID;  *display Employee_ID as the identifier ;
label Employee_ID='Employee ID'
      Job_Title = 'Job Title';  * Create a labels 
run;


/* Question 2 */
/*The option 'LIBRARY=libref<.catalog>' stores the formats created in the permanent LIBRARY.FORMATS catalog. */

/*The options FMTSEARCH=(catalog-specification-1<... catalog-specification-n>)searches the catalogs in the
 FMTSEARCH= list in the order that they are listed until the format or informat is found.;*/

/* Question 3 */

data work.delays;  * 3-a) create data work.delays using orion.orders as input;
set orion.orders;
where Employee_id = 99999999; * subset obs of variables employee_id;
Order_month = month(Order_Date); * create new variable , order_month;
Days4Delivery = Delivery_date- Order_Date; * create new variable  days4deliverry;
if days4delivery >= 4 and order_month in (7,8,6) ;  * subset observation based on 2 created new variables;
drop order_id order_type;
label order_date = 'Date ordered'
      delivery_date = 'Date Delivered'
	  order_month = 'Month Ordered';   * add labels;
format order_date delivery_date order_Month mmddyy10.;  * add format;
run; 

proc print data=work.delays;
id Employee_id;
run;
/*verify that the labels and formats were stored permanently*/
proc contents data = work.delays;
run;

/*Question 4*/

/* part a */
libname hw4 excel "D:\google drive\NC semester 6\st555\HW4\football.xls";  *create hw4 libarary using excel engine;
* print first 10 observations;
proc print data = hw4.'Colleges$'n (obs=10);
run;
proc print data = HW4.'footballrecruiting$'n (obs=10);
run;

/* part b */
data work.colleges;
set hw4.'Colleges$'n;
run;
data work.recruit;
set HW4.'footballrecruiting$'n;
run;

/* part c */
/*The format for address is $98.*/
proc contents data = work.colleges;
run;

/* part d */
/*The data set WORK.TEXAS has 59 observations and 6 variables.*/
data work.texas;
set work.colleges;
where type ? 'Private' and address ? 'Texas';  * subset obs of variables type and address;
drop Address Type;  * drop variables address and type;
format Students Undergrads comma10.; * add format for variable students and undergrads;
run;

/* part e */
/*The data set WORK.RECRUIT2 has 8 observations and 7 variables.*/
data work.recruit2;
set work.recruit;
drop points;  * drop variable points;
label Conf = 'Conference'    
      Off = 'Offense'
	  Def = 'Defense'
	  SpT = 'Special Teams'; * set labels;
where rank<=20 and conf like '%C';  *subset observations of variable rank and conf;
run; 


/* part f : Florida is ranked number 1*/
proc print data=work.recruit2 label;
run;

libname hw4 clear;

/*Question 5*/

/*This howework take me 4 hours. */



 ods pdf close;
