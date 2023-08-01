import 'package:devmate/src/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../bloc/swipe/swipe_bloc.dart';
import '../../constants/colors.dart';
import '../widgets/choice_button.dart';
import '../widgets/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: 'Devmare'.text.white.size(28).semiBold.make().centered(),
        actions: [
          const Icon(Icons.message, color: Colors.grey),
          5.w.widthBox,
          const Icon(Icons.person, color: Colors.grey),
          5.w.widthBox,
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SwipeBloc, SwipeState>(
          builder: (context, state) {
            if (state is SwipeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SwipeLoaded) {
              var userCount = state.users.length;
              return Column(
                children: [
                  InkWell(
                    onDoubleTap: () {
                      Navigator.pushNamed(context, '/users',
                          arguments: state.users[0]);
                    },
                    child: Draggable<User>(
                      data: state.users[0],
                      feedback: UserCard(user: state.users[0]),
                      childWhenDragging: (userCount > 1)
                          ? UserCard(user: state.users[1])
                          : Container(),
                      onDragEnd: (drag) {
                        if (drag.velocity.pixelsPerSecond.dx < 0) {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeLeftEvent(user: state.users[0]));
                        } else {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeRightEvent(user: state.users[0]));
                        }
                      },
                      child: UserCard(user: state.users[0]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 60,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<SwipeBloc>()
                                .add(SwipeRightEvent(user: state.users[0]));
                          },
                          child: const ChoiceButton(
                            width: 80,
                            height: 80,
                            size: 30,
                            color: Colors.redAccent,
                            hasGradient: false,
                            icon: Icons.clear_rounded,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<SwipeBloc>()
                                .add(SwipeLeftEvent(user: state.users[0]));
                          },
                          child: const ChoiceButton(
                            width: 80,
                            height: 80,
                            size: 30,
                            color: Colors.white,
                            hasGradient: true,
                            icon: Icons.favorite,
                          ),
                        ),
                        const ChoiceButton(
                          color: Colors.brown,
                          icon: Icons.watch_later_outlined,
                          hasGradient: false,
                          size: 25,
                          height: 80,
                          width: 80,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            if (state is SwipeError) {
              return Center(
                child: Text('There aren\'t any more users.',
                    style: Theme.of(context).textTheme.headlineMedium),
              );
            } else {
              return const Text('Something went wrong.');
            }
          },
        ),
      ),
    );
  }
}