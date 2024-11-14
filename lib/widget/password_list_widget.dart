import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:thread_detection/config/enum.dart';

class PasswordListTile extends StatelessWidget {
  final String title;
  final AccountType type;
  final String username;

  const PasswordListTile({
    super.key,
    required this.title,
    required this.type,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              username,
              style: textTheme.bodyMedium,
            ),
          ],
        ),
        leading: Image.asset(type.logo, width: 40.0, height: 40.0),
        trailing: Container(
          width: 40.0,
          height: 40.0,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(LucideIcons.chevron_right),
        ),
        // onTap: onTap,
      ),
    );
  }
}
