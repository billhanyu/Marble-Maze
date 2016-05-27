//
//  GameViewController.swift
//  MarbleMaze
//
//  Created by Bill Yu on 5/24/16.
//  Copyright (c) 2016 Bill Yu. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var scnView: SCNView!
    var scnScene: SCNScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScene()
        setupNodes()
        setupSounds()
    }
    
    func setupScene() {
        scnView = self.view as! SCNView
        scnView.delegate = self
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        scnScene = SCNScene(named: "art.scnassets/game.scn")
        scnView.scene = scnScene
    }
    
    func setupNodes() {
        
    }
    
    func setupSounds() {
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

extension GameViewController: SCNSceneRendererDelegate {
    func renderer(renderer: SCNSceneRenderer, updateAtTime time: NSTimeInterval) {
        
    }
}