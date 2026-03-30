# Modern Data Stack : Pipeline ELT (GCP, Snowflake, dbt)

## 📌 Contexte du Projet
Ce projet démontre la mise en place d'une architecture **ELT (Extract, Load, Transform)** moderne pour une entreprise de e-commerce fictive (Jaffle Shop). L'objectif est d'ingérer des données brutes stockées dans le cloud, de les charger dans un Data Warehouse, puis de les transformer en modèles analytiques testés et documentés.

## 🛠️ Architecture & Technologies
* **Cloud Storage :** Google Cloud Platform (GCP)
* **Data Warehouse :** Snowflake
* **Transformation & Orchestration :** dbt (data build tool) Core / Cloud
* **CI/CD & Versioning :** GitHub

## ⚙️ Déroulement du Pipeline

### 1. Extraction & Load (GCP -> Snowflake)
* Création d'un bucket **GCP Cloud Storage** pour agir comme zone d'atterrissage (Data Lake) des données brutes (fichiers CSV des clients, commandes et paiements).
* Configuration d'une **Storage Integration** sécurisée (IAM) entre GCP et Snowflake.
* Utilisation de la commande `COPY INTO` pour charger massivement les données dans les tables brutes (schéma `raw` de Snowflake).

### 2. Transformation (dbt)
Développement d'un projet dbt respectant les meilleures pratiques de modélisation :
* **Couche Staging :** Nettoyage léger, renommage des colonnes et cast des types de données (ex: `stg_customers`, `stg_orders`).
* **Couche Marts :** Création d'une table de faits / dimension consolidée (`dim_customers`) regroupant l'historique d'achat des clients via des jointures SQL complexes.

### 3. Qualité des données & Documentation (Data Quality)
* Implémentation de **tests génériques dbt** (`unique`, `not_null`, `accepted_values`) définis en YAML pour garantir l'intégrité des données à chaque exécution du pipeline.
* Génération automatique du catalogue de données et du graphe de lignage (Data Lineage) via `dbt docs`.
