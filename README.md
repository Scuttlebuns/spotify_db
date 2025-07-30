# Spotify Data Exploration Project

## Project Overview
This project centers on designing and implementing a relational database using real-world music-related datasets. Using structured data from Spotify and artist popularity records, we explore how relational models, normalization, and SQL queries can uncover insights into music trends, artist influence, and audio characteristics.

The project includes:
- Data modeling using E/R diagrams
- Schema normalization up to Third Normal Form (3NF)
- Implementation in MySQL
- SQL-based analysis using joins, subqueries, views, and aggregations

All components are compiled into a final report and an accompanying in-class presentation.

---

## Loading the Database

1. **Clone the Repo**:
   ```bash
   git clone git@github.com:Scuttlebuns/spotify_db.git
   ```
2. **Open Terminal** and navigate to that folder:
   ```bash
   cd /path/to/spotify_db
   ```
3. **Run the schema script** to create tables and import data:
   ```bash
   mysql --local-infile=1 -u root < create_tables.sql
   ```
4. **Verify** the import worked:
   ```bash
   mysql -u root -e "USE spotify_db; SHOW TABLES; SELECT COUNT(*) FROM artists; SELECT COUNT(*) FROM tracks;"
   ```
---

## Running Queries in MySQL Workbench

To run and explore the included SQL queries (query.sql) using MySQL Workbench:
1.    Open MySQL Workbench and connect to your local MySQL server.
2.    Select the database by executing:
    ```bash   
    USE spotify_db;
    ```
2.    To run queries:
    ```bash   
    open the script file 'query.sql'
    ```  

## Project Components

### 1. Dataset Selection

We selected two music datasets from Kaggle that offer strong join potential and rich metadata:

- **Spotify Dataset for SQL Practice**  
  Source: [Kaggle – ambaliyagati](https://www.kaggle.com/datasets/ambaliyagati/spotify-dataset-for-playing-around-with-sql)  
  Description: Over 1,000 songs with attributes such as `track_name`, `artist`, `popularity`, `danceability`, `energy`, `valence`, and `genre`.  
  Example questions:
  - Which genres have the highest average valence?
  - What are the most energetic or popular tracks by decade?

- **US Top 10K Artists and Their Popular Songs**  
  Source: [Kaggle – spoorthiuk](https://www.kaggle.com/datasets/spoorthiuk/us-top-10k-artists-and-their-popular-songs)  
  Description: Data on 10,000 top U.S. artists, each with their top 10 songs. Includes artist popularity, track popularity, genre, and release year.  
  Example questions:
  - How does artist popularity relate to individual track performance?
  - Which genres are most common among top artists?

---

### 2. Database Design and Implementation

- **Modeling**: An E/R diagram defines entities such as `Artists`, `Tracks`, `AudioFeatures`, and `Genres`.
- **Normalization**: All tables are normalized to 3NF to reduce redundancy and ensure consistency.
- **Implementation**: SQL scripts create all tables and relationships in MySQL.

Deliverables:
- A clear E/R diagram
- SQL schema as code blocks or appendix
- A 1–2 page written explanation of design and normalization decisions

---

### 3. Data Exploration and Insights

We wrote and executed 10–15 SQL queries that demonstrate the usefulness of the system. These include:
- Joins between artist and track datasets
- Aggregations (e.g., averages, totals)
- Subqueries for filtering and comparisons
- At least one view for modular query reuse

The queries aim to provide meaningful insights, such as:
- Trends in audio features by genre
- Artist productivity and popularity correlations
- Shifts in popular music characteristics over time

---

### 4. Presentation and Documentation

Final submission includes:
- A professional report in PDF format containing all required components
- A short 7–10 minute presentation summarizing:
  - Dataset rationale
  - Key aspects of the database design
  - 2–3 notable insights from the analysis

---

## Final Deliverables

- Final Project Report (PDF)
- Presentation Slides (PDF or PPT)

---

## Collaboration and Integrity

- Team size: up to 3 students
- All work must be original
- If a team, the report includes a breakdown of each member’s contributions

---

## Dataset Links

- [Spotify Dataset for SQL Practice](https://www.kaggle.com/datasets/ambaliyagati/spotify-dataset-for-playing-around-with-sql)
- [US Top 10K Artists and Their Popular Songs](https://www.kaggle.com/datasets/spoorthiuk/us-top-10k-artists-and-their-popular-songs)

---

## Due Date

August 4, 2025
