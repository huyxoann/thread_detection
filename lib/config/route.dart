import 'package:go_router/go_router.dart';
import 'package:thread_detection/pages/confirm_new_pin.dart';
import 'package:thread_detection/pages/create_password_page.dart';
import 'package:thread_detection/pages/edit_password.dart';
import 'package:thread_detection/pages/home_page.dart';
import 'package:thread_detection/pages/list_password_page.dart';
import 'package:thread_detection/pages/login_screeen.dart';
import 'package:thread_detection/pages/new_pin_screen.dart';
import 'package:thread_detection/pages/password_detail.dart';

final router = GoRouter(initialLocation: '/login', routes: [
  GoRoute(
    name: 'login',
    path: '/login',
    builder: (context, state) => const LoginScreeen(),
  ),
  GoRoute(
    name: 'home',
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    name: 'account-list',
    path: '/account-list',
    builder: (context, state) => const ListPasswordPage(),
  ),
  GoRoute(
    name: 'create-password',
    path: '/create-password',
    builder: (context, state) => const CreatePasswordPage(),
  ),
  GoRoute(
    name: 'account-details',
    path: '/details',
    builder: (context, state) {
      final id = state.uri.queryParameters['id'];
      return PasswordDetailPage(id: id ?? "");
    },
  ),
  GoRoute(
    name: 'new-pin',
    path: '/new',
    builder: (context, state) => const NewPinScreen(),
  ),
  GoRoute(
    name: 'confirm-pin',
    path: '/new/confirm-pin',
    builder: (context, state) {
      final pin = state.uri.queryParameters['pin'];
      return ConfirmPinScreen(pin: pin ?? "");
    },
  ),
  GoRoute(
    name: 'edit-password',
    path: '/password/edit',
    builder: (context, state) {
      final id = state.uri.queryParameters['id'];
      return EditPasswordPage(id: id ?? "");
    },
  )
]);
