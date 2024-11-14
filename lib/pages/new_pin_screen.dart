import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class NewPinScreen extends StatefulWidget {
  const NewPinScreen({super.key});

  @override
  _NewPinScreenState createState() => _NewPinScreenState();
}

class _NewPinScreenState extends State<NewPinScreen> {
  final TextEditingController _pinController = TextEditingController();

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
              "Tạo mã PIN mới",
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
                context.pushNamed('confirm-pin', queryParameters: {'pin': pin});
              },
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {},
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
