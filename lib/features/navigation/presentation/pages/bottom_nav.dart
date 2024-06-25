import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../../../lib.dart';

class BottomNav extends StatefulWidget {
  final int _selectedIndex;

  const BottomNav({
    Key? key,
    int selectedIndex = 0,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int _activedIndex = 0;
  final List<BottomNavigationEntity> _bottomNavList =
      BottomNavigationEntity.bottomNavList;

  @override
  Widget build(BuildContext context) {
    return ScaffoldConstraint(
      keyGlobal: _key,
      resizeToAvoidBottomInset: true,
      onWillPop: () {},
      isBottomNavBar: true,
      backgroundColor: AppColors.white,
      bottomNavigationBar: _bottomNavigation(context),
      child: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _activedIndex,
              children: [
                const Center(
                  child: Text("data"),
                ),
                const Center(
                  child: Text("data"),
                ),
                const Center(
                  child: Text("data"),
                ),
                const Center(
                  child: Text("data"),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: SafeArea(
          child: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(eccentricity: 0.0, side: BorderSide.none),
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _bottomNavigation(BuildContext ctx) {
    return AnimatedBottomNavigationBar(
      icons: _bottomNavList.map((e) => e.icon).toList(),
      activeIndex: _activedIndex,
      splashColor: AppColors.secondary,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      rightCornerRadius: 10,
      leftCornerRadius: 10,
      iconSize: 25,
      elevation: 2,
      inactiveColor: AppColors.black.withOpacity(0.5),
      onTap: (index) => _onItemTappedIndex(index, ctx),
    );
  }

  Future<void> _onItemTappedIndex(int index, BuildContext ctx) async {
    FocusScope.of(context).unfocus();
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _activedIndex = index;
    });
  }
}
