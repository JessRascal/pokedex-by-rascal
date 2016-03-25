//
//  DetailsPageVC.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 24/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class DetailsPageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    private(set) lazy var pagedVCs: [UIViewController] = {
        return [self.getVC("BioVC"), self.getVC("EvoVC"), self.getVC("MovesVC")]
    }()
    
    var selectedPokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        // Set the starting VC.
        if let startingVC = pagedVCs.first {
            setViewControllers([startingVC], direction: .Forward, animated: true, completion: nil)
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
        if let evoBC = currentVC as? PokemonEvoVC {
            evoBC.pokemon = selectedPokemon
        }
        if let movesBC = currentVC as? PokemonMovesVC {
            movesBC.pokemon = selectedPokemon
        }
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
}