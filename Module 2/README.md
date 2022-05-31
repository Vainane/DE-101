# Module 2

_SQL_ databases and data visualisasion

## _SQL_ databases

### 1.1 Getting started with _PostgreSQL_ on _Linux(Ubuntu20.04)_

#### Installation

Open Terminal

Update local package:

```
sudo apt-get update
```

Install app:

```
apt install postgresql postgresql-contrib
```

#### Launch

Look at _PosgreSQL_ status:
```
sudo systemctl status postgresql
```
In line `Active:` shoud be: `active (exited)
`   
#### DBMS

I am using _PGadmin 4_ web version as in [SQL-101](https://www.youtube.com/watch?v=jP2dsNqXeYU&list=PLg5SS_4L6LYuE4z-3BgLYGkZrs-cF4Tep&index=3) course.
[Download guidline](https://www.pgadmin.org/download/pgadmin-4-apt/).

### 1.2 _SQL_ client and base queries

In _PGadmin 4_ i will create 3 tables from "Sample - Superstore" data with following queries:

- [Orders](https://github.com/Vainane/DE-101/blob/main/Module%202/orders.sql)

- [People](https://github.com/Vainane/DE-101/blob/main/Module%202/people.sql)

- [Returns](https://github.com/Vainane/DE-101/blob/main/Module%202/returns.sql)

Now we have some sort of database. Shouldn't we extract some valuable information? ;)

Let's answer some quetions from [Module 1](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module01/DE%20-%20101%20Lab%201.1#%D0%B0%D0%BD%D0%B0%D0%BB%D0%B8%D1%82%D0%B8%D0%BA%D0%B0-%D0%B2-excel) with followng [queries](https://github.com/Vainane/DE-101/blob/main/Module%202/queries.sql).

### 1.3 Data models. DDL. INSERT INTO

Using _SQLdbm_ i going to create 3 sort of data models:

#### Conceptual model

![Conceptual.png](https://github.com/Vainane/DE-101/blob/main/Module%202/conceptual.png)

#### Logical model

![Logical.png](https://github.com/Vainane/DE-101/blob/main/Module%202/logical.png)

#### Physical model

![Physical.png](https://github.com/Vainane/DE-101/blob/main/Module%202/physical.png)

####[DDL+INSERT INTO](https://github.com/Vainane/DE-101/blob/main/Module%202/ddlinsrtinto.sql).
