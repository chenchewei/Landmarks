//
//  PageViewController.swift
//  Landmarks
//
//  Created by Anderson Chen on 2024/2/14.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageVC = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        pageVC.dataSource = context.coordinator
        return pageVC
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[0]],
            direction: .forward,
            animated: true
        )
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        var controllers: [UIViewController] = []
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
        
            return index == 0 ? controllers.last : controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            return index + 1 == controllers.count ? controllers.first : controllers[index + 1]
        }
    }
    
}
