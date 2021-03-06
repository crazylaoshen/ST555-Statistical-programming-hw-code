/** ST555 HW 11 dataset ***************************************************************************/
/** Dr. Renee' Moore																			
/** Description of the Dataset:
/**** Subjects in a study participated in one of three different weightlifting programs 
/**** (RI, WI, CONT). The first program increased the number of repetitions as the subject 
/****  became stronger (RI= repetition increase), the second program increased the amount 
/****  of weight as subjects became stronger (WI = weight increase), and the subjects in 
/****  the third program did not participate in weightlifting (CONT = control). The strength 
/****  of participants was measured once every other day for two weeks after they began the 
/****  program. Littell, Freund, and Spector (1991). The objective of this analysis is to 
/****  investigate the effect each weightlifting program has on increasing strength over time.  
/**************************************************************************************************/

/** This is the study dataset **/ 

data weights;
   input subj program$ s1 s2 s3 s4 s5 s6 s7;
   datalines;
 1      CONT      85    85    86    85    87    86    87
 2      CONT      80    79    79    78    78    79    78
 3      CONT      78    77    77    77    76    76    77
 4      CONT      84    84    85    84    83    84    85
 5      CONT      80    81    80    80    79    79    80
 6      CONT      76    78    77    78    78    77    74
 7      CONT      79    79    80    79    80    79    81
 8      CONT      76    76    76    75    75    74    74
 9      CONT      77    78    78    80    80    81    80
10      CONT      79    79    79    79    77    78    79
11      CONT      81    81    80    80    80    81    82
12      CONT      77    76    77    78    77    77    77
13      CONT      82    83    83    83    84    83    83
14      CONT      84    84    83    82    81    79    78
15      CONT      79    81    81    82    82    82    80
16      CONT      79    79    78    77    77    78    78
17      CONT      83    82    83    85    84    83    82
18      CONT      78    78    79    79    78    77    77
19      CONT      80    80    79    79    80    80    80
20      CONT      78    79    80    81    80    79    80
 1      RI        79    79    79    80    80    78    80
 2      RI        83    83    85    85    86    87    87
 3      RI        81    83    82    82    83    83    82
 4      RI        81    81    81    82    82    83    81
 5      RI        80    81    82    82    82    84    86
 6      RI        76    76    76    76    76    76    75
 7      RI        81    84    83    83    85    85    85
 8      RI        77    78    79    79    81    82    81
 9      RI        84    85    87    89    88    85    86
10      RI        74    75    78    78    79    78    78
11      RI        76    77    77    77    77    76    76
12      RI        84    84    86    85    86    86    86
13      RI        79    80    79    80    80    82    82
14      RI        78    78    77    76    75    75    76
15      RI        78    80    77    77    75    75    75
16      RI        84    85    85    85    85    83    82
 1      WI        84    85    84    83    83    83    84
 2      WI        74    75    75    76    75    76    76
 3      WI        83    84    82    81    83    83    82
 4      WI        86    87    87    87    87    87    86
 5      WI        82    83    84    85    84    85    86
 6      WI        79    80    79    79    80    79    80
 7      WI        79    79    79    81    81    83    83
 8      WI        87    89    91    90    91    92    92
 9      WI        81    81    81    82    82    83    83
10      WI        82    82    82    84    86    85    87
11      WI        79    79    80    81    81    81    81
12      WI        79    80    81    82    83    82    82
13      WI        83    84    84    84    84    83    83
14      WI        81    81    82    84    83    82    85
15      WI        78    78    79    79    78    79    79
16      WI        83    82    82    84    84    83    84
17      WI        80    79    79    81    80    80    80
18      WI        80    82    82    82    81    81    81
19      WI        85    86    87    86    86    86    86
20      WI        77    78    80    81    82    82    82
21      WI        80    81    80    81    81    82    83
;
               
run;
