#!/bin/bash

#run the setup script to create the DB and the schema in the DB
#do this in a loop because the timing for when the SQL instance is ready is indeterminate
for i in {1..50};
do
    /opt/mssql-tools18/bin/sqlcmd -C -S localhost -U sa -P Yukon900 -d master -Q "SELECT @@Servername;" #-i setup.sql
    if [ $? -eq 0 ]
    then
        echo "server accepting connections"
        break
    else
        echo "not ready yet..."
        sleep 1
    fi
done

echo "Importing sql files"
# Loop through all files ending with .sql in the specified directory
for sql_file in ./mnt/*.sql; do
  #sql_file=$(basename "$file")

  # Check if a file was actually found (in case no .sql files exist)
  if [ -f "$sql_file" ]; then
      echo "Processing SQL file: $sql_file"
      /opt/mssql-tools18/bin/sqlcmd -C -S localhost -U sa -P Yukon900 -i "$sql_file"
  else
    echo "$sql_file not a file"
  fi
done

#import the data from the csv file
#/opt/mssql-tools18/bin/bcp DemoData.dbo.Products in "/usr/src/app/Products.csv" -c -t',' -S localhost -U sa -P Yukon900 -u

trap "echo 'SIGTERM received, exiting...'; kill %1; exit 0" SIGTERM
    
echo "Waiting indefinitely for a signal..."
# Start a dummy background process
while true; do sleep 1; done & 
wait
echo "Exited."
