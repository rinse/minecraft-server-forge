FROM openjdk:8-jdk

WORKDIR /server

ARG VERSION

RUN  wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/${VERSION}/forge-${VERSION}-installer.jar \
  && java -jar forge-${VERSION}-installer.jar --installServer \
  && rm forge-${VERSION}-installer.* \
  && echo "eula=true" > eula.txt