//
//  SolutionAdaptiveProfile.swift
//  MDI-114 Class 2
//
//  Created by SDGKU on 03/11/25.
//

import SwiftUI

struct SolutionExerciseGoalView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
                Image(systemName: "flag.checkered.2.crossed")
                    .font(.title)
                    .foregroundColor(.accentColor)
                Text("The Goal") 
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.bottom, 8)
            
            Text("Your task is to build a beautiful, adaptive user profile card. Arrange the UI elements using Stacks, refine the layout with spacing and alignment, and make it adapt perfectly between compact and regular screen sizes.")
                .font(.body)
            
            HStack(spacing: 15) {
                VStack(spacing: 10) {
                    Text("Compact Width")
                        .font(.headline)
                    Image(systemName: "iphone")
                        .font(.largeTitle)
                    Text("A single, elegant vertical column.")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .frame(height: 40)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(LinearGradient(colors: [.blue.opacity(0.1), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(12)
                
                VStack(spacing: 10) {
                     Text("Regular Width")
                        .font(.headline)
                    Image(systemName: "ipad.landscape")
                        .font(.largeTitle)
                    Text("A clean, two-column layout.")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .frame(height: 40)

                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(LinearGradient(colors: [.green.opacity(0.1), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(12)
            }
            .padding(5)
            .background(Color(.secondarySystemGroupedBackground))
            .cornerRadius(16)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
        .padding([.horizontal, .top])
    }
}

// MARK: - Main Exercise View

struct SolutionAdaptiveProfile: View {
    
    @Environment(\.horizontalSizeClass) var hSizeClass

    var body: some View {
        ScrollView {
            VStack {
                Spacer()

                SolutionExerciseGoalView()
                Text("Completed Profile Card")
                    .font(.title.bold())
                    .padding(.top, 30)

                if hSizeClass == .regular {
                    RegularWidthLayout()
                } else {
                    CompactWidthLayout()
                }

            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Solution: Adaptive Profile")
        .navigationBarHidden(false)
    }
}

// MARK: - Compact Layout
struct CompactWidthLayout: View {
    var body: some View {
        VStack(spacing: 20) {
            UserInfoView()
            UserStatsView()
            Divider()
            BioView()
            ActionButtonsView()
            Spacer()
            FooterInfoView()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(25)
        .background(LinearGradient(colors: [Color(.systemBackground), .blue.opacity(0.1)], startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 10, y: 5)
        .padding()
    }
}

// MARK: - Regular Layout
struct RegularWidthLayout: View {
    var body: some View {
        HStack(alignment: .top, spacing: 25) {
            VStack(alignment: .leading, spacing: 20) {
                UserInfoView()
                Divider()
                UserStatsView()
                Spacer()
            }
            .frame(maxWidth: 300)
            
            VStack(alignment: .leading, spacing: 20) {
                BioView()
                ActionButtonsView()
                Spacer()
                FooterInfoView()
            }
        }
        .padding(25)
        .background(LinearGradient(colors: [Color(.systemBackground), .green.opacity(0.1)], startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 10, y: 5)
        .padding()
    }
}


// MARK: - Previews
struct SolutionAdaptiveProfile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SolutionAdaptiveProfile()
                .previewDevice("iPhone 14 Pro")
                .preferredColorScheme(.light)
                .previewDisplayName("Compact Preview")
        }

        NavigationView {
            SolutionAdaptiveProfile()
                .previewDevice("iPad Pro (12.9-inch) (6th generation)")
                .previewInterfaceOrientation(.landscapeLeft)
                .preferredColorScheme(.dark)
                .previewDisplayName("Regular Preview")
        }
    }
}
