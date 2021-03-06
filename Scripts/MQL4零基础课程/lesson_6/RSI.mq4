#property copyright "shiyingpan"
#property link      "https://aijy.github.io"
#property version   "1.00"
#property strict

void OnStart()
  {
//---------- 设置币种4小时周期，前三根K线14日RSI值 -----------//
 
   string 币种=Symbol(); //----币种Symbol为图表币种，也可直接定义如“EURUSD”
   int 时间周期=240;     //----时间周期指图表周期，240（分钟）是4小时图，使用0，则默认图表周期
   int RSI周期=14;      //----均线周期，本例指14均线

   double rsi_0=iRSI(币种,时间周期,RSI周期,PRICE_CLOSE,0);  //---最后一个参数表示第几根k线，0是从右往左第一根，即最近的一根K线
   double rsi_1=iRSI(币种,时间周期,RSI周期,PRICE_CLOSE,1);  //---第二根，从右往左。注意第n+1根K线的标号为n。
   double rsi_2=iRSI(币种,时间周期,RSI周期,PRICE_CLOSE,2);  

   PrintFormat("前三根K线RSI值为：%.5f,%.5f,%.5f",rsi_0,rsi_1,rsi_2);
   
//---------- 获取 EURUSD 日线日收盘RSI值 -----------//  
   double rsi_eurusd=iRSI("EURUSD",PERIOD_D1,14,PRICE_CLOSE,1);  
   PrintFormat("EURUSD日线的RSI值为：%.5f",rsi_eurusd); 
  }

