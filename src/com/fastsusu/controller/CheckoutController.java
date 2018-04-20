package com.fastsusu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fastsusu.model.ChargeRequest;
import com.fastsusu.model.Group;

@Controller
public class CheckoutController {

	@Value("${STRIPE_PUBLIC_KEY}")
	private String stripePublicKey;
	
	@RequestMapping("/enroll")
	public String enroll(@ModelAttribute("group") Group group, Model model, BindingResult theResult, HttpServletRequest request) {
		ChargeRequest chargeRequest = new ChargeRequest();
		chargeRequest.setCurrency("USD");
		chargeRequest.setAmount(group.getPayoutAmount());
		model.addAttribute("chargeRequest", chargeRequest);
		model.addAttribute("stripePublicKey",stripePublicKey);
		return "enroll";
	}
}
