package com.bf.log.reduce;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.mapreduce.Reducer;

import com.bf.log.dimention.UserDimention;

public class LogUserReduce extends Reducer<UserDimention, LongWritable, UserDimention, LongWritable> {
	@Override
	protected void reduce(UserDimention arg0, Iterable<LongWritable> arg1,
			Reducer<UserDimention, LongWritable, UserDimention, LongWritable>.Context arg2)
			throws IOException, InterruptedException {
		
		int count=0;
		
		////////////////////////新增用户数据累加///////////////////////////////////
		if(arg0.getLogEN().equals("en=e_l")){
			for (LongWritable longWritable : arg1) {
				count++;
			}
			
		}
		
		//////////////////////////新增会员数据累加//////////////////////////////////////
		if(arg0.getUserMemberDimention().getLogP_URL().equals("p_url")){
			for (LongWritable longWritable : arg1) {
				count++;
			}
		}
		
		/////////////////////////会话分析长度///////////////////////////////////////////
		if(arg0.getSessionDimention().getSessionLength().equals("sessionLength")){
			//通过Arrays,进行从小到大的排序
			List<Long> list=new ArrayList<Long>();
			for (LongWritable longWritable : arg1) {
				//System.out.println(longWritable+"\t");
				list.add(longWritable.get());
				count++;
			}
			Long[] ll=new Long[list.size()];
			 	list.size();
				
			for(int i=0;i<list.size();i++){
				ll[i]=list.get(i);
			}
			Arrays.sort(ll);
			arg0.getSessionDimention().setSessionMax(String.valueOf(ll[ll.length-1]) );
			arg0.getSessionDimention().setSessionMin(String.valueOf(ll[0]) );
			arg0.getSessionDimention().setSessionShort(String.valueOf(ll[ll.length-1]-ll[0]));
		}
		
		////////////////////////////////////分析各个浏览器的pv值,进行值的累加//////////////////////
		if(arg0.getLog_PV().equals("pv")){
			for (LongWritable longWritable : arg1) {
				count++;
			}
			//System.out.println(arg0.toString());
		}
		
		
		arg2.write(arg0, new LongWritable(count));
		
	}
}
