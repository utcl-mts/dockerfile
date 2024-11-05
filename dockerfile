# Use the official Debian image as the base
FROM debian:latest

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install NGINX and Git
RUN apt-get update && \
    apt-get install -y nginx git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose port 80 for NGINX
EXPOSE 80

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]