import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

enum AccountType { Facebook, Tiktok, Google, Twitter, Instagram, Zalo }

extension AccountTypeName on AccountType {
  String get name {
    switch (this) {
      case AccountType.Facebook:
        return 'Facebook';
      case AccountType.Tiktok:
        return 'Tiktok';
      case AccountType.Google:
        return 'Google';
      case AccountType.Twitter:
        return 'Twitter';
      case AccountType.Instagram:
        return 'Instagram';
      case AccountType.Zalo:
        return 'Zalo';
    }
  }

  String get logo {
    switch (this) {
      case AccountType.Facebook:
        return 'assets/logo/facebook.png';
      case AccountType.Tiktok:
        return 'assets/logo/tiktok.png';
      case AccountType.Google:
        return 'assets/logo/google.png';
      case AccountType.Twitter:
        return 'assets/logo/twitter.png';
      case AccountType.Instagram:
        return 'assets/logo/instagram.png';
      case AccountType.Zalo:
        return 'assets/logo/zalo.png';
    }
  }
}

enum MenuItem { edit, delete }

enum LinkType { safe, unsafe, suspicious }

extension LinkTypeName on LinkType {
  String get name {
    switch (this) {
      case LinkType.safe:
        return 'An toàn';
      case LinkType.unsafe:
        return 'Không an toàn';
      case LinkType.suspicious:
        return 'Cảnh báo lừa đảo';
    }
  }

  IconData get icon {
    switch (this) {
      case LinkType.safe:
        return LucideIcons.shield_check;
      case LinkType.unsafe:
        return LucideIcons.shield_x;
      case LinkType.suspicious:
        return LucideIcons.badge_alert;
    }
  }
}
