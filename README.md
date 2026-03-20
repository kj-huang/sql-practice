# SQL Practice

A comprehensive collection of MySQL exercises and examples using the [Sakila sample database](https://dev.mysql.com/doc/sakila/en/). Covers everything from basic queries to query optimization — ideal for learning or brushing up on SQL.

## Prerequisites

- **MySQL** 5.7+ (or MySQL 8.0+)
- **Sakila database** — install it from the [official MySQL docs](https://dev.mysql.com/doc/sakila/en/sakila-installation.html)

## Getting Started

1. Install and start MySQL.
2. Load the Sakila sample database:
   ```bash
   mysql -u root -p < sakila-schema.sql
   mysql -u root -p < sakila-data.sql
   ```
3. Run any practice file:
   ```bash
   mysql -u root -p sakila < select-1.sql
   ```
   Or open a file in your preferred SQL client and execute queries individually.

## Topics

### Basic SQL

| File | Description |
|------|-------------|
| `select-1.sql` | Basic SELECT statements and filtering |
| `select-2.sql` | Intermediate SELECT techniques |
| `select-3.sql` | Advanced SELECT patterns |
| `where-1.sql` | WHERE clause conditions and operators |
| `where-2.sql` | Advanced WHERE filtering |
| `orderby.sql` | Sorting results with ORDER BY |
| `limit.sql` | Limiting result sets |
| `insert.sql` | INSERT — single row, multi-row, and subquery inserts |
| `update.sql` | UPDATE operations |
| `delete.sql` | DELETE operations |

### Joins and Set Operations

| File | Description |
|------|-------------|
| `joins.sql` | INNER, LEFT, RIGHT, CROSS, NATURAL, and self joins |
| `union.sql` | Combining result sets with UNION |
| `subquery.sql` | Subqueries and nested queries |

### Functions

| File | Description |
|------|-------------|
| `aggregate-functions.sql` | COUNT, MAX, MIN, AVG, SUM with GROUP BY |
| `string-functions.sql` | CONCAT, UPPER, SUBSTRING, and more |
| `numeric-functions.sql` | Mathematical and numeric functions |
| `date-functions.sql` | Date and time functions |
| `cast-functions.sql` | Type casting and conversion |
| `control-flow-functions.sql` | IF, CASE, COALESCE, NULLIF |
| `information-functions.sql` | System and session info functions |
| `miscellaneous-functions.sql` | Other useful MySQL functions |

### Database Objects

| File | Description |
|------|-------------|
| `sproc.sql` | Stored procedures with IN/OUT parameters |
| `store-function.sql` | User-defined stored functions |
| `trigger.sql` | BEFORE INSERT and AFTER UPDATE triggers |
| `view-basic.sql` | Creating and using views |
| `view-dml.sql` | DML operations on views |
| `view-queries.sql` | Querying through views |
| `view-security.sql` | View security and access control |
| `view-with-check-option.sql` | Views with WITH CHECK OPTION |
| `event.sql` | Scheduled events |

### Indexing and Performance

| File | Description |
|------|-------------|
| `indexing-1.sql` | Creating and using indexes |
| `cluster-index.sql` | Clustered index concepts |
| `cover-index.sql` | Covering indexes |
| `index-hint.sql` | Index hints for query optimization |
| `index-maintenance.sql` | Index management and maintenance |
| `explain-keyword.sql` | Using EXPLAIN to analyze queries |
| `explain-extended.sql` | EXPLAIN EXTENDED for detailed analysis |
| `query-optimize-1.sql` | Query optimization techniques (part 1) |
| `query-optimize-2.sql` | Query optimization techniques (part 2) |
| `query-optimize-3.sql` | Query optimization techniques (part 3) |
| `query-optimize-joins.sql` | Optimizing JOIN queries |
| `query-optimize-joins-compare.sql` | Comparing JOIN optimization strategies |

### Administration

| File | Description |
|------|-------------|
| `show-full-processlist.sql` | Monitoring active MySQL processes |
| `recovery.sql` | Database recovery operations |

## Usage Tips

- Each file is self-contained with comments explaining every query.
- Many files create temporary sample tables and clean them up with `DROP` statements at the end.
- Work through files in order within each section, as they progress from basic to advanced.
- Use a SQL client (MySQL Workbench, DBeaver, or the `mysql` CLI) to run queries one at a time for the best learning experience.
