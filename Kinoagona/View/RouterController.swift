////
////  RouterViewController.swift
////  Kinoagona
////
////  Created by Камиль Кадыров on 10.08.2022.
////
//
//import UIKit
//
//class RouterController : UIViewController {
//
//    static var router : UINavigationController!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    func routeToTheAuthorization(){
//        let authVC = AuthorizationViewController()
//        RouterController.router = UINavigationController(rootViewController: authVC)
//        RouterController.router.modalPresentationStyle = .fullScreen
//        present(RouterController.router, animated: false)
//    }
//
//    func routeToTheRegistration(){
//        let regVC = RegistrationViewController()
//        RouterController.router.pushViewController(regVC, animated: true)
//    }
//}
