FROM debian:stable-slim

COPY ./Script ./Script

WORKDIR /Script

RUN ./Store.sh

CMD ["./Backup.sh"]
