package webtaskwithajax.webtaskwithajax.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import webtaskwithajax.webtaskwithajax.entity.Person;
import webtaskwithajax.webtaskwithajax.service.PersonService;

import java.util.List;

@RestController
@RequestMapping("/person")
@CrossOrigin(origins = "*")
public class PersonController {
    @Autowired
    private PersonService personService;

    @PostMapping
    public String Save(@RequestBody Person person) {
        return personService.save(person);
    }

    @GetMapping
    public List<Person> getPersonStartWith(@RequestParam("name") String name) {
        return personService.getPersonStartWith(name);
    }

    @GetMapping("/age")
    public List<Person> getByPersonAge(@RequestParam Integer minAge, @RequestParam Integer maxAge) {
        return personService.getByPersonAge(minAge, maxAge);
    }

    @GetMapping("/all")
    public ResponseEntity<List<Person>> getAll() {

        return new ResponseEntity<List<Person>>(personService.getAll(), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable String id) {
        personService.delete(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping
    public void deleteAll() {
        personService.deleteAll();
    }

    @PutMapping
    public ResponseEntity<String> updatePerson(@RequestBody Person person) {
        return new ResponseEntity<String>(personService.save(person), HttpStatus.OK);
    }

}

