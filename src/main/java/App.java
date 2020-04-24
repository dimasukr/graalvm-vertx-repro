import io.vertx.core.Vertx;
import io.vertx.pgclient.PgConnectOptions;
import io.vertx.pgclient.PgConnection;

public class App {

    static PgConnection dbConnection;

    public static void main(String[] args) {
        PgConnection.connect(Vertx.vertx(), PgConnectOptions.fromEnv()
                , arConn -> {
                    if (arConn.succeeded()) {
                        dbConnection = arConn.result();
                    } else {
                        System.out.println("DB Connection exception occurred");
                    }
                });
    }
}
