#property copyright "shiyingpan"
#property link      "https://aijy.github.io"
#property version   "1.00"
#property strict

void OnStart()
  {
//---------- 默认币种4小时周期，前三根K线14日均线值 -----------//
 
   string 币种=Symbol(); //----币种Symbol为图表币种，也可直接定义如“EURUSD”
   int 时间周期=240;     //----时间周期指图表周期，240（分钟）是4小时图，使用0，则默认图表周期
   int 均线周期=14;      //----均线周期，本例指14均线

   double ma_0=iMA(币种,时间周期,均线周期,0,MODE_EMA,PRICE_CLOSE,0);  //---最后一个参数表示第几根k线，0是从右往左第一根，即最近的一根K线
   double ma_1=iMA(币种,时间周期,均线周期,0,MODE_EMA,PRICE_CLOSE,1);  //---第二根，从右往左。注意第n+1根K线的标号为n。
   double ma_2=iMA(币种,时间周期,均线周期,0,MODE_EMA,PRICE_CLOSE,2);  

   PrintFormat("前三根K线均线值为：%.5f,%.5f,%.5f",ma_0,ma_1,ma_2);
   
//---------- 获取 EURUSD 日线50日周期的前日收盘均线值 -----------//  
   double ma_eurusd=iMA("EURUSD",PERIOD_D1,50,0,MODE_EMA,PRICE_CLOSE,1);  
   PrintFormat("EURUSD的均线值为：%.5f",ma_eurusd); 
  }
