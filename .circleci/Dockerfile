FROM nginx:latest

#COPY index.html /usr/share/nginx/html
COPY linux.png /usr/share/nginx/html

EXPOSE 80 443   


COPY . .

CMD ["nginx", "-g", "daemon off;"]
