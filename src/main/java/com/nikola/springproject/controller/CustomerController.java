package com.nikola.springproject.controller;

import com.nikola.springproject.entity.Customer;
import com.nikola.springproject.service.ICustomerService;
import com.nikola.springproject.utility.SortUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private ICustomerService customerService;

    @GetMapping("/list")
    public String listCustomers(Model model, @RequestParam(required = false)String sort){

        // Get customers from service
        List<Customer> theCustomers = null;

        // Check for sort fields
        if (sort != null) {
            int theSortField = Integer.parseInt(sort);
            theCustomers = customerService.getCustomers(theSortField);
        }else {
            // no sort field provided ... default to sorting by last name
            theCustomers = customerService.getCustomers(SortUtils.LAST_NAME);
        }

        // Add customers to the model
        model.addAttribute("customers", theCustomers);

        return "list-customers";
    }


    @GetMapping("/showFormForAdding")
    public String showFormForAdding(Model model){

        // Creating customer attribute to bind form data
        Customer theCustomer = new Customer();

        model.addAttribute("customer", theCustomer);

        return "customer-form-adding-customers";

    }

    @PostMapping("/saveCustomer")
    public String saveCustomer(@ModelAttribute("customer") Customer theCustomer){

        // Save the customer using service
        customerService.saveCustomer(theCustomer);

        return "redirect:/customer/list";

    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("customerId")int theId, Model model){

        // Get the customer from service
        Customer theCustomer = customerService.getCustomer(theId);

        // Set customer as model attribute to pre-populate form
        model.addAttribute("customer", theCustomer);

        // send over to our form
        return "customer-form-adding-customers";
    }

    @GetMapping("/delete")
    public String deleteCustomer(@RequestParam("customerId")int theId){

        // Delete the customer
        customerService.deleteCustomer(theId);

        return "redirect:/customer/list";

    }

    @GetMapping("/search")
    public String searchForCustomer(@RequestParam("theSearchName") String theSearchName, Model model){

        // Search for customer from service
        List<Customer> theCustomers = customerService.searchCustomers(theSearchName);

        // Add customer to the model
        model.addAttribute("customers", theCustomers);

        return "list-customers";


    }

}
