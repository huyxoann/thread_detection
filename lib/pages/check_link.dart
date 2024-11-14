import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:thread_detection/config/enum.dart';
import 'package:thread_detection/model/link.dart';
import 'package:thread_detection/viewmodel/link_viewmodel.dart';
import 'package:thread_detection/widget/link_checked_tile.dart';

class CheckingLinkPage extends StatefulWidget {
  const CheckingLinkPage({super.key});

  @override
  _CheckingLinkPageState createState() => _CheckingLinkPageState();
}

class _CheckingLinkPageState extends State<CheckingLinkPage> {
  late LinkViewmodel viewModel;
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
  void initState() {
    viewModel = Provider.of<LinkViewmodel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.getLinks();
    });

    super.initState();
  }

  Future<void> saveLinkHistoryCheck(LinkType linkType, String link) async {
    var box = await Hive.openBox('links');
    await box.put((box.length + 1).toString(), {
      'link': link,
      'type': LinkType.values.indexOf(linkType),
      'createdAt': DateTime.now(),
    });
    viewModel.getLinks();
  }

  Future<void> isScamLink(String url) async {
    final firestore = FirebaseFirestore.instance;

    String uriHost = getMainDomain(url);

    QuerySnapshot querySnapshot =
        await firestore.collection('scam_links').get();
    for (var doc in querySnapshot.docs) {
      final scamLink = doc['link'];
      if (uriHost == scamLink || scamLink.contains(uriHost)) {
        await saveLinkHistoryCheck(LinkType.suspicious, url);
        return;
      } else {
        querySnapshot = await firestore.collection('safe_links').get();
        for (var doc in querySnapshot.docs) {
          final scamLink = doc['link'];
          if (uriHost == scamLink || scamLink.contains(uriHost)) {
            await saveLinkHistoryCheck(LinkType.safe, url);
            return;
          } else {
            await saveLinkHistoryCheck(LinkType.unsafe, url);
            return;
          }
        }
      }
    }
  }

  String getMainDomain(String url) {
    final uri = Uri.parse(url);
    return uri.host;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController linkCheckController = TextEditingController();
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
                        controller: linkCheckController,
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
                        child: ValueListenableBuilder<TextEditingValue>(
                          valueListenable: linkCheckController,
                          builder: (context, value, child) {
                            return FilledButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                              ),
                              onPressed: value.text.isNotEmpty
                                  ? () async {
                                      await isScamLink(
                                          linkCheckController.text);
                                    }
                                  : null,
                              child: const Text("Kiểm tra"),
                            );
                          },
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
                    Consumer<LinkViewmodel>(
                      builder: (context, viewmodel, _) {
                        viewmodel.links
                            .sort((a, b) => b.createdAt.compareTo(a.createdAt));
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: viewmodel.links.length,
                          itemBuilder: (context, index) {
                            final link = viewmodel.links[index];
                            return Dismissible(
                              key: Key(link.id),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) async {
                                var box = await Hive.openBox('links');
                                await box.delete(link.id);
                                setState(() {
                                  viewmodel.links.removeAt(index);
                                });
                              },
                              background: Container(
                                color: colorScheme.surface,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Icon(LucideIcons.trash,
                                    color: colorScheme.onSurface),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: GestureDetector(
                                  child: LinkCheckedTile(
                                    link: link.link,
                                    type: link.type,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
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
