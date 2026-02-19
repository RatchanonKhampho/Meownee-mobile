import 'package:flutter/material.dart';
import 'package:meownee/models/wallet_model.dart';

List<Wallet> mockWallets = [
  Wallet(
    id: '1',
    name: 'เงินสด',
    icon: Icons.wallet,
    color: Colors.orange,
    balance: 1000.00,
  ),
  Wallet(
    id: '2',
    name: 'ธนาคาร',
    icon: Icons.account_balance,
    color: Colors.blue,
    balance: 20000.00,
  ),
];
