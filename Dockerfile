FROM openjdk:8-alpine as builder

WORKDIR /minecraft

ARG VERSION

RUN wget -O forge-installer.jar \
      https://files.minecraftforge.net/maven/net/minecraftforge/forge/${VERSION}/forge-${VERSION}-installer.jar \
  && java -jar forge-installer.jar --installServer \
  && mv forge-${VERSION}.jar forge.jar \
  && rm ./forge-installer.jar \
  && rm ./*.log \
  && rm -fr /tmp/*


FROM openjdk:8-alpine

WORKDIR /minecraft

COPY --from=builder /minecraft /minecraft

EXPOSE 25565
EXPOSE 25575

CMD [ "java", "-Xmx8192M", "-Xms8192M", "-jar", "forge.jar", "nogui" ]
