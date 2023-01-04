//
//  OnboardingRouter.swift
//  Onboarding
//
//  Created by Егор Бадмаев on 04.01.2023.
//

import UIKit

final class OnboardingRouter {
    weak var presenter: OnboardingRouterOutput?
    weak var viewController: UIViewController?
}

extension OnboardingRouter: OnboardingRouterInput {
}
