import 'package:flutter/material.dart';
import '../models/wallet.dart';

/// จำลองข้อมูลแบบ API (JSON)
final List<Map<String, dynamic>> walletJsonData = [
  {
    "name": "เงินสด",
    "balance": 5000,
    "icon": Icons.money.codePoint,
    "color": Colors.green.value,
  },
  {
    "name": "ธนาคาร",
    "balance": 20000,
    "icon": Icons.account_balance.codePoint,
    "color": Colors.blue.value,
  },
];

/// แปลง JSON → List<Wallet>
final List<Wallet> wallets =
    walletJsonData.map((json) => Wallet.fromJson(json)).toList();
