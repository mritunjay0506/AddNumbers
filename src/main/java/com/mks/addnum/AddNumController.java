package com.mks.addnum;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AddNumController {
	@RequestMapping ("getAddedValue/{num1}/{num2}")
	public int getAddedValue() {
		
		
		return 5;
		
	}
}
