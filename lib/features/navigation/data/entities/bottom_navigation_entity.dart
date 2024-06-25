import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationEntity {
  final IconData icon;
  final String label;

  BottomNavigationEntity({
    required this.icon,
    required this.label,
  });

  static List<BottomNavigationEntity> bottomNavList = [
    BottomNavigationEntity(
      icon: CupertinoIcons.home,
      label: "Home",
    ),
    BottomNavigationEntity(
      icon: CupertinoIcons.creditcard,
      label: "Credit Card",
    ),
    BottomNavigationEntity(
      icon: CupertinoIcons.money_dollar,
      label: "Money",
    ),
    BottomNavigationEntity(
      icon: CupertinoIcons.person,
      label: "Profile",
    )
  ];
}