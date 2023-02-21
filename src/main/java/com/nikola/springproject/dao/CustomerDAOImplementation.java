package com.nikola.springproject.dao;

import com.nikola.springproject.entity.Customer;
import com.nikola.springproject.utility.SortUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class CustomerDAOImplementation implements ICustomerDAO{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Customer> getCustomers(int theSortField) {

        // get the current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // determine sort field
        String theFieldName = null;

        switch (theSortField) {
            case SortUtils.FIRST_NAME -> theFieldName = "firstName";

            case SortUtils.LAST_NAME ->  theFieldName = "lastName";

            case SortUtils.EMAIL -> theFieldName = "email";

            case SortUtils.CITY -> theFieldName = "city";

            // if nothing matches the default to sort by lastName
            default -> theFieldName = "lastName";
        }

        // create a query
        String queryString = "from Customer order by " + theFieldName;
        Query<Customer> theQuery =
                currentSession.createQuery(queryString, Customer.class);

        // execute query and get result list
        List<Customer> customers = theQuery.getResultList();

        // return the results
        return customers;
    }

    @Override
    public void saveCustomer(Customer theCustomer) {

        // Get the current hibernate session
        Session session = sessionFactory.getCurrentSession();

        // Save/Update the Customer
        session.saveOrUpdate(theCustomer);

    }

    @Override
    public Customer getCustomer(int theId) {

        // Get the current session
        Session session = sessionFactory.getCurrentSession();

        // Now retrieve/read from database using the customer ID
        Customer theCustomer = session.get(Customer.class, theId);

        return theCustomer;

    }

    @Override
    public void deleteCustomer(int theId) {

        // Get the current session
        Session session = sessionFactory.getCurrentSession();

        // Delete object with primary key
        Query query = session.createQuery("delete from Customer where id=:customerId");
        query.setParameter("customerId", theId);


        query.executeUpdate();

    }

    @Override
    public List<Customer> searchCustomers(String theSearchName) {

        // Get the current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        Query theQuery = null;

        // Only search by name if theSearchName is not empty
        if (theSearchName != null && theSearchName.trim().length() > 0){

            // Search for firstName or lastName .... case insensitive
            theQuery = currentSession.createQuery("from Customer where lower(firstName) like: theName or lower(lastName) like: theName", Customer.class);

            theQuery.setParameter("theName","%"+theSearchName.toLowerCase()+"%");
        }else {
            theQuery = currentSession.createQuery("from Customer ",Customer.class);
        }

        // Execute query amd get result list
        List<Customer> customers = theQuery.getResultList();

        // Return customers
        return customers;
    }
}
