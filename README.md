# Exchange Rates Parser 💱

A simple Ruby application for fetching current exchange rates from the European Central Bank (ECB).

## 📋 Description

This application retrieves current exchange rates (USD, JPY, CZK) against the Euro from the official ECB XML feed and displays them in a human-readable format.

## 🚀 Features

- Fetches data via HTTP requests to the European Central Bank API
- Parses XML data with currency exchange rates
- Processes and formats exchange rate information
- Comprehensive error handling (HTTP, XML, network)

## 🛠 Technologies and Skills

### Technologies Used:
- **Ruby 3.2.3**
- Ruby Standard Libraries:
    - `net/http` - for HTTP requests
    - `rexml` - for XML parsing
    - `uri` - for URL handling
    - `date` - for date manipulation

### Applied Concepts:
- **Object-Oriented Programming (OOP)** - `Rates` class for data encapsulation
- **HTTP API Integration** - working with external REST APIs
- **XML Parsing** - processing structured data
- **Exception Handling** - robust error management for network and data issues
- **Modularity** - separating logic into individual files

## ▶️ Usage

```bash
ruby exchange.rb
```
## 📊 Sample Output
Date: 2025-11-04

Currency: USD

1 Euro is equal to: 1.0856 USD


Date: 2025-11-04

Currency: JPY

1 Euro is equal to: 165.32 JPY


Date: 2025-11-04

Currency: CZK

1 Euro is equal to: 25.285 CZK

## 📝 Project Structure
exchange/

├── exchange.rb # Main script for fetching and processing data

├── rates.rb # Class for representing exchange rates

├── .gitignore # Git exclusions

└── README.md # Project documentation

## 🔗 Data Source
[ECB Daily Exchange Rates XML Feed](https://www.ecb.europa.eu/home/html/index.en.html)
