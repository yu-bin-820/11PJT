package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
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
	
	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
//	@RequestMapping("/addPurchase.do")
//	public String addPurchase( @ModelAttribute("purchase") Purchase purchase, 
//							   @RequestParam("prodNo") int prodNo,
//							   @RequestParam("userId") String userId,
//							   Model model ) throws Exception {
	@RequestMapping(value="addPurchase", method=RequestMethod.POST)
	public String addPurchase( @ModelAttribute("purchase") Purchase purchase, 
							   @RequestParam("prodNo") int prodNo,
							   @RequestParam("userId") String userId,
							   Model model ) throws Exception {
		
		System.out.println("/purchase/addPurchase : POST");
		System.out.println(purchase);
		purchase.setPurchaseProd(productService.findProduct(prodNo));
		purchase.setBuyer(userService.getUser(userId));
		purchase.setDivyDate(purchase.getDivyDate().replaceAll("-", ""));
		purchase.setTranCode("1");
		System.out.println(purchase);
		//Business Logic
		purchaseService.addPurchase(purchase);
		// Model 과 View 연결
		model.addAttribute("purchase", purchase); 
		return "forward:/purchase/addPurchase.jsp";
	}
	
//	@RequestMapping("/addPurchaseView.do")
//	public String getPurchaseView(@RequestParam("prodNo") String prodNo, 
//								  Model model, 
//								  HttpSession session ) throws Exception{
	@RequestMapping(value="addPurchase", method=RequestMethod.GET)
	public String getPurchaseView(@RequestParam("prodNo") String prodNo, 
								  Model model, 
								  HttpSession session ) throws Exception{
		System.out.println("/purchase/addPurchase : GET");
		String userId=((User)session.getAttribute("user")).getUserId();
		//Business Logic
		Product product = productService.findProduct(Integer.parseInt(prodNo));
		User user = userService.getUser(userId);
		//Model 과 View 연결
		model.addAttribute("product", product);
		model.addAttribute("user", user);
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
//	@RequestMapping("/getPurchase.do")
//	public String getPurchase(@RequestParam("tranNo") int tranNo, 
//							  Model model) throws Exception{
	@RequestMapping(value="getPurchase", method=RequestMethod.GET)
	public String getPurchase(@RequestParam("tranNo") int tranNo, 
							  Model model) throws Exception{
		
		System.out.println("/purchase/getPurchase : GET");
		//Business Logic
		Purchase purchase = purchaseService.getPurchase(tranNo);
		//Model 과 View 연결
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/getPurchase.jsp";
	}
	
//	@RequestMapping("/listPurchase.do")
//	public String listPurchase( @ModelAttribute("search") Search search, 
//								Model model, 
//								HttpSession session) throws Exception{
	@RequestMapping(value="listPurchase")
	public String listPurchase( @ModelAttribute("search") Search search, 
								Model model, 
								HttpSession session) throws Exception{
		System.out.println("listPurchase");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		String userId=((User)session.getAttribute("user")).getUserId();
		//Business logic 수행
		Map<String, Object> map=purchaseService.getPurchaseList(search,userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		System.out.println(map);
		// Model 과 View 연결
		model.addAttribute("map", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		

		return "forward:/purchase/listPurchase.jsp";
	}
	
//	@RequestMapping("/updatePurchase.do")
//	public String updatePurchase( @ModelAttribute("purchase") Purchase purchase, 
//								  Model model ) throws Exception{
	@RequestMapping(value="updatePurchase", method = RequestMethod.POST)
	public String updatePurchase( @ModelAttribute("purchase") Purchase purchase, 
								  Model model ) throws Exception{
		
		System.out.println("/purchase/updatePurchase : POST");
		purchase.setDivyDate(purchase.getDivyDate().replaceAll("-", ""));
		
		purchaseService.updatePurchase(purchase);
		
		model.addAttribute("purchase",purchase);
		
		return "redirect:/purchase/getPurchase?tranNo="+purchase.getTranNo();
	}
	
	
//	@RequestMapping("/updatePurchaseView.do")
//	public String updatePurchaseView( @RequestParam("tranNo") int tranNo, 
//									  Model model) throws Exception{
	@RequestMapping(value="updatePurchase", method = RequestMethod.GET)
	public String updatePurchaseView( @RequestParam("tranNo") int tranNo, 
									  Model model) throws Exception{
		System.out.println("/purchase/updatePurchase : GET");
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		
		if (purchase.getDivyDate() != null && purchase.getDivyDate() != "") {
			purchase.setDivyDate(purchase.getDivyDate().substring(0,10));
		}

		//Model 과 View 연결
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/updatePurchase.jsp";
	}
	
	
//	@RequestMapping("/updateTranCodeByProd.do")
//	public String updateTranCodeByProd( @RequestParam("prodNo") int prodNo, 
//										@RequestParam("tranCode") String tranCode, 
//										Model model , 
//										HttpSession session) throws Exception{
	@RequestMapping(value="updateTranCodeByProd", method = RequestMethod.GET)
	public String updateTranCodeByProd( @RequestParam("prodNo") int prodNo, 
										@RequestParam("tranCode") String tranCode, 
										Model model , 
										HttpSession session) throws Exception{
		System.out.println("purchase/updateTranCodeByProd:GET");
		
		Purchase purchase = new Purchase();
		purchase.setTranCode(tranCode);
		purchase.setPurchaseProd(productService.findProduct(prodNo));
		
		purchaseService.updateTranCodeByProd(purchase);
		
		model.addAttribute("purchase",purchase);
		
		return "redirect:/product/listProduct?menu=manage";
	}
	
//	@RequestMapping("/updateTranCode.do")
//	public String updateTranCode( @RequestParam("tranNo") String tranNo, 
//								  @RequestParam("tranCode") String tranCode, 
//								  Model model , 
//								  HttpSession session) throws Exception{
	@RequestMapping(value="updateTranCode", method = RequestMethod.GET)
	public String updateTranCode( @RequestParam("tranNo") String tranNo, 
								  @RequestParam("tranCode") String tranCode, 
								  Model model , 
								  HttpSession session) throws Exception{
		
		System.out.println("/purchas/updateTranCode : POST");
		
		Purchase purchase = new Purchase();
		purchase.setTranNo(Integer.parseInt(tranNo));
		
		purchase.setTranCode(tranCode);

		purchaseService.updateTranCode(purchase);
		
		model.addAttribute("purchase",purchase);
		
		return "redirect:/purchase/listPurchase";
	}
	

}
