# High-Performance Multi-Branch Sales Reporting System

## Overview
This project contains an optimized MySQL query built to aggregate high-volume sales transactional data across multiple retail branches. The main goal here was to cut down query execution times during peak reporting hours when data volume spikes.

## Tech Highlights & Optimizations
* **Performance Tuning:** Used a `WHERE EXISTS` semi-join instead of a standard inner join to check branch active status. This keeps the intermediate query results small and stops unnecessary row duplication before aggregation.
* **Locking & Concurrency:** Applied the `READ UNCOMMITTED` isolation level to prevent shared lock contention on heavy operational (OLTP) tables, making it safer to run during busy store hours.
* **Aggregations:** Structured around core dimension and fact tables to make the best use of index keys while calculating 30-day rolling metrics.

## File Structure
* `reporting_query.sql` - Production-ready optimized SQL reporting script.
