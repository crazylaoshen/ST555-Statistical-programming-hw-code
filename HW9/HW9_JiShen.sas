
/***Your Name Ji Shen
	Date 3/18/2015
	ST 555
	Homework number 9
	Goal: 
    To apply concepts from the chapters 7 9 like using loop and data rotation.
    ***/
libname hw9 "D:\google drive\NC semester 6\st555\HW9";  *create hw9 libarary;
libname Orion "D:\google drive\NC semester 6\st555\prog2";  *create orion libarary;
%let path=D:\google drive\NC semester 6\st555\HW9;

ods pdf file='st555_hw6_result_JISHEN.pdf';




/*Quetion 1*/
/*There are 21 patients included in the 'completers'dataset*/
data hw9.completers;
set hw9.lapband;
if cmiss(of _all_) then delete;
run;

/*Quetion 2*/
data hw9.noneg9;
set hw9.completers;
array Records{*} WgtLBS:;
do i=1 to dim(Records);
if Records{i}=-9 then Records{i}=.;
end;
run;

/*Quetion 3*/

/*Part a Convert the weight measurements to kg*/
data hw9.noneg9_kg;
set hw9.noneg9;
drop i WgtLBS:;
array Records{*} WgtLBS:;
array Rc{*} WgtKG0 WgtKG2 WgtKG4 WgtKG6 WgtKG12 WgtKG18 WgtKG24;
do i=1 to dim(Rc);
Rc{i}=0.4536*Records{i};
end;
run;


/*Convert wide data to narrow one*/
data hw9.noneg9_v(keep=id Month WgtKG WgtLBS);
set hw9.noneg9;
array Records{*} WgtLBS:;
do i=1 to dim(Records);
Month = 2*i;
WgtLBS=Records{i};
WgtKG=0.4536*Records{i};
output;
end;
run;

/*Sort the data*/
proc sort data=hw9.noneg9_v;
by Month;
run;

/*Summarize the data for both KG and LBS*/
proc means data = hw9.noneg9_v  mean stddev min median max ;
var WgtLBS WgtKG;
by Month;
run;

/*Quetion 4*/

/*Part a */
/*Calculate the percentage change*/
data hw9.noneg9_pct(drop=i );
set hw9.noneg9;
array Records{*} WgtLBS:;
array Pctwl{*} Pctwl2 Pctwl4 Pctwl6 Pctwl12 Pctwl18 Pctwl24;
do i=1 to dim(Pctwl);
Pctwl{i}=((Records{i+1}-Records{1})/Records{1})*100;
end;
run;

/*Part b*/
/*Convert wide dataset to narrow dataset*/
data hw9.noneg9_pctv(keep=id Month Pctwloss);
set hw9.noneg9_pct;
array Pctwl{*} Pctwl:;
do i=1 to dim(Pctwl);
if Pctwl{i} ne .  then do;
Month = 2*i;
Pctwloss=Pctwl{i};
output;
end;
end;
run;
/*Sort the data*/
proc sort data=hw9.noneg9_pctv;
by Month;
run;
/*Summarize data of weight change percentage of different time point*/
proc means data = hw9.noneg9_pctv mean stddev min median max;
var Pctwloss;
by Month;
run;

/*Quetion 5*/
/*calculate the difference between result and goal*/
data hw9.compare(drop=i);
   set hw9.noneg9_pct;
   array Pctwl{*} Pctwl:;
   array Diff{6};
   array Goal{6} _temporary_ (-10,-14,-18,-20,-22,-27); * set the goal using look up table;
   do i=1 to 6;
      Diff{i}=Pctwl{i}-Goal{i};
   end;
run;

/*Transpose the data*/
data hw9.compare_v(keep=id Month Difference);
set hw9.compare;
array Diff{*} Diff:;
do i=1 to dim(Diff);
if Diff{i} ne .  then do;
Month = 2*i;
Difference=Diff{i};
output;
end;
end;
run;
/*sort the data by month*/
proc sort data=hw9.compare_v;
by Month;
run;

/*Part a :Provide summary statistics for these 6 difference variables.*/
proc means data = hw9.compare_v mean stddev min median max;
var Difference;
by Month;
run;
/*Part b :Provide output that provides the number of patients for each category .*/
data hw9.compare_met;
set hw9.compare_v;
if Difference<=0 then Diffmet = Difference;  * set the diffmet if the patients meet the goal;
run;

/*Count the number of patient for each month*/
proc means data = hw9.compare_met N ;
var Difference Diffmet;
by Month;
run;




ods pdf close;
