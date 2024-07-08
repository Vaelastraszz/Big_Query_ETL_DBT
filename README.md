# DBT Project for BigQuery: Star Schema Transformation

## Overview

This dbt project transforms a normalized database into a star schema in BigQuery. The project involves creating dimension tables for channels, customers, products, and dates, as well as fact tables for visit and purchase history. Sources are defined from the raw database, and analytical queries are provided to derive metrics from the transformed data model.

## Project Structure
```
.
├── README.md
├── dbt_project.yml
├── models
│ ├── marts
│ │ ├── core
│ │ │ ├── dim_channels.sql
│ │ │ ├── dim_customers.sql
│ │ │ ├── dim_products.sql
│ │ │ ├── dim_dates.sql
│ │ │ ├── fct_visits.sql
│ │ │ ├── fct_purchase_history.sql
│ │ │ └── ...
│ ├── staging
│ │ ├── stg_channels.sql
│ │ ├── stg_customers.sql
│ │ ├── stg_products.sql
│ │ ├── stg_dates.sql
│ │ ├── stg_visits.sql
│ │ ├── stg_purchase_history.sql
│ │ └── ...
│ ├── snapshots
│ │ ├── snapshot_orders.sql
│ │ └── ...
│ └── ...
├── macros
│ ├── get_unique_values.sql
│ ├── filter_last_90_days.sql
│ └── ...
└── ...
```

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/your-dbt-project.git
    cd your-dbt-project
    ```

2. Install dbt and the required packages:

    ```bash
    pip install dbt
    ```

3. Set up your BigQuery profile in `profiles.yml`:

    ```yaml
    your-profile:
      target: dev
      outputs:
        dev:
          type: bigquery
          method: service-account
          project: your-gcp-project
          dataset: your_dataset
          keyfile: /path/to/your-service-account-file.json
          threads: 1
          timeout_seconds: 300
          location: US
    ```

## Models

### Dimensions

- **Channels**: `dim_channels.sql`
- **Customers**: `dim_customers.sql`
- **Products**: `dim_products.sql`
- **Dates**: `dim_dates.sql`

### Facts

- **Visits**: `fct_visits.sql`
- **Purchase History**: `fct_purchase_history.sql`

### Staging

- **Channels**: `stg_channels.sql`
- **Customers**: `stg_customers.sql`
- **Products**: `stg_products.sql`
- **Dates**: `stg_dates.sql`
- **Visits**: `stg_visits.sql`
- **Purchase History**: `stg_purchase_history.sql`

### Snapshots

- **Order Status Transitions**: `snapshot_orders.sql`

## Macros

- **Get Unique Values**: `get_unique_values.sql`
- **Filter Last 90 Days**: `filter_last_90_days.sql`

## Analytical Queries

- Analytical queries are included to derive metrics from the new star schema model. These queries can be found in the `analytical` folder and provide insights such as total sales, average order value, customer retention rates, and more.

## Running the Project

1. Compile and run the models:

    ```bash
    dbt run
    ```

2. Run tests to ensure data integrity:

    ```bash
    dbt test
    ```

3. Generate documentation:

    ```bash
    dbt docs generate
    dbt docs serve
    ```

## Usage

This project transforms raw data into a star schema for efficient querying and analysis. The dimension and fact tables created allow for streamlined reporting and analytics. Use the provided analytical queries to gain insights from your transformed data.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss changes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

