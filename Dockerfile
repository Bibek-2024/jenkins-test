# Use official nginx image as base
FROM nginx:latest

# Remove default Nginx HTML files
RUN rm -rf /usr/share/nginx/html/*

# Copy website files into Nginx html folder
COPY . /usr/share/nginx/html/

# Expose port 8000
EXPOSE 8000

# Update default Nginx config to listen on 8000
RUN sed -i 's/listen 80;/listen 8000;/' /etc/nginx/conf.d/default.conf

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
