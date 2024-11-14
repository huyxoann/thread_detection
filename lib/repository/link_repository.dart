import 'package:thread_detection/model/link.dart';

abstract class LinkRepository {
  Future<List<Link>> getLinks();
}
