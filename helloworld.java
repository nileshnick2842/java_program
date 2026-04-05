import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpExchange;
import java.io.*;
import java.net.InetSocketAddress;
import java.nio.file.Files;
import java.nio.file.Paths;

public class helloworld {
    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        server.createContext("/", exchange -> {
            String config = "";
            try {
                config = new String(Files.readAllBytes(Paths.get("/app/config.txt")));
            } catch (Exception e) {
                config = "Config not found";
            }
            String response = "<html><body>" +
                "<h1>Hello from Nilesh's Java Docker container!</h1>" +
                "<p>Config loaded via ADD instruction:</p>" +
                "<pre>" + config + "</pre>" +
                "</body></html>";
            exchange.sendResponseHeaders(200, response.length());
            OutputStream os = exchange.getResponseBody();
            os.write(response.getBytes());
            os.close();
        });
        System.out.println("Java server running on port 8080...");
        server.start();
    }
}