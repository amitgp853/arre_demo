part of '../../player_module.dart';

class MiniPlayer extends StatelessWidget {
  MiniPlayer({super.key});

  final PlayerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onVerticalDragUpdate: _onDragUpdate,
        onVerticalDragEnd: _onDragEnd,
        child: AnimatedOpacity(
          opacity: controller.miniPlayerOpacity.value,
          duration: const Duration(milliseconds: 300),
          child: _miniPlayerContent(),
        ),
      ),
    );
  }

  Widget _miniPlayerContent() {
    return Container(
      height: controller.miniPlayerHeight.value,
      padding: const EdgeInsets.only(left: 12, right: 8),
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        color: ColorConstants.primaryColor,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: _miniPlayerDetails(),
        ),
      ),
    );
  }

  Widget _miniPlayerDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _musicDetails(),
        const ImageButton(AssetConstants.like),
        const CircularButton(
          imagePath: AssetConstants.play,
          size: 12,
        ),
        const ImageButton(AssetConstants.details)
      ],
    );
  }

  Widget _musicDetails() {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConstants.songName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: StringConstants.ubuntuFontFamily,
                  fontSize: 14,
                  color: Colors.white),
            ),
            Text(
              StringConstants.owner,
              style: TextStyle(
                fontFamily: StringConstants.hindFontFamily,
                fontSize: 12,
                color: ColorConstants.activeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BorderRadius get _borderRadius => const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      );

  void _onDragUpdate(DragUpdateDetails details) {
    double newHeight = controller.miniPlayerHeight.value - details.delta.dy;
    newHeight = newHeight.clamp(0.0, 64.0);
    controller.updateHeight(newHeight);

    double newOpacity = newHeight / 64;
    newOpacity = newOpacity.clamp(0.0, 1.0);
    controller.updateOpacity(newOpacity);
  }

  void _onDragEnd(DragEndDetails details) {
    if (controller.miniPlayerOpacity.value < 0.5) {
      controller.hideMiniPlayer();
    } else {
      controller.updateHeight(64.0);
      controller.updateOpacity(1.0);
    }
  }
}
