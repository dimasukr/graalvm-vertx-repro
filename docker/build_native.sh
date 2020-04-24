#!/usr/bin/env bash
set -Eeuo pipefail
set -x

native-image -jar bootstrap.jar \
-H:Name=bootstrap \
-H:ReflectionConfigurationFiles=reflect-config.json \
-H:ResourceConfigurationFiles=resource-config.json \
-H:+ReportExceptionStackTraces \
-H:+TraceClassInitialization \
-H:+JNI \
--allow-incomplete-classpath \
--static \
--no-fallback \
--no-server \
--initialize-at-run-time=io.netty.util.internal.logging.Log4JLogger,\
io.netty.handler.ssl,io.netty.resolver.dns,\
io.netty.channel.DefaultChannelId,\
io.netty.buffer.PooledByteBufAllocator,\
io.netty.util.NetUtil,\
io.netty.channel.socket.InternetProtocolFamily,\
io.netty.resolver.HostsFileEntriesResolver,\
io.netty.resolver.dns.DnsNameResolver,\
io.netty.resolver.dns.DnsServerAddressStreamProviders,\
io.netty.resolver.dns.PreferredAddressTypeComparator\$1,\
io.netty.resolver.dns.DefaultDnsServerAddressStreamProvider,\
io.vertx.core.impl.AddressResolver,\
io.netty.handler.codec.http.websocketx.extensions.compression.DeflateEncoder,\
io.netty.handler.codec.http.websocketx.extensions.compression.DeflateDecoder,\
io.netty.handler.codec.http.HttpObjectEncoder,\
io.netty.handler.codec.http.websocketx.WebSocket00FrameEncoder,\
io.netty.handler.codec.http2.Http2CodecUtil,\
io.netty.handler.codec.http2.Http2ConnectionHandler,\
io.netty.handler.codec.http2.DefaultHttp2FrameWriter,\
io.netty.handler.ssl.ReferenceCountedOpenSslServerContext,\
io.netty.handler.ssl.JdkNpnApplicationProtocolNegotiator,\
io.netty.handler.ssl.ReferenceCountedOpenSslEngine,\
io.netty.handler.ssl.ConscryptAlpnSslEngine,\
io.netty.handler.ssl.JettyNpnSslEngine,\
io.netty.handler.ssl.JettyAlpnSslEngine\$ClientEngine,\
io.netty.handler.ssl.JettyAlpnSslEngine\$ServerEngine,\
io.netty.handler.ssl.ReferenceCountedOpenSslContext,\
io.netty.handler.ssl.ReferenceCountedOpenSslClientContext,\
io.vertx.core.net.impl.transport.EpollTransport,\
io.vertx.core.net.impl.transport.KQueueTransport,\
io.vertx.core.http.impl.VertxHttp2ClientUpgradeCodec,\
io.vertx.core.eventbus.impl.clustered.ClusteredEventBus

#--initialize-at-run-time classes are used from
#https://github.com/vertx-howtos/graal-native-image-howto/blob/master/steps/step-9/src/main/resources/META-INF/native-image/com.example/myapp/native-image.properties
