package weview.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import weview.dto.MemberDto;
import weview.service.MemberService;
import weview.utills.UploadFileUtils;

@Controller
public class MemberController {

	private static Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService service;

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		logger.info("MemberController login() " + new Date());
		return "login";

	}

	// 회원가입 페이지 이동
	@RequestMapping(value = "regi.do", method = RequestMethod.GET)
	public String regi() {
		logger.info("MemberController regi() " + new Date());
		return "regi";
	}
	
	@Resource(name="uploadPath")
    String uploadPath;

	// 회원가입
	@RequestMapping(value = "regiAf.do", method = RequestMethod.POST)
	public String regiAf(MemberDto dto, MultipartFile file) throws Exception {
		logger.info("MemberController regiAf() " + new Date());

		String imgUploadPath = uploadPath;
//		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());
		} else {
			fileName = uploadPath + File.separator + "none.png";
		}

		dto.setProfile(fileName);
		dto.setProfile2("s_" + fileName);

		service.addmember(dto);
		return "redirect:/login.do";
	}

	@ResponseBody
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	public String idcheck(String id) {
		logger.info("MemberController idcheck() " + new Date());

		int count = service.getId(id);

		if (count > 0) { // 아이디가 있음
			return "NO";
		} else { // 아이디가 없음
			return "YES";
		}
	}

	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String loginAf(MemberDto dto, HttpServletRequest req) {
		logger.info("MemberController loginAf() " + new Date());

		MemberDto mem = service.login(dto);

		if (mem != null) {
			req.getSession().setAttribute("login", mem);
			
			return "redirect:/mainpage.do";
		} else {

			return "redirect:/login.do";
		}
	}
	
	@RequestMapping(value = "logout.do")
	public String logout(HttpServletRequest request)
	{
		request.getSession().setAttribute("login", null);
		
		String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
	}
	
	@RequestMapping(value = "logoutToMain.do")
	public String logoutToMain(HttpServletRequest request)
	{
		request.getSession().setAttribute("login", null);

	    return "redirect:/mainpage.do";
	}

	@RequestMapping(value = "change.do", method = RequestMethod.POST)
	public String change() {

		return "change";
	}

	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String update(MemberDto mem) {
		logger.info("update");
		service.update(mem);
		return "redirect:/login.do";
	}
	
	@RequestMapping(value = "profile.do", method = RequestMethod.GET)
	public String bbslist() {
		
		return "profile";
	}
}





