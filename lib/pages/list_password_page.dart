import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:thread_detection/config/enum.dart';
import 'package:thread_detection/model/account.dart';
import 'package:thread_detection/widget/appbar.dart';
import 'package:thread_detection/widget/password_list_widget.dart';

class ListPasswordPage extends StatefulWidget {
  const ListPasswordPage({super.key});

  @override
  _ListPasswordPageState createState() => _ListPasswordPageState();
}

class _ListPasswordPageState extends State<ListPasswordPage> {
  List<Account> accounts = [];

  @override
  void initState() {
    super.initState();
    // Load data from the 'accounts' box
    // Assuming you are using Hive for local storage
    Hive.openBox('accounts').then((box) {
      setState(() {
        accounts = box.values.map((e) {
          return Account(
            id: box.keys.firstWhere((key) => box.get(key) == e),
            title: e['label'],
            username: e['email'],
            type: AccountType.values.firstWhere(
              (element) => element.name == e['accountType'],
            ),
            password: e['password'],
            createdAt: e['createdAt'] ?? DateTime.now(),
          );
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Mật khẩu đã lưu"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: accounts.length,
                  itemBuilder: (context, index) {
                    final account = accounts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          context.pushNamed('account-details',
                              queryParameters: {'id': account.id});
                        },
                        child: PasswordListTile(
                          title: account.title,
                          type: account.type,
                          username: account.username,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
