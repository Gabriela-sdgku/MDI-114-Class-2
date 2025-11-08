//
//  SimpleAdaptivityDemo.swift
//  MDI-114 Class 2
//
//  Created by SDGKU on 03/11/25.
//

import SwiftUI
struct SimpleAdaptivityDemo: View {
    @State private var isAlignedToLeading = true
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                Text("SwiftUI Adaptive Layout")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("This interface adapts its layout based on screen orientation and demonstrates dynamic alignment.")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding()
            .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Adaptive Container")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                if horizontalSizeClass == .regular {
                    HStack(spacing: 15) {
                        InfoCardView(title: "Device Orientation", description: "Layout changes from portrait to landscape.", iconName: "ipad.landscape", color: .blue)
                        InfoCardView(title: "Size Classes", description: "Using .horizontalSizeClass for adaptability.", iconName: "arrow.left.and.right.square", color: .green)
                    }
                } else {
                    VStack(spacing: 15) {
                        InfoCardView(title: "Device Orientation", description: "Layout changes from portrait to landscape.", iconName: "ipad", color: .blue)
                        InfoCardView(title: "Size Classes", description: "Using .horizontalSizeClass for adaptability.", iconName: "arrow.up.and.down.square", color: .green)
                    }
                }
            }
            .padding()
            
            Divider().padding()

            VStack(alignment: .leading, spacing: 12) {
                Text("Dynamic Alignment")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                HStack {
                    if !isAlignedToLeading {
                        Spacer()
                    }
                    
                    Text("Movable Element")
                        .font(.headline)
                        .padding()
                        .background(isAlignedToLeading ? Color.orange.opacity(0.8) : Color.purple.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .animation(.spring(response: 0.5, dampingFraction: 0.6), value: isAlignedToLeading)
                    
                    if isAlignedToLeading {
                        Spacer()
                    }
                }
                .padding()
                .background(Color(.secondarySystemGroupedBackground))
                .cornerRadius(12)
            }
            .padding()

            Spacer()

            Button(action: {
                isAlignedToLeading.toggle()
            }) {
                HStack {
                    Image(systemName: isAlignedToLeading ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                    Text(isAlignedToLeading ? "Align to Trailing" : "Align to Leading")
                }
                .font(.headline)
                .fontWeight(.semibold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(radius: 5)
                .padding()
            }
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle("Simple Adaptivity")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SimpleAdaptivityDemo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { 
            SimpleAdaptivityDemo()
                .previewDevice("iPad Pro (12.9-inch) (6th generation)")
        }
    }
}
