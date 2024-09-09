import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dbirr/views/auth/forgot_password.dart';
import 'package:dbirr/views/auth/locked.dart';
import 'package:dbirr/views/auth/login.dart';
import 'package:dbirr/views/auth/register.dart';
import 'package:dbirr/views/auth/reset_password.dart';
import 'package:dbirr/views/forms/basic_page.dart';
import 'package:dbirr/views/forms/form_mask.dart';
import 'package:dbirr/views/forms/validation.dart';
import 'package:dbirr/views/other/basic_table.dart';
import 'package:dbirr/views/starter.dart';
import 'package:dbirr/views/ui/buttons_page.dart';
import 'package:dbirr/views/ui/cards_page.dart';
import 'package:dbirr/views/ui/carousels.dart';
import 'package:dbirr/views/ui/notifications.dart';
import 'package:dbirr/views/ui/tabs_page.dart';

import '/services/auth_services.dart';
import 'views/dashboard.dart';
import 'views/error_pages/coming_soon_page.dart';
import 'views/error_pages/error_404.dart';
import 'views/error_pages/error_500.dart';
import 'views/error_pages/maintenance_page.dart';
import 'views/ui/landing_page.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthService.isLoggedIn
        ? null
        : const RouteSettings(name: '/auth/login');
  }
}

getPageRoute() {
  var routes = [
    GetPage(
        name: '/',
        page: () => const DashboardPage(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/starter',
        page: () => const Starter(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/dashboard',
        page: () => const DashboardPage(),
        middlewares: [AuthMiddleware()]),

    ///---------------- Auth ----------------///

    GetPage(name: '/auth/login', page: () => const LoginPage()),
    GetPage(name: '/auth/forgot_password', page: () => const ForgotPassword()),
    GetPage(name: '/auth/register', page: () => const Register()),
    GetPage(name: '/auth/reset_password', page: () => const ResetPassword()),
    GetPage(
        name: '/auth/locked',
        page: () => const LockedPage(),
        middlewares: [AuthMiddleware()]),

    ///---------------- UI ----------------///

    GetPage(
        name: '/ui/buttons',
        page: () => const ButtonsPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/cards',
        page: () => const CardsPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/tabs',
        page: () => const TabsPage(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/ui/carousels',
        page: () => const Carousels(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/ui/notification',
        page: () => const Notifications(),
        middlewares: [AuthMiddleware()]),

    // GetPage(
    //     name: '/ui/discover',
    //     page: () => const DiscoverJobs(),
    //     middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/landing',
        page: () => const LandingPage(),
        middlewares: [AuthMiddleware()]),

    ///---------------- Error ----------------///

    GetPage(
        name: '/coming-soon',
        page: () => const ComingSoonPage(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/error-404',
        page: () => const Error404(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/error-500',
        page: () => const Error500(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/maintenance',
        page: () => const MaintenancePage(),
        middlewares: [AuthMiddleware()]),

    ///---------------- Form ----------------///

    GetPage(
        name: '/form/basic',
        page: () => const BasicPage(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/form/validation',
        page: () => const ValidationPage(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/form/form-mask',
        page: () => const FormMaskPage(),
        middlewares: [AuthMiddleware()]),

    ///---------------- Other ----------------///

    GetPage(
        name: '/other/basic_tables',
        page: () => const BasicTable(),
        middlewares: [AuthMiddleware()]),
  ];
  return routes
      .map(
        (e) => GetPage(
            name: e.name,
            page: e.page,
            middlewares: e.middlewares,
            transition: Transition.noTransition),
      )
      .toList();
}
