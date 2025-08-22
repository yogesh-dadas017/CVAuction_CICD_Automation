FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80
EXPOSE 5007
EXPOSE 5173

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["CV_Auction099/CV_Auction099.csproj", "CV_Auction099/"]
RUN dotnet restore "CV_Auction099/CV_Auction099.csproj"

COPY . .
WORKDIR "/src/CV_Auction099"
RUN dotnet publish "CV_Auction099.csproj" -c Release -o /app/out

FROM base AS final
WORKDIR /app
COPY --from=build /app/out .

ENTRYPOINT ["dotnet", "CV_Auction099.dll"]