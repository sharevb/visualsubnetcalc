mkdir -p dist/css dist/js dist/icon dist/css/font/fonts
sass --style compressed src/scss/custom.scss:dist/css/bootstrap.min.css 
cp node_modules/lz-string/libs/lz-string.min.js dist/js/lz-string.min.js 

cp node_modules/bootstrap/dist/js/bootstrap.bundle.min.js dist/js/bootstrap.bundle.min.js

cp node_modules/jquery/dist/jquery.min.js dist/js/jquery.min.js
cp node_modules/jquery-validation/dist/jquery.validate.min.js dist/js/jquery.validate.min.js
cp node_modules/jquery-validation/dist/additional-methods.min.js dist/js/additional-methods.min.js

cp node_modules/bootstrap-icons/font/bootstrap-icons.css dist/css/font/bootstrap-icons.css
cp node_modules/bootstrap-icons/font/fonts/* dist/css/font/fonts/

cp src/css/main.css dist/css/ 
cp src/index.html dist/ 
cp src/js/main.js dist/js/ 
cp -r src/icon/* dist/icon/ 
cp src/favicon.ico dist/ 
cp src/robots.txt dist/ 
cp src/sitemap.xml dist/ 
cp src/ads.txt dist/ 
cp src/404.html dist/