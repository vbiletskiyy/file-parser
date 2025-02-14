# File Parser

## Overview
This project is a high-performance CSV importer using **Ruby**, **SmarterCSV**, and **Sidekiq** for batch processing. It reads a CSV file, processes its contents in chunks, and inserts/upserts records into a PostgreSQL database.

## Features
- **Batch Processing**: Efficiently processes large CSV files in configurable batch sizes.
- **Background Processing**: Uses Sidekiq to offload database operations.
- **Custom Data Converters**: Applies transformations like Boolean and String conversions.
- **Upsert Support**: Ensures duplicate user records are updated instead of reinserted.


## Installation
1. Install dependencies:
   ```sh
   bundle install
   ```

2. Configure your PostgreSQL database in `database_connector.rb`.

3. Start Redis (required for Sidekiq):
   ```sh
   redis-server
   ```

4. Start Sidekiq:
   ```sh
   bundle exec sidekiq -r ./workers/csv_worker.rb
   ```

## Usage
1. Run the CSV parser:
   ```sh
   ruby main.rb
   ```
2. This will:
   - Read `_sample.csv`
   - Process data in batches
   - Send jobs to Sidekiq for database insertion

## Configuration
- Set batch size using `CHUNK_SIZE` environment variable:
  ```sh
  export CHUNK_SIZE=5000
  ```
