package clothes.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import org.apache.commons.codec.digest.DigestUtils;

public class Constants {

	public static final int FPP = 6; 
	public static final int RPP = 2; 
	public static final int APP = 3; 
	
	public static HashMap<Character, Character> mapChar;
	static {
		mapChar = new HashMap<>();
		initMap();
	}
	
	public static String md5(String data) {
		return DigestUtils.md5Hex(data);
	}
	
	public static String randomCode(int len) {
		Random r = new Random();
		String s = "";
		for(int i=0; i<len; i++) {
			s += Math.abs(r.nextInt()%10);
		}
		return s;
	}
	public static String getBanner(String images) {
		String firstImage = "";
		if (images == null || images.trim().length() == 0) {
			firstImage = "resources/resources/blog_3.jpg";
		} else {
			firstImage = images.split("\\s+")[0];
		}
		return firstImage;
	}
	public static String getImageAt(String images, int index) {
		if (images == null || images.trim().length() == 0)
			return "";
		String[] s = images.split("\\s+");
		if (index >= s.length)
			return "";
		return s[index];
	}
	public static int getMaxPage(int size, int RPP) {
		return size / RPP + (size % RPP != 0 ? 1 : 0);
	}
	
	public static String getCurrentTime() {
		DateFormat df = new SimpleDateFormat("yyyyMMdd_HHmmss");
		String currentTime = df.format(new Date());
		
		return currentTime;
	}

	public static int adminPanelIndex(String url) {
		String[] path = {"admin/product", "admin/mail", "admin/order","admin/account" };
		for (int i = 0; i < path.length; i++) {
			if (url.toLowerCase().contains(path[i].toLowerCase())) {
				return i;
			}
		}
		return -1;
	}
	
	public static String rewriteFileName(String name) {
		String res = "";
		char c;
		for (int i = 0; i < name.length(); i++) {
			c = name.charAt(i);
			if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c == '.') {
				res += c;
			} else if (mapChar.containsKey(c)) {
				res += mapChar.get(c);
			} else {
				res += '_';
			}
		}
		return res;
	}

	public static void initMap() {
		mapChar.put('??', 'a');
		mapChar.put('??', 'a');
		mapChar.put('??', 'a');
		mapChar.put('???', 'a');
		
		mapChar.put('??', 'a');
		mapChar.put('???', 'a');
		mapChar.put('???', 'a');
		mapChar.put('???', 'a');
		mapChar.put('???', 'a');
		mapChar.put('???', 'a');

		mapChar.put('??', 'a');
		mapChar.put('???', 'a');
		mapChar.put('???', 'a');
		mapChar.put('???', 'a');
		mapChar.put('???', 'a');
		mapChar.put('???', 'a');

		mapChar.put('??', 'd');

		mapChar.put('??', 'e');
		mapChar.put('??', 'e');
		mapChar.put('???', 'e');
		mapChar.put('???', 'e');
		mapChar.put('???', 'e');

		mapChar.put('??', 'e');
		mapChar.put('???', 'e');
		mapChar.put('???', 'e');
		mapChar.put('???', 'e');
		mapChar.put('???', 'e');
		mapChar.put('???', 'e');

		mapChar.put('??', 'i');
		mapChar.put('??', 'i');
		mapChar.put('???', 'i');
		mapChar.put('??', 'i');
		mapChar.put('???', 'i');

		mapChar.put('??', 'o');
		mapChar.put('??', 'o');
		mapChar.put('???', 'o');
		mapChar.put('??', 'o');
		mapChar.put('???', 'o');

		mapChar.put('??', 'o');
		mapChar.put('???', 'o');
		mapChar.put('???', 'o');
		mapChar.put('???', 'o');
		mapChar.put('???', 'o');
		mapChar.put('???', 'o');

		mapChar.put('??', 'o');
		mapChar.put('???', 'o');
		mapChar.put('???', 'o');
		mapChar.put('???', 'o');
		mapChar.put('???', 'o');
		mapChar.put('???', 'o');

		mapChar.put('??', 'u');
		mapChar.put('??', 'u');
		mapChar.put('???', 'u');
		mapChar.put('??', 'u');
		mapChar.put('???', 'u');

		mapChar.put('??', 'u');
		mapChar.put('???', 'u');
		mapChar.put('???', 'u');
		mapChar.put('???', 'u');
		mapChar.put('???', 'u');
		mapChar.put('???', 'u');
	}

}
