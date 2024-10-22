FROM node:22-alpine

# Set environment variables
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# Create application directory within the container's filesystem
RUN mkdir -p /home/benedict/simple_js_app/my_app/package.json

# Copy your local application code from your working directory into the container's filesystem
COPY . /home/benedict/simple_js_app/my_app/package.json

# Set the working directory inside the container
WORKDIR /home/benedict/simple_js_app/my_app/package.json

# Install dependencies within the container
RUN npm install

# Expose the port the app runs on (optional, only if needed for external access)
EXPOSE 3000

# Start the app with node
CMD ["node", "server.js"]
