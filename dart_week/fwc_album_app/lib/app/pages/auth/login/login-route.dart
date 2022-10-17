import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/pages/auth/login/login/login_service.dart';
import 'package:fwc_album_app/app/pages/auth/login/login/login_service_impl.dart';
import 'package:fwc_album_app/app/pages/auth/login/login/presenter/login_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/login/login/presenter/login_presenter_impl.dart';

import 'login_page.dart';

class LoginRoute extends FlutterGetItPageRoute {
  const LoginRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<LoginService>(
            (i) => LoginServiceImpl(authRepository: i())),
        Bind.lazySingleton<LoginPresenter>(
          (i) => LoginPresenterImpl(loginService: i()),
        )
      ];

  @override
  WidgetBuilder get page => (context) => LoginPage(
        presenter: context.get(),
      );
}
