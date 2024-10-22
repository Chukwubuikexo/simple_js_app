FROM node:22-alpine

# Set environment variables
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# Create application directory within the container's filesystem
RUN mkdir -p /home/simple_js_app

# Copy package.json and package-lock.json to the container first for efficient caching
COPY my_app/package*.json /home/simple_js_app/

# Set the working directory
WORKDIR /home/simple_js_app

# Install dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY my_app/ /home/simple_js_app

# Expose the port if needed
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
