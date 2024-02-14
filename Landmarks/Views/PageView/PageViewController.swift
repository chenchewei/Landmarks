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
    
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        return UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])],
            direction: .forward,
            animated: true
        )
    }
    
}
