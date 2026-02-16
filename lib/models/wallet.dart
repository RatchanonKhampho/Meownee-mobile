import 'package:flutter/material.dart';

class Wallet {
  final String id;
  final String name;
  final double balance;
  final IconData icon;
  final Color color;

  Wallet({
    required this.id,
    required this.name,
    required this.balance,
    required this.icon,
    required this.color,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      balance: (json['balance'] ?? 0).toDouble(),
      icon: IconData(json['icon'] ?? 0xe3f1, fontFamily: 'MaterialIcons'),
      color: Color(json['color'] ?? 0xFF2196F3),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'balance': balance,
      'icon': icon.codePoint,
      'color': color.value,
    };
  }
}
