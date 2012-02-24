package common
{
	import com.adobe.images.JPGEncoder;
	import com.adobe.images.PNGEncoder;    
	import flash.display.BitmapData;   
	import flash.net.URLRequest;   
	import flash.net.URLRequestMethod;   
	import flash.net.navigateToURL;   
	import flash.utils.ByteArray;   
	import mx.core.UIComponent; 
	
	public class AdobeExportImage
	{
		public function AdobeExportImage()
		{
			
		}
        
        /**  
		* 把图像发送到服务端，转为图像输出  
		*/  
		public function sendImageByte(target:UIComponent,url:String):void  
		{   
			var request:URLRequest = new URLRequest(url);   
			request.contentType = "applicatoin/octet-stream";   
			request.data = getJPGByteArray(target);   
			request.method = URLRequestMethod.POST;   
			navigateToURL(request, "_self");   
		}   
		
		/**  
		* 把目标组件转换为图像数组  
		*/  
		public function getJPGByteArray(target:UIComponent):ByteArray {  
			var bitmapData : BitmapData = new BitmapData(target.width, target.height);  
			bitmapData.draw(target);   
			var jpg : JPGEncoder = new JPGEncoder(); 
			var jpgByteArray : ByteArray = jpg.encode(bitmapData); 
			return jpgByteArray;  
		} 
		
	}
}