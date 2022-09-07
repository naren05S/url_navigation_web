import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:url_navigation_web/LandingPage.dart';
import 'package:url_navigation_web/SplashScreen.dart';
import 'package:url_navigation_web/pages/Arguments.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static Handler _splashHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          SplashScreen());

  static Handler _mainHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          LandingPage(page: params['name'][0])); // this one is for one paramter passing...

  // lets create for two parameters tooo...
  static Handler _mainHandler2 = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        String screen = params['name'][0];
        print(screen);
        switch(screen){
          case "about":
            return Container();//LandingPage(page: params['name'][0],extra: params['extra'][0]);
          default:
            return LandingPage(page: params['name'][0],extra: params['extra'][0]);
        }
      });

  static Handler _mainHandler3 = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        print("======="+params.values.toString());
        String screen = params['name'][0];
        print(screen);
        switch(screen){
          case "about":
            return LandingPage(page: params['name'][0],extra: params['extra'][0],data: params['data'][0]);
          default:
            return LandingPage(page: params['name'][0],extra: params['extra'][0]);
        }
      });

  // ok its all set now .....
  // now lets have a handler for passing parameter tooo....


  static void setupRouter(){
    print("routes");
    router.define(
      '/',
      handler: _splashHandler,
    );
    router.define(
      '/main/:name',
      handler: _mainHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      '/main/:name/:extra',
      handler: _mainHandler2,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
    '/main/:name/:extra/:data',
      handler: _mainHandler3,
      transitionType: TransitionType.fadeIn,
    );
  }

}
class RoutesGetX {
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: MyRoutes.userList, page: () {
      InsurArgument arguments = Get.arguments as InsurArgument;
      return LandingPage(page:Get.arguments.policyNo,extra:Get.arguments.policyNo) ;
  } ),

  ];
}

class MyRoutes {
  static const userList = "/userList";
}