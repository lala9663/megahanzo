package com.koreait.app.movie;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.app.movie.dao.MovieDAO;

public class ReviewRemoveAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MovieDAO mdao = new MovieDAO();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String movieid = req.getParameter("movieid");
		int reviewid = Integer.parseInt(req.getParameter("reviewid"));
		
		PrintWriter out = resp.getWriter();
		
		if(mdao.removeReview(reviewid)) {
			out.write("<script>alert('"+reviewid+"번 리뷰 삭제 성공!');");
		}
		else {
			out.write("<script>alert('"+reviewid+"번 리뷰 삭제 실패!');");
		}
		out.write("location.href='"+req.getContextPath()+"/movie/MovieView.mo?movieid="+movieid+"';");
		out.write("</script>");
		return null;
	}
}
