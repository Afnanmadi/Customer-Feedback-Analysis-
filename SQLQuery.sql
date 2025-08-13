USE ecommerce1
CREATE TABLE SurveyFeedback (
    customer_id INT,
    name NVARCHAR(100),
    email NVARCHAR(100),
    region NVARCHAR(50),
    rating INT,
    comments NVARCHAR(255),
    review_date DATE
);

CREATE TABLE WebFeedback (
    customer_id INT,
    rating INT,
    comments NVARCHAR(255)
);

CREATE TABLE ExternalReviews (
    customer_id INT,
    rating INT,
    comments NVARCHAR(255)
);


--Bulk Insert Cleaned Data into SQL Server
BULK INSERT SurveyFeedback
FROM 'C:\Users\user\Downloads\Willis college\ETL\Assignments\finle ptojects\2\cleaned_customer_survey.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001'
);

-- Bulk Insert Cleaned CSV
BULK INSERT WebFeedback
FROM 'C:\Users\user\Downloads\Willis college\ETL\Assignments\finle ptojects\2\cleaned_web_feedback.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
  CODEPAGE = '65001'
);

-- Bulk Insert Cleaned CSV
BULK INSERT ExternalReviews
FROM 'C:\Users\user\Downloads\Willis college\ETL\Assignments\finle ptojects\2\cleaned_external_reviews.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001'
);

--Validate Parsed Data in SQL.
--SurveyFeedback.

SELECT customer_id, COUNT(*) AS count
FROM SurveyFeedback
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Validate Ratings
SELECT * FROM SurveyFeedback WHERE rating NOT BETWEEN 1 AND 5;

--Validate Dates
SELECT * FROM SurveyFeedback WHERE TRY_CAST(review_date AS DATE) IS NULL;




--Check for Duplicates

-- WebFeedback
SELECT customer_id, COUNT(*) AS count
FROM WebFeedback
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- ExternalReviews
SELECT customer_id, COUNT(*) AS count
FROM ExternalReviews
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- Validate Rating Range
-- WebFeedback
SELECT * FROM WebFeedback
WHERE rating NOT BETWEEN 1 AND 5;

-- ExternalReviews
SELECT * FROM ExternalReviews
WHERE rating NOT BETWEEN 1 AND 5;


SELECT * FROM SurveyFeedback
WHERE TRY_CAST(review_date AS DATE) IS NULL;




-- Top 10 highest-rated customer feedback (assuming each customer reviewed a product)
SELECT TOP 10
    customer_id,
    AVG(rating) AS avg_rating
FROM (
    SELECT customer_id, rating FROM SurveyFeedback
    UNION ALL
    SELECT customer_id, rating FROM WebFeedback
    UNION ALL
    SELECT customer_id, rating FROM ExternalReviews
) AS CombinedRatings
GROUP BY customer_id
ORDER BY avg_rating DESC;

-- Search for common complaint keywords
SELECT 
    'SurveyFeedback' AS Source,
    COUNT(*) AS Count,
    'damaged' AS Keyword
FROM SurveyFeedback
WHERE comments LIKE '%damaged%'

UNION

SELECT 
    'WebFeedback' AS Source,
    COUNT(*),
    'late'
FROM WebFeedback
WHERE comments LIKE '%late%'

UNION

SELECT 
    'ExternalReviews' AS Source,
    COUNT(*),
    'defective'
FROM ExternalReviews
WHERE comments LIKE '%defective%';


-- Classify feedback sentiment
SELECT 
    customer_id,
    rating,
    comments,
    CASE
        WHEN rating >= 4 THEN 'Positive'
        WHEN rating = 3 THEN 'Neutral'
        ELSE 'Negative'
    END AS sentiment
FROM SurveyFeedback;


-- Monthly trend: count of reviews and average rating
SELECT 
    FORMAT(review_date, 'yyyy-MM') AS month,
    COUNT(*) AS total_reviews,
    AVG(rating) AS avg_rating
FROM SurveyFeedback
GROUP BY FORMAT(review_date, 'yyyy-MM')
ORDER BY month;







