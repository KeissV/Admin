package classes;

import java.util.Comparator;

public class UserComparator implements Comparator<User> {
    private String sortBy;

    public UserComparator(String sortBy) {
        this.sortBy = sortBy;
    }

    @Override
    public int compare(User u1, User u2) {
        if (sortBy.equals("name")) {
            return u1.getName().compareTo(u2.getName());
        } else if (sortBy.equals("email")) {
            return u1.getEmail().compareTo(u2.getEmail());
        } else {
            return u1.getId().compareTo(u2.getId()); // Default sort by ID
        }
    }
}
