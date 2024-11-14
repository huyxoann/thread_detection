import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:thread_detection/config/enum.dart';
import 'package:thread_detection/model/account.dart';
import 'package:thread_detection/widget/password_list_widget.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key, required this.title});

  final String title;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Xin chào!", style: textTheme.headlineMedium),
                Text(
                  "Lưu lại mật khẩu dễ dàng và bảo mật",
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          LucideIcons.shield_check,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Tạo mật khẩu mới",
                        style: textTheme.bodyLarge,
                      ),
                      Text(
                        "Lưu lại mật khẩu dễ dàng và bảo mật",
                        style: textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8.0),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                          onPressed: () => context.pushNamed('create-password'),
                          child: const Text("Tạo mới +"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          LucideIcons.key_round,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mật khẩu đã lưu",
                                style: textTheme.bodyMedium,
                              ),
                              Text(
                                "${accounts.length} mật khẩu",
                                style: textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(LucideIcons.chevron_right),
                                  onPressed: () {
                                    context.pushNamed('account-list');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Mật khẩu đã lưu",
                        style: textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8.0),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
