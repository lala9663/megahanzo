package com.koreait.app.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.app.user.dao.UserDTO;
import com.koreait.app.ticketing.dao.SeatDTO;
import com.koreait.app.ticketing.dao.TicketingDAO;
import com.koreait.app.ticketing.dao.TicketingDTO;
import com.koreait.app.ticketing.dao.TimeDTO;

public class UserTicketingListAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		TicketingDAO tdao = new TicketingDAO();
		String temp = req.getParameter("page");
		String movietitle = req.getParameter("movietitle");
		
		int page = temp == null ? 1 : Integer.parseInt(temp);
		
		//한 페이지에서 보여줄 게시글의 개수
		int pageSize = 20;
		
		//전체 개시글의 개수
		int totalCnt = tdao.getTimeCnt(movietitle);
		
//							13	/10				11
		//아래쪽 페이징 처리 부분에 보여지는 첫번째 페이지 번호
		int startPage = ((page-1)/10)*10+1;
		//아래쪽 페이징 처리 부분에 보여지는 마지막 페이지 번호(연산으로 구해진것)
		int endPage = startPage+9;
		//전체 개수를 기반으로 한 가장 마지막 페이지 번호
		int totalPage = (totalCnt-1)/pageSize+1;
		
		//가장 마지막 페이지 번호보다 연산으로 구해진 endPage가 더 큰 경우도 있다.(허구의 페이지 번호가 존재한다)
		//그때는 endPage를 가장 마지막 페이지 번호로 바꿔준다.
		endPage = endPage>totalPage ? totalPage : endPage;
		
		int startRow = (page-1)*pageSize;
		HttpSession session = req.getSession();
		String userid = ((UserDTO)session.getAttribute("loginUser")).getUserid();
		List<TicketingDTO> ticketingList = tdao.getUserTicketingList(startRow, pageSize, userid);
		List<SeatDTO> seatList = tdao.getOccupiedList();
		List<TimeDTO> timeList = tdao.getTimeList();
		req.setAttribute("seatList", seatList);
		req.setAttribute("ticketingList", ticketingList);
		req.setAttribute("timeList", timeList);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("page", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		
		
		ActionTo acto = new ActionTo();
		acto.setRedirect(false);
		acto.setPath("/app/user/userticketinglist.jsp");
		return acto;
	}
}
