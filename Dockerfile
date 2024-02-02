From node:latest
Workdir /apps
Add . .
Run npm install
Cmd ["node", "index.js"]