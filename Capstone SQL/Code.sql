--Quiz Info
Select * from survey Limit 10;
-- Number of each response
Select question, count (distinct user_id) from survey group by 1;
--Home-try-on funnel
Select * from quiz limit 5;
Select * from home_try_on limit 5;
Select * from Purchase Limit 5;
--Home-try-on-funnel
Select Distinct Q.user_id, H.number_of_pairs, H.user_id is not null as 'is_home_try_on',
P.user_id Is Not Null As 'is_purchase'
from Quiz As Q
Left Join home_try_on H
ON Q.User_id = H.user_id
Left Join Purchase P
ON P.user_id = H.user_id
Limit 10;
--Home-try-on-funnel
with funnel as (Select Distinct Q.user_id, H.number_of_pairs, H.user_id is not null As 'is_home_try_on',
P.user_id Is Not Null As 'is_purchase'
from Quiz As Q
Left Join home_try_on H
ON Q.User_id = H.user_id
Left Join Purchase P
ON P.user_id = H.user_id
Limit 10) 
Select Count (*) As 'num_browse',
SUM (is_home_try_on) As 'num_home_try_on',
SUM (is_purchase) AS 'num_purchase',
1.0 * SUM(is_home_try_on) / Count (user_id) AS 'browse_to_Home_try_on',
1.0 * Sum (is_purchase) / SUM(IS_HOME_TRY_ON) AS 'Home_try_on_to_pruchase' From Funnel;
--Home-try-on-funnel
With Pairs as (with funnel as (Select Distinct Q.user_id, H.number_of_pairs,
H.user_id Is Not Null As 'is_home_try_on',
P.user_id Is Not Null As 'is_purchase'
from Quiz As Q
Left Join home_try_on H
ON Q.User_id = H.user_id
Left Join Purchase P
ON P.user_id = H.user_id)
Select user_id, count (distinct CASE when number_of_pairs = '3 pairs' then user_id end) as 'pair_3', count (distinct case when number_of_pairs = '5 pairs' then user_id end) as 'pair_5'
from funnel where is_purchase = 1 group by 1 order by 1)
Select sum (Pair_3), Sum (Pair_5) from pairs;
Select count (*) as Women from quiz where style like 'W%';
Select Count (*) as men from quiz where style like 'M%';
Select count (*) as Medium from quiz where fit like 'M%';
Select Count (*) as Wide from quiz where fit like 'W%';
Select Count(*) as Narrow from quiz where fit like 'N%';
Select Count (*) as Rectangular from quiz where shape like 'Rectangular'; 
Select Count (*) as round from quiz where shape like 'round';
Select Count (*) as Square from quiz where shape like 'square';
Select count (*) as tortoise from quiz where color like 'tortoise';
Select count (*) as black from quiz where color like 'black';
Select count (*) as Two from quiz where color like 'Two%';
Select count (*) as crystal from quiz where color like 'crystal';
select count (*) as neutral from quiz where color like 'Neutral';
Select Count (*) as NOPstyle from quiz where shape like 'NO%';
Select model_name, Count (*) as count
From purchase
Group by model_name
ORDER BY count DESC;
Select style, Count (*) as count
From purchase
Group by style
ORDER BY count DESC;
Select color, Count (*) as count
From purchase
Group by color
ORDER BY count DESC;
Select price, Count (*) as count
From purchase
Group by price
ORDER BY count DESC;
Select product_id, Count (*) as count
From purchase
Group by product_id
ORDER BY count DESC;
Select User_id, Count (*) as count
From purchase
Group by User_id
ORDER BY count DESC;