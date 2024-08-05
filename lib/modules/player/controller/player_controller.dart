part of '../player_module.dart';

class PlayerController extends GetxController {
  late ScrollController scrollController;
  double scrollPosition = 0;

  RxBool isScrolled = false.obs;
  RxBool isPlaying = false.obs;
  RxDouble miniPlayerOpacity = 1.0.obs;
  RxDouble miniPlayerHeight = 64.0.obs;

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(_updateScrollPosition);
    super.onInit();
  }

  void _updateScrollPosition() {
    scrollPosition = scrollController.position.pixels;
    if (!isScrolled.value && scrollPosition > 0) {
      isScrolled.value = true;
    } else if (isScrolled.value && scrollPosition == 0) {
      isScrolled.value = false;
    }
  }

  void playMusic() {
    isPlaying.value = true;
    miniPlayerOpacity.value = 1.0;
    miniPlayerHeight.value = 64.0;
  }

  void hideMiniPlayer() {
    isPlaying.value = false;
  }

  void updateOpacity(double newOpacity) {
    miniPlayerOpacity.value = newOpacity;
  }

  void updateHeight(double newPosition) {
    miniPlayerHeight.value = newPosition;
  }
}
