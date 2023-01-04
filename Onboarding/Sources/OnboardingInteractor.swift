//
//  OnboardingInteractor.swift
//  Onboarding
//
//  Created by Егор Бадмаев on 04.01.2023.
//

import Foundation
import Persistence

final class OnboardingInteractor {
    weak var presenter: OnboardingInteractorOutput?
}

extension OnboardingInteractor: OnboardingInteractorInput {
    
    func setHasOnboardedTrue() {
        UserDefaults.hasOnboarded = true
        presenter?.didSetHasOnboardedTrue()
    }
}
