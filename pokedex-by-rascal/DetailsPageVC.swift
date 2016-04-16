//
//  DetailsPageVC.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 24/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit
import SwiftSpinner

class DetailsPageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    private(set) lazy var pagedVCs: [UIViewController] = {
        return [self.getVC("Bio"), self.getVC("Evolutions"), self.getVC("Moves")]
    }()
    
    var selectedPokemon: Pokemon!
    let bgImage = UIImageView(image: UIImage(named: "bg"))
    let bgView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        // Set the colours of the page control.
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.appAccentColor()
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.appPrimaryColor()
        
        // Add the audio trigger button the nav bar.
        let musicIcon = MusicPlayerSingleton.globalMusicPlayer.musicIcon
        let audioButton = UIBarButtonItem(image: musicIcon, style: .Plain, target: self, action: #selector(triggerMusicBg))
        navigationItem.setRightBarButtonItem(audioButton, animated: true)
        
        // Set the starting VC.
        if let startingVC = pagedVCs.first {
            // Display the activity indicator (spinner).
            SwiftSpinner.show("Waking up \(selectedPokemon.name.capitalizedString)...")
            // Dowload all the selected Pokemon's details (including moves), and then set the starting VC.
            selectedPokemon.downloadPokemonDetails { () -> () in
                self.selectedPokemon.downloadMoveDetails { () -> () in
                    // Hide the activity indicator (spinner).
                    SwiftSpinner.hide()
                    self.setViewControllers([startingVC], direction: .Forward, animated: true, completion: nil)
                }
            }
            
            if let navTitle = startingVC.restorationIdentifier {
                setNavTitle(navTitle)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        // Set the background of the PageController's view.
        setBackground()
    }
    
    func triggerMusicBg() {
        MusicPlayerSingleton.globalMusicPlayer.triggerMusicBg()
        if let barButton = navigationItem.rightBarButtonItem {
            barButton.image = MusicPlayerSingleton.globalMusicPlayer.musicIcon
        }
    }
    
    // Get a view controller and set its Pokemon variable object.
    private func getVC(id: String) -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil) .instantiateViewControllerWithIdentifier(id)
        setPokemonOnVC(vc)
        return vc
    }
    
    func setPokemonOnVC(currentVC: UIViewController) {
        if let bioVC = currentVC as? PokemonBioVC {
            bioVC.pokemon = selectedPokemon
        }
        if let evoVC = currentVC as? PokemonEvoVC {
            evoVC.pokemon = selectedPokemon
        }
        if let movesVC = currentVC as? PokemonMovesVC {
            movesVC.pokemon = selectedPokemon
        }
    }
    
    func setNavTitle(navTitle: String) {
        navigationItem.title = navTitle
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        // Get the index of the current VC.
        guard let currentIndex = pagedVCs.indexOf(viewController) else {
            return nil
        }
        
        // Get the index of the previous VC.
        let previousIndex = currentIndex - 1
        
        // Checks that there is a VC before the current one.
        guard previousIndex >= 0 else {
            // If the current VC is the first then go to the last to create an infinite loop.
            return pagedVCs.last
        }
        
        // Check that the previousIndex is valid.
        guard previousIndex <= pagedVCs.count else {
            return nil
        }
        
        return pagedVCs[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        // Get the index of the current VC.
        guard let currentIndex = pagedVCs.indexOf(viewController) else {
            return nil
        }
        
        // Get the index of the next VC.
        let nextIndex = currentIndex + 1
        
        // Checks that there is a VC after the current one.
        guard nextIndex != pagedVCs.count else {
            // If the current VC is the last then go to the first to create an infinite loop.
            return pagedVCs.first
        }
        
        // Checks that the nextIndex is valid.
        guard nextIndex <= pagedVCs.count else {
            return nil
        }
        
        return pagedVCs[nextIndex]
    }
    
    // Set the navigation bar title when the page is changed.
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let currentVC = viewControllers?.first {
            if let navTitle = currentVC.restorationIdentifier {
                setNavTitle(navTitle)
            }
        }
    }
    
    // Display the page indicator graphic.
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pagedVCs.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let currentVC = viewControllers?.first, currentVCIndex = pagedVCs.indexOf(currentVC) else {
            return 0
        }
        return currentVCIndex
    }
    
    // Set the background image.
    func setBackground() {
        // Create the background imageview.
//        let bgImage = UIImageView(image: UIImage(named: "bg"))
        bgImage.contentMode = .ScaleAspectFill
        bgImage.frame.size.width = self.view.frame.width
        bgImage.frame.size.height = self.view.frame.height
        
        // Create the semi-transparent background view.
//        let bgView = UIView()
        bgView.backgroundColor = UIColor.appSecondaryColorTrans()
        bgView.frame.size.width = self.view.frame.width
        bgView.frame.size.height = self.view.frame.height
        
        // Add both the the page controller view.
        view.insertSubview(bgImage, atIndex: 0)
        view.insertSubview(bgView, atIndex: 1)
    }
    
}