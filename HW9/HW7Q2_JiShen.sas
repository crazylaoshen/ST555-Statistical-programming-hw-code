
/*Quetion 2*/

/*Part a*/
/* create a report with the variable names of each dataset*/
proc contents data = hw7._all_ ;
run;

/*Part b*/
/*Only include observations with Start Point values of 'BHM' and flights scheduled for Christmas Day. */
proc sort data=hw7.Sales121999 out=work.Sales(drop=BClassRev);
by flightid;
where origin = 'BHM' and date = '25Dec1999'd;
run;

proc sort data=hw7.target121999 out=work.target(drop=BClassTarRev);
by flightid;
where origin = 'BHM' and date = '25Dec1999'd;
run;

/*Part c*/
/*sort the 2 original datasets for merge*/
proc sort data=hw7.Sales121999 ;
by flightid;
run;

proc sort data=hw7.target121999;
by flightid;
run;


data hw7.BHM  hw7.NonBHM;
merge hw7.Sales121999
      hw7.target121999; * i. merge the data;
by flightid;
select (origin);
	  when ('BHM')  do;
         TotalTar=sum(BClassTarRev,CargoTarRev,EClassTarRev,FClassTarRev); * iv Create a new variable called 'Totaltar';
		 TotalSal=sum(BClassRev,CargoRev,EClassRev,FClassRev); * v Create a new variable called 'TotalSal';
		 if totaltar>=totalsal then Goal='Not Met'; else Goal='Met'; * vi Create a new variable called 'Goal';
         output hw7.BHM;
      end;
	  otherwise  do;
	  	 TotalTar=sum(BClassTarRev,CargoTarRev,EClassTarRev,FClassTarRev); * iv Create a new variable called 'Totaltar';
		 TotalSal=sum(BClassRev,CargoRev,EClassRev,FClassRev); * v Create a new variable called 'TotalSal';
		 if totaltar>=totalsal then Goal='Not Met'; else Goal='Met'; * vi Create a new variable called 'Goal';
		 output hw7.NonBHM;
      end;
end; 
run;
/*ii. 20 minutes to complete this question*/
/*iii. 30 minutes to complete this question */

/*Part d*/
data hw7.bhm_final;
set hw7.bhm;
if flightid ^= 'IA02401'
and goal='Met' then output;
keep flightid FClassRev BClassRev EClassRev CargoRev totalsal;
run;

/*Part e*/
proc print data=hw7.bhm noobs label ;
label totalsal='Total Revenue';
format totalsal dollar10.2 ;
run;
