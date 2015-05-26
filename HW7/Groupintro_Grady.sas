/*Marshall Grady
  SAS 555 
  Homework 5
  Question 5*/

libname orion "C:\Users\Marshall\Documents\ecprg193";
run;

 data Orion.GroupIntro2;
	input Name $ From $  Degree $  Age $  Gains $  StClasses  PRGLanguages  Experience $  WeLove $;
	datalines;
	Marshall	NC	Stats	22	SAS+R	6	1	little	TV
	Kaaviya	India	IMSE	26	SAS+R	2	2	little	TV
	Jianhong	China	Stats	33	SAS+R	5	0	little	TV	
;
run;
proc print data=Orion.GroupIntro_Take2;
run;
