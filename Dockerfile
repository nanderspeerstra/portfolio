# Use the official NGINX image as the base
FROM nginx:alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Remove the default NGINX HTML content
RUN rm -rf ./*

# Copy the Hugo public directory (generated static files) to the container
COPY public/ .

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
