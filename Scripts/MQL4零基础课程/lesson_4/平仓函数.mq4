//+------------------------------------------------------------------+
//|                                                         平仓指令.mq4 |
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
   bool mybool=false;
   int ticket=380673918;
   //-- 平仓
   mybool=OrderClose(ticket,0.05,Bid,3,clrNONE);
   if(mybool==false)
   {
      Print("平仓失败");
   }
   else
   {
      Print("平仓成功");
   }
   
   //-- 删除挂单
   mybool=OrderDelete(ticket,clrNONE);
   if(mybool==false)
   {
      Print("平仓失败");
   }
   else
   {
      Print("平仓成功");
   }

   
   
  }
//+------------------------------------------------------------------+
