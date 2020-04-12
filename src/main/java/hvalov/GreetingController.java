package hvalov;

import hvalov.domain.Photo;
import hvalov.repos.PhotoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class GreetingController {

    @Autowired
    private PhotoRepo photoRepo;

    @GetMapping("/greeting")
    public String greeting(@RequestParam(name = "name", required = false, defaultValue = "World") String name, Map<String, Object> model) {
        model.put("name", name);
        return "greeting";
    }

    @GetMapping
    public String main(Map<String, Object> model){
        Iterable<Photo> photos = photoRepo.findAll();
        model.put("photos", photos);
        return "main";
    }

    @PostMapping
    public String add(@RequestParam String name, @RequestParam String imagePath, @RequestParam String tag, Map<String, Object> model){
        Photo photo = new Photo(name, imagePath, tag);
        photoRepo.save(photo);

        Iterable<Photo> photos = photoRepo.findAll();
        model.put("photos", photos);

        return "main";
    }
}
