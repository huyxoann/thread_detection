import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:thread_detection/config/enum.dart';
import 'package:thread_detection/widget/appbar.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  AccountType accountTypeSelected = AccountType.Facebook;
  TextEditingController labelController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();

    labelController.text = "Tài khoản ${accountTypeSelected.name}";
  }

  String generateRandomPassword() {
    const length = 16;
    const chars =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+[]{}|;:,.<>?";
    final rand = Random.secure();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)])
        .join('');
  }

  Future<void> saveAccount() async {
    // Implement your logic to save the account to the box
    // For example, using Hive:
    var box = Hive.box('accounts');
    await box.put((box.length + 1).toString(), {
      'label': labelController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'accountType': accountTypeSelected.name,
      'createdAt': DateTime.now(),
    });
    debugPrint(
        'Account saved: ${labelController.text}, ${emailController.text}, ${passwordController.text}, ${accountTypeSelected.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Tạo mật khẩu"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    icon: Image.asset(accountTypeSelected.logo,
                        width: 40.0, height: 40.0),
                    onPressed: () {
                      // Add your onPressed code here!
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          List<AccountType> accountTypes = AccountType.values;
                          return SizedBox(
                            height: 500,
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: accountTypes.length,
                                    itemBuilder: (context, index) {
                                      final element = accountTypes[index];
                                      return ListTile(
                                        leading: Image.asset(
                                          element.logo,
                                          width: 40.0,
                                          height: 40.0,
                                        ),
                                        title: Text(element.name),
                                        onTap: () {
                                          setState(() {
                                            accountTypeSelected = element;
                                            labelController.text =
                                                "Tài khoản ${element.name}";
                                          });
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Nhập lại mật khẩu",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                      controller: labelController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text("Tên đăng nhập/Email",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(
                height: 4.0,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Nhập tên đăng nhập hoặc email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "Mật khẩu",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: const InputDecoration(
                        hintText: "Nhập mật khẩu",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(LucideIcons.dices, size: 28),
                    onPressed: () {
                      setState(() {
                        passwordController.text = generateRandomPassword();
                        debugPrint(passwordController.text);
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      isPasswordVisible ? LucideIcons.eye : LucideIcons.eye_off,
                      size: 28,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: labelController,
                builder: (context, label, child) {
                  return ValueListenableBuilder<TextEditingValue>(
                    valueListenable: emailController,
                    builder: (context, email, child) {
                      return ValueListenableBuilder<TextEditingValue>(
                        valueListenable: passwordController,
                        builder: (context, password, child) {
                          return SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: (label.text.isNotEmpty &&
                                      email.text.isNotEmpty &&
                                      password.text.isNotEmpty)
                                  ? () {
                                      saveAccount();
                                      context.pushNamed('home');
                                    }
                                  : null,
                              child: const Text("Lưu"),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
