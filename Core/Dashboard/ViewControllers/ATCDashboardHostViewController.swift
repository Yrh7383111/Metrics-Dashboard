import UIKit


class ATCDashboardHostViewController: UIViewController, UITabBarControllerDelegate {
    let homeVC: ATCDashboardHomeViewController
    let categoriesVC: ATCDashboardCategoriesViewController
    let notificationsVC: ATCNotificationsViewController
    let feedVC: ATCDashboardFeedViewController
    let ordersVC: ATCDashboardOrdersViewController
    let uiConfig: ATCDashboardConfigurationProtocol
    let serverConfig: ATCOnboardingServerConfigurationProtocol

    
    init(uiConfig: ATCDashboardConfigurationProtocol, serverConfig: ATCOnboardingServerConfigurationProtocol) {
        self.uiConfig = uiConfig
        self.serverConfig = serverConfig
        self.homeVC = ATCDashboardHomeViewController.homeViewController(uiConfig: uiConfig)
        self.categoriesVC = ATCDashboardCategoriesViewController.categoriesViewController(uiConfig: uiConfig)
        self.notificationsVC = ATCNotificationsViewController.notificationsViewController(uiConfig: uiConfig)
        self.feedVC = ATCDashboardFeedViewController.feedViewController(uiConfig: uiConfig)
        self.ordersVC = ATCDashboardOrdersViewController.ordersViewController(uiConfig: uiConfig)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var hostController: ATCHostViewController = { [unowned self] in
        let menuItems: [ATCNavigationItem] = [
            ATCNavigationItem(title: "Home",
                              viewController: homeVC,
                              image: uiConfig.homeImage,
                              type: .viewController,
                              leftTopViews: nil,
                              rightTopViews: nil),
            ATCNavigationItem(title: "Dashboard",
                              viewController: categoriesVC,
                              image: uiConfig.categoriesImage,
                              type: .viewController),
            //            ATCNavigationItem(title: "ADD",
            //                              viewController: UIViewController(),
            //                              image: ATCListingUIConfiguration.shared.composeImage,
            //                              type: .viewController),
            ATCNavigationItem(title: "Orders",
                              viewController: ordersVC,
                              image: uiConfig.ordersImage,
                              type: .viewController),
            ATCNavigationItem(title: "Notifications",
                              viewController: notificationsVC,
                              image: uiConfig.notificationsImage,
                              type: .viewController),
            ATCNavigationItem(title: "Activity",
                              viewController: feedVC,
                              image: uiConfig.savedImage,
                              type: .viewController)
        ]
        let menuConfiguration = ATCMenuConfiguration(user: nil,
                                                     cellClass: ATCCircledIconMenuCollectionViewCell.self,
                                                     headerHeight: 0,
                                                     items: menuItems,
                                                     uiConfig: ATCMenuUIConfiguration(itemFont: uiConfig.regularMediumFont,
                                                                                      tintColor: uiConfig.mainTextColor,
                                                                                      itemHeight: 45.0,
                                                                                      backgroundColor: uiConfig.mainThemeBackgroundColor))

        let config = ATCHostConfiguration(menuConfiguration: menuConfiguration,
                                          style: .tabBar,
                                          topNavigationRightViews: [self.logoutButton()],
                                          titleView: nil,
                                          topNavigationLeftImage: UIImage.localImage("three-equal-lines-icon", template: true),
                                          topNavigationTintColor: uiConfig.mainThemeForegroundColor,
                                          statusBarStyle: uiConfig.statusBarStyle,
                                          uiConfig: uiConfig,
                                          pushNotificationsEnabled: true,
                                          locationUpdatesEnabled: true)
        let onboardingCoordinator = self.onboardingCoordinator(uiConfig: uiConfig, serverConfig: serverConfig)
        let walkthroughVC = self.walkthroughVC(uiConfig: uiConfig)
        return ATCHostViewController(configuration: config, onboardingCoordinator: onboardingCoordinator, walkthroughVC: walkthroughVC, profilePresenter: nil)
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewControllerWithView(hostController)
        hostController.view.backgroundColor = uiConfig.mainThemeBackgroundColor
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return uiConfig.statusBarStyle
    }

    fileprivate func onboardingCoordinator(uiConfig: ATCDashboardConfigurationProtocol, serverConfig: ATCOnboardingServerConfigurationProtocol) -> ATCOnboardingCoordinatorProtocol {
        let landingViewModel = ATCLandingScreenViewModel(imageIcon: "combo-chart-icon",
                                                         title: "Welcome to Dashboard",
                                                         subtitle: "Visualize realtime updates from your business",
                                                         loginString: "Log In",
                                                         signUpString: "Sign Up")
        let loginViewModel = ATCLoginScreenViewModel(contactPointField: "E-mail or phone number".localizedInApp,
                                                     passwordField: "Password".localizedInApp,
                                                     title: "Sign In".localizedInApp,
                                                     loginString: "Log In".localizedInApp,
                                                     facebookString: "Facebook Login".localizedInApp,
                                                     separatorString: "OR".localizedInApp,
                                                     forgotPasswordString: "Forgot Password?".localizedInApp)
        
        let phoneLoginViewModel = ATCPhoneLoginScreenViewModel(contactPointField: "E-mail".localizedCore,
                                                               passwordField: "Password".localizedCore,
                                                               title: "Sign In".localizedCore,
                                                               loginString: "Log In".localizedCore,
                                                               sendCodeString: "Send Code".localizedCore,
                                                               submitCodeString: "Submit Code".localizedCore,
                                                               facebookString: "Facebook Login".localizedCore,
                                                               phoneNumberString: "Phone number".localizedCore,
                                                               phoneNumberLoginString: "Login with phone number".localizedCore,
                                                               emailLoginString: "Sign in with E-mail".localizedCore,
                                                               separatorString: "OR".localizedCore,
                                                               contactPoint: .email,
                                                               phoneCodeString: kPhoneVerificationConfig.phoneCode,
                                                               forgotPasswordString: "Forgot Password?".localizedCore)

        let signUpViewModel = ATCSignUpScreenViewModel(nameField: "Full Name",
                                                       phoneField: "Phone Number",
                                                       emailField: "E-mail Address",
                                                       passwordField: "Password",
                                                       title: "Create new account",
                                                       signUpString: "Sign Up")
        
        let phoneSignUpViewModel = ATCPhoneSignUpScreenViewModel(firstNameField: "First Name".localizedCore,
                                                                 lastNameField: "Last Name".localizedCore,
                                                                 phoneField: "Phone Number".localizedCore,
                                                                 emailField: "E-mail Address".localizedCore,
                                                                 passwordField: "Password".localizedCore,
                                                                 title: "Create new account".localizedCore,
                                                                 signUpString: "Sign Up".localizedCore,
                                                                 separatorString: "OR".localizedCore,
                                                                 contactPoint: .email,
                                                                 phoneNumberString: "Phone number".localizedCore,
                                                                 phoneNumberSignUpString: "Sign up with phone number".localizedCore,
                                                                 emailSignUpString: "Sign up with E-mail".localizedCore,
                                                                 sendCodeString: "Send Code".localizedCore,
                                                                 phoneCodeString: kPhoneVerificationConfig.phoneCode,
                                                                 submitCodeString: "Submit Code".localizedCore)
        
        let resetPasswordViewModel = ATCResetPasswordScreenViewModel(title: "Reset Password".localizedCore,
                                                                     emailField: "E-mail Address".localizedCore,
                                                                     resetPasswordString: "Reset My Password".localizedCore)

        let userManager: ATCSocialUserManagerProtocol? = (serverConfig.isFirebaseAuthEnabled ? ATCSocialFirebaseUserManager() : nil)
        
        return ATCClassicOnboardingCoordinator(landingViewModel: landingViewModel,
                                               loginViewModel: loginViewModel,
                                               phoneLoginViewModel: phoneLoginViewModel,
                                               signUpViewModel: signUpViewModel,
                                               phoneSignUpViewModel: phoneSignUpViewModel,
                                               resetPasswordViewModel: resetPasswordViewModel,
                                               uiConfig: DashboardOnboardingUIConfig(config: uiConfig),
                                               serverConfig: serverConfig,
                                               userManager: userManager)
    }

    fileprivate func walkthroughVC(uiConfig: ATCDashboardConfigurationProtocol) -> ATCWalkthroughViewController {
        let viewControllers = ATCDashboardMockStore.walkthroughs.map { ATCClassicWalkthroughViewController(model: $0, uiConfig: uiConfig, nibName: "ATCClassicWalkthroughViewController", bundle: nil) }
        return ATCWalkthroughViewController(nibName: "ATCWalkthroughViewController",
                                            bundle: nil,
                                            viewControllers: viewControllers,
                                            uiConfig: uiConfig)
    }

    fileprivate func logoutButton() -> UIButton {
        let logoutButton = UIButton()
        logoutButton.configure(icon: UIImage.localImage("logout-menu-item", template: true), color: uiConfig.mainTextColor)
        logoutButton.snp.makeConstraints({ (maker) in
            maker.width.equalTo(60.0)
            maker.height.equalTo(60.0)
        })
        logoutButton.layer.cornerRadius = 60.0 / 2
        logoutButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20);
        logoutButton.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)
        return logoutButton
    }

    @objc fileprivate func didTapLogoutButton() {
        NotificationCenter.default.post(name: kLogoutNotificationName, object: nil)
    }
}


