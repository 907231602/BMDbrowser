package com.bf.log.format;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.mapreduce.JobContext;
import org.apache.hadoop.mapreduce.OutputCommitter;
import org.apache.hadoop.mapreduce.OutputFormat;
import org.apache.hadoop.mapreduce.RecordWriter;
import org.apache.hadoop.mapreduce.TaskAttemptContext;
import org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import com.bf.log.connection.JdbcManager;
import com.bf.log.dimention.UserDimention;

public class LogUserFormat extends OutputFormat<UserDimention, LongWritable> {

	@Override
	public RecordWriter<UserDimention, LongWritable> getRecordWriter(TaskAttemptContext context)
			throws IOException, InterruptedException {
		Configuration conf = context.getConfiguration();

		Connection connection = JdbcManager.getConnection(conf);

		return new MyUserRecordWriter(conf, connection);
	}

	@Override
	public void checkOutputSpecs(JobContext context) throws IOException, InterruptedException {

	}

	@Override
	public OutputCommitter getOutputCommitter(TaskAttemptContext context) throws IOException, InterruptedException {
		return new FileOutputCommitter(FileOutputFormat.getOutputPath(context), context);
	}

	class MyUserRecordWriter extends RecordWriter<UserDimention, LongWritable> {
		private Configuration conf;
		private Connection con;

		public MyUserRecordWriter(Configuration conf, Connection con) {
			this.conf = conf;
			this.con = con;
		}

		HashMap<String, Integer> hashAdd = new HashMap<String, Integer>();
		LinkedHashMap<String, Integer> hashVisit = new LinkedHashMap<String, Integer>();
		private HashMap<String, PreparedStatement> psMaps = new HashMap<String, PreparedStatement>();
		LinkedHashMap<String, Integer> hashMemberAdd = new LinkedHashMap<String, Integer>();
		LinkedHashMap<String, Integer> hashMemberVisit = new LinkedHashMap<String, Integer>();
		HashMap<String,Integer> hashSessionNumber=new HashMap<String, Integer>();
		HashMap<String,Long> hashSessionLength=new HashMap<String,Long>();
		HashMap<String,Long> hashPV=new HashMap<String, Long>();

		@Override
		public void write(UserDimention key, LongWritable value) throws IOException, InterruptedException {
			if (key.getLogEN().equals("en=e_l")) {
				hashAdd.put(key.getLogDate()+"\t"+key.getLogB_IEV(), (int) value.get());
			} else if (key.getLogEN().equals("u_ud")) {
				int visitUserCount = (hashVisit.containsKey(key.getLogDate()+"\t"+key.getLogB_IEV())
						? hashVisit.get(key.getLogDate()+"\t"+key.getLogB_IEV()): 0);
				hashVisit.put(key.getLogDate()+"\t"+key.getLogB_IEV(), visitUserCount+1);
			} else if (key.getUserMemberDimention().getLogP_URL().equals("p_url")) {
				
				hashMemberAdd.put(key.getLogDate()+"\t"+key.getLogB_IEV(), (int) value.get());
			} else if (key.getUserMemberDimention().getLogP_URL().equals("p_UMID")) {
				
				int memberCount = (hashMemberVisit.get(key.getLogDate()+"\t"+key.getLogB_IEV()) == null ? 0
						: (int) hashMemberVisit.get(key.getLogDate()+"\t"+key.getLogB_IEV())) + 1;
				hashMemberVisit.put(key.getLogDate()+"\t"+key.getLogB_IEV(), memberCount);
			}else if(key.getSessionDimention().getSessionNumber().equals("sessionNumber")){
			
				int sessionCount = (hashSessionNumber.get(key.getLogDate()+"\t"+key.getLogB_IEV()) == null ? 0
						: (int) hashSessionNumber.get(key.getLogDate()+"\t"+key.getLogB_IEV())) + 1;
				hashSessionNumber.put(key.getLogDate()+"\t"+key.getLogB_IEV(), sessionCount);
			}
			else if(key.getSessionDimention().getSessionLength().equals("sessionLength")){
				long sessionLength = (hashSessionLength.get(key.getLogDate()+"\t"+key.getLogB_IEV()) == null ? 0
						:  hashSessionLength.get(key.getLogDate()+"\t"+key.getLogB_IEV())) + Long.parseLong(key.getSessionDimention().getSessionShort()) ;
				hashSessionLength.put(key.getLogDate()+"\t"+key.getLogB_IEV(), sessionLength);
			}
			else if(key.getLog_PV().equals("pv")){
				hashPV.put(key.getLogDate()+"\t"+key.getLogB_IEV(), value.get());
			}

		}

