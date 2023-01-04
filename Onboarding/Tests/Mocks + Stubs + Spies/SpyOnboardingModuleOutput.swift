//
//  SpyOnboardingModuleOutput.swift
//  Onboarding-Unit-Tests
//
//  Created by Егор Бадмаев on 04.01.2023.
//

@testable import Onboarding

class SpyOnboardingModuleOutput: OnboardingModuleOutput {
    
    var onboardingModuleDidFinishFlag: Bool!
    
    func onboardingModuleDidFinish() {
        onboardingModuleDidFinishFlag = true
    }
}
