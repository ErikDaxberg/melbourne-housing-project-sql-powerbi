# Melbourne Housing - Price per SQM analysis
This project answers what suburbs that on average is the cheapest and most expensive in Melbourne overall and also within five miles of the Central Business District. The analysis also includes the number of sales that the data is listed on and the average year of the buildings.

## Data Source
[Melbourne Housing Dataset](https://www.kaggle.com/datasets/dansbecker/melbourne-housing-snapshot)
## Data Cleaning
- Removed nulls in BuildingArea and Price
- Changed BuildingArea from TEXT to REAL
- Filtered buildings smaller than 10 SQM and above 500
- Filtered suburbs with less than 10 sales

## Key Findings
- The top three most expensive suburb per SQM is: Kew East ($17403). Middle Park ($16213). Albert Park ($15719)
- The top three cheapest suburbs per SQM is: South Morang ($3335). Greenvale ($3389). Sunbury ($3518)
- Cheapest three suburbs within 5 miles of CBD is: Maribyrnong ($6730). Southbank ($7350). West Melbourne ($7363)
-  Most expensive three suburbs within 5 miles of CBD is: Middle park ($16212). Albert Park ($15719). Parkville ($13551)

There is a large difference between the cheapest and expensive Suburbs.

The Suburbs that are distinguished by older buildings have a higher average price. Two possible, identified reasons are either that the expensive Suburbs are due to distinguished architecture of those ages, which are high valued or that the cheaper Suburbs are characterized by mass production. It is however most likely a combination of the two.

## Tools Used
- SQL/DBeaver
- PowerBi

## Dashboard
<img width="575" height="323" alt="image" src="https://github.com/user-attachments/assets/b31bab9e-5d65-4bb3-b779-5951524af21c" />
