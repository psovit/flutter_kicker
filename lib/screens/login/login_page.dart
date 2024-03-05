import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import '../../utils/responsive.dart';
import '../../widgets/buttons/google_sso.dart';
import '../../widgets/login_terms.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQDSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        desktop: Row(
          children: [
            _leftBody(mediaQDSize),
            Expanded(child: _rightBody(context)),
          ],
        ),
        tablet: Row(
          children: [
            _leftBody(mediaQDSize),
            Expanded(child: _rightBody(context)),
          ],
        ),
        mobile: SizedBox(
          width: double.infinity,
          child: _rightBody(context),
        ),
      ),
    );
  }

  Widget _leftBody(Size mediaQDSize) {
    return Stack(
      children: [
        Container(
          height: mediaQDSize.height,
          width: mediaQDSize.width / 2,
          color: AppColors.webImageBgColor,
          child: const Image(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/web_login.png',
            ),
          ),
        ),
        Positioned(
          bottom: 120,
          left: 15,
          child: RichText(
            textAlign: TextAlign.start,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Ready To Unlock \n',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                WidgetSpan(
                  child: SizedBox(height: 55),
                ),
                TextSpan(
                  text: 'Your True Potential?',
                  style: TextStyle(
                    fontSize: 34.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _rightBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 80,
          child: Text(
            appName.substring(0, 1),
            style: const TextStyle(
              fontSize: 100,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Log in to $appName",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 20),
        const GoogleSsoButton(),
        const SizedBox(height: 20),
        const TermsPrivacyText(),
      ],
    );
  }
}
