import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/animatedcontainer_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimatedcontainerCubit(),
      child: MaterialApp(
        home: AnimatedContainerMain(),
      ),
    );
  }
}

class AnimatedContainerMain extends StatelessWidget {
  const AnimatedContainerMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AnimatedcontainerCubit, AnimatedcontainerState>(
          builder: (context, state) {
            if (state is AnimatedcontainerState) {
              return AnimatedContainer(
                curve: Curves.ease,
                duration: Duration(seconds: 1),
                decoration: BoxDecoration(
                    color: state.color,
                    borderRadius: BorderRadius.circular(state.radius)),
                width: state.width,
                height: state.heigh,
              );
            }
            return Text("error");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            BlocProvider.of<AnimatedcontainerCubit>(context).change(),
      ),
    );
  }
}
