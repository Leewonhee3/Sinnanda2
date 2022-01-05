package com.b2.sinnanda.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.b2.sinnanda.commons.DL;
import com.b2.sinnanda.service.IndexCategoryService;

@Controller
public class IndexController {
	//[이원희] 인덱스 페이지 검색 카테고리 주소, 숙소유형..옵션 리스트.
	@Autowired IndexCategoryService indexCategoryService;
	@Autowired DL dl;
	
	@GetMapping("index")
	public String index(Model model) {
		
		List<String> sidoList = indexCategoryService.getSidoList();
		
		model.addAttribute("sidoList",sidoList);
		
		dl.p("IndexController", "sidoList", sidoList);
		
		return "index";
	}
	
	@GetMapping("termsOfUse")
	public String getTermsOfUse() {
		return "termsOfUse";
	}
	
	@GetMapping("privacyPolicy")
	public String getPrivacyPolicy() {
		return "privacyPolicy";
	}
}
