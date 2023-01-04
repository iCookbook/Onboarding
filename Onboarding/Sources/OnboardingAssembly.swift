//
//  OnboardingAssembly.swift
//  Onboarding
//
//  Created by Егор Бадмаев on 04.01.2023.
//

import UIKit

public final class OnboardingAssembly {
    
    // MARK: - Public Properties
    
    public let input: OnboardingModuleInput
    public let viewController: UIViewController
    
    // MARK: - Private Properties
    
    private(set) weak var router: OnboardingRouterInput!
    
    // MARK: - Public Methods
    
    public static func assemble(with context: OnboardingContext) -> OnboardingAssembly {
        let router = OnboardingRouter()
        let interactor = OnboardingInteractor()
        let presenter = OnboardingPresenter(router: router, interactor: interactor)
        let viewController = OnboardingViewController(presenter: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.presenter = presenter
        router.viewController = viewController
        router.presenter = presenter
        
        return OnboardingAssembly(view: viewController, input: presenter, router: router)
    }
    
    // MARK: - Init
    
    private init(view: UIViewController, input: OnboardingModuleInput, router: OnboardingRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

public struct OnboardingContext {
    weak var moduleOutput: OnboardingModuleOutput?
    
    public init(moduleOutput: OnboardingModuleOutput?) {
        self.moduleOutput = moduleOutput
    }
}
