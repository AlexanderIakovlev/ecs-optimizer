FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# Bundle app source
# add this and below command will run without cache
COPY . .

CMD [ "./ecs-optimizer.js", "--region", "us-east-1", "--cluster", "eagle-prod", "--percentage", "75", "--type", "CPUUtilization" ]
#, "--type", "CPUUtilization" ]