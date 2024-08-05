part of '../../player_module.dart';

class PlayerContent extends StatelessWidget {
  PlayerContent({super.key});

  final PlayerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            PlayerList(),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _bottomContent(),
        )
      ],
    );
  }

  Widget _bottomContent() {
    return SizedBox(
      height: Platform.isIOS ? 152 : 130,
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (controller.isPlaying()) MiniPlayer(),
            if (controller.isPlaying()) const PlayerSlider(),
            PlayerBottomBar(),
          ],
        ),
      ),
    );
  }
}
