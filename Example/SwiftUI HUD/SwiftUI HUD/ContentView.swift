//
//  ContentView.swift
//  SwiftUI HUD
//
//  Created by Deepak on 14/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var count = 0.0
    
    var body: some View {
        ZStack {
            Color(uiColor: UIColor.systemGroupedBackground)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack {
                        Spacer().frame(height: 100)
                        Button {
                            self.showSpinner()
                        } label: {
                            Text("Spinner")
                                .font(.system(size: 15))
                        }
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(.purple)
                        .clipShape(Capsule())
                        Spacer().frame(height: 30)
                        
                        Button {
                            self.showSpinner(spinnerSize: .large)
                        } label: {
                            Text("Large spinner")
                                .font(.system(size: 15))
                        }
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(.orange)
                        .clipShape(Capsule())
                        Spacer().frame(height: 30)
                    }
                    VStack {
                        Button {
                            self.showSpinner(text: "Please wait..", textPosition: .top)
                        } label: {
                            Text("Spinner with top text")
                                .font(.system(size: 15))
                        }
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                        Spacer().frame(height: 30)
                        
                        Button {
                            self.showSpinner(text: "Please wait..")
                        } label: {
                            Text("Spinner with bottom text")
                                .font(.system(size: 15))
                        }
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(.cyan)
                        .clipShape(Capsule())
                        Spacer().frame(height: 30)
                    }
                    
                    VStack {
                        Button {
                            self.showProgress(progress: $count)
                        } label: {
                            Text("Progress bar")
                                .font(.system(size: 15))
                        }
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(.brown)
                        .clipShape(Capsule())
                        Spacer().frame(height: 30)
                        
                        Button {
                            self.showProgress(title: "Please wait..", progress: $count, totoalProgress: 100.0, textPosition: .bottom)
                        } label: {
                            Text("Progress bar with text")
                                .font(.system(size: 15))
                        }
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(.indigo)
                        .clipShape(Capsule())
                        Spacer().frame(height: 30)
                    }
                    
                    VStack {
                        Button {
                            self.showSpinner(text: "Please wait..", backgroundColor: .orange, textColor: .white)
                        } label: {
                            Text("Different color")
                                .font(.system(size: 15))
                        }
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(.pink)
                        .clipShape(Capsule())
                        Spacer().frame(height: 30)
                        
                        Button {
                            self.showCustomProgressView(view: CustomView())
                        } label: {
                            Text("Custom view HUD")
                                .font(.system(size: 15))
                        }
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(.mint)
                        .clipShape(Capsule())
                        Spacer().frame(height: 30)
                    }
                    
                    Spacer()
                    Stepper("", value: $count, in: 0...100, step: 10.0)
                        .labelsHidden()
                    Button {
                        self.hideProgress()
                    } label: {
                        Text("Hide")
                            .font(.system(size: 20))
                    }
                    .frame(width: 200, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .background(.red)
                    .clipShape(Capsule())
                    Spacer().frame(height: 80)
                }
            }
        }.ignoresSafeArea()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "face.smiling")
                .frame(alignment:.center)
                .font(.system(size: 30))
            Spacer()
                .frame(height: 20)
            Text("Hello world!")
                .frame(alignment:.center)
        }
    }
}
