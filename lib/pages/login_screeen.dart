import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:pinput/pinput.dart';

class LoginScreeen extends StatefulWidget {
  const LoginScreeen({super.key});

  @override
  _LoginScreeenState createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
  final TextEditingController _pinController = TextEditingController();
  bool isPinStored = false;

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  Future<bool> _isPinStored(String pin) async {
    var box = await Hive.openBox('userInfo');
    if (box.containsKey('pin')) {
      isPinStored = true;
      return pin == box.get('pin');
    } else {
      return pin == '1234';
    }
  }

  Future<bool> _isContainsKey(String key) async {
    var box = await Hive.openBox('userInfo');
    return box.containsKey(key);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nhập mật khẩu để tiếp tục",
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Pinput(
                controller: _pinController,
                length: 4,
                onCompleted: (pin) {
                  print('Entered PIN: $pin');
                },
              ),
              const SizedBox(height: 20),
              Text(
                "Mật khẩu mặc định: 1234",
                style: textTheme.bodySmall,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final pin = _pinController.text;
                  print('Entered PIN: $pin');
                  await _isPinStored(pin).then((isCorrect) {
                    if (isCorrect) {
                      if (isPinStored) {
                        // ignore: use_build_context_synchronously
                        context.goNamed('home');
                      } else {
                        // ignore: use_build_context_synchronously
                        context.pushNamed('new-pin');
                      }
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Mật khẩu không đúng, vui lòng thử lại',
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onError,
                              )),
                          backgroundColor: colorScheme.error,
                        ),
                      );
                    }
                  });
                },
                child: Text(
                  'Đăng nhập',
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
