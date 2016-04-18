package com.wolfogre.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.wolfogre.domain.Manager;
import com.wolfogre.domain.Student;
import com.wolfogre.domain.Teacher;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

/**
 * Created by Jason Song(wolfogre.com) on 2016/4/18.
 */
public class CheckLoginAction implements Action {
	private String id;
	private String password;
	private String loginType;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	//狗日的对参数大小写敏感，参数必须是loginType，logintype不行
	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	@Override
	public String execute() throws Exception {
		ActionContext actionContext = ActionContext.getContext();
		if(getId() == null)
		{
			actionContext.put("error", "学号/工号不能为空！");
			return ERROR;
		}
		if(getPassword() == null)
		{
			actionContext.put("error", "密码不能为空！");
			return ERROR;
		}
		if(getLoginType() == null)
		{
			actionContext.put("error", "登录类型不能为空！");
			return ERROR;
		}

		if(!getLoginType().equals("student") && !getLoginType().equals("teacher") && !getLoginType().equals("manager"))
		{
			actionContext.put("error", "登录类型不合法！");
			return ERROR;
		}

		Configuration configuration = new Configuration().configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();

		if(getLoginType().equals("student")){
			Student student = (Student)session.get(Student.class,getId());
			if(student == null || !student.getS_pwd().equals(getPassword())) {
				actionContext.put("error", "学号或密码错误");
				return ERROR;
			}
		}

		if(getLoginType().equals("teacher")){
			Teacher teacher = (Teacher)session.get(Teacher.class,getId());
			if(teacher == null || !teacher.getT_pwd().equals(getPassword())) {
				actionContext.put("error", "工号或密码错误");
				return ERROR;
			}
		}

		if(getLoginType().equals("manager")){
			Manager manager = (Manager)session.get(Manager.class,getId());
			if(manager == null || !manager.getM_pwd().equals(getPassword())) {
				actionContext.put("error", "工号或密码错误");
				return ERROR;
			}
		}

		actionContext.getSession().put("id", getId());
		actionContext.getSession().put("loginType", getLoginType());
		return SUCCESS;
	}
}