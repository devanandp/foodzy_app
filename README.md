# foodzy

Project to demonstrate different taxonomies related to food and list the collections associated with it

### Language used - Flutter(Channel stable, 3.3.9, on macOS 13.0.1 22A400 darwin-arm, locale en-IN)

### Architecture - MVVM

### State Management - Provider

# Folder structure

    |-lib   
        |-base
            |- api_response.dart - Enums for API Response statuses
            |- app_exception.dart - Class for defining different ypes of Exceptions to be handled
        |-feature
            |-cart
              |- models
                  |- cart_model.dart - Model for items in the cart
              |- view
                  |- cart_screen.dart - UI for Cart Screen
              |- viewmodel
                  |- cart_view_model.dart - Provider class for Cart related actions
              |- widgets
                  |- cart_item_widget.dart - Cart Individual Item Widget
              |-categories
                  |- models
                      |- categories_detail_model.dart - Model related to individual items in each Category
                      |- categories_model.dart - Model related to Category List
                  |- repository
                      |- categories_repository.dart - Repository for Categories related actions
                  |- service
                      |- categories_service.dart - Services handling API Calls and provide the data related to Categories
                  |- view
                      |- categories_screen.dart - UI Screen for Categories Listing - Main Screen
                      |- home_base.dart - Creates the Home base for Tab Navigations
                  |- viewmodel
                      |- categories_view_model.dart - Categories related Provider containing getters and setters
              |- splash
                  |- view
                      |- splash_screen.dart - A simple splash screen appearing at the app initialisation
        |- utils
            |- constants.dart - Constants used across the app
            |- images.dart - Images Singleton Instance
            |- route_strings.dart - Routs Singleton Instance
            |- theme.dart - Theme data used across the app
        |- widgets
            |- button
                |- resizable_button.dart - Customized Button used across the app
            |- dialog
                |- custom_dialog.dart - Customized Model used across the app
        |- app.dart - App Build starts from here and Providers are instantiated
        |-foodzy_app.dart - List of all export statements needs to be exported
        |- main.dart - App Initialisation
    |- test
        |- view
            |- categories_screen_test.dart - Widget testing for Categories Screen
        |- viewmodel
            |- cart_view_model_test.dart - Unit Testing for Cart Provider
       
       
 # Commands to Run
    
    flutter run - To run the app
    flutter test - To run the test suite
    flutter pub get - To get the dependencies declared in pubspec.yaml file
    
# Screenshots
![Simulator Screen Shot - iPhone 14 Pro Max - 2022-12-06 at 01 22 31](https://user-images.githubusercontent.com/24209814/205730956-67eb0035-540c-4af3-be8c-5bcc6bbc066d.png)


![Simulator Screen Shot - iPhone 14 Pro Max - 2022-12-06 at 01 22 37](https://user-images.githubusercontent.com/24209814/205730978-6d835159-a8a5-465a-9e60-f8729dade570.png)


![Simulator Screen Shot - iPhone 14 Pro Max - 2022-12-06 at 01 22 45](https://user-images.githubusercontent.com/24209814/205730989-564f7cd1-77d4-4e97-9227-3b237c98883d.png)


![Simulator Screen Shot - iPhone 14 Pro Max - 2022-12-06 at 01 23 00](https://user-images.githubusercontent.com/24209814/205731014-b6587908-409b-4bf0-82ee-f7539cdac9ae.png)


![Simulator Screen Shot - iPhone 14 Pro Max - 2022-12-06 at 01 23 06](https://user-images.githubusercontent.com/24209814/205731026-9f2f8ab5-681a-4851-a5f6-1fd5869b240c.png)


