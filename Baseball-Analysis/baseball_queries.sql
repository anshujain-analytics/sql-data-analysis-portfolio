Q 1 - Who are the top 5 players having height more than average?
--SELECT * FROM baseball_data;
--SELECT avg(height) from baseball_data;
--SELECT name, height FROM baseball_data where height > (SELECT CAST(avg(height) as Float) from baseball_data) ORDER BY height DESC LIMIT 5;
  

Q2 - Bottom 2 players having least weight and must be left handed?
SELECT * from baseball_data WHERE handedness = 'L' ORDER BY weight ASC;
