//
//  WelcomeScreen.swift
//  Sleepy
//
//  Created by Lolita Chernysheva on 28.01.2025.
//  
//

import SwiftUI
import Combine

class WelcomeViewModel: ObservableObject {
    @Published var babyName: String = ""
    @Published var birthDate: String = ""
    
    func saveName() {
    }
}

struct WelcomeScreen: View {
    
    @ObservedObject var viewModel: WelcomeViewModel
    
    var body: some View {
        ZStack {
            Color.brend
                .ignoresSafeArea()
            VStack {
                logoView
                titleView
                subtitleView
                Spacer()
                VStack(alignment: .leading, spacing: 40) {
                    nameSectionView
                    birthDateSectionView
                    continueButtonView
                }
                .padding(.horizontal, 16)
                Spacer()

            }
        }
    }
    
    @ViewBuilder
    private var logoView: some View {
        Images.logo
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 250)
    }
    
    @ViewBuilder
    private var titleView: some View {
        Text("Welcome")
            .font(.custom("LexendDeca-Bold", size: 18))
    }
    
    @ViewBuilder
    private var subtitleView: some View {
        Text("Let's start tracking your baby's sleep!")
            .font(.custom("LexendDeca-Bold", size: 22))
            .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    private var nameSectionView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Baby's name")
                .font(Fonts.sleepyPlaceholders)
                .foregroundColor(.black)
            TextField("Baby's  name", text: $viewModel.birthDate)
                .font(Fonts.sleepyPlaceholders)
                .padding(.horizontal, 16)
                .frame(height: 56)
                .background(Color.white)
                .cornerRadius(12)
                .keyboardType(.numberPad)
                .onChange(of: viewModel.birthDate) { newValue in
                    
                }
        }
    }
    
    @ViewBuilder
    private var birthDateSectionView: some View {
        VStack(alignment: .leading,  spacing: 8) {
            Text("Baby’s date of birth")
                .font(Fonts.sleepyPlaceholders)
                .foregroundColor(.black)
            TextField("MM/DD/YYYY", text: $viewModel.birthDate)
                .font(Fonts.sleepyPlaceholders)
                .padding(.horizontal, 16)
                .frame(height: 56)
                .background(Color.white)
                .cornerRadius(12)
                .keyboardType(.numberPad)
                .onChange(of: viewModel.birthDate) { newValue in
                    
                }
        }
    }
    
    @ViewBuilder
    private var continueButtonView: some View {
        Button("Continue") {
            viewModel.saveName()
                
        }
        .font(.custom("LexendDeca-Bold", size: 16))
        .foregroundColor(.white)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
        .frame(height: 56)
        .background(Color.button)
        .cornerRadius(12)
    }
}


#Preview {
    let viewModel = WelcomeViewModel()
    WelcomeScreen(viewModel: viewModel)
}
