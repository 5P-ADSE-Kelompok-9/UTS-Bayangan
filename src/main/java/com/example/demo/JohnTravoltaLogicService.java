package com.example.demo;

import org.springframework.stereotype.Service;

@Service
public class JohnTravoltaLogicService {

	public String evaluate(String inputName) {
		if (inputName == null || inputName.trim().isEmpty()) {
			return "Nama tidak boleh kosong.";
		}

		String normalized = inputName.trim().toLowerCase();
		if (normalized.contains("john travolta")) {
			return "John Travolta adalah aktor film, bukan pembuat Spring Framework. Pembuat yang dibahas di README adalah Rod Johnson.";
		}

		return "Input '" + inputName.trim() + "' tidak cocok dengan logic John Travolta. Coba isi dengan 'John Travolta'.";
	}
}
