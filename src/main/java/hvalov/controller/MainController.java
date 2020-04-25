package hvalov.controller;

import hvalov.domain.Photo;
import hvalov.domain.User;
import hvalov.repos.PhotoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {

    @Autowired
    private PhotoRepo photoRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(Map<String, Object> model){
        Iterable<Photo> photos = photoRepo.findAll();
        model.put("photos", photos);
        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String name,
            Map<String, Object> model,
            @RequestParam("file") MultipartFile file
            ) throws IOException {
        Photo photo = new Photo(name, user);

        if(file != null) {
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            photo.setFilename(resultFilename);
        }

        photoRepo.save(photo);

        Iterable<Photo> photos = photoRepo.findAll();
        model.put("photos", photos);

        return "main";
    }
}
