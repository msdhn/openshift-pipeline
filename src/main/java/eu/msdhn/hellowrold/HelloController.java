package eu.msdhn.hellowrold;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Enumeration;
import java.util.Properties;


@RestController
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        Properties p = System.getProperties();
        Enumeration keys = p.keys();
        while (keys.hasMoreElements()) {
            String key = (String) keys.nextElement();
            String value = (String) p.get(key);
            System.out.println(key + ": " + value);
        }
        return "Hello..... Hello Application";
    }
}
