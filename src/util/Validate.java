package util;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Validate {
	
	/**
	 * �Ƿ�Ϊ���ֺ�Ӣ����֤
	 *
	 */
	public int getIntAndChar(String str){
		char c;
		int i;
		for (i = 0; i<str.length(); i++){
			c = str.charAt(i);
			if(!((c>='0' && c<='9') || (c>='a' && c<='z') || (c>='A' && c<='Z'))){
				break;
			}
		}//�ж��ַ��Ƿ���ĳ������
		if(i < str.length()){
			return -1;
		}else{
			return 0;
		}
	}
	
	/**
	 * �Ƿ�Ϊ������֤
	 *
	 */
	public int getInt(String str){
		char c;
		int i;
		for (i = 0; i<str.length(); i++){
			c = str.charAt(i);
			if(!(c>='0' && c<='9')){
				break;
			}
		}//�ж��ַ��Ƿ���ĳ������
		if(i < str.length()){
			return -1;
		}else{
			return 0;
		}
	}
	
	/**
	 * �Ƿ�Ϊ�Ƿ��ַ���֤
	 *
	 */
	public boolean getLawlessChar(String str){
		boolean flag = false;
		char c;
		for(int i = 0;i < str.length();i++){
			c = str.charAt(i);
			switch(c){
			case '<' : flag = true; break;
			case '>' : flag = true; break;
			case '"' : flag = true; break;
			case '&' : flag = true; break;
			case ' ' : flag = true; break;
			}
		}
		return flag;
	}
	
	/**
	 * ����ת��
	 * ��gb2312����ת����unicode����
	 */
	public String getUnicode(String str) {
		if(str != null){
			try {
				return new String(str.getBytes("iso8859_1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO �Զ����� catch ��
				e.printStackTrace();
				return str;
			}
		}else{
			return null;
		}
	}
	
	/**
	 * ����ת��
	 * ��unicode����ת����gb2312����
	 */
	public String getGb2312(String str) {
		if(str != null){
			try {
				return new String(str.getBytes("utf-8"),"iso8859_1");
			} catch (UnsupportedEncodingException e) {
				// TODO �Զ����� catch ��
				e.printStackTrace();
				return str;
			}
		}else{
			return null;
		}
	}
	
	/**
	 * ��ʽ������ ��-��-�� Сʱ��0-23��:����:��
	 */
	public String getSystemDate(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		return df.format(date);
	}
	
	/**
	 * ��������
	 */
	public float getRround(float f){
		int tem = (int)(f*100+0.5);
		float ff = ((float)tem/100);
		return ff;
	}
}