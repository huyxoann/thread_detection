import 'package:thread_detection/config/enum.dart';

class Account {
  String id;
  String title;
  String username;
  AccountType type;
  DateTime createdAt;
  String password;

  Account({
    required this.id,
    required this.title,
    required this.username,
    required this.type,
    required this.createdAt,
    required this.password,
  });
}
