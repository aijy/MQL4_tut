#property copyright "shiyingpan"
#property link      "https://aijy.github.io"
#property version   "1.00"
#property strict

int 授权账号=123;
double 初始资金=0;

int OnInit()
  {
   while(AccountNumber()==0) //-- 加载前可先使用账户号判断时候可交易，网络未连接时，账号为0
      Sleep(500);            //-- 程序在此停留0.5秒，啥也不干，再判断账号值
   if(AccountNumber()!=授权账号)
   {
      Alert("非授权账号");
      return INIT_FAILED;   //-- 非授权账号，不能加载成功
   }
   Print("账号名：",AccountName());    //-- 获取账户名   
   初始资金=AccountEquity();           //-- 加载EA时获取当前账户净值
   
   if(!IsDemo())                  //-- 如果是实盘
   {
      Alert("当前账户为实盘账户！");
   }
   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {

   
  }

void OnTick()
  {
//--------------- 账户净值风险控制 ----------------//
   if(AccountEquity()<初始资金*0.8)
   {
      Alert("当前账户净值亏损20%，已停止交易");
      //-- 添加平仓操作（平仓退出）
      ExpertRemove(); //-- 退出EA
      return;
   }
  }