part of '../../player_module.dart';

class PlayerSlider extends StatelessWidget {
  const PlayerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2,
      child: Row(
        children: [
          Expanded(
            flex: 30,
            child: Container(
              color: ColorConstants.activeColor,
            ),
          ),
          Expanded(
            flex: 70,
            child: Container(
              color: ColorConstants.inactiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
