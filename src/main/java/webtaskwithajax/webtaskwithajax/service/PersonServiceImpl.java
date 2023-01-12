package webtaskwithajax.webtaskwithajax.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import webtaskwithajax.webtaskwithajax.entity.Person;
import webtaskwithajax.webtaskwithajax.repository.PersonRepository;

import java.util.List;
import java.util.Optional;

@Service
public class PersonServiceImpl implements PersonService {
    @Autowired
    private PersonRepository personRepository;

    @Override
    public String save(Person person) {
        return personRepository.save(person).getPersonId();
    }

    @Override
    public List<Person> getPersonStartWith(String name) {
        List<Person> byFirstNameStartsWith = personRepository.findByFirstNameStartsWith(name);
        return byFirstNameStartsWith;
    }

    @Override
    public void delete(String id) {
        personRepository.deleteById(id);
    }

    @Override
    public List<Person> getByPersonAge(Integer minAge, Integer maxAge) {
        List<Person> byAgeBetween = personRepository.findPersonByAgeBetween(minAge, maxAge);
        return byAgeBetween;
    }

    @Override
    public void deleteAll() {
        personRepository.deleteAll();
    }

    @Override
    public List<Person> getAll() {
        return personRepository.findAll();
    }

    @Override
    public Person getPersonById(String id) {
        Optional<Person> byId = personRepository.findById(id);
        Person person = null;
        if (byId.isPresent()){
            person = byId.get();
        }
        return person;
    }
}
