package com.example.controller;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import org.iq80.leveldb.*;
import org.iq80.leveldb.impl.Iq80DBFactory;
import static org.iq80.leveldb.impl.Iq80DBFactory.*;
import java.io.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.charset.Charset;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import com.example.entity.User;


public class LoginController extends AbstractController {
  //成功与失败字段
  private String successView;
  private String failView;
  public String getSuccessView() {
    return successView;
  }

  public void setSuccessView(String successView) {
    this.successView = successView;
  }
	public String getFailView() {
		return failView;
	}

	public void setFailView(String failView) {
		this.failView = failView;
	}
   
	

	@Override
  protected ModelAndView handleRequestInternal(HttpServletRequest request,
      HttpServletResponse response) throws Exception {
		
    String username = request.getParameter("username");
	SimpleDateFormat df = new SimpleDateFormat(" HH:mm:ss yyyy-MM-dd");
	String time=df.format(new Date());
	int count=0;
	
    User user=new User(username,time);
	    //保存相应的参数，通过ModelAndView返回
	Map<String ,String> map=new HashMap<String,String>();
		
	
	boolean cleanup = false;
    Charset charset = Charset.forName("utf-8");
    String path = "E:/data/leveldb";

    //init
    DBFactory factory = Iq80DBFactory.factory;
    File dir = new File(path);
    //如果数据不需要reload，则每次重启，尝试清理磁盘中path下的旧数据。
    if(cleanup) {
        factory.destroy(dir,null);//清除文件夹内的所有文件。
    }
    Options options = new Options().createIfMissing(true);
    //重新open新的db
    DB db = factory.open(dir,options);

    //write

    Map<String ,Object> model=new HashMap<String,Object>();
    if(username !=null){
    	db.put(username.getBytes(charset),time.getBytes(charset));
    	map.put(username, time);

    }
    
    else{
		map.put("error", "输入错误,请重新输入");
		return new ModelAndView(getFailView(),map);

    }

   // public User getUser(String username,String time)
	//{
		//if(username.equals("lilingxia"))
		//{
		//	return new User(username,time);
		//}
		//else
		///(username.equals("liuchong"))
		//	{
		//		return new User(username,time);
		//	}
		//	else 
			//	if(username.equals("guoli"))
			//	{
			//		return new User(username,time);
			//	}
			//	else 
			//		if(username.equals("lijunjun"))
				//	{
				//		return new User(username,time);
					//}
					//else 
		//{
		//	return null;
	//	}
	//}
    //读取当前snapshot，快照，读取期间数据的变更，不会反应出来
    Snapshot snapshot = db.getSnapshot();
    //读选项
    ReadOptions readOptions = new ReadOptions();
    readOptions.fillCache(false);//遍历中swap出来的数据，不应该保存在memtable中。
    readOptions.snapshot(snapshot);//默认snapshot为当前。
    DBIterator iterator = db.iterator(readOptions);
    
   //
    while (iterator.hasNext()) {
        Map.Entry<byte[],byte[]> item = iterator.next();
        String key = new String(item.getKey(),charset);
        String value = new String(item.getValue(),charset);//null,check.
        System.out.println(key + ":" + value);
        map.put(key, value);
        count++;
    }
    iterator.close();
 
    //
    db.close();

    
	ModelAndView mav=new ModelAndView();
	mav.addObject("map",map);
	mav.addObject("user",user);
	mav.addObject("count",count);
	mav.setViewName("showUser");

    return mav;
	
		//return new ModelAndView(getSuccessView(),model);
  
	}
		
  }	

