part of '../../player_module.dart';

class PlayerBottomBar extends StatelessWidget {
  PlayerBottomBar({super.key});

  final PlayerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: Platform.isIOS ? 86 : 64,
        decoration: BoxDecoration(
          borderRadius: _borderRadius(controller.isPlaying()),
          color: ColorConstants.primaryColor.withOpacity(controller.isPlaying()
              ? (0.7 + 0.3 * controller.miniPlayerOpacity().clamp(0.0, 1))
              : 0.7),
        ),
        child: ClipRRect(
          borderRadius: _borderRadius(controller.isPlaying()),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: action(),
          ),
        ),
      ),
    );
  }

  Widget action() {
    return Padding(
      padding:
          EdgeInsets.only(left: 0, right: 0, bottom: Platform.isIOS ? 18 : 0),
      child: Row(
        children: [
          actionButton(AssetConstants.home),
          actionButton(AssetConstants.search),
          const Expanded(
              child: CircularButton(imagePath: AssetConstants.microphone)),
          actionButton(AssetConstants.community),
          profile,
        ],
      ),
    );
  }

  Widget actionButton(String path) {
    return Expanded(child: ImageButton(path));
  }

  BorderRadius _borderRadius(bool isPlaying) {
    return !isPlaying
        ? const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )
        : BorderRadius.zero;
  }

  Widget get profile => Expanded(
        child: SizedBox(
            height: 28,
            child: Image.asset(
              AssetConstants.profile,
              fit: BoxFit.fitHeight,
            )),
      );
}
