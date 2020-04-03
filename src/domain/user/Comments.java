package domain.user;

public class Comments {
    private String username;
    private String comment;
    private String datetime;
private int uid;
private int bid;
private String niname;
private  String icon;

    public String getNiname() {
        return niname;
    }

    public void setNiname(String niname) {
        this.niname = niname;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Comments(String username, String comment, String datetime) {
        this.username = username;
        this.comment = comment;
        this.datetime = datetime;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public Comments() {
    }

    @Override
    public String toString() {
        return "Comments{" +
                "username='" + username + '\'' +
                ", comment='" + comment + '\'' +
                ", datetime='" + datetime + '\'' +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }
}
