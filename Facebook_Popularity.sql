-- Finding the Popularity Percentage
-- (total number of friends for user)/(total no of users on the platform)
--  order the percentage in ascending order by user_id


-- finding the total users on the platform
-- select count(*)
-- from 
--     (select user1 from facebook_friends
--     union
--     select user2 from facebook_friends) tqq


-- Finding the total friends for every user

-- Since for every user1 as friends with user2 we have user2 who is also friends with user1


select user1,count(*)/cast(max(total.total_user_count) as float)*100 as popularity_percentage from
(
select count(*) as total_user_count
from 
    (select user1 from facebook_friends
    union
    select user2 from facebook_friends) tqq) total
join
(select user1,user2 from facebook_friends
union
select user2 as user1,user1 as user2 from facebook_friends) user_count
on 1=1
group by user1
order by user1 asc;
