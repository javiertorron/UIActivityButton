# UIActivityButton
Are you looking for how to put a Activity Indicator inside a button? UIActivityButton fits for you It is like a normal UIButton, but implements two selectors for showing and hiding the loader. Stop showing indicators in your view, and show it ondirectly on your download/send/connect... button.

## How To Use
Copy both .m and .h files into your project and import it where you want to use:

    #import "UIActivityButton"
    
You have 2 options.

### Storyboard use:
Set the class of your UIButton to `UIActivityButton`. In the options you can select Spinner Color for changing the Activity Indicator color.

### Programmatically:

    UIActivityButton *yourButton = [[UIActivityButton alloc] initWithColor:[UIColor redColor]];

## Showing and hiding the activity indicator.

    // You can call this selectors inside UIActivityButton IBAction or even outside
    [yourButton showLoading];   // Hides button title, button image, and deletes UIEdgeInsets
    [yourButton hideLoading];   // Hides activity indicator and restores previous title, image and UIEdgeInsets
    
*NOTE:* You can use the button as a normal UIButton in code or storyboard.
    
So easy!
