package models;

public class UserType {
    private Integer userTypeId;
    private String name;    

    public UserType(Integer userTypeId) {
        this.userTypeId = userTypeId;
    }
    public Integer getUserTypeId() {
        return userTypeId;
    }
    public void setUserTypeId(Integer userTypeId) {
        this.userTypeId = userTypeId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    
}
