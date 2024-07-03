
package Treee;

public class Nodetree {
    private Person person;
    private Nodetree leftChild;
    private Nodetree rightChild;

    // Constructor
    public Nodetree(Person person) {
        this.person = person;
        this.leftChild = null;
        this.rightChild = null;
    }

    // Getters and Setters
    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public Nodetree getLeftChild() {
        return leftChild;
    }

    public void setLeftChild(Nodetree leftChild) {
        this.leftChild = leftChild;
    }

    public Nodetree getRightChild() {
        return rightChild;
    }

    public void setRightChild(Nodetree rightChild) {
        this.rightChild = rightChild;
    }
}

