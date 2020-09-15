


import 'package:flutter_test/flutter_test.dart';
import 'package:proj_boticario/Controller/home_page_post_controller.dart';


main() {
  TestWidgetsFlutterBinding.ensureInitialized();
   HomePagePostController home = HomePagePostController();

  
  test('Ver se a lista esta voltando vazia', () {
      
      home.loadJson();
      var resultado = home.list;
      expect(resultado.length, 0);
  });




}
