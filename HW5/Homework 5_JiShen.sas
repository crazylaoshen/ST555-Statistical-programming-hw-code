

/***Your Name Ji Shen
	Date 1/27/2015
	ST 555
	Homework number 5
	Goal: 
    To apply concepts from the chapters such as read non standard data and manipulate data
    ***/
libname hw5 "D:\google drive\NC semester 6\st555\HW5";  *create hw5 libarary;
libname Orion "D:\google drive\NC semester 6\st555\HW5";  *create orion libarary;

ods pdf file='st555_hw5_result_JISHEN.pdf';
/* Question 1 */

/* part a */
/*Use DATA step to read supplier.csv into SAS*/
data hw5.supplier;
infile "D:\google drive\NC semester 6\st555\HW5\supplier.csv" dlm=',' firstobs=2;
input Supplier_ID  Supplier_Name :$28.  Street_ID  Supplier_Address :$24. Street_Number Country :$2.;
* use informat to read nonstandard data;
run;


/* part b */
/*The length for Supplier Name is 28;*/
/*The length for Address is 24;*/
/*The length for Country is 2;*/

/* part c*/
data hw5.supplier2;
* ii Use length statement ensure that the values of 'DiscountType' and 'Region' are not truncated.;
set hw5.supplier;
length DiscountType $ 8   Region $ 17; 
* Create 3 new variables under conditions;
if Country in('US', 'CA') then do;
Discount=0.10 ;
DiscountType ='Required';
Region= 'North America';
end;
else do;
Discount=0.05;
DiscountType ='Optional';
Region= 'Not North America';
end;
* Only keep the supplier name, country, and the 3 variables created in part b;
keep supplier_name country Discount DiscountType  Region;
run;


/* part d */
* There are 24 obs in North america, 28 are not in North America;
proc freq data = hw5.supplier2 nlevels;
table region / nocum ;   * select variable region as catogory showed in the table;
run;

 

/* Question 2 */

* part a write a DATA step to read in prices.dat.;
data hw5.prices;
infile "D:\google drive\NC semester 6\st555\HW5\prices.dat" dlm='*' missover ; * use missover to leave place for missing data in the end;
input ProductID  StartDate:date. EndDate:date. UnitCostPrice:dollar. UnitSalesPrice:dollar.; * informatw.to read nonstandard data, w typically not used;
* part b create labels;
label  ProductID ='Product ID'    StartDate='Start of Date' EndDate='End of Date'   
       UnitCostPrice='Cost PPU'   UnitSalesPrice='Sales PPU';
* part c & d set format;
format StartDate enddate ddmmyy10. unitcostprice  unitsalesprice dollar5.2 ;
run; 

* part e print the dataset with labels ;
proc print data=hw5.prices  label;
run;

* part f  The 25th observation doesn't contain any missing values;


/* Question 3*/
* read in manager.dat and display the result;
data hw5.salesmgmt;
infile "D:\google drive\NC semester 6\st555\HW5\managers.dat" dlm='/' dsd missover; * use dsd recognize missing data between delimiters;
* informatw.to read nonstandard data, w typically not used, colon modifier will make sas read until next delimiter;
input ID  First$ Last:$11.  Gender$ Salary  Title:$20. Country$   Birthdate:date.  HireDate:ddmmyy.; 
run; 


proc print data=hw5.salesmgmt ;
var ID Last Title  HireDate  Salary; * keep only 5 variables;
format Last $11. Title $20. HireDate Date9.; * set the format which is required ;
run;




* part c recreate the report with dollar sign and commas;

proc print data=hw5.salesmgmt ;
var ID Last Title  HireDate  Salary; * keep only 5 variables;
format Last $11. Title $20. HireDate Date9. Salary dollar8.; * set the format which is required ;
run;



/* Question 4*/
*SAS/Access guarantees accessing the most recent data in the workbook or database;
*Proc import is easier for programming, it doesn't need the name literal;
*Proc import makes a copy of data unless use specific option replace;


/* Question 5*/
* Creat my goup data;
 data Orion.GroupIntro2;
    infile datalines delimiter=','; *Using infile with delimiter option to change delimiter as comma;
	input name:$15. HomeTown:$10.  Disciplineage:$30.  Age Gender:$1.  Hope:$150.  NoOfStClass  NoOfLanguage  ExpSas:$10.  GroupTrait:$20.;
	datalines;
	Ji Shen,   Taizhou,    Economics,30, M, Form a good programming habit in sas, 2, 1,  Medium,  We live with Pets     
    Ian Murray,Bridgeport, Chemistry,23, M, Get a basic understanding of SAS and R as to help me in statistical analysis of my research,1,0,None,  We live with Pets 
	Elissa Ashley,Orlando,NaturalResources,24,F, I am hoping to gain a greater understanding of SAS and R programming so that I can utilize these tools in my Graduate research,2,0,Little,We live with Pets
    Rongjing Wang, Dalian, Electrical engineering,23, M,I want to have a basic understanding of SAS and R from future research, 5, 2, little,  We live with Pets
;
run; 

* part d  print the dataset;
proc print data=Orion.GroupIntro2;
run;


/* Question 6*/
/*I spend 3.5 hours to finish this homework.*/

ods pdf close;
