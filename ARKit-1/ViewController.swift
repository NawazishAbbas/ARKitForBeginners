//
//  ViewController.swift
//  ARKit-1
//
//  Created by Inam Abbas on 11/4/19.
//  Copyright © 2019 Codivator. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView:ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration, options: .resetTracking)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func addBox()  {
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0.2)
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(0, 0, 0.2)
        
        let scene = SCNScene()
        scene.rootNode.addChildNode(boxNode)
        sceneView.scene = scene
    }

    func addTapeGestureToSceneView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap(withGestureRecognizer:)))
        sceneView.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTap(withGestureRecognizer recognizer:UIGestureRecognizer) {
        let tapLocation = recognizer.location(in: sceneView)
        let hitTestResults = sceneView.hitTest(tapLocation, with: nil)
        hitTestResults?.removeFromSuperview()
    }
}

