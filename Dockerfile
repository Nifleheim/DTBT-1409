FROM debian:stable-slim

COPY . .

RUN chmod +x Backup.sh

RUN chmod +x Store.sh

RUN ./Backup.sh

RUN ./Store.sh
