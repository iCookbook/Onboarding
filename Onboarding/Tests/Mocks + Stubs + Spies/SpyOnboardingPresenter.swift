//
//  SpyOnboardingPresenter.swift
//  Onboarding-Unit-Tests
//
//  Created by Егор Бадмаев on 06.01.2023.
//

@testable import Onboarding

class SpyOnboardingPresenter: OnboardingInteractorOutput {
    
    var didSetHasOnboardedFlag: Bool!
    
    func didSetHasOnboardedTrue() {
        didSetHasOnboardedFlag = true
    }
}
