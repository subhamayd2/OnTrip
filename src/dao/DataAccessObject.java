package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import bean.Client;
import bean.bookBean;
import bean.busBean;
import bean.flightBean;
import bean.trainBean;
import oracle.jdbc.pool.OracleDataSource;

public class DataAccessObject {
	public static OracleDataSource ods;
	static{
		try {
			ods = new OracleDataSource();
			ods.setURL("jdbc:oracle:thin:subhamay/subh15@localhost:1521:XE");
			Connection con = ods.getConnection();
			System.out.println(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Client readClientCookie(String u_id) {
		Client c2 = new Client();
		try {
			Connection con = ods.getConnection();
			String sql = "select * from u_login where u_id= ? and uactive=1";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				c2.setU_id(rs.getString("u_id"));
				c2.setUname(rs.getString("uname"));
				c2.setUaddress(rs.getString("uaddress"));
				c2.setUphone(rs.getString("uphone"));
				c2.setUimage(rs.getString("uimage"));				
			}
			return c2;
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public Client readClient(Client c) {
		Client c2 = new Client();
		try {
			Connection con = ods.getConnection();
			String sql = "select * from u_login where u_id= ? AND upass= ? and uactive=1";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, c.getU_id());
			ps.setString(2, c.getUpass());
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				c2.setU_id(rs.getString("u_id"));
				c2.setUname(rs.getString("uname"));
				c2.setUaddress(rs.getString("uaddress"));
				c2.setUphone(rs.getString("uphone"));
				c2.setUimage(rs.getString("uimage"));				
			}
			return c2;
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public boolean checkUid(Client c) {
		try {
			Connection con = ods.getConnection();
			String sql = "select u_id from u_login where u_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, c.getU_id());
			int r = ps.executeUpdate();
			if(r>0)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean insertClient(Client c) {
		try {
			Connection con = ods.getConnection();
			String sql = "insert into u_login values(?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, c.getU_id());
			ps.setString(2, c.getUpass());
			ps.setString(3, c.getUname());
			ps.setString(4, c.getUaddress());
			ps.setString(5, c.getUphone());
			ps.setString(6, c.getUimage());
			ps.setString(7, c.getUactive());
			ps.setString(8, c.getUhash());
			int r = ps.executeUpdate();
			if(r > 0)
			{
				con.commit();
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean verifyClient(Client c) {
		try {
			Connection con = ods.getConnection();
			String Chksql = "select u_id from u_login where u_id=? and uhash=? and uactive='0'";
			PreparedStatement Chkps = con.prepareStatement(Chksql);
			Chkps.setString(1, c.getU_id());
			Chkps.setString(2, c.getUhash());
			int r = Chkps.executeUpdate();
			if(r > 0)
			{
				String updateSql = "update u_login set uactive='1' where u_id= ? and uhash=?";
				PreparedStatement updateps = con.prepareStatement(updateSql);
				updateps.setString(1, c.getU_id());
				updateps.setString(2, c.getUhash());
				r = updateps.executeUpdate();
				if(r > 0)
					return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public ArrayList<busBean> getBusDetails(busBean bb) {
		ArrayList<busBean> messageData = new ArrayList<busBean>();
		try {
			Connection con = ods.getConnection();
			String sql = "select * from bus_info where bus_from = ? and bus_to = ? and bus_depart LIKE ? and bus_arrive LIKE ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bb.getBus_from());
			ps.setString(2, bb.getBus_to());
			ps.setString(3, bb.getBus_depart());
			ps.setString(4, bb.getBus_arrive());
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				busBean bbObject = new busBean();
				bbObject.setBus_no(rs.getString("bus_no"));
				bbObject.setBus_license(rs.getString("bus_license"));
				bbObject.setBus_from(rs.getString("bus_from"));
				bbObject.setBus_to(rs.getString("bus_to"));
				bbObject.setSeat_avail(rs.getString("seat_avail"));
				bbObject.setBus_type(rs.getString("bus_type"));
				bbObject.setBus_price(rs.getString("bus_price"));
				bbObject.setBus_depart(rs.getString("bus_depart"));
				bbObject.setBus_arrive(rs.getString("bus_arrive"));
				bbObject.setBus_days(rs.getString("bus_days"));
				messageData.add(bbObject);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return messageData;
	}
	public ArrayList<trainBean> getTrainDetails(trainBean tb) {
		ArrayList<trainBean> messageData = new ArrayList<trainBean>();
		try {
			Connection con = ods.getConnection();
			String sql = "select * from train_info where train_from = ? and train_to = ? and train_depart LIKE ? and train_arrive LIKE ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, tb.getTrain_from());
			ps.setString(2, tb.getTrain_to());
			ps.setString(3, tb.getTrain_depart());
			ps.setString(4, tb.getTrain_arrive());
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				trainBean tbObject = new trainBean();
				tbObject.setTrain_name(rs.getString("train_name"));
				tbObject.setTrain_depart(rs.getString("train_depart"));
				tbObject.setTrain_arrive(rs.getString("train_arrive"));
				tbObject.setTrain_fare(rs.getString("train_fare"));
				tbObject.setTrain_avail(rs.getString("train_avail"));
				tbObject.setTrain_class(rs.getString("train_class"));
				tbObject.setTrain_from(rs.getString("train_from"));
				tbObject.setTrain_to(rs.getString("train_to"));
				tbObject.setTrain_days(rs.getString("train_days"));
				tbObject.setTrain_no(rs.getString("train_no"));
				messageData.add(tbObject);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return messageData;
	}
	public ArrayList<flightBean> getFlightDetails(flightBean fb) {
		ArrayList<flightBean> messageData = new ArrayList<flightBean>();
		try {
			Connection con = ods.getConnection();
			String sql = "select * from flight_info where flight_from = ? and flight_to = ? and flight_depart LIKE ? and flight_arrive LIKE ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, fb.getFlight_from());
			ps.setString(2, fb.getFlight_to());
			ps.setString(3, fb.getFlight_depart());
			ps.setString(4, fb.getFlight_arrive());
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				flightBean fbObject = new flightBean();
				fbObject.setFlight_airline(rs.getString("flight_airline"));
				fbObject.setFlight_no(rs.getString("flight_no"));
				fbObject.setFlight_depart(rs.getString("flight_depart"));
				fbObject.setFlight_arrive(rs.getString("flight_arrive"));
				fbObject.setFlight_price(rs.getString("flight_price"));
				fbObject.setFlight_from(rs.getString("flight_from"));
				fbObject.setFlight_to(rs.getString("flight_to"));
				fbObject.setFlight_avail(rs.getString("flight_avail"));
				fbObject.setFlight_days(rs.getString("flight_days"));
				fbObject.setFlight_type(rs.getString("flight_type"));
				messageData.add(fbObject);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return messageData;
	}
	public boolean chkRecoveryUid(Client c) {
		try {
			Connection con = ods.getConnection();
			String sql = "select u_id from u_login where u_id = ? and uname = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, c.getU_id());
			ps.setString(2, c.getUname());
			int r = ps.executeUpdate();
			if(r > 0)
			{
				return true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean insertBook(bookBean b) {
		try {
			Connection con = ods.getConnection();
			String sql = "insert into u_booking values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getU_id());
			ps.setString(2, b.getT_type());
			ps.setString(3, b.getT_number());
			ps.setString(4, b.getT_book_on());
			ps.setString(5, b.getT_passenger());
			ps.setString(6, b.getT_class());
			ps.setString(7, b.getT_amount());
			ps.setString(8, b.getT_status());
			ps.setString(9, b.getT_time());
			ps.setString(10, b.getT_book_for());
			ps.setString(11, b.getT_from());
			ps.setString(12, b.getT_to());
			int r = ps.executeUpdate();
			if(r > 0)
				con.commit();
				return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean insertFeedback(String u_id, String u_query) {
		String u_time = new Date().toString();
		try {
			Connection con = ods.getConnection();
			String sql = "insert into u_feedback values(?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u_id);
			ps.setString(2, u_query);
			ps.setString(3, u_time);
			int r = ps.executeUpdate();
			if(r > 0)
			{
				con.commit();
				return true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public Client updateClient(Client c) {
		Client c2 = new Client();
		try {
			Connection con = ods.getConnection();
			String sql = "update u_login set uname = ?, uaddress = ?, uphone = ?, uimage= ? WHERE u_id = ?";
			String sql2 = "select * from u_login where u_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps.setString(1, c.getUname());
			ps.setString(2, c.getUaddress());
			ps.setString(3, c.getUphone());
			ps.setString(4, c.getUimage());
			ps.setString(5, c.getU_id());
			int r = ps.executeUpdate();
			if(r > 0)
			{
				con.commit();
				ps2.setString(1, c.getU_id());
				ResultSet rs = ps2.executeQuery();
				while(rs.next())
				{
					c2.setU_id(rs.getString("u_id"));
					c2.setUname(rs.getString("uname"));
					c2.setUaddress(rs.getString("uaddress"));
					c2.setUphone(rs.getString("uphone"));
					c2.setUimage(rs.getString("uimage"));
				}
				return c2;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<bookBean> getManage(String u_id) {
		ArrayList<bookBean> messageData = new ArrayList<bookBean>();
		try {
			Connection con = ods.getConnection();
			String sql = "select * from u_booking where u_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				bookBean bb = new bookBean();
				bb.setU_id(u_id);
				bb.setT_type(rs.getString("t_type"));
				bb.setT_number(rs.getString("t_number"));
				bb.setT_book_on(rs.getString("t_book_on"));
				bb.setT_passenger(rs.getString("t_passenger"));
				bb.setT_class(rs.getString("t_class"));
				bb.setT_amount(rs.getString("t_amount"));
				bb.setT_status(rs.getString("T_status"));
				bb.setT_time(rs.getString("t_time"));
				bb.setT_book_for(rs.getString("t_book_for"));
				bb.setT_from(rs.getString("t_from"));
				bb.setT_to(rs.getString("t_to"));
				messageData.add(bb);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return messageData;
	}
	public ArrayList<bookBean> getManageDetails(String u_id, String t_type, String t_time, String t_book_for) {
		ArrayList<bookBean> messageData = new ArrayList<bookBean>();
		try {
			Connection con = ods.getConnection();
			String sql = "select * from u_booking where u_id = ? and t_type = ? and t_time = ? and t_book_for = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u_id);
			ps.setString(2, t_type);
			ps.setString(3, t_time);
			ps.setString(4, t_book_for);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				bookBean bb = new bookBean();
				bb.setU_id(u_id);
				bb.setT_type(rs.getString("t_type"));
				bb.setT_number(rs.getString("t_number"));
				bb.setT_book_on(rs.getString("t_book_on"));
				bb.setT_passenger(rs.getString("t_passenger"));
				bb.setT_class(rs.getString("t_class"));
				bb.setT_amount(rs.getString("t_amount"));
				bb.setT_status(rs.getString("T_status"));
				bb.setT_time(rs.getString("t_time"));
				bb.setT_book_for(rs.getString("t_book_for"));
				bb.setT_from(rs.getString("t_from"));
				bb.setT_to(rs.getString("t_to"));
				messageData.add(bb);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return messageData;
	}
	public boolean cancelBooking(String u_id, String t_type, String t_time, String t_book_for) {
		try {
			Connection con = ods.getConnection();
			String sql = "update u_booking set t_status = 'CANCELLED' WHERE u_id = ? and t_type = ? and t_time = ? and t_book_for = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u_id);
			ps.setString(2, t_type);
			ps.setString(3, t_time);
			ps.setString(4, t_book_for);
			int r = ps.executeUpdate();
			System.out.println(r);
			if(r > 0)
			{
				con.commit();
				return true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
























