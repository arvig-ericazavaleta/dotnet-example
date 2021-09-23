# Dotnet Example

This is a sample container using Microsoft's .NET core framework.  

By default the container listens on port 80 for http requests.  

To build locally, 

`docker build -t dotnet-example:latest .`

To run locally in Docker

`docker run -d -p 8080:80 dotnet-example:latest`

Then access the app at http:\\localhost:8080