## Storage Systems

For this system, multiple storage solutions are used based on the nature of data and use cases. A relational database such as PostgreSQL is used for transactional patient records because it ensures strong consistency and supports ACID properties, which are critical for healthcare data. A data warehouse such as BigQuery or Snowflake is used for reporting purposes, as it enables efficient aggregation and analysis for monthly reports like bed occupancy and departmental costs.

A data lake is used to store large volumes of raw and semi-structured data, such as ICU device logs and historical treatment data, which are later used for machine learning models. For enabling natural language queries by doctors, a vector database such as FAISS or Pinecone is used. It stores embeddings of patient records, allowing semantic search. Additionally, a streaming system like Kafka is used to ingest real-time vitals data from ICU devices.

---

## OLTP vs OLAP Boundary

The OLTP system consists of the relational database that handles day-to-day operations such as patient admissions, treatments, and billing. This system is optimized for fast inserts, updates, and transactions. The OLAP system begins when data is extracted from the OLTP database and loaded into the data warehouse through ETL pipelines. The data warehouse is optimized for analytical queries, aggregations, and reporting. Machine learning models and dashboards operate on this analytical layer, not directly on the transactional database, ensuring performance and separation of concerns.

---

## Trade-offs

One major trade-off in this architecture is increased system complexity due to the use of multiple storage systems such as relational databases, data lakes, vector databases, and streaming platforms. While this improves scalability and flexibility, it also increases operational overhead and maintenance effort.

To mitigate this, a unified data platform or orchestration tool such as Apache Airflow can be used to manage data pipelines efficiently. Additionally, proper monitoring and automation can reduce manual intervention. Despite the complexity, this architecture provides the scalability and performance required for advanced analytics, real-time processing, and AI-driven capabilities in a healthcare system.
