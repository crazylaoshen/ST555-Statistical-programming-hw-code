/***Your Name Ji Shen
	Date 1/15/2015
	ST 555
	Homework number 2
	Goal: 
    To apply concepts from the chapters to a set of problems
    ***/


%let path=D:\google drive\NC semester 6\st555\Data;

libname orion "D:\google drive\NC semester 6\st555\Data";

/*Problem 1: Check how many data in Orion libary are created */
title; * clear titles;
proc contents data=orion._all_ nods; *viewing variable names and attributes;
run;

/*Problem 3: Create Group Introduction Dataset */

data Orion.GroupIntro; 
    length name$ 8 age sex$ 1 decipline$ 25 ;
	input name$ age sex$  decipline$  GroupTrait$;
	datalines;
	Ji  30  M   Economics                HavePets     
    Ian 23  M   Chemistry                HavePets 
	Elissa 24 F NaturalResources         HavePets 
    Rongjing 23 M ElectricalEngineering  HavePets 
run; 

proc print data=orion.GroupIntro; *question 1b: Printing the results of the dataset;
	title 'Group Introduction'; *1b: Giving the printout an appropriate title;
run;

/*Problem 4: Check how many data in Orion libary are created */

DATA Tecator; /* see http://lib.stat.cmu.edu/datasets/tecator for details */
* Each sample contains finely chopped pure meat with different moisture, fat and protein contents ;
input Fat Moisture Protein;
datalines ;
60.5 22.5 16.7
46.0 40.1 13.5
71.0 8.4 20.5
72.8 5.9 20.7
58.3 25.5 15.5
44.0 42.7 13.7
44.0 42.7 13.7
69.3 10.6 19.3
61.4 19.9 17.7
61.4 19.9 17.7
41.4 46.0 12.5
76.6 0.9 21.2
72.7 2.9 21.7
71.4 3.5 21.5
69.8 4.0 21.3
74.5 5.2 20.2
73.5 5.6 20.0
74.1 6.3 19.2
67.3 7.2 20.1
71.8 7.8 20.2
72.4 7.9 19.7
71.6 9.2 18.7
69.4 9.3 18.2
;
RUN;
/*** END Data Step for HW2: Question IV ***/
title;
* Q4c: viewing variable names and attributes;
proc contents data=tecator ; 
run;
*Q4d: Printing the results of the dataset;
proc print data=tecator; 
	title 'Tecator'; * Giving the printout an appropriate title;
run;
*Q4e: Printing means of the dataset;
proc means data = tecator mean maxdec=2 fw=18;
    var fat moisture;
	title 'Mean of Fat and Moisture';
run;
