package ch15;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class PollMgr {
        
		private DBConnectionMgr pool;
        
        public PollMgr() {
			pool = DBConnectionMgr.getInstance();
		}
        
        //max num값
        public int getMaxNum(){
    		Connection con = null;
    		PreparedStatement pstmt = null;
    		String sql = null;
    		ResultSet rs = null;
    		int maxNum = 0;
    		try {
    			con = pool.getConnection();
    			sql = "select max(num) from tblPollList";
    			pstmt = con.prepareStatement(sql);
    			rs = pstmt.executeQuery();
    			if(rs.next())
    				maxNum = rs.getInt(1);//가장 큰 num값
    		} catch (Exception e) {
    			e.printStackTrace();
    		} finally {
    			pool.freeConnection(con, pstmt, rs);
    		}
    		return maxNum;
    	}
        
        //poll & item저장
        public boolean insertPoll(PollListBean plBean, PollItemBean piBean){
    		Connection con = null;
    		PreparedStatement pstmt = null;
    		String sql = null;
    		boolean flag = false;
    		try {
    			con = pool.getConnection();
    			sql = "insert tblPollList(question,sdate,edate,wdate,types)"
    					+"values(?,?,?,now(),?)";
    			pstmt = con.prepareStatement(sql);
    			pstmt.setString(1, plBean.getQuestion());
    			pstmt.setString(2, plBean.getSdate());
    			pstmt.setString(3, plBean.getEdate());
    			pstmt.setInt(4, plBean.getTypes());
    			int result = pstmt.executeUpdate();
    			if(result==1){
    				sql = "insert tblPollItem values(?,?,?,?)";
    				pstmt = con.prepareStatement(sql);
    				int listnum = getMaxNum();
    				String item[] = piBean.getItem();
    				int j = 0;
    				for (int i = 0; i < item.length; i++) {
    					if(item[i]==null||item[i].equals(""))
    						break;
    						pstmt.setInt(1, listnum);
    						pstmt.setInt(2, i);
    						pstmt.setString(3, item[i]);
    						pstmt.setInt(4, 0);
    						j = pstmt.executeUpdate();
    				}
    				if(j>0){
    					flag = true;
    				}
    			}
    		} catch (Exception e) {
    			e.printStackTrace();
    		} finally {
    			pool.freeConnection(con, pstmt);
    		}
    		return flag;
    	}
        
        //poll All List 
        public Vector<PollListBean> getAllList(){
        	Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			Vector<PollListBean> vlist = new Vector<PollListBean>();
			try {
				con = pool.getConnection();
				sql = "select * from tblPolllist";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					PollListBean plBean = new PollListBean();
					plBean.setNum(rs.getInt("num"));
					plBean.setQuestion(rs.getString("question"));
					plBean.setSdate(rs.getString("sdate"));
					plBean.setEdate(rs.getString("edate"));
					vlist.addElement(plBean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
        	
        }
        
        //poll get
        public PollListBean getList(int num){
        	Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			PollListBean plBean = new PollListBean();
			try {
			con = pool.getConnection();
			if(num==0){
				num = getMaxNum();
				}
			sql = "select * from tblPolllist where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs= pstmt.executeQuery();
			if(rs.next()){
				plBean.setQuestion(rs.getString("question"));
				plBean.setTypes(rs.getInt("types"));
				plBean.setActive(rs.getInt("active"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return plBean;
        	
        }
        
        //poll item get
        public Vector<String> getItem(int num){
        	Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			Vector<String> vlist = new Vector<String>();
			try {
				con = pool.getConnection();
				if(num==0)num = getMaxNum();
				sql = "select item from tblpollitem where listnum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				while(rs.next()){
					vlist.addElement(rs.getString(1));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
        }
        //poll update
       public boolean updatePoll(int num, String[] itemnum){
    	Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update tblPollItem set count=count+1 where listnum=? and itemnum=?";
			pstmt = con.prepareStatement(sql);
			if(num==0)num =getMaxNum();
			for (int i = 0; i < itemnum.length; i++) {
				if(itemnum[i]==null||itemnum[i].equals(""))	break;
				pstmt.setInt(1, num);
				pstmt.setInt(2, Integer.parseInt(itemnum[i]));
				int j = pstmt.executeUpdate();
				if(j==1) flag=true;
				}
			
				pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			pool.freeConnection(con, pstmt);
		}
		return flag;
       }
        
        //poll view
        public Vector<PollItemBean> getView(int num){
        	Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			Vector<PollItemBean> vlist = new Vector<PollItemBean>();
			try {
				con = pool.getConnection();
				sql = "select * from tblPollItem where listnum=?";
				pstmt = con.prepareStatement(sql);
				if(num==0)num=getMaxNum();
				pstmt.setInt(1,num);
				rs = pstmt.executeQuery();
				while(rs.next()){
				 PollItemBean piBean = new PollItemBean();
				 String item[]= new String[1];
				 item[0] = rs.getString("item");
				 piBean.setItem(item);
				 piBean.setCount(rs.getInt("count"));
				 vlist.addElement(piBean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
        	
        }
        
        //count sum
        public int sumCount(int num){
        	Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			int count =0;
			try {
				con = pool.getConnection();
				sql = "select sum(count) from tblPollItem where listnum=?";
				pstmt = con.prepareStatement(sql);
				if(num==0)num=getMaxNum();
				pstmt.setInt(1,num);
				rs = pstmt.executeQuery();
				rs.next();
				count = rs.getInt(1);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return count;
        }
        
}
