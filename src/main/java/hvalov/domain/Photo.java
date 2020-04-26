package hvalov.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Entity
public class Photo {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Please, fill the name.")
    @Length(max = 100, message = "Name is too long (100 max).")
    private String name;

    @NotBlank(message = "Please, fill the name.")
    private String filename;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;


//private List<String> comments;

    public Photo() {

    }

    public Photo(String name, User user) {
        this.author = user;
        this.name = name;
        //this.comments = comments;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getAuthorName() {
        return author != null ? author.getUsername() : "<none>";
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

//    public List<String> getComments() {
//        return comments;
//    }
//
//    public void setComments(List<String> comments) {
//        this.comments = comments;
//    }
}
