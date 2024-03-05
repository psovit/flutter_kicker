import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants.dart';

class TermsPrivacyText extends StatelessWidget {
  const TermsPrivacyText({super.key});
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text:
                'By signing into $appName, you agree to our ${UniversalPlatform.isWeb ? '\n' : ''} ',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          WidgetSpan(
            child: InkWell(
              child: const Text(
                'Terms',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {
                launchUrl(Uri.parse(termsUrl));
              },
            ),
          ),
          const TextSpan(
            text: ' and ',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          WidgetSpan(
            child: InkWell(
              child: const Text(
                'Privacy Policy.',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {
                launchUrl(Uri.parse(privacyUrl));
              },
            ),
          )
        ],
      ),
    );
  }
}
