part of '../../player_module.dart';

class PlayerListItem extends StatelessWidget {
  PlayerListItem({super.key});

  final PlayerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.playMusic,
      child: Image.asset(
        AssetConstants.musicCard,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
