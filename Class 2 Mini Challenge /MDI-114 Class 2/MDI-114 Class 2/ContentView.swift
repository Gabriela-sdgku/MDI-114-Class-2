//
//  ContentView.swift
//  MDI-144 Class 2
//
//  Created by SDGKU on 07/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Interactive Demos")) {
                    NavigationLink(destination: LayoutBuildingBlocks()) {
                        Label("Layout Building Blocks", systemImage: "ruler.fill")
                    }
                    
                    NavigationLink(destination: SimpleAdaptivityDemo()) {
                        Label("Simple Adaptivity Demo", systemImage: "ipad.and.iphone")
                    }
                }

                Section(header: Text("Student Exercise")) {
                    
                    NavigationLink(destination: ExerciseAdaptiveLayout()) {
                        Label("Exercise: Adaptive Layout", systemImage: "flag.checkered.2.crossed")
                    }
                    
                    NavigationLink(destination: SolutionAdaptiveProfile()) {
                        Label("Solution: Adaptive Profile", systemImage: "person.crop.rectangle.fill")
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("iPad Layout Lessons")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
    }
}
