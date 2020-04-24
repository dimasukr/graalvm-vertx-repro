FROM maven:3-jdk-11-slim as maven

RUN mkdir -p /build
WORKDIR /build
COPY pom.xml /build
COPY src /build/src

RUN mvn compile package
# Result is in bootstrap.jar because of finalName in pom.xml

FROM oracle/graalvm-ce:20.0.0-java11 as graal

RUN gu install native-image

RUN mkdir -p /build
COPY --from=maven /build/target/bootstrap.jar /build/
COPY docker/native-config/*.json /build/
COPY docker/build_native.sh /build/

WORKDIR /build
RUN ./build_native.sh
