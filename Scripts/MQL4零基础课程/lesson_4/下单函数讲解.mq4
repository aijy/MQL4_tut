//+------------------------------------------------------------------+
//|                                                       下单函数讲解.mq4 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   string 币种="EURUSD1";//-- Symbol()
   int    交易类型=OP_BUY;
   double 单量=0.1;
   double 开仓价=Ask;
   int    滑点=3;
   double 止损=0,止盈=0;
   string 注释="测试";
   int    魔数=123;
   int 过期时间=0;
   int 订单号;
   订单号=OrderSend(币种,交易类型,单量,开仓价,滑点,止损,止盈,注释,魔数,过期时间,clrNONE);
   if(订单号<0)
   {
      Print("下单失败");
   }
   else
   {
      Print("下单成功，订单号：",订单号);
   }
   
  }
//+------------------------------------------------------------------+
