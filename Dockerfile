FROM ubuntu:20.04

ENV ASPNETCORE_URLS http://*:80

WORKDIR /app

#Install Base Requirements
RUN apt-get update && apt-get install -y software-properties-common language-pack-en-base wget

#Install DotNet Repo
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb && rm packages-microsoft-prod.deb

#Install common tools and libraries.  Install DotNet SDK + ASPnet Core
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    zip \
    unzip \
    vim \
    openssl \
    dotnet-sdk-5.0 \
    aspnetcore-runtime-5.0 \
    ssl-cert

# #Copy our app into the image
COPY app/. /app

# build our app
RUN dotnet build

#Start our dotnet app
CMD ["dotnet", "watch", "run", "--server.urls", "http://*:80"]
