package autocreate;

import com.lanlan.util.DBUtil;
import com.lanlanauto.main.CreateFile;
import com.lanlanauto.mapper.Parse;

public class Create {
	
	public static void main(String[] args) {
		CreateFile createFile =new CreateFile(DBUtil.getConnection(), "tedu_store", "tedu_store", "%", new Parse());
		createFile.createMain();
	}
}
