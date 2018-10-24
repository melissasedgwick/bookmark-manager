# Bookmark Manager

User Stories

```
As a user
So I can quickly reach the websites I like
I want to be able to see a list of bookmarks

As a user
So I can easily access a website
I want to be able to add a URL to my bookmarks

As a user
So I can remove unwanted links
I want to be able to delete a URL from my bookmarks

As a user
So I can change my bookmarks
I want to be able to update existing URLs

As a user
So I can easily locate bookmarks
I want to be able to see titles for the URLs
```

## How to Use ##
1. Open Terminal and clone the repository:
```bash
git clone https://github.com/melissasedgwick/bookmark-manager.git
```
2. Change into the project directory:
```bash
cd bookmark-manager
```
3. Run the program:
```bash
rackup
```
4. Access the program from `localhost:9292`.

5. Create the database to store the bookmarks by following the steps below.


## Database Setup ##

Connect to `psql` and create the `bookmark_manager` and `bookmark_manager_test` databases:

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

## Testing ##

To run tests:

`rspec`