		@Override
		public void close(TaskAttemptContext context) throws IOException, InterruptedException {

			////////////////// 对新增用户的写入//////////////////////////////////////////////////////////
			PreparedStatement ps = psMaps.get("browser_add");
			if (ps == null) {
				try {
					ps = con.prepareStatement(conf.get("browser_add"));
					psMaps.put("browser_add", ps);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			for (String kk : hashAdd.keySet()) {
				try {
					String[] keys= kk.split("\t");
					ps.setString(1, keys[0]);
					ps.setString(2, keys[1]);
					ps.setString(3, Integer.toString(hashAdd.get(kk)));

					ps.setString(4, Integer.toString(hashAdd.get(kk)));
					ps.execute();

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			/**
			 * 通过日期和浏览器类别获得每日的不同浏览器用户值，在根据浏览器类型对不同天数的值进行累加
			 */
			///////////////////////////////// 对活跃浏览器用户及每天新增浏览器用户累加统计的写入///////////////////////////////////////
			ps = psMaps.get("browser_visit");
			if (ps == null) {
				try {
					ps = con.prepareStatement(conf.get("browser_visit"));
					psMaps.put("browser_visit", ps);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			HashMap<String,Integer> hashsum=new HashMap<String, Integer>();
			for (String hh : hashVisit.keySet()) {
				try {
					String[] keyValue=hh.split("\t");
					
					int sum=(hashsum.get(keyValue[1])==null?0:hashsum.get(keyValue[1]))+hashVisit.get(hh);
					hashsum.put(keyValue[1], sum);
					ps.setString(1, keyValue[0]);
					ps.setString(2, keyValue[1]);
					ps.setString(3, Integer.toString(hashVisit.get(hh)));
					ps.setString(4, Integer.toString(sum));

					ps.setString(5, Integer.toString(hashVisit.get(hh)));
					ps.setString(6, Integer.toString(sum));
					ps.execute();
					
				} catch (Exception e) {
					e.printStackTrace();
				}

			}

			//////////////////////////// 新增浏览器会员每日总和及每日新增累积和///////////////////////////////////////
			HashMap<String, Integer> hashMemberSum=new HashMap<String, Integer>();
			ps=getPSSQL("browserMember_add");
			for (String entry : hashMemberAdd.keySet()) {
				try {
					String[] keyValue=entry.split("\t");
					
					int sum=(hashMemberSum.get(keyValue[1])==null?0:hashMemberSum.get(keyValue[1]))+hashMemberAdd.get(entry);
					hashMemberSum.put(keyValue[1], sum);
					ps.setString(1, keyValue[0]);
					ps.setString(2, keyValue[1]);
					ps.setString(3, Integer.toString(hashMemberAdd.get(entry)));
					ps.setString(4, Integer.toString(sum));

					ps.setString(5, Integer.toString(hashMemberAdd.get(entry)));
					ps.setString(6, Integer.toString(sum));
					ps.execute();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
			}

			
			
			
			
			///////////////////////////活跃会员//////////////////////////////////////////
			ps=getPSSQL("browserMember_visit");
			for (String st : hashMemberVisit.keySet()) {
				try {
					String[] vv=st.split("\t");
					ps.setString(1, vv[0]);
					ps.setString(2, vv[1]);
					ps.setString(3, Integer.toString(hashMemberVisit.get(st)) );
					
					ps.setString(4, Integer.toString(hashMemberVisit.get(st)) );
					
					ps.execute();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			
			/////////////////////////////////浏览器会话个数/////////////////////////////////////
			ps=getPSSQL("browserSession_add");
			for (String keyy : hashSessionNumber.keySet()) {
				try {
					String[] val=keyy.split("\t");
					ps.setString(1, val[0]);
					ps.setString(2, val[1]);
					ps.setString(3, String.valueOf(hashSessionNumber.get(keyy)) );
					
					ps.setString(4, String.valueOf(hashSessionNumber.get(keyy)) );
					
					ps.execute();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			//////////////////////////////////////会话长度/////////////////////////////////
			ps=getPSSQL("browserSession_length");
			for (String ee : hashSessionLength.keySet()) {
				try {
					String[] ke=ee.split("\t");
					if(ke[1].equals("-")){//
						continue;
					}
					ps.setString(1, ke[0]);
					ps.setString(2, ke[1]);
					ps.setString(3, String.valueOf(hashSessionLength.get(ee)) );
					ps.setString(4, String.valueOf(hashSessionLength.get(ee)/hashSessionNumber.get(ee)));
					
					ps.setString(5, String.valueOf(hashSessionLength.get(ee)) );
					ps.setString(6, String.valueOf(hashSessionLength.get(ee)/hashSessionNumber.get(ee)));
					ps.execute();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			
			//////////////////////////////////////pv//////////////////////////////////
			ps=getPSSQL("browser_pv");
			for (String keyt : hashPV.keySet()) {
				try {
					String[] kl=keyt.split("\t");
					ps.setString(1, kl[0]);
					ps.setString(2, kl[1]);
					ps.setString(3, String.valueOf(hashPV.get(keyt)) );
					
					ps.setString(4, String.valueOf(hashPV.get(keyt)) );
					ps.execute();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			try {
				ps.close();
				con.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		////////////////////////获取sql对应的ps语句//////////////////////////////////////
		public PreparedStatement getPSSQL(String sqlName){
			PreparedStatement ps=psMaps.get(sqlName);
			if (ps == null) {
				try {
					ps = con.prepareStatement(conf.get(sqlName));
					psMaps.put(sqlName, ps);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return ps;
		}

	}
}
