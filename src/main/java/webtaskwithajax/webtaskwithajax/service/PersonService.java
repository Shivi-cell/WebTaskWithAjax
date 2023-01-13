package webtaskwithajax.webtaskwithajax.service;

import webtaskwithajax.webtaskwithajax.entity.Person;

import java.util.List;

public interface PersonService {
    Person save(Person person);

    List<Person> getPersonStartWith(String name);

    void delete(String id);

    List<Person> getByPersonAge(Integer minAge, Integer maxAge);

    void deleteAll();

    List<Person> getAll();

    Person getPersonById(String id);
}
