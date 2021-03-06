#property copyright "shiyingpan"
#property link      "https://aijy.github.io"
#property version   "1.00"
#property strict

void OnStart()
  {
/*
    设置币种4小时周期，前根K线MACD值,MACD有2个返回值macd的值，与macd的均线值
*/
   string 币种=Symbol(); //----币种Symbol为图表币种，也可直接定义如“EURUSD”
   int 时间周期=240;     //----时间周期指图表周期，240（分钟）是4小时图，使用0，则默认图表周期
   int 慢周期=26,快周期=12,均滑周期=9;
   
   double macd_main=iMACD(币种,时间周期,快周期,慢周期,均滑周期,PRICE_CLOSE,MODE_MAIN,1);  //---最后一个参数表示第几根k线，0是从右往左第一根，即最近的一根K线
   double macd_signal=iMACD(币种,时间周期,快周期,慢周期,均滑周期,PRICE_CLOSE,MODE_SIGNAL,1);  //---第二根，从右往左。注意第n+1根K线的标号为n。

   PrintFormat("MACD值为：%.5f,SIGNAL：%.5f",macd_main,macd_signal);
   
//---------- 获取 EURUSD 日线当前MACD值 -----------//  
   macd_main=iMACD("EURUSD",PERIOD_D1,快周期,慢周期,均滑周期,PRICE_CLOSE,MODE_MAIN,0);  //---最后一个参数表示第几根k线，0是从右往左第一根，即最近的一根K线
   macd_signal=iMACD("EURUSD",PERIOD_D1,快周期,慢周期,均滑周期,PRICE_CLOSE,MODE_SIGNAL,0);  //---第二根，从右往左。注意第n+1根K线的标号为n。

   PrintFormat("MACD值为：%.5f,SIGNAL：%.5f",macd_main,macd_signal);
  }