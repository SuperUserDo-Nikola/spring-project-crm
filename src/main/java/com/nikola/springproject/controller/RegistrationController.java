package com.nikola.springproject.controller;

import com.nikola.springproject.user.CrmUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import javax.validation.Valid;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    @Autowired
    private UserDetailsManager userDetailsManager;

    private Map<String, String> roles;

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    private Logger logger = Logger.getLogger(getClass().getName());

    @InitBinder
    public void initBinder(WebDataBinder dataBinder){

        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);

        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);

    }

    @PostConstruct
    protected void loadRoles(){

        // Using hashmap
        roles = new LinkedHashMap<String, String>();

        // Value to display for user
        roles.put("ROLE_EMPLOYEE", "Employee");
        roles.put("ROLE_MANAGER", "Manager");

    }

    @GetMapping("/showRegistrationForm")
    public String showMyLoginPage(Model model){

        model.addAttribute("crmUser", new CrmUser());

        // Add roles to the model for form display
        model.addAttribute("roles", roles);

        return "registration-form";

    }

    @PostMapping("/processRegistrationForm")
    public String processRegistrationForm(@Valid @ModelAttribute("crmUser") CrmUser theCrmUser, BindingResult bindingResult, Model model){

        String userName = theCrmUser.getUserName();

        logger.info("====> Processing registration form for: "+userName);


        // Form validation
        if (bindingResult.hasErrors()){

            model.addAttribute("crmUser", new CrmUser());
            model.addAttribute("registrationError", "User name/password can not be empty");
            model.addAttribute("roles",roles);

            logger.warning("Username / Password can not be empty");

            return "registration-form";
        }

        // encrypt the password
        String encodedPassword = passwordEncoder.encode(theCrmUser.getPassword());

        // prepend the encoding algorithm id
        encodedPassword = "{bcrypt}" + encodedPassword;

        // give user default role of "employee"
        List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList();
        authorities.add(new SimpleGrantedAuthority("ROLE_EMPLOYEE"));

        // if the user selected role other than employee
        // then add that one too (multiple roles)
        String formRole = theCrmUser.getFormRole();
        if (!formRole.equals("ROLE_EMPLOYEE")) {
            authorities.add(new SimpleGrantedAuthority(formRole));
        }

        // create user object (from Spring Security framework)
        User tempUser = new User(userName, encodedPassword, authorities);

        // save user in the database
        userDetailsManager.createUser(tempUser);

        logger.info("Successfully created user: " + userName);



        return "registration-confirmation";


    }

    private boolean doesUserExist(String userName){

        logger.info("---> Checking if user exosts: "+userName);

        // check database if the user alrady exists
        boolean exists = userDetailsManager.userExists(userName);

        logger.info("User: "+userName+", exists: "+userName);

        return exists;

    }
}
