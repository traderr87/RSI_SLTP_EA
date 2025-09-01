# RSI Trading Bot for MetaTrader 5

A simple yet effective automated trading expert advisor (EA) for MetaTrader 5 that uses the Relative Strength Index (RSI) indicator to identify oversold and overbought conditions for trade entries.

## 📋 Overview

This EA implements a classic RSI-based trading strategy that:
- **Buys** when RSI falls below the oversold level (default: 30)
- **Sells** when RSI rises above the overbought level (default: 70)
- Uses fixed stop loss and take profit levels
- Prevents multiple positions on the same symbol

## 🚀 Features

- **RSI-based signals**: Uses RSI indicator for trade entry decisions
- **Risk management**: Built-in stop loss and take profit functionality
- **Position control**: Prevents opening multiple positions on the same symbol
- **Customizable parameters**: All key settings can be adjusted via input parameters
- **Error handling**: Includes basic error handling for RSI indicator creation

## ⚙️ Input Parameters

| Parameter | Default Value | Description |
|-----------|---------------|-------------|
| `LotSize` | 0.1 | Trade volume (lot size) for each position |
| `RSI_Period` | 14 | Period for RSI calculation |
| `RSI_Buy_Level` | 30 | RSI level below which buy signals are generated |
| `RSI_Sell_Level` | 70 | RSI level above which sell signals are generated |
| `StopLossPoints` | 4000 | Stop loss distance in points |
| `TakeProfitPoints` | 8000 | Take profit distance in points |

## 📊 Trading Logic

### Buy Conditions
- RSI value drops below `RSI_Buy_Level` (default: 30)
- No existing position on the current symbol
- Stop Loss: Current Ask price - `StopLossPoints`
- Take Profit: Current Ask price + `TakeProfitPoints`

### Sell Conditions
- RSI value rises above `RSI_Sell_Level` (default: 70)
- No existing position on the current symbol
- Stop Loss: Current Bid price + `StopLossPoints`
- Take Profit: Current Bid price - `TakeProfitPoints`

## 🛠️ Installation

1. **Download the code** and save it as an `.mq5` file (e.g., `RSI_Trading_Bot.mq5`)
2. **Copy the file** to your MetaTrader 5 data folder:
   ```
   MetaTrader 5/MQL5/Experts/
   ```
3. **Compile the code** in MetaEditor (F7 key)
4. **Restart MetaTrader 5** or refresh the Navigator panel
5. **Drag and drop** the EA onto your desired chart

## ⚠️ Risk Warning

**IMPORTANT**: This is a basic trading algorithm for educational purposes. Trading involves substantial risk of loss.

- **Test thoroughly** on demo accounts before live trading
- **Monitor performance** and adjust parameters based on market conditions
- **Consider market volatility** when setting stop loss and take profit levels
- **Understand** that past performance does not guarantee future results

## 🔧 Configuration Tips

### For Different Markets
- **Forex pairs**: Default settings may work well for major pairs
- **Volatile markets**: Consider increasing stop loss points
- **Ranging markets**: May require tighter RSI levels (e.g., 25/75)

### Parameter Optimization
- **RSI Period**: Shorter periods (7-10) for more sensitive signals, longer periods (21-28) for smoother signals
- **RSI Levels**: Adjust based on historical analysis of your chosen symbol
- **Stop Loss/Take Profit**: Should reflect the symbol's average daily range

## 📝 Code Structure

```
├── Input Parameters
├── Global Variables (CTrade, RSI Handle)
├── OnInit() - Initialize RSI indicator
└── OnTick() - Main trading logic
    ├── Get RSI value
    ├── Check existing positions
    ├── Execute buy/sell logic
    └── Set stop loss and take profit
```

## 🐛 Known Issues & Limitations

- **Single position limit**: Only one position per symbol at a time
- **No time filters**: Trades can be opened at any time
- **Fixed lot size**: Does not implement dynamic position sizing
- **No trend filter**: May generate false signals in trending markets

## 🔄 Potential Improvements

- Add trend filter (moving average, ADX)
- Implement trailing stop functionality
- Add time-based filters (trading hours)
- Include money management rules
- Add multiple timeframe analysis
- Implement position scaling based on RSI strength

## 📞 Support

For questions about MQL5 programming or trading strategies, consult:
- [MQL5 Documentation](https://www.mql5.com/en/docs)
- [MetaTrader 5 Help](https://www.metaquotes.net/en/metatrader5/help)
- MQL5 Community Forums

## ⚖️ Disclaimer

This software is provided for educational purposes only. The authors are not responsible for any financial losses incurred through the use of this trading algorithm. Always test strategies thoroughly and never risk more than you can afford to lose.
