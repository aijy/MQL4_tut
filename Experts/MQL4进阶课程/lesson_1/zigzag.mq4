#property copyright "shiyingpan"
#property link      "https://aijy.github.io"
#property version   "1.00"
#property strict

void OnStart()
  {
//---------- 调用自定义指标，指标需在指标文件夹中 -----------//
 
/*----  iCustom用法
 iCustom(货币对名称, 时间周期, 指标名, 指标输入参数1,指标输入参数2,第几个数据,第几根K线); 
*/ 
   string 币种=Symbol(); //----币种Symbol为图表币种，也可直接定义如“EURUSD”
   int 时间周期=240;     //----时间周期指图表周期，240（分钟）是4小时图，使用0，则默认图表周期
   string 指标名="RSI";

   double value_0=iCustom(币种,时间周期,指标名,14,0,0);  //---最后一个参数表示第几根k线，0是从右往左第一根，即最近的一根K线
   double value_1=iCustom(币种,时间周期,指标名,14,0,1);  //---第二根，从右往左。注意第n+1根K线的标号为n。
   double value_2=iCustom(币种,时间周期,指标名,14,0,2);  

   PrintFormat("前三根K线RSI值为：%.5f,%.5f,%.5f",value_0,value_1,value_2);
   
//---------- 获取 EURUSD 日线的zigzag值 -----------// 
    
   double zz_value=0;
   double position=0;
   for(int i=0;i<100;i++)
   {
      zz_value=iCustom("EURUSD", PERIOD_D1, "ZigZag", 12, 5, 3, 0, i); 
      if(zz_value!=0)
      {
         position=i;
         break;
      }   
   }   
   PrintFormat("EURUSD日线上个峰值/底值为：%.5f,第%d根K线",zz_value,position); 
  }
