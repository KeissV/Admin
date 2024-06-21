package classes;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    private static final String USER_FILE = "C:\\Users\\franc\\OneDrive\\Documentos\\NetBeansProjects\\SymposiumProject\\register.txt";
    private static final String MESSAGE_FILE = "C:\\Users\\franc\\OneDrive\\Documentos\\NetBeansProjects\\SymposiumProject\\request.txt";
    public static List<User> readUsers() throws IOException {
        List<User> users = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(USER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 3) { // Asegura que haya al menos tres partes
                    User user = new User();
                    user.setId(parts[0].trim());
                    user.setName(parts[1].trim());
                    user.setEmail(parts[2].trim());
                    users.add(user);
                } else {
                    // Manejar el caso de datos incorrectos en el archivo
                    System.err.println("Error: La línea no tiene el formato esperado: " + line);
                }
            }
        }
        
        return users;
    }

    public static List<Message> readMessages() throws IOException {
        List<Message> messages = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(MESSAGE_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 4) { // Asegura que haya al menos cuatro partes
                    Message message = new Message();
                    message.setName(parts[0].trim());
                    message.setEmail(parts[1].trim());
                    message.setPhone(parts[2].trim());
                    message.setContent(parts[3].trim());
                    messages.add(message);
                } else {
                    // Manejar el caso de datos incorrectos en el archivo
                    System.err.println("Error: La línea no tiene el formato esperado: " + line);
                }
            }
        }
        return messages;
    }
}


