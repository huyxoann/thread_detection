import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:pinput/pinput.dart';

class ConfirmPinScreen extends StatefulWidget {
  final String pin;

  const ConfirmPinScreen({super.key, required this.pin});
  @override
  _ConfirmPinScreenState createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  final TextEditingController _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.pin);
  }

  bool _checkPin(String pin) {
    return pin == widget.pin;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorSc = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(LucideIcons.chevron_left)),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorSc.primaryContainer,
                borderRadius: BorderRadius.circular(45),
              ),
              padding: const EdgeInsets.all(20),
              child: Icon(
                LucideIcons.lock_keyhole,
                size: 120,
                color: colorSc.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Nhập lại mã PIN",
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Pinput(
              controller: _pinController,
              length: 4,
              onCompleted: (pin) {
                print('New PIN: $pin');
              },
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                if (_checkPin(_pinController.text)) {
                  Box box = Hive.box('userInfo');
                  box.put('pin', _pinController.text);
                  context.goNamed('home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Mã PIN không khớp"),
                    ),
                  );
                }
              },
              child: const Text("Xác nhận"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }
}
