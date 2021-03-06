#property copyright "shiyingpan"
#property link      "https://aijy.github.io"
#property version   "1.00"
#property strict

void OnStart()
  {
/*
    设置币种4小时周期，前根K线布林线上、中、下轨值
*/
   string 币种=Symbol(); //----币种Symbol为图表币种，也可直接定义如“EURUSD”
   int 时间周期=240;     //----时间周期指图表周期，240（分钟）是4小时图，使用0，则默认图表周期
   int 布林线周期=20,布林线方差=2;
   
   double bands_upper  =iBands(币种,时间周期,布林线周期,布林线方差,0,PRICE_CLOSE,MODE_UPPER,1);  //---第二根k线，布林线上轨值
   double bands_middle =iBands(币种,时间周期,布林线周期,布林线方差,0,PRICE_CLOSE,MODE_MAIN,1);  //---第二根k线，布林线中轨值
   double bands_lower  =iBands(币种,时间周期,布林线周期,布林线方差,0,PRICE_CLOSE,MODE_LOWER,1);  //---第二根k线，布林线下轨值

   PrintFormat("4小时布林线前K线上轨值：%.5f,中轨值：%.5f,下轨值：%.5f",bands_upper,bands_middle,bands_lower);
   
//---------- 获取 EURUSD 日线当前布林线值 -----------//  
   bands_upper  =iBands("EURUSD",PERIOD_D1,20,2,0,PRICE_CLOSE,MODE_UPPER,0);  //--- 布林线上轨值
   bands_middle =iBands("EURUSD",PERIOD_D1,20,2,0,PRICE_CLOSE,MODE_MAIN,0);  //--- 布林线中轨值
   bands_lower  =iBands("EURUSD",PERIOD_D1,20,2,0,PRICE_CLOSE,MODE_LOWER,0);  //--- 布林线下轨值

   PrintFormat("当前日线布林线上轨值：%.5f,中轨值：%.5f,下轨值：%.5f",bands_upper,bands_middle,bands_lower);
  }
