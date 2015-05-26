/*Quetion 3*/
libname hw8 "D:\google drive\NC semester 6\st555\HW8";  *create hw7 libarary;


/*This is my dataset*/
 data hw8.GroupIntroShen;
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
data hw8.groupintroOlasimbo; /*bringing the info from the group discussions using informats and datalines*/
input From & $20. Discipline & $15. Age StatCourses GroupTrait & $30. Gender$ Languages Experience & $8. Interest1 & $30. Interest2 & $65.;
datalines;
Shandong, China  Statistics  26  6  Advance in Sas  Female  2  Medium  Changed Name  Loves to sew  
Riverdale, Ga  Statistics  30  15  Advance in Sas  Male  0  Little  Played Football at UT  Lived in 6 different states  
India  Engineering  26  3  Advance in Sas  Male  0  Little  Likes Chocolate  Likes Motorcycles
;
run;
/*This is my teammate's dataset*/
data hw8.GroupIntroGrady;
	input Name $ From $  Degree $  Age  Gains $  StClasses  PRGLanguages  Experience $  WeLove $;
	datalines;
	Marshall	NC	Stats	22	SAS+R	6	1	little	TV
	Kaaviya	India	IMSE	26	SAS+R	2	2	little	TV
	Jianhong	China	Stats	33	SAS+R	5	0	little	TV	
;
run;
/*Merge the the 3 dataset together*/
data hw8.GroupIntro_Shen;

set hw7.groupintroShen
    hw7.groupintroolasimbo(rename=(from=HomeTown StatCourses=NoOfStClass languages=NoOfLanguage Experience=ExpSas))
	hw7.groupintrogrady(rename=(from=HomeTown StClasses=NoOfStClass  gains=hope PRGlanguages=NoOfLanguage Experience=ExpSas Degree=Discipline Welove=grouptrait));

run;
