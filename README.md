# DMQL
Raw Data Source: ```"https://www.kaggle.com/competitions/instacart-market-basket-analysis/data"```

**Setting up a Database from this GitHub Repository**

To set up the database from a GitHub repository, follow these steps:

1. **Clone the Repository**: Begin by cloning the GitHub repository to your local machine.

2. **Unzip CSV Data**: Locate and unzip the 'CSV.zip' file within the repository.

3. **Execute create.sql**: Run the 'create.sql' script. This script likely creates the necessary database schema and tables.

4. **Execute load.sql**: Next, execute the 'load.sql' script. This script is responsible for populating the database with data.

5. **Front-End Application**: It appears that a front-end application has been created to facilitate running queries and retrieving results from the database.

6. **Implement Triggers**: The database seems to include trigger functions. These triggers are used to automate actions based on specific events in the database.

7. **Normalization (BCNF and 3BCNF)**: The data has been normalized to at least Boyce-Codd Normal Form (BCNF) and possibly to Third Normal Form (3BCNF). This is a structured way to organize the data to minimize redundancy.

8. **Indexing**: Indexes have been added to the data. Indexing is a performance optimization technique that speeds up data retrieval operations. This step significantly reduced query execution time.

**Indexing Performance Improvement**:

After implementing indexing, the query execution time improved significantly, reducing it to less than one-fourth of the original time.

This means that with indexing in place, the database can retrieve data much more efficiently, making it a crucial optimization technique.