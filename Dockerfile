############################################################################
# Webpage served by nginx (25,1 MB)
#
# build from project root dir with: docker build -t example-html5-landingpage-profile:latest .
# run with: docker run -p 80:8080 -d example-html5-landingpage-profile:latest
############################################################################
FROM nginxinc/nginx-unprivileged:mainline-alpine
LABEL maintainer="tait1337"

# App
WORKDIR /usr/share/nginx/html
COPY index.html favicon.ico ./
COPY img ./img
EXPOSE 8080