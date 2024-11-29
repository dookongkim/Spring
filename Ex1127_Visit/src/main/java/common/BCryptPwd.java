package common;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPwd {
	
	//암호화
	public String encryption( String pwd ) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodePwd = encoder.encode(pwd);
		
		return encodePwd;
	}
	
	//복호화
	public boolean decryption( String encodePwd , String pwd ) {
		boolean isValid = false;
		
		isValid=BCrypt.checkpw(pwd,encodePwd);
		
		return isValid;
	}
	
}
