package crm.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
    private int id;
    private String fullname;
    private int age ;
    private String username;
    private String password;
    private String create_date;
}
