part of '../../player_module.dart';

class PlayerList extends StatelessWidget {
  PlayerList({super.key});

  final PlayerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
          // controller: controller.scrollController,
          padding: EdgeInsets.zero,
          separatorBuilder: (ctx, i) {
            return const SizedBox(height: 14);
          },
          itemCount: 8,
          itemBuilder: (ctx, i) {
            return PlayerListItem();
          }),
    );
  }
}
