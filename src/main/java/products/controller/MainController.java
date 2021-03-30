package products.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import products.dao.productDao;
import products.model.Product;

@Controller
public class MainController {
	@Autowired
	private productDao productDao;
	
	
	@RequestMapping("/")
	public String home(Model m) {
		
		List<Product> products = productDao.getProducts();
		m.addAttribute("products", products);
		
		
		
		 return "index";
	}
	@RequestMapping("/addproduct")
	public String addproduct() {
		
		
		return "addproductform";
		
		
	}
@RequestMapping(value="/handleproduct", method=RequestMethod.POST)
	public RedirectView handleproduct(@ModelAttribute Product product, HttpServletRequest request) {
		System.out.println(product);
		this.productDao.createProduct(product);
		RedirectView redirectview = new RedirectView();
		redirectview.setUrl(request.getContextPath()+ "/");
		
		
		return redirectview;
		
	}
@RequestMapping("/delete")
@ResponseBody
public RedirectView delete(@RequestParam ("id") int productid, HttpServletRequest request) {
	this.productDao.deleteProduct(productid);
	RedirectView redirectview = new RedirectView();
	redirectview.setUrl(request.getContextPath()+ "/");
	
	
	return redirectview;
}

@RequestMapping("/update/{productid}")
public String updateform(@PathVariable("productid") int id, Model m) {
	
	Product product = this.productDao.getProduct(id);
	m.addAttribute("product", product);
	
	
	return "updateform";
}
@RequestMapping(value="/searching", method = RequestMethod.POST)
public String search(@RequestParam ("search") String search, Model m) {
	
	List<Product> products = productDao.getProductsbyName(search);
	System.out.println(products);
	m.addAttribute("products", products);
	
	
	return "searchpost";
}
}
