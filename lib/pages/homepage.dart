import 'package:complex_animations/widgets/drawers/custom_drawer.dart';
import 'package:complex_animations/widgets/menus/staggered_menu.dart';

import '../config/constants.dart';
import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../widgets/app_bar.dart';
import 'flight_survey_page.dart';

class HomePage extends StatefulWidget {
  final AppBar appBar;
  const HomePage({Key? key, required this.appBar}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerController;
  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    if (_drawerController.value == 1 ||
        _drawerController.status == AnimationStatus.forward) {
      _drawerController.reverse();
    } else {
      _drawerController.forward();
    }
  }

  Widget _drawerBody() {
    return AnimatedBuilder(
      animation: _drawerController,
      builder: (context, child) {
        return FractionalTranslation(
          translation: Offset(1.0 - _drawerController.value, 0.0),
          child: _drawerController.value == 0.0
              ? const SizedBox()
              : const StaggeredMenu(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomepageColors.homeBackground,
      appBar: appBarWithNoElevation(
        '',
        HomepageColors.homeBackground,
        true,
        AnimatedBuilder(
          animation: _drawerController,
          builder: (context, child) {
            return IconButton(
              onPressed: _toggleDrawer,
              icon: _drawerController.value == 1 ||
                      _drawerController.status == AnimationStatus.forward
                  ? const Icon(Icons.close)
                  : const Icon(Icons.menu),
            );
          },
        ),
      ),

      // drawer: const CustomDrawer(
      //   child: MyDrawer(),
      // ),

      // Drawer(
      //   backgroundColor: AppColors.homeBackground,
      //   child: ListView(
      //     children: const [
      //       DrawerHeader(
      //         child: Text('String'),
      //       ),
      //     ],
      //   ),
      // ),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FlightSurveyPage(),
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 5,
              ),
              child: const Text('Next Page'),
            ),
          ),
          _drawerBody(),
        ],
      ),
    );
  }
}
