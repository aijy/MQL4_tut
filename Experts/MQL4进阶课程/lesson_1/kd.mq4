#property copyright "shiyingpan"
#property link      "https://aijy.github.io"
#property version   "1.00"
#property strict

void OnStart()
  {
/*
    设置币种4小时周期，前根K线KD值,KD有2个返回值K值，与D值
*/
   string 币种=Symbol(); //----币种Symbol为图表币种，也可直接定义如“EURUSD”
   int 时间周期=240;     //----时间周期指图表周期，240（分钟）是4小时图，使用0，则默认图表周期
   int K周期=5,D周期=3,均滑周期=3;
   
   double kd_main=iStochastic(币种,时间周期,K周期,D周期,均滑周期,MODE_EMA,0,MODE_MAIN,1);  //---最后一个参数表示第几根k线，0是从右往左第一根，即最近的一根K线
   double kd_signal=iStochastic(币种,时间周期,K周期,D周期,均滑周期,MODE_EMA,0,MODE_SIGNAL,1);  //---第二根，从右往左。注意第n+1根K线的标号为n。

   PrintFormat("KD值为：%.5f,SIGNAL：%.5f",kd_main,kd_signal);
   
//---------- 获取 EURUSD 日线当前KD值 -----------//  
   kd_main=iStochastic("EURUSD",PERIOD_D1,5,3,3,MODE_EMA,0,MODE_MAIN,0);  //---最后一个参数表示第几根k线，0是从右往左第一根，即最近的一根K线
   kd_signal=iStochastic("EURUSD",PERIOD_D1,5,3,3,MODE_EMA,0,MODE_SIGNAL,0);  //---第二根，从右往左。注意第n+1根K线的标号为n。

   PrintFormat("KD值为：%.5f,SIGNAL：%.5f",kd_main,kd_signal);
  }