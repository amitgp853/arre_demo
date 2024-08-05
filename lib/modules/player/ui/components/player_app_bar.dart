part of '../../player_module.dart';

class PlayerAppBar extends StatelessWidget {
  PlayerAppBar({super.key});

  final PlayerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return _sliverAppBar();
  }

  Widget _sliverAppBar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: _borderRadius(true)),
      backgroundColor: ColorConstants.primaryColor.withOpacity(0.7),
      expandedHeight: 55,
      flexibleSpace: ClipRRect(
        borderRadius: _borderRadius(true),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ),
      leadingWidth: 68,
      leading: _leadingIcon(),
      actions: _actions(),
    );
  }

  Widget _leadingIcon() {
    return const Padding(
      padding: EdgeInsets.only(left: 12, bottom: 4),
      child: SvgImage(
        AssetConstants.arreLogo,
        width: 55,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  List<Widget> _actions() {
    return const [
      SvgImage(AssetConstants.notification),
      Padding(
        padding: EdgeInsets.only(left: 24, right: 16),
        child: SvgImage(
          AssetConstants.chat,
        ),
      ),
    ];
  }

  BorderRadius _borderRadius(bool isScrolled) {
    return isScrolled
        ? const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )
        : BorderRadius.zero;
  }

  Decoration get _decoration => BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorConstants.shadowColor.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      );
}
