import 'package:brew_dash_app/components/my_button.dart';
import 'package:brew_dash_app/models/food.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
      // intialize selected addons to fasle
      for (Addon addon in food.availableAddons) {
        selectAddons[addon] = false;
      }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  
// method to add to cart
void addToCart(Food food, Map<Addon, bool> selectedAddons) {
  // close the current food page to go back to menu
  Navigator.pop(context);

  // format the selected addons
  List<Addon> currentlySelectedAddons = [];
  for (Addon addon in widget.food.availableAddons) {
    if (widget.selectAddons[addon] == true) {
      currentlySelectedAddons.add(addon);
    }
  }
  // add to cart
  context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
}

  
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
    //scaffold ui
    Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // food image
            Image.asset(widget.food.imagePath),
          
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // food name
                Text(
                  widget.food.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ), 
                ), 
        
                Text(
                  '\$${widget.food.price}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ), 
                ), 
        
                const SizedBox(height: 10,),
                // food description
                Text(widget.food.description,), 
        
                const SizedBox(height: 10,),
                 
                Divider(color: Theme.of(context).colorScheme.secondary,),
                 
                const SizedBox(height: 10,),
        
                // addons
                Text(
                  "Add-ons",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ), 
                ), 
                
                const SizedBox(height: 10,),
        
                Container(
                  decoration: BoxDecoration(border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary),
                        borderRadius: BorderRadius.circular(8),
                    ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: widget.food.availableAddons.length,
                    itemBuilder: (context, index) {
                      // get individual addon
                      Addon addon = widget.food.availableAddons[index];
                  
                      // return check box UI
                      return CheckboxListTile(
                        title: Text(addon.name),
                        subtitle: Text('\$${addon.price}', style: TextStyle(color: Theme.of(context).colorScheme.primary,
                        ),
                        ),
                        value: widget.selectAddons[addon],
                        onChanged: (bool? value) {
                          setState(() {
                            widget.selectAddons[addon] = value!;
                          });
                        },
                      ); // CheckboxListTile
                    },
                  ),
                ), ],),
              ),
              //button to cart
        
              MyButton(
                onTap: () => addToCart(widget.food, widget.selectAddons),
                text: "Add to cart",
              ),

              const SizedBox(height: 25,),
          ],
        ),
      ), 
    ),
      //back button 
      SafeArea(
        child: Opacity(
          opacity: 0.6,
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            decoration: 
              BoxDecoration(color: Theme.of(context).colorScheme.secondary, 
              shape: BoxShape.circle,
              ),
            child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
