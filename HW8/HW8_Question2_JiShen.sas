
libname hw8 "D:\google drive\NC semester 6\st555\HW8";  *create hw7 libarary;


/*Quetion 2*/

/*This is my group member's dataset.*/
data hw8.GroupIntroMA;
	input Name $ From $  Degree $  Age   Gains $  StClasses  PRGLanguages  Experience $  WeLove $;
	datalines;
	Marshall	NC	Stats	22	SAS+R	6	1	little	TV
	Kaaviya	India	IMSE	26	SAS+R	2	2	little	TV
	Jianhong	China	Stats	33	SAS+R	5	0	little	TV	
;
run;

data hw8.GroupintroOl; 
input From & $20. Discipline & $15. Age StatCourses GroupTrait & $30. Gender$ Languages Experience & $8. Interest1 & $30. Interest2 & $65.;
datalines;
Shandong, China  Statistics  26  6  Advance in Sas  Female  2  Medium  Changed Name  Loves to sew  
Riverdale, Ga  Statistics  30  15  Advance in Sas  Male  0  Little  Played Football at UT  Lived in 6 different states  
India  Engineering  26  3  Advance in Sas  Male  0  Little  Likes Chocolate  Likes Motorcycles
;
run;

data hw8.GroupIntroSH;
    infile datalines delimiter=','; *Using infile with delimiter option to change delimiter as comma;
	input name:$15. HomeTown:$10.  Discipline:$30.  Age Gender:$1.  Hope:$150.  NoOfStClass  NoOfLanguage  ExpSas:$10.  GroupTrait:$20.;
	datalines;
	Ji Shen,   Taizhou,    Economics,30, M, Form a good programming habit in sas, 2, 1,  Medium,  We live with Pets     
    Ian Murray,Bridgeport, Chemistry,23, M, Get a basic understanding of SAS and R as to help me in statistical analysis of my research,1,0,None,  We live with Pets 
	Elissa Ashley,Orlando,NaturalResources,24,F, I am hoping to gain a greater understanding of SAS and R programming so that I can utilize these tools in my Graduate research,2,0,Little,We live with Pets
    Rongjing Wang, Dalian, Electrical engineering,23, M,I want to have a basic understanding of SAS and R from future research, 5, 2, little,  We live with Pets
;
run;



/*part a*/
/*i. There are 4 observations in the dataset.*/
/*ii. There are 22 variables*/



/*part b*/
/*i. Common variables: name  HomeTown  Discipline  Age Gender   NoOfStClass  NoOfLanguage  ExpSas*/
/*ii. The variables that I included but my group member did not:   GroupTrait Hope */
/*iii. The variables he include but you did not are:WeLove  gains Interest1   Interest2*/


/*part c*/
/*i. The tings I like about his programe is that he use very short input to make the dataset looks neat.*/
/*ii. In the merge data step, he better use set statement to vertically combine the data not horizontally.*/
