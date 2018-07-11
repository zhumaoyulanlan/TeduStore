package cn.tedu.store.util;

import javax.servlet.http.HttpSession;

import cn.tedu.store.bean.User;

public class ControllerUtil {
	public static int getCurrentUserID(HttpSession session) {
		User user = (User)session.getAttribute("currentUser");
		if(user!=null) {
			return user.getId();
		}
		return -1;
	}
}
