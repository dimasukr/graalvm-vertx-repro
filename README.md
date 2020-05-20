# graalvm-vertx-repro
Project to reproduce graalvm native image issue with vertx-pg-client https://github.com/oracle/graal/issues/2389

To reproduce issue run the following command:  
`bash docker_build.sh`  
Or if you don't have docker but you have graalvm and native-image (20.1.0) then you can run
```
mvn package
mkdir build
cp ./target/bootstrap.jar ./build/
cp ./docker/native-config/*.json ./build/
cp ./docker/build_native.sh ./build/
cd ./build
sh ./build_native.sh
```
