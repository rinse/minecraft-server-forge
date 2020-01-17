FROM openjdk:8-alpine

WORKDIR /minecraft

ARG VERSION

RUN  wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/${VERSION}/forge-${VERSION}-installer.jar \
  && java -jar forge-${VERSION}-installer.jar --installServer \
  && rm ./forge-installer.jar \
  && rm ./*.log \
  && rm -fr /tmp/* \
  && echo "eula=true" > eula.txt
