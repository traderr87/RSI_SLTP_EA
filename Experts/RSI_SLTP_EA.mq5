#include <Trade\Trade.mqh>
input double LotSize = 0.1;
input int RSI_Period = 14;
input int RSI_Buy_Level = 30;
input int RSI_Sell_Level = 70;
input int StopLossPoints = 4000;
input int TakeProfitPoints = 8000;

CTrade trade;

int rsiHandle;

// สร้าง RSI เมื่อเริ่มต้น
int OnInit()
  {
   rsiHandle = iRSI(_Symbol, _Period, RSI_Period, PRICE_CLOSE);
   if(rsiHandle == INVALID_HANDLE)
     {
      Print("RSI creation failed!");
      return(INIT_FAILED);
     }
   return(INIT_SUCCEEDED);
  }

void OnTick()
  {
   double rsi[];
   if(CopyBuffer(rsiHandle, 0, 0, 1, rsi) < 0)
     {
      Print("Failed to get RSI data");
      return;
     }

   double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);

   if(PositionSelect(_Symbol)) return; // มี order แล้วไม่เปิดเพิ่ม

   double sl = 0.0;
   double tp = 0.0;

   if(rsi[0] < RSI_Buy_Level)
     {
      sl = NormalizeDouble(ask - StopLossPoints * _Point, _Digits);
      tp = NormalizeDouble(ask + TakeProfitPoints * _Point, _Digits);
      trade.Buy(
         LotSize,            // 1. volume
         _Symbol,            // 2. symbol
         ask,                // 3. price
         sl,                 // 4. Stop Loss
         tp,                 // 5. Take Profit
         "RSI Buy"           // 6. comment
      );
     }

   if(rsi[0] > RSI_Sell_Level)
     {
      sl = NormalizeDouble(bid + StopLossPoints * _Point, _Digits);
      tp = NormalizeDouble(bid - TakeProfitPoints * _Point, _Digits);
      trade.Sell(
         LotSize,
         _Symbol,
         bid,                // ใช้ bid เป็นราคาขาย
         sl,
         tp,
         "RSI Sell"
      );
     }
  }