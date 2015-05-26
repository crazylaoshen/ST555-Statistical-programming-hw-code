/*i.      Where You Are From:    JiangSu Province, China*/
/*ii.     Discipline:    Economics*/
/*iii.    Birthdate or Age:    30*/
/*iv.     Gender:    Male*/
/*v.      What You hope to get out of this course:   Form a good programming habit in sas*/
/*vi.     # of statistics courses taken:   4*/
/*vii.    # of programming languages proficient:   2*/
/*viii.   Experience with SAS: None, Little, Medium, A Lot:    Medium*/
/*ix.     Two Interesting/Unique Things About Yourself:    My favorite TV drama is The Shiled*/

/*Input the SAS dataset*/
data NBAplayer ;
input name$18. games minutes points; 
*input variables include one character variable and three numeric variables;
datalines;
James Harden      35 36.7 26.8
Lebron James      29 37.5 25.2
Anthony Davis     34 35.8 23.9
Carmelo Anthony   30 36.1 23.9
DeMarcus Cousins  24 32.6 23.5
LaMarcus Aldridge 31 36.5 23
Kobe Bryant       32 34.8 23
Stephen Cury      33 33.3 22.9
Blake Griffin     36 35.3 22.6
Damian Lilard     35 36.1 22.2
Jimmy Butler      33 39.8 21.7
Klay Thompsan     32 32.9 21.6
;
run;

/*Let's print the dataset*/
proc print data=NBAplayer;
run;
