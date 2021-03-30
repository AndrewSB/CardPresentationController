//
//  CardTransitionManager.swift
//  CardPresentationController
//
//  Copyright © 2018 Aleksandar Vacić, Radiant Tap
//  MIT License · http://choosealicense.com/licenses/mit/
//

import UIKit

@available(iOS 10.0, *)
public final class CardTransitionManager: NSObject, UIViewControllerTransitioningDelegate {
	private(set) var configuration: CardConfiguration

    public init(configuration: CardConfiguration, onDismiss: (() -> Void)? = .none) {
		self.configuration = configuration
		super.init()
        cardAnimator.onDismiss = onDismiss
	}

	private lazy var cardAnimator = CardAnimator(configuration: configuration)

    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
		let pc = CardPresentationController(configuration: configuration, presentedViewController: presented, presenting: presenting)
		pc.sourceController = source
		pc.cardAnimator = cardAnimator
		pc.dismissAreaHeight = configuration.dismissAreaHeight
		return pc
	}

    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		cardAnimator.direction = .presentation
		return cardAnimator
	}

    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		cardAnimator.direction = .dismissal
		return cardAnimator
	}

    public func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
		if cardAnimator.isInteractive { return cardAnimator }
		return nil
	}

    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
		if cardAnimator.isInteractive { return cardAnimator }
		return nil
	}
}
