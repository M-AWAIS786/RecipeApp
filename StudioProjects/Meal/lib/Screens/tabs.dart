import 'package:flutter/material.dart';
import 'package:meal/Model/MealModel.dart';
import 'package:meal/Screens/categories.dart';
import 'package:meal/Screens/filters.dart';
import 'package:meal/Screens/meals.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/widgets/main_drawer.dart';

const  kInitialFilters ={
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vigon: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<MealModel> _favouriteMeals = [];
   Map<Filter,bool> _selectedFilters = kInitialFilters;



  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      duration: const Duration(seconds: 2),
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    ));
  }

  void _toggleMealFavouriteStatus(MealModel mealModel) {
    final isAlreadyFavourite = _favouriteMeals.contains(mealModel);

    if (isAlreadyFavourite) {
      setState(() {
        _favouriteMeals.remove(mealModel);
      });
      _showInfoMessage("Meal is Added in favourite");
    } else {
      setState(() {
        _favouriteMeals.add(mealModel);
      });
      _showInfoMessage("Meal is no longer a favourite");
    }
  }

  void _selectPage(int index) {
    print(index);
    setState(() {
      _selectedPageIndex = index;
    });
  }



  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
   final result = await Navigator.of(context)
          .push<Map<Filter,bool>>(MaterialPageRoute(
          builder: (context) =>  filterScreen(
          currentFilters: _selectedFilters,
          ),),);
      print(result);
      setState(() {
        _selectedFilters =result ??kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final availableMeals = dummyMeal.where((element) {
      if(_selectedFilters[Filter.glutenFree]! && !element.isGlutenFree) {
        return false;
      }
      if(_selectedFilters[Filter.lactoseFree]! && !element.isLactoseFree) {
        return false;
      }
      if(_selectedFilters[Filter.vegetarian]! && !element.isVegetarian) {
        return false;
      }
      if(_selectedFilters[Filter.vigon]! && !element.isVegan) {
        return false;
      }
      return true;
    }).toList();




    Widget activePage = CategoriesScreen(
      onToggleFavourite: _toggleMealFavouriteStatus,
      availableMeals: availableMeals,

    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMealFavouriteStatus,
      );
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          return _selectPage(index);
        },
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
