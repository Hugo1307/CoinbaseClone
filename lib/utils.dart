import 'package:flutter/material.dart';

class Currency {
  
  final String currencyName;
  final String currencyAlias;
  final double currentPrice;
  final double variation;
  final String currencyImagePath;
  final Color currencyColor;

  Currency(this.currencyName, this.currencyAlias, this.currentPrice, this.variation, this.currencyImagePath, this.currencyColor);
  
}
