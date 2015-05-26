
/*--------------Question 3 ---------------------*/

proc sort data=orion.groupintro_Take2Olasimbo;
by discipline;
run;

proc sort data=orion.GroupIntro2Grady;
by degree;
run;

proc sort data=Orion.GroupIntro2Shen;
by Disciplineage;
run;

/* 3a-b.  Merging the datasets  */
data orion.GroupIntro_Olasimbo_Group11;
merge	orion.groupintro_Take2Olasimbo 
		orion.GroupIntro2Grady (rename=(degree=Discipline
										Gains=Group
										StClasses=StatCourses
										PRGLanguages=Languages
										WeLove=Interest1))

		Orion.GroupIntro2Shen (rename=(hometown=from
										Disciplineage=Discipline
										hope=group
										NoOfStClass=StatCourses
										NoOfLanguage=Languages
										expSas=Experience
										GroupTrait=Interest1));
by discipline;
Run;

/* 3c. 11 variables are in the merged dataset */
/* 3d This problem took me an hour to comlete. */

proc print data=orion.groupintro_Olasimbo_group11;
run;

ods pdf close;

/* datasets from groupdiscussions */

data orion.groupintro_Take2Olasimbo; /*bringing the info from the group discussions using informats and datalines*/
input From & $20. Discipline & $15. Age StatCourses Group & $30. Gender$ Languages Experience & $8. Interest1 & $30. Interest2 & $65.;
datalines;
Shandong, China  Statistics  26  6  Advance in Sas  Female  2  Medium  Changed Name  Loves to sew  
Riverdale, Ga  Statistics  30  15  Advance in Sas  Male  0  Little  Played Football at UT  Lived in 6 different states  
India  Engineering  26  3  Advance in Sas  Male  0  Little  Likes Chocolate  Likes Motorcycles
;
run;

 data orion.GroupIntro2Grady;
	input Name $ From $  Degree $  Age   Gains $  StClasses  PRGLanguages  Experience $  WeLove $;
	datalines;
	Marshall	NC	Stats	22	SAS+R	6	1	little	TV
	Kaaviya	India	IMSE	26	SAS+R	2	2	little	TV
	Jianhong	China	Stats	33	SAS+R	5	0	little	TV	
;
run;

 data Orion.GroupIntro2Shen;
    infile datalines delimiter=','; *Using infile with delimiter option to change delimiter as comma;
	input name:$15. HomeTown:$10.  Disciplineage:$30.  Age Gender:$1.  Hope:$150.  NoOfStClass  NoOfLanguage  ExpSas:$10.  GroupTrait:$20.;
	datalines;
	Ji Shen,   Taizhou,    Economics,30, M, Form a good programming habit in sas, 2, 1,  Medium,  We live with Pets     
    Ian Murray,Bridgeport, Chemistry,23, M, Get a basic understanding of SAS and R as to help me in statistical analysis of my research,1,0,None,  We live with Pets 
	Elissa Ashley,Orlando,NaturalResources,24,F, I am hoping to gain a greater understanding of SAS and R programming so that I can utilize these tools in my Graduate research,2,0,Little,We live with Pets
    Rongjing Wang, Dalian, Electrical engineering,23, M,I want to have a basic understanding of SAS and R from future research, 5, 2, little,  We live with Pets
;
run;










