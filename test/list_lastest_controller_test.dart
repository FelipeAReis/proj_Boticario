import 'package:flutter_test/flutter_test.dart';
import 'package:proj_boticario/Controller/list_lastest_controller.dart';

main() {

      test('testar retorno da api', () {
        ListLastestController controller = ListLastestController();
        var resultado = controller.getList();
        expect(resultado.toString(), 'Instance of \'Future<List<News>>\'');
      });
}
