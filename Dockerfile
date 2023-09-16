FROM debian:stable-slim

COPY . .

RUN ./Store.sh

CMD ["./Backup.sh"]
