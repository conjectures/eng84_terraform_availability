#!/bin/bash
echo export DB_HOST="mongodb://12.1.1.11/posts" >> /etc/profile
cd /home/ubuntu/app
npm install
node seeds/seed.js
pm2 start app.js
