import 'package:cread/core/base/view/base_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cread/view/auth/splash/viewmodel/splash_view_model.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../feature/widget/Indicator/page_indicator.dart';

//refactor the splash screen later
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashViewModel viewModel = SplashViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      builder: buildScaffold,
    );
  }

  Scaffold buildScaffold(BuildContext context, SplashViewModel viewModel) {
    PageController _pageController = PageController(initialPage: 0);
    viewModel.pageController = _pageController;
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 3,
          child: PageView.builder(
              itemCount: viewModel.splashItems.length,
              controller: _pageController,
              onPageChanged: (value) {
                viewModel.setCurrentPage(value);
              },
              itemBuilder: (context, index) {
                return pageBuilder(viewModel, index);
              }),
        ),
      ]),
    );
  }

  Column pageBuilder(SplashViewModel viewModel, int index) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Lottie.asset(viewModel.splashItems[index].splashPath),
        ),
        Expanded(
          flex: 2,
          child: splashContent(viewModel, index),
        ),
        Expanded(flex: 1, child: indicatorBuilder(viewModel)),
        Expanded(
          flex: 1,
          child: nextPageButton(viewModel),
        ),
      ],
    );
  }

  Column splashContent(SplashViewModel viewModel, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(viewModel.splashItems[index].title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          width: double.infinity,
          child: Text(
            viewModel.splashItems[index].description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Padding nextPageButton(SplashViewModel viewModel) {
    // create a extension for this
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.blue,
            ),
          ),
          onPressed: () {
            viewModel.nextPage();
          },
          child: Observer(builder: (_) {
            return Text(
              viewModel.currentPage == viewModel.splashItems.length - 1
                  // add localization of this texts on translation file
                  ? 'Get Started'
                  : 'Next',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            );
          }),
        ),
      ),
    );
  }

  ListView indicatorBuilder(SplashViewModel viewModel) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Observer(
          builder: (_) {
            return PageIndicator(
              is_selected: viewModel.currentPage == index,
            );
          },
        );
      },
    );
  }
}