class DashboardOnboardingUIConfig: ATCOnboardingConfigurationProtocol {
    var backgroundColor: UIColor
    var titleColor: UIColor
    var titleFont: UIFont
    var logoTintColor: UIColor?

    var subtitleColor: UIColor
    var subtitleFont: UIFont

    var loginButtonFont: UIFont
    var loginButtonBackgroundColor: UIColor
    var loginButtonTextColor: UIColor

    var signUpButtonFont: UIFont
    var signUpButtonBackgroundColor: UIColor
    var signUpButtonTextColor: UIColor
    var signUpButtonBorderColor: UIColor

    var separatorFont: UIFont
    var separatorColor: UIColor

    var textFieldColor: UIColor
    var textFieldFont: UIFont
    var textFieldBorderColor: UIColor
    var textFieldBackgroundColor: UIColor

    var signUpTextFieldFont: UIFont
    var signUpScreenButtonFont: UIFont

    var otpTextFieldBackgroundColor: UIColor
    var otpTextFieldBorderColor: UIColor

    
    init(config: ATCDashboardConfigurationProtocol) {
        backgroundColor = config.mainThemeBackgroundColor
        titleColor = config.mainThemeForegroundColor
        titleFont = config.boldSuperLargeFont
        logoTintColor = config.mainThemeForegroundColor
        subtitleFont = config.regularLargeFont
        subtitleColor = config.mainTextColor
        loginButtonFont = config.boldLargeFont
        loginButtonBackgroundColor = config.mainThemeForegroundColor
        loginButtonTextColor = config.mainThemeBackgroundColor

        signUpButtonFont = config.boldLargeFont
        signUpButtonBackgroundColor = config.mainThemeBackgroundColor
        signUpButtonTextColor = UIColor(hexString: "#414665")
        signUpButtonBorderColor = UIColor(hexString: "#B0B3C6")
        separatorColor = config.mainTextColor
        separatorFont = config.mediumBoldFont

        textFieldColor = UIColor(hexString: "#B0B3C6")
        textFieldFont = config.regularLargeFont
        textFieldBorderColor = UIColor(hexString: "#B0B3C6")
        textFieldBackgroundColor = config.mainThemeBackgroundColor

        signUpTextFieldFont = config.regularMediumFont
        signUpScreenButtonFont = config.mediumBoldFont
        
        otpTextFieldBackgroundColor = UIColor.white
        otpTextFieldBorderColor = UIColor(hexString: "#B0B3C6")
    }
}
