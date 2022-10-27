package cz.czechitas.java2webapps.lekce6.controller.cokolada;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Random;

/**
 *
 */
@Controller
@RequestMapping("/cokolada")
public class CokoladaController {
  private final Random random = new Random();
  @GetMapping("")
  public Object index() {
    ModelAndView result = new ModelAndView("/cokolada/formular");
    result.addObject("form", new CokoladaForm());
    return result;
  }

  @PostMapping("")
  public Object form(@Valid @ModelAttribute("form") CokoladaForm form, BindingResult bindingResult) {

    if (bindingResult.hasErrors()) {
      return "/cokolada/formular";
    }

    return new ModelAndView("/cokolada/objednano")
            .addObject("kod", Math.abs(random.nextInt()))
            .addObject("email", form.getEmail());
  }
}
