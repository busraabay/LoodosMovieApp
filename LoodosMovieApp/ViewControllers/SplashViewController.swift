//
//  SplashViewController.swift
//  LoodosMovieApp
//
//  Created by Büşra on 17.03.2022.
//

import UIKit
import Firebase

class SplashViewController: UIViewController {

    @IBOutlet weak var remoteConfigLabel: UILabel!
    
    var remoteConfig: RemoteConfig!
    let configureKey = "LoodosConfig"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkNetworkConnection()
        remoteConfig = RemoteConfig.remoteConfig()
        setupRemoteConfigDefaults()
        fetchRemoteConfig()
        displayNewValues()
    }
    
    func setupRemoteConfigDefaults() {
        let defaultValue = ["LoodosConfig": "Loodos" as NSObject]
        remoteConfig.setDefaults(defaultValue)
    }
    
    func fetchRemoteConfig(){
        remoteConfig.fetch(withExpirationDuration: 0) { [unowned self] (status, error) in
            guard error == nil else { return }
            remoteConfig.activate()
            self.displayNewValues()
    }}
    
    func displayNewValues(){
        let newLabelText = remoteConfig.configValue(forKey: "LoodosConfig").stringValue ?? ""
        remoteConfigLabel.text = newLabelText
    }
    
    func checkNetworkConnection() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            Loading.shared.show(in: self.view)
            if NetworkConnection.shared.isConnected {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                let navigationController = UINavigationController(rootViewController: vc)
                navigationController.modalPresentationStyle = .fullScreen
                self.show(navigationController, sender: nil)
            }else{
                let alertController = UIAlertController(title: "Error", message: "Try turning on your Wifi or Mobile Data for using the app", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in
                    self.checkNetworkConnection()
                }))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
