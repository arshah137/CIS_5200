--PIG SCRIPT FOR YEARLY SALES

iowafull = LOAD '/user/ashah36/iowafinal/project1.csv' USING PigStorage(',') AS
(invoice:chararray, year:int, dat:chararray, storename:chararray, city:chararray, zip:int, catname:chararray, vendorname:chararray, itemname:chararray, pack:long, bottlevol:long, bottlesold:long, sale:long, volume:double);


a1 = FOREACH iowafull GENERATE year, sale;
group1 = group a1 by year;
counter = foreach group1 generate SUM(a1.sale);

dump counter;
