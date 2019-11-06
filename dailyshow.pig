A=LOAD '/user/home/daily_shows' using PigStorage(',') (year:chararray,occupation:chararray);
B=foreach A generate occupation, date;
C=foreach B generate occupation,Todate(date,'MM/dd/yy') as date;
D=filter C by ((date>ToDate('1/11/99','MM/dd/yy'))and (date<ToDate('6/11/99','MM/dd/yy')));
E=group D by occupation;
F= foreach E generate group,COUNT(D) as cnt;
G=order F by cnt desc;
H=limit G 5;


A= load '/home/user/daily_shows' using PigStorage(',') as (year:chararray,occupation:chararray,group:chararray);
B=foreach A generate year,group;
C=filter B by group=='Politician';
D=group C by year;
E=foreach D generate group, COUNT(C) as cnt;
F=order E by cnt desc;
dump F;
