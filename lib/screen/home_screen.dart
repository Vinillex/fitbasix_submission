import 'package:auto_route/auto_route.dart';
import 'package:fitbasix_submission/router/app_router.gr.dart';
import 'package:fitbasix_submission/widgets/data_tile.dart';
import 'package:fitbasix_submission/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          HomeAppBarWidget(),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DataTile(
                  icon: Icon(Icons.monitor_heart_outlined,size: 30,),
                  header: 'My Fitness',
                  content: 'Track your daily fitness records',
                  color: Color(0xFF12bf1f),
                  darkColor: Color(0xFF0b7829),
                  onTap: (){
                    context.router.push(MyFitnessRoute());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
