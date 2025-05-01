import 'package:bloc/bloc.dart';
import 'package:bloc_state/data/model/products_model.dart';
import 'package:bloc_state/data/repo/products_repo.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  List<Products> products = [];
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  List<Products> getAllProducts(){
    productsRepo.getAllProducts().then((products){
      emit(ProductsLoaded(products));
      this.products = products;
    });
    return products;
  }
}
