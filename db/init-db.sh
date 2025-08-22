#!/bin/bash

echo "🕒 Waiting for SQL Server to start..."
sleep 20

echo "⚙️ Running SQL scripts..."

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P admin123 -d master -i /db-scripts/01-create-db.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P admin123 -d cvauction -i /db-scripts/02-seed-data.sql

echo "✅ SQL setup complete."

tail -f /dev/null