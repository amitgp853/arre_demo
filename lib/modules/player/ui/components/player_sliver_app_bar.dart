import 'package:arre_demo/modules/player/player_module.dart';
import 'package:flutter/material.dart';

class PlayerSliverAppBar extends StatelessWidget {
  const PlayerSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        PlayerAppBar(),
      ],
      body: PlayerContent(),
    );
  }
}
