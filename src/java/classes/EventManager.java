package classes;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class EventManager {
    private static final String FILE_PATH = "C:\\Users\\chiul\\Documents\\Manu\\SimposioUcr\\SimposioUcr\\web\\WEB-INF\\events.txt";

    public List<String[]> getEvents() throws IOException {
        List<String[]> events = new ArrayList<>();
        Path filePath = Paths.get(FILE_PATH);
        try (BufferedReader reader = Files.newBufferedReader(filePath, StandardCharsets.UTF_8)) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split("\\|");
                events.add(data);
            }
        }
        return events;
    }

    public boolean saveEvents(List<String[]> events) {
        Path filePath = Paths.get(FILE_PATH);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath.toString(), false))) {
            for (String[] event : events) {
                writer.write(String.join("|", event));
                writer.newLine();
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}
