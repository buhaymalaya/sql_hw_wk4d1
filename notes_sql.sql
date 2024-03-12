-- general rules. . . 

SELECT customer_id, SUM(amount)     -- what you want to see
FROM payment                        -- from where
                                    -- these two are your basic building blocks!
WHERE customer_id BETWEEN 70 AND 80  -- how?
GROUP BY customer_id        -- using aggregates
HAVING SUM(amount) > 150       -- how for aggregates, doesn't have to be here
                            -- BUT can't come before group by
ORDER BY customer_id
LIMIT 2                 -- always towards the end, limits results
OFFSET 1;     -- discards the number of rows mentioned and starts there  

-- clauses we've talked about so far (in the order they must appear):
-- select <columns> <aggregates>
-- from <table>
-- where <conditional>
-- group by <columns>
-- order by <column>

-- where allows us to modify/filter the results of the select 
-- specifically with our normal columns 

-- we have another clause that allows us to similarly filter the results of an aggregates 
-- HAVING lets us apply a conditional filtering an aggregate
-- WHERE is to SELECTING a normal column like HAVING is to an AGGREGATE
-- a having clause would appear directly after a group by 
-- ORDER OF CLAUSES IF USING EVERYTHING:
-- select <columns> <aggregates>
-- from <table>
-- where <conditional>
-- group by <columns>
-- having <conditional>
-- order by <column>