import 'package:flutter/material.dart';

class Wallet {
  final String id;
  String name;
  IconData icon;
  Color color;
  double balance;

  Wallet({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.balance,
  });
}

enum TransactionType { income, expense }

class TransactionModel {
  final String id;
  final String walletId;
  final TransactionType type;
  final double amount;
  final DateTime date;
  final String? note;

  TransactionModel({
    required this.id,
    required this.walletId,
    required this.type,
    required this.amount,
    required this.date,
    this.note,
  });
}
