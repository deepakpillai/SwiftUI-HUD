<p><h1 align="left">SwiftUI HUD</h1></p>
<div><p><img align="right" src="https://github.com/deepakpillai/SwiftUI-HUD/blob/main/SwiftUI%20HUD.gif?raw=true" width="160" />
</p>
<p><h4>Old school HUD is back in SwiftUI. Highly customisable and easy to use HUD developed for SwiftUI.</h4></p>

___

# Usage

1. Drag and Drop Progress.swift into your project
2. You can call below listed methods to show the HUD on screen
    1. Spinner 
    ```swift
    self.showSpinner()
    ```
    2. Progress View
    ```swift
    self.showProgress(progress: $progress)
    ```
    3. Passing custom view 
    ```swift
    self.showCustomProgressView(view: YourCustomView())
    ```
    4. Hide HUD
    ```swift
    self.hideProgress()
    ```
    
* Swift UI HUD support multiple customisation options. 
    * <u>Spinners</u>
        * `spinnerSize:` let you select your prefered spinner size. You will have five options to choose from. `.small`, `.medium`, `.semiMedium`, `.large` & `.extraLarge`
        * `title:` to set your string. 
        * `textPosition:` let you choose your prefered text position. You can choose either `.top` or `.bottom`
        * `textColor:` let you set your prefered color for your text
    * <u>Progress Bar</u>
        * `currentProgress:` let you pass the current progress
        * `totoalProgress:` let you pass the total progress duration 
        * `title:` to set your string. 
        * `textPosition:` let you choose your prefered text position. You can choose either `.top` or `.bottom`
        * `textColor:` let you set your prefered color for your text
    * <u>Show your custom view in HUD</u>
        * `view:`let you pass your view object 
    
    
    

### Installation - Manually

Drop [Progress.swift](https://github.com/deepakpillai/SwiftUI-HUD/blob/main/Example/SwiftUI%20HUD/SwiftUI%20HUD/Progress.swift) into your project.

#SwiftUIHUD
<br>
<br>
<br>

