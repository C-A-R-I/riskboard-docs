# build environment
FROM python:3.9-alpine as build
WORKDIR /app
ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt
ADD docs docs
ADD mkdocs.yml mkdocs.yml
RUN mkdocs build

# production environment
FROM nginx:stable-alpine
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/site /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
