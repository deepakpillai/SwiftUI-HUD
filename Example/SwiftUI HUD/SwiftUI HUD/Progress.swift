//
//  Progress.swift
//  SwiftUI HUD
//
//  Created by Deepak on 14/10/22.
//

import SwiftUI

let viewTag = 1267990

enum TextPosition: Int {
    case top
    case bottom
}

enum SpinnerSize: CGFloat {
    case small = 1.0
    case medium = 2.0
    case semiMedium = 2.5
    case large = 3.0
    case extraLarge = 4
}

struct Spinner: View {
    var spinnerSize: SpinnerSize = .medium
    var body: some View {
        VStack {
            ProgressView()
                .scaleEffect(spinnerSize.rawValue)
        }
    }
}

struct SpinnerWithText: View {
    
    var title = "Please wait"
    var spinnerSize: SpinnerSize = .medium
    var textPosition: TextPosition = .top
    var textColor: Color = .black
    
    var body: some View {
        VStack {
            if textPosition == .top {
                Text(title)
                    .font(.system(size: 20))
                    .offset(y: -5)
                    .foregroundColor(textColor)
                Spacer().frame(height: 25)
            }
            ProgressView()
                .scaleEffect(spinnerSize.rawValue)
                .offset(y: textPosition == .top ? -10 : 10)
            if textPosition == .bottom {
                Spacer().frame(height: 30)
                Text(title)
                    .font(.system(size: 20))
                    .foregroundColor(textColor)
                
            }
        }
    }
}

struct ProgressBar: View {
    @Binding var currentProgress: Double
    var totoalProgress = 100.0
    var body: some View {
        VStack {
            ProgressView(value: currentProgress, total: totoalProgress)
                .padding([.leading, .trailing], 5)
        }
    }
}

struct ProgressBarWithText: View {
    @Binding var currentProgress: Double
    var totoalProgress = 0.0
    var title = "Please wait"
    var textPosition: TextPosition = .top
    var textColor: Color = .black
    
    var body: some View {
        VStack {
            if textPosition == .top {
                Text(title)
                    .font(.system(size: 20))
                    .offset(y: -10)
                    .foregroundColor(textColor)
                Spacer().frame(height: 25)
            }
            
            ProgressView(value: currentProgress, total: totoalProgress)
                .offset(y: textPosition == .top ? -10 : 20)
            
            if textPosition == .bottom {
                Spacer().frame(height: 25)
                Text(title)
                    .font(.system(size: 20))
                    .offset(y: 10)
                    .foregroundColor(textColor)
            }
        }.padding([.leading, .trailing], 5)
    }
}

extension View {
    // MARK: - View extensions
    func showSpinner(spinnerSize: SpinnerSize = .medium, backgroundColor: Color = .white) {
        self.hideProgress()
        self.createView(view: Spinner(spinnerSize: spinnerSize), backgroundColor: backgroundColor)
    }
    
    func showSpinner(text: String, textPosition: TextPosition = .bottom, spinnerSize: SpinnerSize = .medium,  backgroundColor: Color = .white, textColor: Color = .black) {
        self.hideProgress()
        self.createView(view: SpinnerWithText(title: text, spinnerSize: spinnerSize, textPosition: textPosition, textColor: textColor), backgroundColor: backgroundColor)
    }
    
    func showProgress(progress: Binding<Double>, totoalProgress: Double = 100, backgroundColor: Color = .white) {
        self.hideProgress()
        self.createView(view: ProgressBar(currentProgress: progress, totoalProgress: totoalProgress), backgroundColor: backgroundColor)
    }
    
    func showProgress(title: String, progress: Binding<Double>, totoalProgress: Double = 100, textPosition: TextPosition = .bottom, backgroundColor: Color = .white, textColor: Color = .black) {
        self.hideProgress()
        self.createView(view: ProgressBarWithText(currentProgress: progress, totoalProgress: totoalProgress, title: title, textPosition: textPosition, textColor: textColor), backgroundColor: backgroundColor)
    }
    
    func showCustomProgressView<someView: View>(view: someView) {
        self.hideProgress()
        self.createView(view: view)
    }
    
    func hideProgress() {
        self.removeFromWindow()
    }
    
    // MARK: - Internal Methods
    private func createView<someView: View>(view: someView, backgroundColor: Color = .white) {
        let view = ProgressConrtoller.prepareRootView(view: view, backgroundColor: backgroundColor)
        self.addToWindow(controller: view)
    }
    
    
    private func addToWindow(controller: UIViewController) {
        let window = UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        window?.addSubview(controller.view)
    }
    
    private func removeFromWindow() {
        let window = UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        if let subviews = window?.subviews {
            for item in subviews {
                item.viewWithTag(viewTag)?.removeFromSuperview()
            }
        }
    }
}

final class ProgressConrtoller<Content> : UIViewController where Content : View {
    
    class func prepareRootView(view: Content, backgroundColor: Color = .white) -> UIViewController {
        let child = UIHostingController(rootView: view)
        let parent = UIViewController()
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.frame = CGRect(x: 5, y: 0, width: 150, height: 130)
        parent.view.addSubview(child.view)
        parent.addChild(child)
        parent.view.backgroundColor = .clear
        parent.view.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 75, y: (UIScreen.main.bounds.height / 2) - 60, width: 150, height: 130)
        parent.view.tag = viewTag
        child.view.layer.cornerRadius = 20
        parent.view.layer.cornerRadius = 20
        child.view.backgroundColor = UIColor(backgroundColor)
        return parent
    }
}
