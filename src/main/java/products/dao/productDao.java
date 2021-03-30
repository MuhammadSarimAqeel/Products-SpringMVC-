package products.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mysql.cj.Query;
import com.mysql.cj.xdevapi.SessionFactory;

import products.model.Product;

@Component
public class productDao {
	

	@Autowired
	private HibernateTemplate hibernateTemplate;

	// create
	@Transactional
	public void createProduct(Product product) {

		this.hibernateTemplate.saveOrUpdate(product);

	}

	// get all products
	public List<Product> getProducts() {
		List<Product> products = this.hibernateTemplate.loadAll(Product.class);
		return products;
	}

	// delete the single product
	@Transactional
	public void deleteProduct(int pid) {
		Product p = this.hibernateTemplate.load(Product.class, pid);
		this.hibernateTemplate.delete(p);
	}

	// get the single product
	public Product getProduct(int pid) {
		return this.hibernateTemplate.get(Product.class, pid);
	}

	public List<Product> getProductsbyName(String name) {
	
	
		 
	
		List<Product> products = (List<Product>) this.hibernateTemplate.findByNamedParam("from Product p where p.name like:name","name", "%"+name+"%");
		return products;
	}


}
