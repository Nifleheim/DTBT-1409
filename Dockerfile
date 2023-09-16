FROM debian:stable-slim

COPY . .

RUN chmod +x Backup.sh

RUN chmod +x Store.sh

RUN ./Store.sh

CMD ["./Backup.sh"]
