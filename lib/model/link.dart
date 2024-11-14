import 'package:thread_detection/config/enum.dart';

class Link {
  final String id;
  final String link;
  final LinkType type;
  final DateTime createdAt;

  Link(
      {required this.id,
      required this.link,
      required this.type,
      required this.createdAt});
}
