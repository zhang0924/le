package domain.user;

public class Blog {
    private int id;
    private String content;
    private String title;
    private String zy;
    private  String datetime;
    private int eye;
    private String type;
    private String tag;
    private  String indexPicture;
private  String icon;
private  String niname;
private  String yzf;

    public String getYzf() {
        return yzf;
    }

    public void setYzf(String yzf) {
        this.yzf = yzf;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getNiname() {
        return niname;
    }

    public void setNiname(String niname) {
        this.niname = niname;
    }

    public String getIndexPicture() {
        return indexPicture;
    }

    public void setIndexPicture(String indexPicture) {
        this.indexPicture = indexPicture;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", title='" + title + '\'' +
                ", zy='" + zy + '\'' +
                ", datetime='" + datetime + '\'' +
                ", eye=" + eye +
                ", type='" + type + '\'' +
                ", tag='" + tag + '\'' +
                ", indexPicture='" + indexPicture + '\'' +
                '}';
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public int getEye() {
        return eye;
    }

    public void setEye(int eye) {
        this.eye = eye;
    }

    public String getZy() {
        return zy;
    }

    public void setZy(String zy) {
        this.zy = zy;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Blog() {
    }

    public Blog(int id, String content, String title) {
        this.id = id;
        this.content = content;
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
