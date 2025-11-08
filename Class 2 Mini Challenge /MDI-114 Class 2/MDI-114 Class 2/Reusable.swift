//
//  Reusable.swift
//  MDI-114 Class 2
//
//  Created by SDGKU on 07/10/25.
//

// MARK: - Reusable Components

import SwiftUI

struct InfoCardView: View {
    var title: String
    var description: String
    var iconName: String
    var color: Color

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: iconName)
                .font(.largeTitle)
                .foregroundColor(color)
                .frame(width: 50)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

struct ConceptSection<Content: View>: View {
    let title: String
    let icon: String
    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(.accentColor)
                    .frame(width: 40)
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.bottom, 8)
            
            content
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
        .padding()
    }
}

struct ExplanationCard: View {
    var text: LocalizedStringKey
    var isCode: Bool = false

    var body: some View {
        Text(text)
            .font(isCode ? .system(.body, design: .monospaced) : .body)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.secondarySystemGroupedBackground))
            .cornerRadius(12)
    }
}

// Reusable data for the "User"
struct UserInfoView: View {
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                )
                .padding(.bottom, 8)

            Text("Alex Doe")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("@alexdoe")
                .font(.headline)
                .foregroundColor(.secondary)
        }
    }
}

struct UserStatsView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 24) {
            VStack {
                Text("1,204").fontWeight(.bold)
                Text("Posts").font(.caption).foregroundColor(.secondary)
            }
            VStack {
                Text("15.1K").fontWeight(.bold)
                Text("Followers").font(.caption).foregroundColor(.secondary)
            }
            VStack {
                Text("350").fontWeight(.bold)
                Text("Following").font(.caption).foregroundColor(.secondary)
            }
        }
    }
}

struct BioView: View {
    var body: some View {
        Text("Bio: A passionate SwiftUI developer exploring the world of adaptive UI. Teaching students how to build beautiful, responsive apps for all Apple devices. #SwiftUI #iOSDev")
            .font(.body)
    }
}

struct ActionButtonsView: View {
    var body: some View {
        HStack(spacing: 12) {
            Button("Follow") {}
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .frame(maxWidth: .infinity)
            
            Button("Message") {}
                .buttonStyle(.bordered)
                .controlSize(.large)
                .frame(maxWidth: .infinity)
        }
    }
}

struct FooterInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "location.fill")
                Text("San Francisco, CA")
            }
            HStack {
                Image(systemName: "calendar")
                Text("Joined October 2025")
            }
        }
        .font(.caption)
        .foregroundColor(.secondary)
    }
}
