import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:thread_detection/config/enum.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final String id;

  const CustomAppBar(
      {super.key,
      required this.title,
      this.showBackButton = false,
      this.id = ''});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  MenuItem? _selectedItem;

  void _deleteAccount(String id) {
    // Implement your logic to delete the account from the box
    // For example, using Hive:
    var box = Hive.box('accounts');
    box.delete(id);
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: colorScheme.surfaceContainerHighest,
      title: Text(widget.title),
      centerTitle: true,
      leading: IconButton(
        icon: CircleAvatar(
          backgroundColor: colorScheme.surface,
          child: Icon(
            LucideIcons.chevron_left,
            color: colorScheme.onSurface,
          ),
        ),
        onPressed: () => context.pop(),
      ),
      actions: [
        if (widget.showBackButton)
          PopupMenuButton<MenuItem>(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
              PopupMenuItem(
                value: MenuItem.edit,
                child: const Text('Chỉnh sửa'),
                onTap: () => context.pushNamed('edit-password',
                    queryParameters: {'id': widget.id.toString()}),
              ),
              PopupMenuItem(
                value: MenuItem.delete,
                child: const Text('Xóa'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Row(
                          children: [
                            Icon(
                              LucideIcons.message_square_warning,
                              color: colorScheme.error,
                            ),
                            const SizedBox(width: 8),
                            const Text('Xóa tài khoản?'),
                          ],
                        ),
                        content: const Text(
                            'Bạn có chắc muốn xóa tài khoản này không?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              context.pop(); // Dismiss the dialog
                            },
                            child: const Text('Hủy'),
                          ),
                          TextButton(
                            onPressed: () {
                              _deleteAccount(widget.id);
                              context.goNamed('home');
                            },
                            child: const Text('Xóa'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
            onSelected: (MenuItem item) {
              setState(() {
                _selectedItem = item;
              });
            },
          ),
      ],
    );
  }
}
