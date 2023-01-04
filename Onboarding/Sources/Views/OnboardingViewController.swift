//
//  OnboardingViewController.swift
//  Onboarding
//
//  Created by Егор Бадмаев on 04.01.2023.
//

import UIKit
import CommonUI
import Resources

final class OnboardingViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let presenter: OnboardingViewOutput
    
    /// Defines the data of the onboarding
    private let data: [(title: String, subtitle: String, image: UIImage?)] = [
        (title: Texts.Onboarding.title1, subtitle: Texts.Onboarding.description1, image: Images.Onboarding.image1),
        (title: Texts.Onboarding.title2, subtitle: Texts.Onboarding.description2, image: Images.Onboarding.image2),
        (title: Texts.Onboarding.title3, subtitle: Texts.Onboarding.description3, image: Images.Onboarding.image3),
    ]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = data.count
        pageControl.currentPageIndicatorTintColor = Colors.appColor
        pageControl.pageIndicatorTintColor = Colors.tertiaryLabel
        pageControl.layer.zPosition = 1
        pageControl.isEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = Colors.appColor
        button.setTitle(Texts.Onboarding.continue, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.zPosition = 3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    
    init(presenter: OnboardingViewOutput) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Private Methods
    
    @objc private func continueButtonTapped() {
        // TODO: Slide to the next item, if last - presenter.handleTappingOnContinueButton()
        presenter.handleTappingOnContinueButton()
    }
    
    private func setupView() {
        view.backgroundColor = Colors.systemBackground
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(separatorView)
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: view.layoutMargins.bottom - 4),
            
            separatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.2),
            
            continueButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            continueButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -view.layoutMargins.bottom - 16),
            continueButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}

extension OnboardingViewController: OnboardingViewInput {
}

extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else {
            fatalError("Could not cast cell at indexPath \(indexPath) to 'OnboardingCollectionViewCell' in 'Onboarding' module")
        }
        let item = data[indexPath.row]
        cell.configure(title: item.title, subtitle: item.subtitle, image: item.image)
        return cell
    }
}
