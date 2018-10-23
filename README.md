# Bookmark Manager

User Stories

```
As a user
So I can quickly reach the websites I like
I want to be able to see a list of bookmarks

As a user
So that I can easily access a website
I want to be able to add a URL to my bookmarks
```

Setup Database


Database Setup

Connect to `psql` and create the `bookmark_manager` and `bookmark_manager_test` databases:

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

To run Bookmark Manager

`rackup`

To run tests:

`rspec`
