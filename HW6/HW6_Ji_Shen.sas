
/***Your Name Ji Shen
	Date 1/27/2015
	ST 555
	Homework number 6
	Goal: 
    To apply concepts from the chapters such as concatenate and merge data
    ***/
libname hw6 "D:\google drive\NC semester 6\st555\HW6";  *create hw5 libarary;
libname Orion "D:\google drive\NC semester 6\st555\data";  *create orion libarary;
ods pdf file='st555_hw6_result_JISHEN.pdf';



/*Quetion 1*/
/* Part a. The program will  calculate Compensation and BonusMonth correctly.*/
/* Part b. The variables in the DROP statement are available for processing in the DATA step but are not written to the output data*/



/*Quetion 2*/

/*Part a*/
data work.bonus;
set orion.nonsales;
if Country='US' then Bonus=500;
else Bonus=300;
run;
/* i observations 125, 197, and 200 have lowercase of contry names 'us'  */

/*ii*/
proc freq data = work.bonus nlevels;
table Bonus  ;   * select variable Bonus as catogory showed in the table;
run;

/*iii There 39 people received bonus of 300.*/


/*Part b*/
/* Solution 1: Test for multplie values of country */
data work.bonus;
set orion.nonsales;
if Country in ('US','us')
then Bonus=500;
else Bonus=300;
run;
proc freq data = work.bonus nlevels;
table Bonus  ;   * select variable Bonus as catogory showed in the table;
run;
/*i There are 199 people received bonus of 500.*/

/*Part c*/
/* Solution 2: Call the upcase function in the expression */ 
data work.bonus;
set orion.nonsales;
if upcase(Country)='US' then Bonus=500;
else Bonus=300;
run;
proc freq data = work.bonus nlevels;
table Bonus  ;   * select variable Bonus as catogory showed in the table;
run;
/*i There are 199 people received bonus of 500.*/

/*Part d*/
/* Solution 3: Clean data before subset variables */ 
data work.bonus;
set orion.nonsales;
country = upcase(country); *use the upcase function to “clean” the codes under Country;
if Country='US' then Bonus=500;
else Bonus=300;
run;


/*Quetion 3*/

* part a;
data work.birthday;
set orion.customer;
Bday2009 = mdy(month(birth_date),day(birth_date),2009);  *i;
BdayDOW2009 = weekday(Bday2009);   *ii;
Age2009 = (Bday2009-birth_date)/365.25;  *iii;
keep customer_name birth_date Bday2009 BdayDOW2009 Age2009;  * part b. include only listed variables;
format Bday2009 date9. Age2009 3.0;  * part c;
run;
proc print data = work.birthday;
where customer_name contains 'Raedene';
run;

/*part d */
/*She is the 56th observation*/
/*She is 17 in 2009*/
/*Thursday*/

/*part e */
/*There are 6 observations whose birthday are in June*/
proc print data = work.birthday;
where month(birth_date)=6; * subset the customers whose birthday are in June;
run;

/*Quetion 3*/

/*Part a  create temporary dataset Donations*/
data work.Donations;
set orion.Employee_Donations;
drop Recipients Paid_By;
run;
/*Part b  create temporary dataset Addresses*/
data work.Addresses;
set orion.Employee_Addresses;
drop Employee_name Street_ID;
where upcase(country)='US';  * subset cumstomers who are from US;
run;
/*Part c  Sort the two temporary dataset*/
proc sort data=work.Donations;
by Employee_ID;
run;

proc sort data=work.Addresses;
by Employee_ID;
run;

/*Part d Merge data*/
/*There are 316 observations in the new dataset'Donate_Address'*/
data work.Donate_Address;
merge work.Donations 
      work.Addresses;
by Employee_ID;
run;


/*Part e*/
/*i*/
data work.AddOnly;
merge work.Donations (in = D)
      work.Addresses (in = A);
by Employee_ID;
/*if D=0 and A=1;*/
if not D and A;
drop Qtr1 Qtr2 Qtr3 Qtr4;
run;

/*ii*/
data work.DonOnly;
merge work.Donations (in = D)
      work.Addresses (in = A);
by Employee_ID;
if D=1 and A=0;
/*if D and not A;*/
run;

/*iv*/
/*There are 192 observations 7 variables in AddOnly*/
/*v*/
/*There are 0 observations in DonOnly*/
/*vi*/
/*There are 316-192=124 matches.*/

/*Part f*/
data work.DonAdd;
merge work.Donations (in = D)
      work.Addresses (in = A);
by Employee_ID;
if D=1 and A=1;
/*if D and A;*/
run;


/*It took me 3 hours to complete this homework.*/

ods pdf close;
