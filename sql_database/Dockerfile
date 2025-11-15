# this will setup a linux server with SQL 2022 installed.  Change this to the appropriate
# version that can be found here: https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-linux-ver16&tabs=cli&pivots=cs1-bash
FROM mcr.microsoft.com/mssql/server:2022-latest

# Switch to root user for access to apt-get install
USER root

# Install node/npm
RUN apt-get -y update  && \
        apt-get install -y dos2unix

# Create app directory
RUN mkdir -p /usr/src/app
# Create a mount directory for the sql import files to be hosted
RUN mkdir -p /usr/src/app/mnt
# Setup the working directory
WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app

#RUN mv /usr/src/app/*.sql /usr/src/app/mnt
RUN dos2unix *

# Grant permissions for the import-data script to be executable
RUN chmod +x /usr/src/app/import-data.sh

# Switch back to mssql user and run the entrypoint script
USER mssql
ENTRYPOINT ["/bin/bash", "./entrypoint.sh"]
