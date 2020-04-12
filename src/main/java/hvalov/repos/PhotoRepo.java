package hvalov.repos;

import hvalov.domain.Photo;
import org.springframework.data.repository.CrudRepository;

public interface PhotoRepo extends CrudRepository<Photo, Long> {
}
