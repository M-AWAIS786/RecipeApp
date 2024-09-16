import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';


final formatter = DateFormat.yMd();

final uuid=Uuid();
 enum category {Food,Travel,Entertainment,work,leisure,other}


Map<category,IconData> categoryIcons ={
   category.Food : Icons.lunch_dining,
  category.Travel:Icons.flight_takeoff,
  category.Entertainment:Icons.music_note,
  category.work:Icons.work,
  category.leisure:Icons.pool,
  category.other:Icons.more_horiz,

};



class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final category categories;

String  get FormattedDate {
   return formatter.format(date);
  }

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.categories,

  }) : id = uuid.v4();

}












