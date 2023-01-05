//
//  OnboardingPresenter.swift
//  Onboarding
//
//  Created by Егор Бадмаев on 04.01.2023.
//

import Foundation

final class OnboardingPresenter {
    weak var view: OnboardingViewInput?
    weak var moduleOutput: OnboardingModuleOutput?
    
    // MARK: - Private Properties
    
    private let router: OnboardingRouterInput
    private let interactor: OnboardingInteractorInput
    
    // MARK: - Init
    
    init(router: OnboardingRouterInput, interactor: OnboardingInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension OnboardingPresenter: OnboardingModuleInput {
}

extension OnboardingPresenter: OnboardingViewOutput {
    
    /// Handles tapping on continue button from view.
    func handleTappingOnContinueButton() {
        interactor.setHasOnboardedTrue()
    }
}

extension OnboardingPresenter: OnboardingInteractorOutput {
    
    /// Tells module's output to close this module.
    func didSetHasOnboardedTrue() {
        moduleOutput?.onboardingModuleDidFinish()
    }
}

extension OnboardingPresenter: OnboardingRouterOutput {
}
