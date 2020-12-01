FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env

RUN apt-get update -yq 
RUN apt-get install curl gnupg -yq 
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get -y install nodejs

WORKDIR /app
COPY . /app

WORKDIR /app/DotnetTemplate.Web/
RUN npm install
RUN npm run build

RUN dotnet build /app/DotnetTemplate.sln
ENTRYPOINT dotnet run