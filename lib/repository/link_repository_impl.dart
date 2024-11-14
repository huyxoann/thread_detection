import 'package:hive/hive.dart';
import 'package:thread_detection/config/enum.dart';
import 'package:thread_detection/model/link.dart';
import 'package:thread_detection/repository/link_repository.dart';

class LinkRepositoryImpl extends LinkRepository {
  @override
  Future<List<Link>> getLinks() async {
    List<Link> links = [];
    await Hive.openBox('links').then((box) {
      links = box.values.map((e) {
        return Link(
          id: box.keys.firstWhere((key) => box.get(key) == e),
          link: e['link'],
          type: LinkType.values.firstWhere(
            (element) => element.index == e['type'],
            orElse: () => LinkType.unsafe,
          ),
          createdAt: e['createdAt'] ?? DateTime.now(),
        );
      }).toList();
    });

    for (var link in links) {
      print(link.link);
    }

    return links;
  }
}
