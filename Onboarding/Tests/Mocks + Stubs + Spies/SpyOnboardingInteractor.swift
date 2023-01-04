//
//  SpyOnboardingInteractor.swift
//  Onboarding-Unit-Tests
//
//  Created by Егор Бадмаев on 04.01.2023.
//

@testable import Onboarding

class SpyOnboardingInteractor: OnboardingInteractorInput {
    
    var setHasOnboardedFlag: Bool!
    
    func setHasOnboardedTrue() {
        setHasOnboardedFlag = true
    }
}
