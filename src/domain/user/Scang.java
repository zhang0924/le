package domain.user;

public class Scang {
    private String title;
    private int id;
    private String datetime;
    private int uid;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public Scang(String title, int id, String datetime) {
        this.title = title;
        this.id = id;
        this.datetime = datetime;
    }

    @Override
    public String toString() {
        return "Scang{" +
                "title='" + title + '\'' +
                ", id=" + id +
                ", datetime='" + datetime + '\'' +
                ", uid=" + uid +
                '}';
    }

    public Scang() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }
}
