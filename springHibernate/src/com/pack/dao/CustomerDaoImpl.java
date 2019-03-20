package com.pack.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.pack.form.Customer;
@Repository
public class CustomerDaoImpl implements CustomerDao {
private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
	this.sessionFactory = sessionFactory;
}

	@Override
	public void addCustomer(Customer c) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(c);
		
	}

	@Override
	public void updateCustomer(Customer c) {
		// TODO Auto-generated method stub
sessionFactory.getCurrentSession().update(c);
	}

	@Override
	public Customer getCustomerById(Integer customerId) {
		// TODO Auto-generated method stub
		Session s=sessionFactory.getCurrentSession();
		Customer c=(Customer)s.get(Customer.class,customerId);
		return c;
	}

	@Override
	public List<Customer> listCustomer() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("From Customer").list();
	}

	@Override
	public void removeCustomer(Integer id) {
		// TODO Auto-generated method stub
		Session s=sessionFactory.getCurrentSession();
		Customer c=(Customer)s.get(Customer.class,id);
		if(c!=null)
			s.delete(c);
		
	}

}
