FROM openjdk:8-jdk

WORKDIR /server

RUN  wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.14.4-28.1.0/forge-1.14.4-28.1.0-installer.jar \
  && java -jar forge-1.14.4-28.1.0-installer.jar --installServer \
  && rm forge-1.14.4-28.1.0-installer.* \
  && echo "eula=true" > eula.txt
