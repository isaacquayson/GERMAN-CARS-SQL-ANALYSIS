-- GERMANY CARS EXPLORATORY DATA ANALYSIS

START TRANSACTION;

-- VIEWING THE DATA 
SELECT * FROM goldfields.germany_cars;

-- CHECKING THE TOTAL RECORDS IN THE TABLE 
SELECT COUNT(*)  AS 'TOTAL CARS' FROM goldfields.germany_cars;

-- CHECKING FOR NULL SPACES IN THE DATA AND  DROPPING THEM
SELECT * FROM germany_cars
WHERE germany_cars.mileage IS NULL OR germany_cars.mileage = ''
OR germany_cars.make IS NULL OR germany_cars.make = ''
OR germany_cars.model IS NULL OR germany_cars.model = ''
OR germany_cars.fuel IS NULL OR germany_cars.fuel = ''
OR germany_cars.gear IS NULL OR germany_cars.gear = ''
OR germany_cars.offerType IS NULL OR germany_cars.offerType = ''
OR germany_cars.price IS NULL OR germany_cars.price = ''
OR GERM

-- DROPPING ROWS WITH NULL SPACES 
DELETE FROM germany_cars
WHERE germany_cars.mileage IS NULL OR germany_cars.mileage = ''
OR germany_cars.make IS NULL OR germany_cars.make = ''
OR germany_cars.model IS NULL OR germany_cars.model = ''
OR germany_cars.fuel IS NULL OR germany_cars.fuel = ''
OR germany_cars.gear IS NULL OR germany_cars.gear = ''
OR germany_cars.offerType IS NULL OR germany_cars.offerType = ''
OR germany_cars.price IS NULL OR germany_cars.price = ''
OR germany_cars.hp IS NULL OR germany_cars.hp = ''
OR germany_cars.year IS NULL OR germany_cars.year = '';

-- CHECKING FOR DUPLICATE ROWS 
SELECT 
    germany_cars.mileage,
    germany_cars.make,
    germany_cars.model,
    germany_cars.fuel,
    germany_cars.gear,
    germany_cars.offerType,
    germany_cars.price,
    germany_cars.hp,
    germany_cars.year,
    COUNT(*) AS Duplicates
FROM
    germany_cars
GROUP BY germany_cars.mileage , germany_cars.make , germany_cars.model , germany_cars.fuel ,
 germany_cars.gear , germany_cars.offerType , germany_cars.price , germany_cars.hp , germany_cars.year
HAVING COUNT(*) > 1;


-- TOTAL SALES 
SELECT SUM(germany_cars.price) AS 'TOTAL SALES' FROM germany_cars;

-- AVERAGE PRICE OF EACH CAR MAKER 

SELECT germany_cars.make, ROUND(AVG(germany_cars.price), 2) AS 'AVERAGE PRICE'
FROM germany_cars
GROUP BY germany_cars.make
ORDER BY  AVG(germany_cars.price) DESC;

-- CATOGORIZING THE CAR MAKERS INTO EXPENSIVE, MEDIUM, AND LESS EXPENSIVE CARS BASED ON THEIR AVERAGE PRICE 

SELECT
    germany_cars.make,
    AVG(germany_cars.price) AS 'AVERAGE PRICE',
    CASE 
        WHEN AVG(germany_cars.price) <= 30000 THEN 'AFFORDABLE'
        WHEN AVG(germany_cars.price) BETWEEN 30001 AND 65000 THEN 'EXPENSIVE'
        ELSE 'VERY EXPENSIVE'
    END AS 'PRICE CATEGORY'
FROM 
    germany_cars
GROUP BY 
    germany_cars.make
ORDER BY 
    AVG(germany_cars.price) DESC;

-- THE AVERAGE MILAGE FOR EACH CAR MAKER 
SELECT germany_cars.make, AVG(germany_cars.mileage) AS 'AVERAGE MILEAGE' 
FROM germany_cars
GROUP BY germany_cars.make
ORDER BY AVG(germany_cars.mileage) DESC;

-- FUEL TYPE PREFERENCES 
SELECT germany_cars.fuel, COUNT(germany_cars.fuel) AS 'COUNT'
FROM germany_cars
GROUP BY germany_cars.fuel
ORDER BY COUNT(germany_cars.fuel) DESC;

-- GEAR TYPE PREFERENCES
SELECT germany_cars.gear, COUNT(germany_cars.gear) AS 'COUNT'
FROM germany_cars
GROUP BY germany_cars.gear
ORDER BY COUNT(germany_cars.gear) DESC;



