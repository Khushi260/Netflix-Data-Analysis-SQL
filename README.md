# Netflix Movies and TV Shows Data Analysis

![](https://github.com/najirh/netflix_sql_project/blob/main/logo.png)

## **Project Overview**

This project analyzes the **Netflix Movies and TV Shows dataset** using SQL to uncover patterns, trends, and insights in content distribution, genre preferences, country-wise availability, popular actors, and content categorization. The goal is to provide actionable insights that can help content strategists, marketing teams, and data analysts make informed decisions.


## **Real-World Problem**

Streaming platforms like Netflix have vast content catalogs released globally. Understanding this dataset helps answer business-critical questions:

* Which types of content (Movies vs TV Shows) dominate the catalog?
* Which genres, directors, and actors are most common?
* How does content release vary over time and across countries?
* How to categorize content for audience safety or preference (e.g., violent content)?
* Which actors or directors have significant influence on Indian content production?


## **Objectives**

1. **Content Distribution Analysis:** Identify the number of Movies vs TV Shows and top contributing countries.
2. **Trend Analysis:** Find top years with the highest content release in India and content added in the last 5 years.
3. **Genre & Director Insights:** Count content per genre, list content by specific directors, and identify entries without directors.
4. **Actor Analysis:** Track top actors in Indian movies and appearances of specific actors over the last decade.
5. **Content Categorization:** Classify content based on keywords like “Kill” and “Violence” to flag sensitive content.
6. **Special Insights:** Identify longest movies, documentaries, and TV shows with more than 5 seasons.


## **Tools & Skills**

* **SQL (PostgreSQL)** – Aggregations, filtering, ranking, string functions, date calculations, conditional logic.
* **Data Analysis** – Trend discovery, categorization, and business insight extraction.
* **Real-World Application** – Supports content strategy, marketing decisions, and audience preference analysis.


## **Key SQL Queries Implemented**

* Count Movies vs TV Shows.
* Find the most common ratings per content type.
* List all movies released in a specific year (e.g., 2020).
* Identify top 5 countries with the most content.
* Find the longest movie.
* Extract content added in the last 5 years.
* Find content by specific directors or actors.
* Count content in each genre.
* Categorize content based on keywords like “Kill” and “Violence.”


## **Usage**

1. Clone the repository:

```bash
git clone https://github.com/YourUsername/Netflix-Data-Analysis-SQL.git
```

2. Load the dataset `netflix_db.csv` into PostgreSQL.
3. Run queries from `SQL/analysis_queries.sql` to reproduce results.
4. View results in `Results/` folder (optional screenshots or exports).

---

## **Dataset**

* Source: Netflix Movies and TV Shows dataset (CSV format).
* Columns include: `show_id, type, title, director, casts, country, date_added, release_year, rating, duration, listed_in, description`.

---

## **Outcome / Insights**

* Identified trends in content release over years and by country.
* Determined top genres, actors, and directors in Indian Netflix content.
* Flagged potentially violent content for sensitive audience guidance.
* Provided actionable insights for content strategy and catalog planning.

