import 'package:flutter/material.dart';
import 'package:thread_detection/model/link.dart';
import 'package:thread_detection/repository/link_repository.dart';

class LinkViewmodel extends ChangeNotifier {
  final LinkRepository _linkRepository;

  LinkViewmodel({required LinkRepository linkRepository})
      : _linkRepository = linkRepository;

  List<Link> links = [];
  bool isLoading = false;

  Future<void> getLinks() async {
    isLoading = true;
    notifyListeners();

    try {
      links = await _linkRepository.getLinks();
    } catch (e) {
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
