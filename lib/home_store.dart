import 'package:mobx/mobx.dart';
import 'package:week_22_example/recipe.dart';
import 'package:week_22_example/recipe_service.dart';

part 'home_store.g.dart'; // Указание для кодогенерации

/// HomeStore -- Store, который будет использовать View. Своего рода это ViewModel.
/// _HomeStore -- Наша реализация Store, _$HomeStore -- Store, который
/// будет создан магической кодогенерацией :)
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  // Наблюдаемое, при изменении которого, обновятся все наблюдатели (Observers)
  @observable
  List<Recipe> value = [];

  // Action -- метод, в котором вы обновляете данные. Если обновляются сразу
  // несколько observables, то все наблюдатели будут уведомлены только после
  // всех вычислений.
  @action
  Future fetchData() async {
    final service = RecipeService();
    final result = await service.fetchRecipes();
    value = result;
  }
}
