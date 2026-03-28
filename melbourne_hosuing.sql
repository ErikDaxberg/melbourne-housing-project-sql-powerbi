
-- Price per SQM calculated as Price/BuildingArea
-- Filtered to buildings between 10 and 500 SQM, removed nulls and suburbs with less than 10 sales
-- Note: BuildingArea was stored as TEXT, converted to REAL before filtering.
--	Question 1: In what suburb can I get the most indoor space for my money?
WITH sqm_filter AS(
SELECT "Suburb", "Price", "BuildingArea","Price"/"BuildingArea" AS "Price_Per_SQM", "YearBuilt", "Distance"
FROM melb_data 
WHERE "BuildingArea" BETWEEN 10 AND 500 AND "SellerG" IS NOT null)


SELECT "Suburb", count("Suburb") AS total_data, avg("Price_Per_SQM") AS "avg_SQM"
FROM sqm_filter
GROUP BY "Suburb"
HAVING count("Suburb") >= 10
ORDER BY "avg_SQM" 
-- Answer 1A: The top three most expensive suburb per SQM is: Kew East ($17403). Middle Park ($16213). Albert Park ($15719)
-- Answer 1B: The top three cheapest suburbs per SQM is: South Morang ($3335). Greenvale ($3389). Sunbury ($3518)

-- Question 2: In what suburb can I get a cheap building near CBD, Central Business District? (Within 5 miles).--

-- Filtered to suburbs within 5 miles of CBD using distance column.
WITH sqm_filter AS(
SELECT "Suburb", "Price", "BuildingArea","Price"/"BuildingArea" AS "Price_Per_SQM", "YearBuilt", "Distance"
FROM melb_data 
WHERE "BuildingArea" BETWEEN 10 AND 500 AND "SellerG" IS NOT null)


SELECT "Suburb", count("Suburb") AS total_data, avg("Price_Per_SQM") AS "Price_Per_SQM"
FROM sqm_filter
WHERE "Distance" <= 5
GROUP BY "Suburb"
HAVING count("Suburb") >= 10
ORDER BY "Price_Per_SQM"
-- Answer 2A: Cheapest three suburbs within 5 miles of CBD is: Maribyrnong ($6730). Southbank ($7350). West Melbourne ($7363)
-- Answer 2B: Most expensive three suburbs within 5 miles of CBD is: Middle park ($16212). Albert Park ($15719). Parkville ($13551)


-- Question 3: What’s the average age of the buildings in the questions below?
-- Averages YearBuilt column in the different suburbs.
WITH sqm_filter AS(
SELECT "Suburb", "Price", "BuildingArea","Price"/"BuildingArea" AS "Price_Per_SQM", "YearBuilt", "Distance"
FROM melb_data 
WHERE "BuildingArea" BETWEEN 10 AND 500 AND "SellerG" IS NOT null)


SELECT "Suburb", round(avg("YearBuilt")) AS Average_year_built
FROM sqm_filter
WHERE "Suburb" IN ('South Morang','Greenvale','Sunbury','Kew East','Middle Park','Albert Park','Maribyrnong','Southbank','West Melbourne','Parkville')
GROUP BY "Suburb"

-- Answer 3.1A avg year for buildings in cheap suburbs is: Greenvale is 2000. South Morang is 2006. Sunbury is 1988. 
-- Answer 3.1B avg year for buildings in expensive suburbs is: Albert Park is 1904. Kew East is 1947. Middle Park is 1912.

-- Question 3.2A What's the avg year for buildings in cheap suburbs near CBD?
-- Answer 3.2A The avg year for buildings in cheap suburbs near CBD is: Maribyrnong is 1985. Southbank is 2000. West Melbourne is 1972
-- Answer 3.2B avg year for expensive suburbs near CBD is: Middle park 1912. Albert Park 1904. Parkville 1931.

-- Final comments and conclusion: Upon investigation, there is a large difference between the cheapest and expensive Suburbs.
-- The suburbs that are distinguished by older buildings have a higher average price. Two possible, identified reasons are
-- Either that the expensive suburbs are due to distinguished architecture of those ages, which are high valued
-- Or that the cheaper suburbs are characterized by mass production. It is most likely a combination of the two.
