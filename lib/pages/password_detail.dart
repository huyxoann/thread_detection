import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:hive/hive.dart';
import 'package:thread_detection/config/enum.dart';
import 'package:thread_detection/model/account.dart';
import 'package:thread_detection/widget/appbar.dart';

class PasswordDetailPage extends StatefulWidget {
  final String id;
  const PasswordDetailPage({super.key, required this.id});

  @override
  _PasswordDetailPageState createState() => _PasswordDetailPageState();
}

class _PasswordDetailPageState extends State<PasswordDetailPage> {
  late bool isShowPassword;
  Account account = Account(
    id: "",
    title: "",
    username: "",
    type: AccountType.Facebook,
    createdAt: DateTime.now(),
    password: "",
  );

  @override
  void initState() {
    super.initState();
    isShowPassword = false;

    Hive.openBox('accounts').then((box) {
      setState(() {
        Map<dynamic, dynamic> accountData = box.get(widget.id);
        account = Account(
          id: widget.id,
          title: accountData['label'],
          username: accountData['email'],
          type: AccountType.values.firstWhere(
            (element) => element.name == accountData['accountType'],
          ),
          password: accountData['password'],
          createdAt: accountData['createdAt'] ?? DateTime.now(),
        );
        print(accountData);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Chi tiết mật khẩu",
        showBackButton: true,
        id: widget.id,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(account.type.logo,
                            width: 52.0, height: 52.0),
                        Text(
                          account.title,
                          style: textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tên đăng nhập / email',
                          style: textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            const Icon(
                              LucideIcons.mail,
                              size: 24,
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: Text(
                                account.username,
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          'Mật khẩu',
                          style: textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(
                                  ClipboardData(text: account.password),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Đã sao chép mật khẩu vào clipboard'),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    LucideIcons.key_round,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 12.0),
                                  Text(
                                    isShowPassword
                                        ? account.password
                                        : '********',
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isShowPassword = !isShowPassword;
                                });
                              },
                              icon: Icon(
                                isShowPassword
                                    ? LucideIcons.eye
                                    : LucideIcons.eye_off,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          'Tài khoản',
                          style: textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Image.asset(account.type.logo,
                                width: 26.0, height: 26.0),
                            const SizedBox(width: 12.0),
                            Text(
                              account.type.name,
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "*Nhấn vào mật khẩu để copy",
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (DateTime.now().difference(account.createdAt).inDays > 30)
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    const Icon(
                      LucideIcons.badge_alert,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Text(
                        'Mật khẩu của bạn đã hơn 30 ngày, vui lòng đổi mật khẩu.',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
