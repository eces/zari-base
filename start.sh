cd /tmp;

rm -rf ./hlabs; true

git clone https://github.com/eces/hlabs.git --branch master --single-branch;

cd ./hlabs;

npm install --quiet;

bower install --allow-root;

grunt compile --quiet;

export PORT=9000;

forever start -l hlabs.log -o out.log -e err.log -a app-hl.js;