import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tech_event/constants/constants.dart';
import 'package:tech_event/widgets/commons/rd_future_widget.dart';

import 'drawer_widgets/nous_contacter.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    Constants constantsColor = const Constants();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 3,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  constantsColor.primaryGradient,
                  constantsColor.primary,
                  constantsColor.third,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'asset/logo/tech_event_logo_complet.png',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const Gap(12),
                RDFutureWidget(
                  PackageInfo.fromPlatform().then(
                    (info) => Text(
                      "V ${info.version}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  loader: const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text(
                      "Agenda",
                    ),
                    leading: Icon(
                      Icons.calendar_month_outlined,
                      color: constantsColor.primary,
                    ),
                    onTap: () {},
                  ),
                  const Gap(2),
                  Divider(
                    color: constantsColor.primary,
                  ),
                  const Gap(2),
                  ListTile(
                    title: const Text(
                      "Contactez-nous",
                    ),
                    leading: Icon(
                      Icons.email,
                      color: constantsColor.primary,
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NousContacter(),
                      ),
                    ),
                  ),
                  const Gap(2),
                  Divider(
                    color: constantsColor.primary,
                  ),
                  const Gap(2),
                  ListTile(
                    title: const Text(
                      "A propos",
                    ),
                    leading: Icon(
                      Icons.error,
                      color: constantsColor.primary,
                    ),
                    onTap: () => showLicensePage(
                      context: context,
                      applicationIcon: Image.asset(
                        'asset/logo/tech_event_logo_complet.png',
                        fit: BoxFit.cover,
                        width: 45,
                        height: 45,
                        alignment: Alignment.center,
                      ),
                      applicationLegalese:
                          "© ${DateTime.now().year} Tech Event",
                      useRootNavigator: false,
                    ),
                  ),
                  const Gap(2),
                  Divider(
                    color: constantsColor.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
