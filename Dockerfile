FROM mcr.microsoft.com/dotnet/sdk:6.0 as base

RUN apt-get -y update && apt-get -y install curl
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - &&\
apt-get install -y nodejs

COPY . ./src/ 

WORKDIR $HOME/src

RUN dir /src
RUN dotnet build
RUN dotnet test

WORKDIR $HOME/src/DotnetTemplate.Web

RUN npm install
RUN npm run build
RUN npm t
RUN npm run lint

EXPOSE 8088
ENTRYPOINT dotnet run --bind 0.0.0.0.8088
