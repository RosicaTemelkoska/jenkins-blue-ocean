# Use a basic image as the base
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy the app's source code
COPY . .

# Expose port for the app
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
