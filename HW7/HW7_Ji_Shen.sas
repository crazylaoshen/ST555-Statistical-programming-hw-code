
/***Your Name Ji Shen
	Date 1/27/2015
	ST 555
	Homework number 7
	Goal: 
    To apply concepts from the chapters 7
    ***/
libname hw7 "D:\google drive\NC semester 6\st555\HW7";  *create hw7 libarary;
libname Orion "D:\google drive\NC semester 6\st555\prog2";  *create orion libarary;
ods pdf file='st555_hw6_result_JISHEN.pdf';



/*Quetion 1*/
/* Part g. The cre8data.sas created 56 datasets.*/


/*Quetion 2*/

/*Part a*/
/* create a report with the variable names of each dataset*/
proc contents data = hw7._all_;
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

/*Part f  It took me 1.5 hour to finish this assignment*/


/*Quetion 3*/
/*This is my dataset*/
 data hw7.GroupIntroShen;
    infile datalines delimiter=','; *Using infile with delimiter option to change delimiter as comma;
	input name:$15. HomeTown:$20.  Discipline:$30.  Age Gender:$1.  Hope:$150.  NoOfStClass  NoOfLanguage  ExpSas:$10.  GroupTrait:$20.;
	datalines;
	Ji Shen,   Taizhou,    Economics,30, M, Form a good programming habit in sas, 2, 1,  Medium,  We live with Pets     
    Ian Murray,Bridgeport, Chemistry,23, M, Get a basic understanding of SAS and R as to help me in statistical analysis of my research,1,0,None,  We live with Pets 
	Elissa Ashley,Orlando,NaturalResources,24,F, I am hoping to gain a greater understanding of SAS and R programming so that I can utilize these tools in my Graduate research,2,0,Little,We live with Pets
    Rongjing Wang, Dalian, Electrical engineering,23, M,I want to have a basic understanding of SAS and R from future research, 5, 2, little,  We live with Pets
;
run;

/*This is my teammate's dataset*/
data hw7.groupintroOlasimbo; /*bringing the info from the group discussions using informats and datalines*/
input From & $20. Discipline & $15. Age StatCourses GroupTrait & $30. Gender$ Languages Experience & $8. Interest1 & $30. Interest2 & $65.;
datalines;
Shandong, China  Statistics  26  6  Advance in Sas  Female  2  Medium  Changed Name  Loves to sew  
Riverdale, Ga  Statistics  30  15  Advance in Sas  Male  0  Little  Played Football at UT  Lived in 6 different states  
India  Engineering  26  3  Advance in Sas  Male  0  Little  Likes Chocolate  Likes Motorcycles
;
run;
/*This is my teammate's dataset*/
data hw7.GroupIntroGrady;
	input Name $ From $  Degree $  Age  Gains $  StClasses  PRGLanguages  Experience $  WeLove $;
	datalines;
	Marshall	NC	Stats	22	SAS+R	6	1	little	TV
	Kaaviya	India	IMSE	26	SAS+R	2	2	little	TV
	Jianhong	China	Stats	33	SAS+R	5	0	little	TV	
;
run;
/*Merge the the 3 dataset together*/
data hw7.GroupIntro_Shen;

set hw7.groupintroShen
    hw7.groupintroolasimbo(rename=(from=HomeTown StatCourses=NoOfStClass languages=NoOfLanguage Experience=ExpSas))
	hw7.groupintrogrady(rename=(from=HomeTown StClasses=NoOfStClass  gains=hope PRGlanguages=NoOfLanguage Experience=ExpSas Degree=Discipline Welove=grouptrait));

run;

/*There are 12 variables in my merged GroupIntro dataset*/
/*It took me 40 minutes to complete this question*/

/*Quetion 4*/
/*a. Paul is helpful in the disscusion in the forum.*/
/*b. I can't think of any this time.*/


ods pdf close;
