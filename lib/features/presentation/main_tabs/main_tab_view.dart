import 'package:assignment_test/features/presentation/main_tabs/cubit/update_tab_cubit.dart';
import 'package:assignment_test/features/presentation/main_tabs/tabs/fix/fix_tab_view.dart';
import 'package:assignment_test/features/presentation/main_tabs/tabs/items/items_tab_view.dart';
import 'package:assignment_test/features/presentation/main_tabs/tabs/login/cubit/login_cubit.dart';
import 'package:assignment_test/features/presentation/main_tabs/tabs/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainTabsView extends StatelessWidget {
  const MainTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateTabCubit(),
      child: BlocBuilder<UpdateTabCubit, UpdateTabState>(
  builder: (context, state) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Potato Tech Flutter Assignment"),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: const Tab(
                    child: Text('Login'),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: const Tab(
                    child: Text('Items'),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: const Tab(
                    child: Text('Fix'),
                  ),
                ),
              ],
              onTap: (v) {
                context.read<UpdateTabCubit>().updateTabIndex(v);
              },
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _tabBars(context.watch<UpdateTabCubit>().state.tabIndex),
            ),
          ),
        ),
      );
  },
),
    );
  }

  Widget _tabBars(int index) {
    switch (index) {
      case 0:
        return  BlocProvider(
  create: (context) => LoginCubit(),
  child: const LoginTabView(),
);
      case 1:
        return const ItemsTabView();
      default:
        return const FixTabView();
    }
  }
}
