//
//  ExerciseAdaptiveLayout.swift
//  MDI-114 Class 2
//
//  Created by SDGKU on 03/11/25.
//

import SwiftUI

// MARK: - Exercise Goal
struct ExerciseGoalView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
                Image(systemName: "flag.checkered.2.crossed")
                    .font(.title)
                    .foregroundColor(.accentColor)
                Text("Your Goal")
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

struct ExerciseAdaptiveLayout: View {
    
    @Environment(\.horizontalSizeClass) var hSizeClass

    var body: some View {
        ScrollView {
            VStack {
                ExerciseGoalView()
                            
                Text("Profile Card Blueprint")
                    .font(.title.bold())
                    .padding(.top, 30)
                Text("(Arrange the elements inside the card below)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom)

                VStack {
                    //MARK: Exercise guide
                    /* You dont have to follow everything strictly as it is stated, you can be creative and generate a different layout.
                     
                     --- PART 1: BASIC STACKING ---
                     TODO 1.1: Create a VStack for the user's info (Avatar, Name, Username).
                     TODO 1.2: Create an HStack for the user's stats (Posts, Followers, Following).
                     TODO 1.3: Create an HStack for the main action buttons (Follow, Message).
                     TODO 1.4: Combine everything into a single parent VStack.
                    
                     --- PART 2: POLISHING THE LAYOUT ---
                     TODO 2.1: Add appropriate `spacing` to your VStacks and HSTacks.
                     TODO 2.2: Use `alignment` to make the user info text left-aligned (hint: .leading).
                     TODO 2.3: Use `Spacer()` to push the location and join date to the bottom.
                     TODO 2.4: Add `padding` to give the content some breathing room.
                    
                     --- PART 3: ADAPTIVE LAYOUT ---
                     TODO 3.1: Use an `if/else` block to check if the `hSizeClass` is `.regular`.
                     TODO 3.2: If it is, use an HStack as the main container to create two columns.
                               Column 1: User Info, Stats.
                               Column 2: Bio, Buttons, Location/Date info.
                     TODO 3.3: In the `else` block, use the single VStack you built in Part 1.
                    
                     --- PART 4: STYLING (BONUS) ---
                     TODO 4.1: Apply a `LinearGradient` to the card's background.
                     TODO 4.2: Use the `.shadow()` modifier to lift the card off the page.
                     TODO 4.3: Give the avatar a circular background color.
                     */
                    
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.accentColor)

                    Text("Alex Doe")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("@alexdoe")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("1,204 Posts")
                    Text("15.1K Followers")
                    Text("350 Following")
                    
                    Text("Bio: A passionate SwiftUI developer exploring the world of adaptive UI. Teaching students how to build beautiful, responsive apps for all Apple devices. #SwiftUI #iOSDev")
                        .font(.body)
                    
                    Button("Follow") {}
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                    
                    Button("Message") {}
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                    
                    Image(systemName: "location.fill")
                    Text("San Francisco, CA")
                    
                    Image(systemName: "calendar")
                    Text("Joined October 2025")
                    
                    
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .padding()

            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Adaptive Layout Exercise")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(false)
    }
}


// MARK: - Previews
struct ExerciseAdaptiveLayout_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExerciseAdaptiveLayout()
                .previewDevice("iPhone 14 Pro")
                .preferredColorScheme(.light)
                .previewDisplayName("Compact Preview")
        }

        NavigationView { 
            ExerciseAdaptiveLayout()
                .previewDevice("iPad Pro (12.9-inch) (6th generation)")
                .previewInterfaceOrientation(.landscapeLeft)
                .preferredColorScheme(.dark)
                .previewDisplayName("Regular Preview")
        }
    }
}
