FROM bcit/alpine

LABEL maintainer="chriswood.ca@gmail.com"
ENV DOCUMIZE_VERSION 2.1.1

ENV DOCUMIZEDBTYPE "mysql"
ENV DOCUMIZESALT "0123456789abcdefg"
ENV DOCUMIZEPORT 5001
#Overwrite this for custom MySQL DB string
ENV DOCUMIZEDB "root:password1@tcp(mysql:3306)/documize"

WORKDIR /app
ADD "https://github.com/documize/community/releases/download/v${DOCUMIZE_VERSION}/documize-community-linux-amd64" ./documize
RUN chmod +x documize

CMD ["sh", "-c", "./documize"]
EXPOSE $DOCUMIZEPORT
