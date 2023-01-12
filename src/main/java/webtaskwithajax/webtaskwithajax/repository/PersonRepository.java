package webtaskwithajax.webtaskwithajax.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;
import webtaskwithajax.webtaskwithajax.entity.Person;

import java.util.List;

@Repository
public interface PersonRepository extends MongoRepository<Person, String> {
    public List<Person> findByFirstNameStartsWith(String name);

    //public List<Person> findByAgeBetween(Integer min, Integer max);
    @Query(value = "{'age':{$lt:?1, $gt:?0}}", fields = "{addresses:0}")
    public List<Person> findPersonByAgeBetween(Integer min, Integer max);

}
