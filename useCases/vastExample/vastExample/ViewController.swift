//
//  ViewController.swift
//  vastExample
//
//  Created by Kang Jinyeoung on 10/09/2017.
//  Copyright © 2017 SuperbDerrick. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func playVideo(_ sender: Any) {
    
    let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "playerController")
    self.navigationController?.pushViewController(signUpVC, animated: true)
  }

}

