import 'package:bommeong/views/chat/chat_screen.dart';
import 'package:bommeong/views/home/doginfo_screen.dart';
import 'package:bommeong/views/like/like_screen.dart';
import 'package:bommeong/views/login/loading_screen.dart';
import 'package:bommeong/views/login/login_screen.dart';
import 'package:bommeong/views/message/message_screen.dart';
import 'package:bommeong/views/my/my_screen.dart';
import 'package:bommeong/views/widget/privacy/privacy_consent_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bommeong/views/base/base_screen.dart';
import 'package:bommeong/views/home/home_screen.dart';
import 'package:bommeong/views/root/custom_bottom_navigation_bar.dart';
import '../../viewModels/root/root_viewmodel.dart';
import 'package:bommeong/views/widget/privacy/privacy_consent_screen.dart';

class RootScreen extends BaseScreen<RootViewModel> {
  const RootScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    print(viewModel.selectedIndex);
    return Obx(
      () => IndexedStack(
        index: viewModel.selectedIndex,
        children: [
          HomeScreen(), //1
          ChatScreen(), // 2
          LikeScreen(), // 3
          MyScreen(), // 4
          DogInfoScreen(), // 5
          MessageScreen(), // 6
          OnboardingScreen(0), //7
          OnboardingScreen(2), //8
        ],
      ),
    );
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) {
    return const CustomBottomNavigationBar();
  }

  @override
  bool get extendBodyBehindAppBar => true;

  @override
  Color? get unSafeAreaColor => const Color(0xFF0D0B26);

  @override
  bool get setTopOuterSafeArea => false;
}
