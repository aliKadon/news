import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/app/presentation/font_manager.dart';

import '../screens/home_screen/controller/home_screen_getx_controller.dart';

class MainDrawer extends StatefulWidget {
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  List<String> types = ['emailed', 'shared', 'viewed'];

  //controller
  late final HomeScreenGetxController _homeScreenGetxController =
      Get.put(HomeScreenGetxController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.white,
            child: Image.asset(
              'assets/images/ny.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width * 1,
            child: Text(
              'Most Popular Article By :',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: FontSize.s16),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: types.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // widget.onOptionSelected(types[index]);
                  _homeScreenGetxController.reload(results1: types[index]);
                  _homeScreenGetxController.getMostViewedArticle(
                      context: context, type: types[index]);
                  Navigator.of(context).pop(types[index]);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text(
                        types[index],
                        style: TextStyle(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

// void _customDialogLanguage(context) async {
//   showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           child: Container(
//             height: 146,
//             width: 360,
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(9),
//             ),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 12,
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     child: Text(
//                       AppLocalizations.of(context)!.language,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600, fontSize: 18),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 12,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       curLocale.setLocale(Locale('en'));
//                       print('=========================language');
//                       print(SharedPrefController().lang1);
//                       SharedPrefController().changeLanguage(language: 'en');
//                       Navigator.of(context)
//                           .pushReplacementNamed('/home_screen');
//                     },
//                     child: Row(
//                       children: [
//                         Text(
//                           AppLocalizations.of(context)!.english,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600, fontSize: 18),
//                         ),
//                         Spacer(),
//                         SharedPrefController().lang1 == 'en'
//                             ? Icon(
//                                 Icons.check,
//                                 color: Colors.lightBlue,
//                               )
//                             : Container(),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 12,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       curLocale.setLocale(Locale('ar'));
//                       SharedPrefController().changeLanguage(language: 'ar');
//                       print('=========================language');
//                       print(SharedPrefController().lang1);
//                       Navigator.of(context)
//                           .pushReplacementNamed('/home_screen');
//                     },
//                     child: Row(
//                       children: [
//                         Text(
//                           AppLocalizations.of(context)!.arabic,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600, fontSize: 18),
//                         ),
//                         Spacer(),
//                         SharedPrefController().lang1 == 'ar'
//                             ? Icon(
//                                 Icons.check,
//                                 color: Colors.lightBlue,
//                               )
//                             : Container(),
//                       ],
//                     ),
//                   ),
//                 ]),
//           ),
//         );
//       });
// }
}
