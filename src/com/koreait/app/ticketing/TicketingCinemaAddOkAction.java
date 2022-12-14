package com.koreait.app.ticketing;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionTo;
import com.koreait.app.ticketing.dao.TicketingDAO;

public class TicketingCinemaAddOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		TicketingDAO tdao = new TicketingDAO();
		ActionTo acto = new ActionTo();
		acto.setRedirect(false);
		int totalcinema = Integer.parseInt(req.getParameter("totalcinema"));
		if(tdao.insertCinema(totalcinema)) {
			acto.setPath(req.getContextPath()+"/ticketing/TicketingCinema.ti?a=t");
		}
		else {
			acto.setPath(req.getContextPath()+"/ticketing/TicketingCinema.ti?a=f");			
		}
		return acto;
	}
}
