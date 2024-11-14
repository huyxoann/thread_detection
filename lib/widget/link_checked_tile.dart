import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:thread_detection/config/enum.dart';

class LinkCheckedTile extends StatelessWidget {
  final String link;
  final LinkType type;
  const LinkCheckedTile({super.key, required this.link, required this.type});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    if (type == LinkType.safe) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                link,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onTertiaryContainer,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                type.name,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onTertiaryContainer,
                ),
              ),
            ],
          ),
          leading: Icon(
            type.icon,
            size: 40.0,
            color: colorScheme.onError,
          ),
        ),
      );
    } else if (type == LinkType.unsafe) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                link,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onError,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                type.name,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onError,
                ),
              ),
            ],
          ),
          leading: Icon(
            type.icon,
            size: 40.0,
            color: colorScheme.onError,
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                link,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onError,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                type.name,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onError,
                ),
              ),
            ],
          ),
          leading: Icon(
            type.icon,
            size: 40.0,
            color: colorScheme.onError,
          ),
        ),
      );
    }
  }
}
