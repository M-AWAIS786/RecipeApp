import 'package:flutter/material.dart';
import 'package:meal/Screens/tabs.dart';
import 'package:meal/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vigon,
}

class filterScreen extends StatefulWidget {
  const filterScreen({super.key, required this.currentFilters});

  @override
  State<filterScreen> createState() => _filterScreenState();

  final Map<Filter,bool> currentFilters;
}

class _filterScreenState extends State<filterScreen> {

  var _glutenFreeFiltersSet = false;
  var _lactoseFreeFiltersSet = false;
  var _vegetarianFiltersSet = false;
  var _viganFiltersSet = false;

@override
void initState(){
  super.initState();
  _glutenFreeFiltersSet =widget.currentFilters[Filter.glutenFree]!;
  _lactoseFreeFiltersSet =widget.currentFilters[Filter.lactoseFree]!;
  _vegetarianFiltersSet =widget.currentFilters[Filter.vegetarian]!;
  _viganFiltersSet =widget.currentFilters[Filter.vigon]!;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier=='meals') {
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabsScreen(),));
      //   }
      // }
      // ),
 /***  Push Replacement is used instead of Push: push Replacement in back button close the app***/
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree:_glutenFreeFiltersSet,
            Filter.lactoseFree: _lactoseFreeFiltersSet,
            Filter.vegetarian: _vegetarianFiltersSet,
            Filter.vigon:_viganFiltersSet,
          });
            return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFiltersSet,
              onChanged: (isChecked){
                setState(() {
                  _glutenFreeFiltersSet=isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFiltersSet,
              onChanged: (isChecked){
                setState(() {
                  _lactoseFreeFiltersSet=isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFiltersSet,
              onChanged: (isChecked){
                setState(() {
                  _vegetarianFiltersSet=isChecked;
                });
              },
              title: Text(
                'Vegetarian-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              subtitle: Text(
                'Only include vegetarian-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: _viganFiltersSet,
              onChanged: (isChecked){
                setState(() {
                  _viganFiltersSet=isChecked;
                });
              },
              title: Text(
                'Vigan-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              subtitle: Text(
                'Only include vigan-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34,right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
