# Module 2

## SQL databases and data visualisasion

### 2.2 Getting started with PostgreSQL on Linux(Ubuntu)

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
Look at PosgreSQL status:
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
