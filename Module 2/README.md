# Module 2

_SQL_ databases and data visualisasion

## _SQL_ databases

### 1.1 Getting started with _PostgreSQL_ on _Linux(Ubuntu)_

### Installation
Open command line   
Update local package:
```
sudo apt-get update
```
Install app:
```
sudo apt-get install postgresql-12
```

### Launch
Look at _PosgreSQL_ status:
```
sudo systemctl status postgresql
```
In line `Active:` shoud be: `active (exited)
`   

To stop:
```
sudo systemctl stop postgresql
```
To start:
```
sudo systemctl start postgresql
```
So it works, but on my machine starting only _PGAdmin3_ and I decided to to use _MySQL Server_ ;0

### 1.2 _SQL_ client and base queries
In _MySQL Workbench_ i will create 3 tables with "Sample - Superstore" data with following queries:

- [Orders](https://github.com/Vainane/DE-101/blob/main/Module%202/orders.sql)

- [People](https://github.com/Vainane/DE-101/blob/main/Module%202/people.sql)

- [Returns](https://github.com/Vainane/DE-101/blob/main/Module%202/returns.sql)

Now we hawe some sort oh database. Shouldn't we extract some valuable information?

Let's answer some quetions from [Module 1](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module01/DE%20-%20101%20Lab%201.1#%D0%B0%D0%BD%D0%B0%D0%BB%D0%B8%D1%82%D0%B8%D0%BA%D0%B0-%D0%B2-excel):

1. Overview

- Total Sales

- Total Profit

- Profit per Order

2. Product Dashboard

- Sales by Product Category over time

3.

- Sales and Profit by Customer

- Sales per region

