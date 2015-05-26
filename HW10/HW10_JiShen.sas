
/***Your Name Ji Shen
	Date 3/25/2015
	ST 555
	Homework number 10
	Goal: 
    To apply concepts from the chapters 9 10 11.
    ***/
libname hw10 "D:\google drive\NC semester 6\st555\HW10";  *create hw10 libarary;
libname Orion "D:\google drive\NC semester 6\st555\prog2";  *create orion libarary;
%let path=D:\google drive\NC semester 6\st555\HW10;

ods pdf file='st555_hw6_result_JISHEN.pdf';
options fmtsearch=(hw10 hw10.myfmts);

/*Quetion 1*/

/*Part a*/
/*Create an output dataset named wgtlift that rotates the weights dataset from wide */
/*to narrow/long. */
data hw10.wgtlift(keep=Subj Program Strength TimePoint);
set hw10.weights;
array wgt{*} s1 s2 s3 s4 s5 s6 s7;
array look{*} _temporary_ (85    85    86    85    87    86    87);
do i=1 to dim(wgt);
TimePoint = i;
Strength=wgt{i};
output;
end;
run;

/*Part b*/

/*1.  Convert the abbreviations RI, WI, CONT, to the full as Repetition Increase, Weight */
/*Increase, and Control*/
/*2.  Change TimePoint= 1, 2, 3, …, 7 to read TimePoint= Day 1, Day 3, Day 5, …., Day 13*/
proc format ;
value $program  'RI'='Repetition Increase'
                'WI'= 'Weight Increase'
                'CONT' = 'Control';
value   dayrec     1 = 'Day 1'
				   2 = 'Day 3' 
				   3 = 'Day 5' 
				   4 = 'Day 7' 
			       5 = 'Day 9' 
				   6 = 'Day 11' 
				   7 = 'Day 13';
run;


proc print data=hw10.wgtlift noobs;
format Program $program.
       TimePoint dayrec.;
run;


/*Part c */
/*Use as array in a data step that rotates the wgtlift dataset back to a wide dataset*/
data hw10.back2wide(drop=timepoint i strength);
set hw10.wgtlift;
by program subj;
retain Day1 Day3 Day5 Day7 Day9 Day11 Day13;
array wgt{*} Day1 Day3 Day5 Day7 Day9 Day11 Day13 ;
if first.subj then do;
do i=1 to dim(wgt);
wgt(i)=.;          *hold the place to fill in strength data;
end;
end;
wgt(TimePoint)=strength; * replace missing value with observations of strength;
if last.subj then output;

run;

proc print data=hw10.back2wide;
run;

/*Part d*/
/*create permanent formats*/
proc format lib = hw10.myfmts;
value $profmt  'RI'='Repetition Increase'
                'WI'= 'Weight Increase'
                'CONT' = 'Control';
run;
data hw10.back2wide;
set hw10.back2wide;
format program $profmt.;
run;


/*Part e*/
/*Provide a report that gives the n, mean, std, min, median, and max for the strengths at each time point for each weightlifting program.*/
proc sort data=hw10.wgtlift out=hw10.wgtsorted;
by program timepoint ;
run;

proc means data=hw10.wgtsorted n mean std min median max;
var strength;
by program timepoint; 
run;


/*Question 2*/


proc sql;
   create table hw10.st (id num, STscore num);
   insert into hw10.st
   values(1,.76) values(7,.65) values(2,.88) values(3,.98) values(9,.74) values(4,.89);



   create table hw10.ma (id num, MAscore num);
   insert into hw10.ma
   values(10,1.00) values(1,.89) values(7,.43) values(3,.76) values(9,.54) values(8,.99);

  
   create table hw10.hs (id num, HSscore num);
   insert into hw10.hs
   values(10,1.00) values(7,.81) values(2,.87) values(5,.92) values(6,.85) values(9,.67) values(8,.93) values(4,.65) ;

/*Part a.  common to the Statistics and Mathematics courses.  Include their scores (course average) in both classes in a side-by-side fashion. */
select s.id,  STscore format=percent8., MAscore format=percent8.
from hw10.st s, hw10.ma m
where s.id = m.id;

/*Part b.  common to the Statistics and History courses.  Include their scores in both classes in a side-by-side fashion. */
select s.id,  STscore format=percent8., HSscore format=percent8.
from hw10.st s, hw10.hs h
where s.id = h.id;
/*c.   common to the Mathematics and History courses.  Include their scores in both classes in a side-by-side fashion.  */
select m.id,  MAscore format=percent8., HSscore format=percent8.
from hw10.ma m, hw10.hs h
where m.id = h.id;
quit;




ods pdf close;
