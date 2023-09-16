FROM debian:stable-slim

COPY . .

RUN chmod +x Backup.sh

RUN ./Backup.sh


