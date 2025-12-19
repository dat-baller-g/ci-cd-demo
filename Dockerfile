
FROM node:18-alpine

# This sets the working directory inside container
WORKDIR /app

# This copies package files for layer caching
COPY package*.json ./

# This installs dependencies
RUN npm install --only=production

# This copies application source
COPY . .

# This exposes app port
EXPOSE 3000

# This starts the app
CMD ["npm", "start"]