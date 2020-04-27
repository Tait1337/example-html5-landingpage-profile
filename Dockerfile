############################################################################
# Webpage served by nginx (25,1 MB)
#
# build from project root dir with: docker build -t example-html5-landingpage-profile:latest .
# run with: docker run --env-file .env -p 80:80 -d example-html5-landingpage-profile:latest
############################################################################
FROM nginx:mainline-alpine
LABEL maintainer="tait1337"

# modify nginx to use a dynamic port and run as non-root user
COPY nginx/default.conf /etc/nginx/conf.d/
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'

# App
WORKDIR /usr/share/nginx/html
COPY index.html favicon.ico ./  
COPY img ./img
EXPOSE $PORT