package com.nikola.springproject.service;

import com.nikola.springproject.entity.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> getCustomers(int theSortField);

    void saveCustomer(Customer theCustomer);

    Customer getCustomer(int theId);

    void deleteCustomer(int theId);

    List<Customer> searchCustomers(String theSearchName);
}
