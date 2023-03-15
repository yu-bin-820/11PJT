package com.model2.mvc.web.purchase;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	//setter Method 구현 않음
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
		
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}
	
//	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET )
//	public Product getProduct( @PathVariable int prodNo ) throws Exception{
//		
//		System.out.println("/product/json/getProduct : GET");
//		
//		//Business Logic
//		return productService.findProduct(prodNo);
//	}
//
//	@RequestMapping( value="json/addProduct", method=RequestMethod.POST )
//	public void addProduct(		@RequestBody Product product ) throws Exception{
//	
//		System.out.println("/product/json/addProduct : POST");
//		
//		//Business Logic
//		System.out.println("::"+product);
//		productService.insertProduct(product);
//		
//	}
	
//	@RequestMapping( value="json/updateProduct", method=RequestMethod.POST )
//	public void updateProduct(		@RequestBody Product product ) throws Exception{
//	
//		System.out.println("/product/json/updateProduct : POST");
//		//Business Logic
//		System.out.println("::"+product);
//		productService.updateProduct(product);
//		
//	}
	
	@RequestMapping( value="json/updateTranCodeByProd", method=RequestMethod.GET )
	public void updateProduct(	@RequestParam("prodNo") int prodNo, 
								@RequestParam("tranCode") String tranCode ) throws Exception{
	
		System.out.println("/product/json/updateTranCodeByProd : GET");
		
		
		Purchase purchase = new Purchase();
		purchase.setTranCode(tranCode);
		purchase.setPurchaseProd(productService.findProduct(prodNo));
		//Business Logic
		purchaseService.updateTranCodeByProd(purchase);
		
	}
	
//	@RequestMapping( value="json/listProduct" , method=RequestMethod.POST)
//	public Map listProduct(	@RequestBody Search search ) throws Exception{
//	
//		System.out.println("/product/json/listProduct : POST");
//		//Business Logic
//		System.out.println("::"+search);
//		Map<String, Object> map =productService.getProductList(search);
//		
//		System.out.println(map);
//		return map;
//	}
	
//	@RequestMapping( value="json/listProduct" , method=RequestMethod.POST)
//	public List listproduct(		@RequestBody Search search ) throws Exception{
//	
//		System.out.println("/product/json/listProduct : POST");
//		//Business Logic
//		System.out.println("::"+search);
//		search.setPageSize(pageSize);
//		Map<String, Object> map =productService.getProductList(search);
//		List<Product> list=  (List<Product>) map.get("list");
//		System.out.println(list);
//		return list;
//	}
//	
//	
//	@RequestMapping( value="json/autocompleteProduct" , method=RequestMethod.GET)
//	public List autocompleteProduct() throws Exception{
//	
//		System.out.println("/product/json/autocompleteProduct : GET");
//		//Business Logic
//		List<String> list =productService.autocompleteProduct();
//		System.out.println(list);
//		return list;
//	}
}