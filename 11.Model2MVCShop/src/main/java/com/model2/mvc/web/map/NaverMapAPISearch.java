package com.model2.mvc.web.map;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/map/*")
public class NaverMapAPISearch {

    @RequestMapping( value="json/getaddress/{keyword}", method=RequestMethod.GET)
	public static String getaddress( @PathVariable String keyword) throws Exception{
        
        	//웹검색
        	//String apiURL = "https://openapi.naver.com/v1/search/local.json?query="+keyword+"&display=1&start=1&sort=random";
        	
        	//이미지검색 URL
            String text = URLEncoder.encode(keyword, "UTF-8");
            String naverOpenAPIURL = "https://openapi.naver.com/v1/search/local.json?query="+keyword+"&display=1&start=1&sort=random";
        	
            // java API 를 이용 HttpRequest
            URL url = new URL(naverOpenAPIURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", "soo4tcb4g3WCyVBPME1D");
            con.setRequestProperty("X-Naver-Client-Secret", "zzcmGqkLka");
            
            
            // Response Code GET
            int responseCode = con.getResponseCode();
            
            BufferedReader br = null;
            
            if(responseCode==200) { 
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
            //JSON Data 읽기

            StringBuffer response = new StringBuffer();
            String jsonData ="";
            while ((jsonData = br.readLine()) != null) {
                response.append(jsonData);
            }
            
            br.close();
            JSONObject jsonObject = (JSONObject)JSONValue.parse(response.toString());

            
            // Console 확인
            System.out.println("넘어온거:"+response.toString());
			return jsonObject.get("items").toString();

    }
}