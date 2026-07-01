1: Just use DuckDB like a SQL database (no Python)

If you simply want to run SQL queries, you only need:

Install DuckDB

brew install duckdb

Open it

duckdb

Run SQL

CREATE TABLE people(id INTEGER, name VARCHAR);

INSERT INTO people VALUES
(1,'Bithi'),
(2,'John');

SELECT * FROM people;

That's it. You do not need Python, a virtual environment, or VS Code for this.
