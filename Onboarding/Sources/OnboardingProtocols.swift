//
//  OnboardingProtocols.swift
//  Onboarding
//
//  Created by Егор Бадмаев on 04.01.2023.
//

import Foundation

public protocol OnboardingModuleInput {
    var moduleOutput: OnboardingModuleOutput? { get }
}

public protocol OnboardingModuleOutput: AnyObject {
    func onboardingModuleDidFinish()
}

protocol OnboardingViewInput: AnyObject {
}

protocol OnboardingViewOutput: AnyObject {
    func handleTappingOnContinueButton()
}

protocol OnboardingInteractorInput: AnyObject {
    func setHasOnboardedTrue()
}

protocol OnboardingInteractorOutput: AnyObject {
    func didSetHasOnboardedTrue()
}

protocol OnboardingRouterInput: AnyObject {
}

protocol OnboardingRouterOutput: AnyObject {
}
