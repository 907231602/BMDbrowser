package com.bf.log.mapper;

import java.io.IOException;
import java.util.Comparator;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

import com.bf.log.constants.ToDate;
import com.bf.log.dimention.SessionDimention;
import com.bf.log.dimention.UserDimention;
import com.bf.log.dimention.UserMemberDimention;
import com.bf.log.utils.UserAgentUtils;

public class LogUserAnalyzeMapper extends Mapper<LongWritable, Text, UserDimention, LongWritable> {

	private int count = 0;

	@Override
	protected void map(LongWritable key, Text value,
			Mapper<LongWritable, Text, UserDimention, LongWritable>.Context context)
			throws IOException, InterruptedException {
		
		String[] values = value.toString().split("\t");

		String logDate = ToDate.toHouse(values[1]);
		String logUrl = values[3];
		String[] logValue = logUrl.split("&");
		
		UserMemberDimention userMemberDimention = new UserMemberDimention();
		userMemberDimention.setLogP_URL("-");
		userMemberDimention.setLogU_MID("-");
		
		SessionDimention sessionDimention=new SessionDimention();
		sessionDimention.setSessionUSD("-");
		sessionDimention.setSessionNumber("-");
		sessionDimention.setSessionLength("-");
		sessionDimention.setSessionMax("-");
		sessionDimention.setSessionMin("-");
		sessionDimention.setSessionShort("-");
		

		/////////////////////////// 新增浏览器用户////////////////////////

		if (logUrl.contains("en=e_l")) {
			UserDimention userDimention = new UserDimention();
			userDimention.setLogDate(logDate);
			userDimention.setLogEN("en=e_l");//用于判别注册用户
			userDimention.setLogUUD("-");
			userDimention.setLog_PV("-");
			for (String string : logValue) {
				if(string.startsWith("b_iev")){
					String[] bievValue=string.split("=");
					userDimention.setLogB_IEV(UserAgentUtils.getUserAgentInfo(bievValue[1]).getUaFamily());
					break;
				}
				
			}
			userDimention.setUserMemberDimention(userMemberDimention);
			userDimention.setSessionDimention(sessionDimention);
			context.write(userDimention, new LongWritable(1));
		}

		/////////////////////////// 活跃浏览器用户///////////////////////
		
		for (String string : logValue) {
			if (string.contains("u_ud")) {
				String[] logUUD = string.split("=");
				UserDimention userDimention = new UserDimention();
				userDimention.setLogDate(logDate);
				userDimention.setLogEN("u_ud");
				userDimention.setLogUUD(logUUD[1]);
				userDimention.setLog_PV("-");
				for (String strings : logValue) {
					if(strings.startsWith("b_iev")){
						String[] bievValue=strings.split("=");
						userDimention.setLogB_IEV(UserAgentUtils.getUserAgentInfo(bievValue[1]).getUaFamily());
						break;
					}
					
				}
				
				userDimention.setUserMemberDimention(userMemberDimention);
				userDimention.setSessionDimention(sessionDimention);
				context.write(userDimention, new LongWritable(1));
				break;
			}
		}

		////////////////////// 新增会员-1/////////////////////////////
		/*if (logUrl.contains("demo4.jsp")) {
			for (String string : logValue) {
				if (string.contains("u_mid")) {
					String[] logUMID = string.split("=");
					UserDimention userDimention = new UserDimention();
					userDimention.setLogDate(logDate);
					userDimention.setLogEN("-");
					userDimention.setLogUUD("-");
					userMemberDimention.setLogP_URL("p_url");// 用于判别新增会员的类型
					userMemberDimention.setLogU_MID(logUMID[1]);
					userDimention.setUserMemberDimention(userMemberDimention);
					context.write(userDimention, new LongWritable(1));
					break;
				}
			}
		}*/
			//////////////////////新增浏览器会员-2/////////////////////////////
		for (String strings : logValue) {
			if(strings.contains("demo4.jsp") && strings.contains("p_url")){
				for (String string : logValue) {
					if (string.contains("u_mid")) {
						String[] logUMID = string.split("=");
						UserDimention userDimention = new UserDimention();
						userDimention.setLogDate(logDate);
						userDimention.setLogEN("-");
						userDimention.setLogUUD("-");
						userDimention.setLog_PV("-");
						//获取浏览器的类型
						for (String str : logValue) {
							if(str.startsWith("b_iev")){
								String[] bievValue=str.split("=");
								userDimention.setLogB_IEV(UserAgentUtils.getUserAgentInfo(bievValue[1]).getUaFamily());
							break;
							}
							
						}
						userMemberDimention.setLogP_URL("p_url");// 用于判别新增会员的类型
						userMemberDimention.setLogU_MID(logUMID[1]);
						//userMemberDimention.setLogU_MID("-");
						userDimention.setUserMemberDimention(userMemberDimention);
						userDimention.setSessionDimention(sessionDimention);
						context.write(userDimention, new LongWritable(1));
						
					}
					
				}
				
			}
		}
		
		

		///////////////////// 活跃浏览器会员///////////////////////////////////

		if (logUrl.contains("u_mid")) {
			UserDimention userDimention = new UserDimention();
			userDimention.setLogDate(logDate);
			userDimention.setLogEN("-");
			userDimention.setLogUUD("-");
			userDimention.setLogB_IEV("-");
			userDimention.setLog_PV("-");
			userMemberDimention.setLogP_URL("p_UMID");// 用于判别活跃会员的类型
			for (String string : logValue) {
				if (string.contains("u_mid"))
					userMemberDimention.setLogU_MID(string);
				 if(string.contains("b_iev")){
					String[] bievValue=string.split("=");
					userDimention.setLogB_IEV(UserAgentUtils.getUserAgentInfo(bievValue[1]).getUaFamily());
				}
			}
			
			userDimention.setUserMemberDimention(userMemberDimention);
			userDimention.setSessionDimention(sessionDimention);
			context.write(userDimention, new LongWritable(1));
		}
		
		
		
		/////////////////////////////浏览器会话个数分析/////////////////////////////////////////////
		for(String val:logValue){
			if(val.contains("u_sd")){
				UserDimention userDimention=new UserDimention();
				userDimention.setLogDate(logDate);
				userDimention.setLogEN("-");
				userDimention.setLogUUD("-");
				userDimention.setLogB_IEV("-");
				userDimention.setLog_PV("-");
				for (String string : logValue) {
					 if(string.contains("b_iev")){
							String[] bievValue=string.split("=");
							userDimention.setLogB_IEV(UserAgentUtils.getUserAgentInfo(bievValue[1]).getUaFamily());
							break;
						}
				}
				
				userMemberDimention.setLogP_URL("-");
				userMemberDimention.setLogU_MID("-");
				userDimention.setUserMemberDimention(userMemberDimention);
				sessionDimention.setSessionNumber("sessionNumber");
				sessionDimention.setSessionUSD(val);
				userDimention.setSessionDimention(sessionDimention);
				context.write(userDimention, new LongWritable(1));
			}
		}
		
		////////////////////////浏览器会话长度////////////////////////////////////////////////////////
		for(String val:logValue){
			if(val.contains("u_sd")){
				UserDimention userDimention=new UserDimention();
				userDimention.setLogDate(logDate);
				userDimention.setLogEN("-");
				userDimention.setLogUUD("-");
				userDimention.setLogB_IEV("-");
				userDimention.setLog_PV("-");
				for (String string : logValue) {
					 if(string.contains("b_iev")){
							String[] bievValue=string.split("=");
							userDimention.setLogB_IEV(UserAgentUtils.getUserAgentInfo(bievValue[1]).getUaFamily());
							break;
						}
				}
				userMemberDimention.setLogP_URL("-");
				userMemberDimention.setLogU_MID("-");
				userDimention.setUserMemberDimention(userMemberDimention);
				sessionDimention.setSessionNumber("-");
				sessionDimention.setSessionLength("sessionLength");
				sessionDimention.setSessionUSD(val);
				userDimention.setSessionDimention(sessionDimention);
				long c_time=0L;
				for (String string : logValue) {
					if(string.contains("c_time")){
						String[] vv=string.split("=");
						c_time=Long.parseLong(vv[1]);
						break;
					}
				}
				
				context.write(userDimention, new LongWritable(c_time));
			}
		}
		
		
		
		
		///////////////////////////////分析各个浏览器的pv值////////////////////////////
		
			
			//String browser="/";
			for (String string : logValue) {
				 if(string.contains("b_iev")){
					 UserDimention userDimention=new UserDimention();
						userDimention.setLogDate(logDate);
						userDimention.setLogEN("-");
						userDimention.setLogUUD("-");
						userDimention.setLogB_IEV("-");
						userDimention.setLog_PV("pv");
					 
						String[] bievValue=string.split("=");
						userDimention.setLogB_IEV(UserAgentUtils.getUserAgentInfo(bievValue[1]).getUaFamily());
							sessionDimention.setSessionUSD("-");
							sessionDimention.setSessionLength("-");
							sessionDimention.setSessionMax("-");
							sessionDimention.setSessionMin("-");
							sessionDimention.setSessionNumber("-");
							sessionDimention.setSessionShort("-");
						 userDimention.setSessionDimention(sessionDimention);
						 userDimention.setUserMemberDimention(userMemberDimention);
						 context.write(userDimention, new LongWritable(1));
						break;
					}
			}
			
		
		

	}
}
