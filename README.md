# Bank Loans Analysis Project

This project analyzes bank loan data using AWS S3, Python, PostgreSQL, dbt (Data Build Tool) and PowerBI. The analysis workflow combines Jupyter notebooks for data exploration, dbt for transformations, and PowerBI for visualization.

## 🛠 Tech Stack

- **Python 3.12+** 
- **AWS S3** - Data storage
- **PostgreSQL** - Database backend
- **dbt** - Data transformation and modeling
- **Jupyter Notebooks** - Data exploration and analysis
- **PowerBI** - Visualization and reporting
- **uv** - Python package management 
- **Docker** - Development environment

## 📁 Project Structure

```
├── notebooks/                   # Jupyter notebooks for analysis
│   ├── BankloanEDA.ipynb       # Exploratory Data Analysis
│   ├── csv_data_load_to_postgres.ipynb  # PostgreSQL data ingestion
│   ├── example_data_load_with_sqlite.ipynb  # SQLite example
│   └── data/                   # Raw data files
├── bankloan_dbt_project/       # dbt transformations
│   ├── dbt_project.yml        # dbt project configuration
│   └── models/
│       └── example/
│           ├── client_loan_analytics.sql
│           └── schema.yml      # dbt schema definitions
├── profiles/                   # dbt connection profiles
├── powerbi/                    # Power BI reports
│   └── bank_loan_report.pbix
├── docker-compose.yml          # Docker services config
├── pyproject.toml             # Python project dependencies
└── example.env                # Environment variables template
```

## 🚀 Getting Started

### Prerequisites

- Python 3.12
- Docker and Docker Compose
- uv package manager

### Installation

1. Clone and setup:
   ```bash
   git clone <repository-url>
   cd bank_loans
   cp example.env .env  # Copy and configure environment variables
   ```

2. Install dependencies:
   ```bash
   uv venv
   uv pip install -e .
   ```

3. Start services:
   ```bash
   docker compose up -d
   ```

### Data Pipeline

1. Data Ingestion:
   - Run `notebooks/csv_data_load_to_postgres.ipynb` to load data into PostgreSQL
   - Data validation and initial exploration in `notebooks/BankloanEDA.ipynb`

2. dbt Transformations:
   ```bash
   # Connect to dbt container
   docker exec -it dbt_core bash
   
   # Inside container:
   cd bankloan_dbt_project
   dbt run
   dbt test
   dbt docs generate && dbt docs serve
   ```

## 📊 Components

### Notebooks
- `BankloanEDA.ipynb`: Exploratory analysis and feature engineering
- `csv_data_load_to_postgres.ipynb`: PostgreSQL data ingestion pipeline
- `example_data_load_with_sqlite.ipynb`: Example using SQLite

### dbt Models
Located in `bankloan_dbt_project/models/`:
- `client_loan_analytics.sql`: Regional loan performance metrics including:
  - Loan counts and amounts by region
  - Average loan durations
  - Default rates
  - Economic indicators

### Visualization
PowerBI dashboard in `powerbi/bank_loan_report.pbix` provides:
- Loan distribution analysis
- Regional performance metrics
- Risk analysis

## 🐳 Infrastructure 

The project runs on Docker with three services:
1. **PostgreSQL** (port 5432) - Main database
2. **dbt** - Transformation engine
3. **pgAdmin** (port 5050) - Database management UI

## 🔑 Configuration

1. Environment Variables (copy `example.env` to `.env`):
   - AWS credentials
   - Region settings

2. Database Settings:
   - PostgreSQL connection details in `profiles/profile.yml`
   - dbt configuration in `bankloan_dbt_project/dbt_project.yml`

## 📚 Documentation

- **dbt**: Run `dbt docs generate` and `dbt docs serve`
- **API**: Available in notebook markdown cells
- **Data Models**: Defined in `schema.yml` files

## 📄 License

This project is licensed under the MIT License.