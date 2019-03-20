package com.pack.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pack.dao.CustomerDao;
import com.pack.form.Customer;
@Service
public class CustomerServiceImpl implements CustomerService {
private CustomerDao customerDao;
	public void setCustomerDao(CustomerDao customerDao) {
	this.customerDao = customerDao;
}

	@Override
	@Transactional
	public void addCustomer(Customer c) {
		// TODO Auto-generated method stub
customerDao.addCustomer(c);

	}

	@Override
	@Transactional
	public void updateCustomer(Customer c) {
		// TODO Auto-generated method stub
customerDao.updateCustomer(c);

	}

	@Override
	@Transactional
	public Customer getCustomerById(Integer customerId) {
		// TODO Auto-generated method stub
		return customerDao.getCustomerById(customerId);
	}

	@Override
	@Transactional
	public List<Customer> listCustomer() {
		// TODO Auto-generated method stub
		List<Customer> l=customerDao.listCustomer();
		return l;
	}

	@Override
	@Transactional
	public void removeCustomer(Integer id) {
		// TODO Auto-generated method stub
		customerDao.removeCustomer(id);
	}

}
