//+------------------------------------------------------------------+
//|                                                     初识脚本.mq4 |
//|                                                       shiyingpan |
//|                                           https://aijy.github.io |
//+------------------------------------------------------------------+
#property copyright "shiyingpan"
#property link      "https://aijy.github.io"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   if(OrderSend(Symbol(),OP_BUY,0.1,Ask,3,0,0,"多单",123,0,clrNONE))
     {
      Print("下单成功了！");
     }
   else
     {
      Alert("下单失败了！原因：",GetLastError());
     }
  }
//+------------------------------------------------------------------+
