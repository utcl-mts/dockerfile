# Use the official Debian image as the base
FROM debian:latest

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install NGINX and Git
RUN apt-get update && \
    apt-get install -y nginx git && apt-get install -y mysql-server &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Set environment variables (replace these with your own values)
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Expose ports
EXPOSE 80
EXPOSE 3306

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;", "mysqld"]
