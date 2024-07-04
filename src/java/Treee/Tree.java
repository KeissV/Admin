package Treee;

import classes.Decryted;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Tree {
    private Nodetree root;

    // Constructor
    public Tree() {
        this.root = null;
    }

    // Insertar un nodo en el árbol
    public void insertNode(Person person) {
        Nodetree newNode = new Nodetree(person);
        if (root == null) {
            root = newNode;
        } else {
            insertRecursive(root, newNode);
        }
    }

    // Método auxiliar recursivo para insertar un nodo
    private void insertRecursive(Nodetree current, Nodetree newNode) {
        // Inserta el nuevo nodo en el subárbol izquierdo si es menor que el nodo actual
        if (newNode.getPerson().getFullName().compareTo(current.getPerson().getFullName()) < 0) {
            if (current.getLeftChild() == null) {
                current.setLeftChild(newNode);
            } else {
                insertRecursive(current.getLeftChild(), newNode);
            }
        }
        // Inserta el nuevo nodo en el subárbol derecho si es mayor o igual que el nodo actual
        else {
            if (current.getRightChild() == null) {
                current.setRightChild(newNode);
            } else {
                insertRecursive(current.getRightChild(), newNode);
            }
        }
    }

    // Método para leer datos desde un archivo y agregarlos al árbol
    public void readFromFileAndInsert(String filePath, Decryted decrypter) throws IOException {
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                // Ejemplo de cómo podrías parsear cada línea (se ajusta según el formato de tu archivo)
                String[] encryptedData = line.split(","); // Suponiendo que el archivo tiene datos separados por comas
                if (encryptedData.length >= 10) {
                    // Desencripta los datos
                    String[] decryptedData = new String[10];
                    for (int i = 0; i < 10; i++) {
                        decryptedData[i] = decrypter.decrypt(encryptedData[i]);
                    }
                    // Crea un objeto Person con los datos desencriptados
                    Person person = new Person(decryptedData[0], decryptedData[1], decryptedData[2], decryptedData[3],
                            decryptedData[4], decryptedData[5], decryptedData[6], decryptedData[7], decryptedData[8],
                            decryptedData[9]);
                    // Inserta la persona en el árbol
                    insertNode(person);
                }
            }
        } catch (Exception e) {
            System.err.println("Error al leer o procesar el archivo: " + e.getMessage());
        }
    }

    // Método para obtener todas las personas en orden alfabético
    public List<Person> getAllPersons() {
        List<Person> persons = new ArrayList<>();
        collectPersonsInOrder(root, persons);
        return persons;
    }

    // Método auxiliar recursivo para recoger personas en orden alfabético
    private void collectPersonsInOrder(Nodetree node, List<Person> persons) {
        if (node != null) {
            collectPersonsInOrder(node.getLeftChild(), persons);
            persons.add(node.getPerson());
            collectPersonsInOrder(node.getRightChild(), persons);
        }
    }
}
