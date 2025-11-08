//
//  LayoutBuildingBlocks.swift
//  MDI-114 Class 2
//
//  Created by SDGKU on 07/10/25.
//

import SwiftUI

// MARK: - Demo Views

struct FramesVsConstraintsDemo: View {
    @State private var containerWidth: CGFloat = 300
    let minWidth: CGFloat = 200
    let maxWidth: CGFloat = 400

    var body: some View {
        VStack(spacing: 15) {
            ExplanationCard(text: "The **red square** has a fixed frame (`CGRect`). The **blue square** is described by relationships (constraints). See what happens when the container resizes.")

            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 2, dash: [5]))

                Rectangle()
                    .fill(Color.red.opacity(0.8))
                    .frame(width: 80, height: 80)
                    .offset(x: 20, y: 20)
                Rectangle()
                    .fill(Color.blue.opacity(0.8))
                    .frame(width: 80, height: 80)
                    .padding([.top, .trailing], 20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)

            }
        
            .frame(width: containerWidth, height: 200)
            .animation(.interactiveSpring(), value: containerWidth)

            Slider(value: $containerWidth, in: minWidth...maxWidth)
            Text("Adjust Container Width: \(Int(containerWidth)) pts")
                .font(.caption)
        }
    }
}

struct StackViewDemo: View {
    enum SelectableAlignment: String, CaseIterable, Hashable {
        case leading, center, trailing

        var alignment: HorizontalAlignment {
            switch self {
            case .leading: return .leading
            case .center: return .center
            case .trailing: return .trailing
            }
        }
    }
    
    @State private var isVertical = true
    @State private var alignment: SelectableAlignment = .center
    @State private var spacing: CGFloat = 10

    var body: some View {
        VStack(spacing: 15) {
            ExplanationCard(text: "**Stack Views** are the easy button for Auto Layout. They manage constraints for a collection of views in a column or row.")

            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.secondarySystemGroupedBackground))
                
                if isVertical {
                    VStack(alignment: alignment.alignment, spacing: spacing) {
                        content
                    }
                    .padding()
                } else {
                    HStack(spacing: spacing) {
                        content
                    }
                    .padding()
                }
            }
            .animation(.spring(), value: "\(isVertical)-\(spacing)-\(alignment.rawValue)")
            
            VStack {
                Toggle("Vertical Axis", isOn: $isVertical)
                HStack {
                    Text("Spacing:")
                    Slider(value: $spacing, in: 0...40)
                }
                if isVertical {
                    Picker("Alignment", selection: $alignment) {
                        ForEach(SelectableAlignment.allCases, id: \.self) { align in
                            Text(align.rawValue.capitalized).tag(align)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
    }

    @ViewBuilder
    var content: some View {
        Text("A").padding().background(Color.orange).cornerRadius(8)
        Text("Longer B").padding().background(Color.green).cornerRadius(8)
        Text("C").padding().background(Color.purple).cornerRadius(8)
    }
}

struct SizeClassAndTraitDemo: View {
    @Environment(\.horizontalSizeClass) var hSizeClass
    @Environment(\.verticalSizeClass) var vSizeClass
    @Environment(\.displayScale) var displayScale

    var body: some View {
        VStack(spacing: 15) {
            ExplanationCard(text: "**Size Classes** abstract away device specifics. Instead of 'iPad' vs. 'iPhone', we think about available space: **Compact** or **Regular**.")
            
            Group {
                if hSizeClass == .regular {
                    HStack(spacing: 20) {
                        adaptiveContent
                    }
                } else {
                    VStack(spacing: 20) {
                        adaptiveContent
                    }
                }
            }
            .padding()
            .background(Color(.secondarySystemGroupedBackground))
            .cornerRadius(12)
            .animation(.spring(), value: hSizeClass)

            ExplanationCard(text: "Size Classes are part of a **UITraitCollection**, which describes the view's environment. In SwiftUI, we read these from the `Environment`.")
            
            traitInfoView
        }
    }
    
    @ViewBuilder
    var adaptiveContent: some View {
        Image(systemName: "star.fill")
            .font(.largeTitle)
            .foregroundColor(.yellow)
        Text("This layout adapts based on the **Horizontal Size Class**.")
            .font(.headline)
            .multilineTextAlignment(.center)
    }

    @ViewBuilder
    var traitInfoView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Current Trait Collection:")
                .font(.headline)
            
            HStack {
                Text("Horizontal Size Class:")
                Spacer()
                Text(hSizeClass == .compact ? "Compact" : "Regular")
                    .fontWeight(.bold)
                    .foregroundColor(hSizeClass == .compact ? .orange : .green)
            }
            HStack {
                Text("Vertical Size Class:")
                Spacer()
                Text(vSizeClass == .compact ? "Compact" : "Regular")
                    .fontWeight(.bold)
                    .foregroundColor(vSizeClass == .compact ? .orange : .green)
            }
            HStack {
                Text("Display Scale:")
                Spacer()
                Text("@\(Int(displayScale))x")
                    .fontWeight(.bold)
            }
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}


// MARK: - Main View
struct LayoutBuildingBlocks: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("The Building Blocks of Layout")
                    .font(.system(size: 44, weight: .bold, design: .rounded))
                Text("An interactive guide to Auto Layout, Stack Views, and Size Classes.")
                    .font(.title2)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)

                ConceptSection(title: "Auto Layout", icon: "ruler") {
                    ExplanationCard(text: "Auto Layout shifts thinking from setting static frames to **describing relationships** (constraints). Instead of *what to do*, we tell the system our *intent*.")
                    
                    FramesVsConstraintsDemo()

                    ExplanationCard(text: "**Anatomy of a Constraint** 📐\nA constraint is a rule expressed as a linear equation:")
                    ExplanationCard(text: "item1.attribute = multiplier × item2.attribute + constant", isCode: true)
                    
                    ExplanationCard(text: "**Resolving Ambiguity:** Some UI elements, like buttons or labels, have an **Intrinsic Content Size** based on their content, which Auto Layout uses to create constraints automatically.")
                }

                ConceptSection(title: "Your Best Friend: StackView", icon: "square.stack.3d.up.fill") {
                    StackViewDemo()
                }
                
                ConceptSection(title: "Size Classes & Traits", icon: "square.split.2x1") {
                    SizeClassAndTraitDemo()
                }
            }
            .padding(.vertical)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Layout Building Blocks")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(false)
    }
}


struct LayoutBuildingBlocks_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LayoutBuildingBlocks()
                .previewDevice("iPad Pro (12.9-inch) (6th generation)")
                .previewInterfaceOrientation(.landscapeLeft)
                .preferredColorScheme(.light)
        }
    }
}
