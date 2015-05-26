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
where type ? 'Private' and address ? 'Texas';  * subset obs of variables type and address contain ...;
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
