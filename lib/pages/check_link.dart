import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_detection/config/enum.dart';
import 'package:thread_detection/model/link.dart';
import 'package:thread_detection/widget/link_checked_tile.dart';

class CheckingLinkPage extends StatefulWidget {
  const CheckingLinkPage({super.key});

  @override
  _CheckingLinkPageState createState() => _CheckingLinkPageState();
}

class _CheckingLinkPageState extends State<CheckingLinkPage> {
  List<Link> links = [
    Link(
        id: '0',
        link: 'huyxoann.com',
        type: LinkType.safe,
        createdAt: DateTime.now()),
    Link(
        id: '1',
        link: 'huyxoann.com',
        type: LinkType.suspicious,
        createdAt: DateTime.now()),
    Link(
        id: '2',
        link: 'huyxoann.com',
        type: LinkType.unsafe,
        createdAt: DateTime.now()),
    Link(
        id: '3',
        link: 'huyxoann.com',
        type: LinkType.unsafe,
        createdAt: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
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
                        "Kiểm tra Link",
                        style: textTheme.bodyLarge,
                      ),
                      Text(
                        "Kiểm tra trước khi nhấn vào đường link lạ",
                        style: textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Nhập đường link...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
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
                          child: const Text("Kiểm tra"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Lịch sử kiểm tra",
                        style: textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: links.length,
                      itemBuilder: (context, index) {
                        final link = links[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              context.pushNamed('account-details',
                                  queryParameters: {'id': link.id});
                            },
                            child: LinkCheckedTile(
                              link: link.link,
                              type: link.type,
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
