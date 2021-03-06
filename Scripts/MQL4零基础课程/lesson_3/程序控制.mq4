#property copyright "shiyingpan"
#property link      "https://aijy.github.io"
#property version   "1.00"
#property strict

//-- 程序控制一般有两种：条件判断，循环
//-- 条件判断使用 if : if/if-else/if-else if-esle if ..else 或使用switch-case
//-- 循环使用 for 或 while，以及循环结束的方法break和continue

input double lot = 1;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart()
  {
// if 控制语句：如果 if后面的条件成立就执行if后面的代码，否则执行else的后续代码，if-else
   if(lot>=1)
     {
      Print("单量太大，不能下单！");
     }
   else if(lot>0.5)
     {
      Print("单量小于1大于0.5，单量较大，须控制止损");
     }
   else if(lot>0)
     {
      Print("单量小于0.5，允许下单");
     }
   else
     {
      Print("输入单量不符合要求！");
     }

//-----23点到1点之间不交易------//
   if(TimeHour(TimeCurrent())==23 || TimeHour(TimeCurrent())==0) //--函数带有括号()
     {
      Alert("非交易时段");
      return;
     }

//--- else 并不是一定要有，根据需要-------//
//--- 本根K线RSI指标高于50下空单，低于50下多单----//
   double rsi_value=iRSI(Symbol(),0,14,PRICE_CLOSE,0);
   int ticket=0;
   if(rsi_value>50)
     {
      ticket=OrderSend(Symbol(),OP_SELL,0.1,Bid,3,0,0,"测试",1242,0,clrNONE);

      if(ticket==0)
         Print("开单失败！错误原因：",GetLastError());
      else
         Print("开单成功！订单号：",ticket);
     }
   else
     {
      ticket=OrderSend(Symbol(),OP_BUY,0.1,Ask,3,0,0,"测试",1242,0,clrNONE);

      if(ticket==0)
         Print("开单失败！错误原因：",GetLastError());
      else
         Print("开单成功！订单号：",ticket);
     }

//--- 本根K线RSI指标高于70下空单，低于30下多单,其他情况不下单----//

   if(rsi_value>70)
     {
      ticket=OrderSend(Symbol(),OP_SELL,0.1,Bid,3,0,0,"测试",1242,0,clrNONE);

      if(ticket==0)
         Print("开单失败！错误原因：",GetLastError());
      else
         Print("开单成功！订单号：",ticket);
     }
   else
      if(rsi_value<30)   // else if 追加判断
        {
         ticket=OrderSend(Symbol(),OP_BUY,0.1,Ask,3,0,0,"测试",1242,0,clrNONE);

         if(ticket==0)
            Print("开单失败！错误原因：",GetLastError());
         else
            Print("开单成功！订单号：",ticket);
        }
//-- switch-case, 可使用if-esle if代替
   int type=OP_BUY;

   switch(type)
     {
      case OP_BUY:
         Print("下多单");
         break;
      case OP_BUYLIMIT:
         Print("下限价买入挂单");
         break;
      case OP_SELL:
         Print("下空单");
         break;
      default:
         Print("其他情况，不操作");
         break;
     }

//-- for(变量;允许条件;变量加减)，例：获取历史订单的订单号
   for(int i=0; i<OrdersHistoryTotal(); i++) //-- i++ : 自增操作，相当于 i=i+1
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)==true)
        {
         PrintFormat("订单%d的单号是：",OrderTicket());
        }
     }

//-- while(允许条件)，例：1-999的和，能用while的地方，一般都可以使用for循环代替
   int i=0,sum = 0;
   while(i<1000)
     {
      i = i+1;
      sum=sum+i;
     }
   PrintFormat("1-999的和为%d。",sum);
   
//-- break终止循环   
   
//-- for(变量;允许条件;变量加减)，例：获取历史订单的订单号
   for(int i=0; i<OrdersHistoryTotal(); i++) //-- i++ : 自增操作，相当于 i=i+1
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)==true)
        {
         PrintFormat("订单%d的单号是：",OrderTicket());
        }
      if(i==10)
      {
         Print("已经找到10个订单，循环结束");
         break;
      }  
     }  
   
//-- continue ,遇到continue时中断一次循环,后面的语句不会被执行，转而执行下一次循环，例：1-999的中奇数之和
   int i=0,sum = 0;
   while(i<1000)
     {
      i = i+1;
      if(i%2==0)
         continue;
      sum=sum+i;
     }
   PrintFormat("1-999的和为%d。",sum);  
  }
//-- 本节必须掌握 if 和 for的 使用方法
