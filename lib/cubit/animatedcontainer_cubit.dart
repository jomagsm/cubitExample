import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'animatedcontainer_state.dart';

class AnimatedcontainerCubit extends Cubit<AnimatedcontainerState> {
  AnimatedcontainerCubit()
      : super(AnimatedcontainerState(
            width: 100,
            heigh: 100,
            radius: 10,
            color: Color.fromARGB(13, 18, 100, 50)));
  change() => emit(AnimatedcontainerState(
      width: random(1, 350).toDouble(),
      heigh: random(1, 350).toDouble(),
      radius: random(1, 350).toDouble(),
      color: Color.fromARGB(
          random(1, 256), random(1, 256), random(1, 256), random(1, 256))));

  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }
}
