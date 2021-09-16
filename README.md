# Bookmark Challenge

User stories
-------

```
As a user,
So that I can quickly go to web sites I regularly visit
I would like to see the list of bookmarks that I have saved

As a user
So I can store bookmark data for later retrieval
I want to add a bookmark to Bookmark Manager
```
### To set up the database

Connect to `psql` and create the `bookmark_manager` and `bookmark_manager_test` databases:

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.


UPDATE bookmarks SET url = 'http://www.destroyallsoftware.com' WHERE url = 'http://www.askjeeves.com';