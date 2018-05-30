# docker build -t appsecco/owasp-webgoat-dot-net .
# docker run --name webgoat -it -p 9000:9000 -d appsecco/owasp-webgoat-dot-net
FROM mono:slim
LABEL MAINTAINER="Appsecco"

RUN apt-get update \
    && apt-get install -y wget unzip mono-xsp4 sqlite3 \
    && wget https://github.com/jerryhoff/WebGoat.NET/archive/master.zip \
    && unzip master.zip \
    && cd /WebGoat.NET-master/WebGoat/ \
    && msbuild

EXPOSE 9000

WORKDIR "/WebGoat.NET-master/WebGoat/"

CMD [ "xsp4", "--printlog" ]
