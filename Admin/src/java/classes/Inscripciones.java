package classes;

import java.io.BufferedReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class Inscripciones {
    private static final String FILE_PATH = "";
    private Decryted decryptor;

    public Inscripciones() {
        decryptor = new Decryted();
    }

    public List<String[]> getInscripciones() throws Exception {
        List<String[]> inscripciones = new ArrayList<>();
        Path filePath = Paths.get(FILE_PATH);
        try (BufferedReader reader = Files.newBufferedReader(filePath, StandardCharsets.UTF_8)) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split("\\|");
                if (data.length < 5) {
                    continue;
                }
                String decryptedEventId = decryptor.decrypt(data[0].trim());
                String decryptedEventName = decryptor.decrypt(data[1].trim());
                String decryptedUserName = decryptor.decrypt(data[2].trim());
                String decryptedIdNumber = decryptor.decrypt(data[3].trim());
                String decryptedEmail = decryptor.decrypt(data[4].trim());
                inscripciones.add(new String[]{decryptedEventId, decryptedEventName, decryptedUserName, decryptedIdNumber, decryptedEmail});
            }
        }
        return inscripciones;
    }
}
