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
    
    let CollisionCategoryBall = 1
    let CollisionCategoryStone = 2
    let CollisionCategoryPillar = 4
    let CollisionCategoryCrate = 8
    let CollisionCategoryPearl = 16
    
    var ballNode: SCNNode!
    
    var game = GameHelper.sharedInstance
    var mostion = CoreMotionHelper();
    var motionForce = SCNVector3(x: 0, y: 0, z: 0)

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
        scnScene.physicsWorld.contactDelegate = self
    }
    
    func setupNodes() {
        ballNode = scnScene.rootNode.childNodeWithName("ball", recursively: true)!
        ballNode.physicsBody?.contactTestBitMask = CollisionCategoryPillar | CollisionCategoryCrate | CollisionCategoryPearl
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

extension GameViewController : SCNPhysicsContactDelegate {
    func physicsWorld(world: SCNPhysicsWorld, didBeginContact contact:
        SCNPhysicsContact) {
        // 1
        var contactNode:SCNNode!
        if contact.nodeA.name == "ball" {
            contactNode = contact.nodeB
        } else {
            contactNode = contact.nodeA
        }
        // 2
        if contactNode.physicsBody?.categoryBitMask == CollisionCategoryPearl {
            contactNode.hidden = true
            contactNode.runAction(SCNAction.waitForDurationThenRunBlock(30) {
                (node:SCNNode!) -> Void in
                node.hidden = false
            })
        }
        if contactNode.physicsBody?.categoryBitMask == CollisionCategoryPillar
            || contactNode.physicsBody?.categoryBitMask == CollisionCategoryCrate {
        }
    }
}