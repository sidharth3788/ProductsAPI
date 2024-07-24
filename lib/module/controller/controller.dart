import 'package:get/get.dart';
import '../../core/network/api_provider.dart';
import '../../module/model/product_response.dart';

class ShopController extends GetxController {
  var products = <ShopItem>[].obs;
  ApiProvider apiProvider = ApiProvider();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      List<ShopItem> fetchedProducts = await apiProvider.fetchProducts();
      products.assignAll(fetchedProducts);
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
}
