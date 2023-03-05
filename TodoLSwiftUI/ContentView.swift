//
//  ContentView.swift
//  TodoLSwiftUI
//
//  Created by Shin Toyo on 2023/03/05.
//

import SwiftUI


struct ContentView: View {
    @State var isShowModal = false
    @State var isCounting = false
    @ObservedObject var timer = TimerModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                List {
                    Button(action: {
                        isCounting.toggle()
                        if isCounting {
                            timer.start()
                        }else{
                            timer.stop()
                        }
                    }, label: {
                        HStack {
                            Spacer()
                            Image(systemName: "stopwatch")
                                .imageScale(.small)
                                .foregroundColor((isCounting) ? .white : .black)
                                .font(.system(size: 30))
                            Text((isCounting) ? "Tap to Stop" : "Tap to Start")
                                .foregroundColor((isCounting) ? .white : .black)
                            .shadow(radius: 10)
                            Spacer()
                        }
                        .padding()

                    }).listRowBackground((isCounting) ? Color.black : Color.white)
                    Section(header: Text("Today")) {
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.red)
                            Text("テキストA")
                            Spacer()
                            Text(String(timer.getMMSS()))
                        }
                    }
                    Section(header: Text("Tomorrow")) {
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.red)
                            Text("テキストB")
                            Spacer()
                            Text("00:00")
                        }
                
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.red)
                            Text("テキストC")
                            Spacer()
                            Text("00:00")
                        }
                    }
                    
                }.navigationTitle("Todo List")
                
            }
            
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro")
            .previewDisplayName("iPhone 14 Pro")
    }
}


