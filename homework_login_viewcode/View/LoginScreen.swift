//
//  LoginScreen.swift
//  homework_login_viewcode
//
//  Created by Victor Pizetta on 24/03/22.
//

import UIKit

class LoginScreen: UIView {
        
    //MARK: - Components
        
    lazy var verticalStack: UIStackView = {
        let stack  = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "godevLogo")
        return image
    }()
    
    private lazy var loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.text = "E-mail"
        loginLabel.font = .systemFont(ofSize: 17)
        loginLabel.textColor = .goDevWhite
        loginLabel.numberOfLines = 0
        return loginLabel
    }()
    
    private lazy var passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Senha"
        passwordLabel.font = .systemFont(ofSize: 17)
        passwordLabel.textColor = .goDevWhite
        passwordLabel.numberOfLines = 0
        return passwordLabel
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "example@example.com"
        textField.keyboardType = .emailAddress
        textField.textColor = .black
        textField.backgroundColor = .goDevWhite
        textField.font = .systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "***********"
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.font = .systemFont(ofSize: 14)
        textField.backgroundColor = .goDevWhite
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    //MARK: - Alert
    
    func alerts(setTitle: String, setMessage: String) {
        
        let alert = UIAlertController(title: setTitle, message: setMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Confirmar", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Button
    @objc func getTouch() {
        guard let email = emailTextField.text else { return }
        guard let senha = passwordTextField.text else { return }
        print("email: \(email), senha:\(senha)")

                if email == "" || senha == "" {
                    alerts(setTitle: "Atenção!", setMessage: "Preencha todos os campos!")
                } else {
                    alerts(setTitle: "Sucesso!", setMessage: "Logado com sucesso!")
                }
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("Autenticar", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(getTouch), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Inicialization
    
    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    //MARK: - Constraints

extension LoginScreen: ViewCodable {
    
    func buildHierarchy() {
        addSubview(image)
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(loginLabel)
        verticalStack.addArrangedSubview(emailTextField)
        verticalStack.addArrangedSubview(passwordLabel)
        verticalStack.addArrangedSubview(passwordTextField)
        addSubview(button)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.heightAnchor.constraint(equalToConstant: 200),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            verticalStack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            verticalStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            button.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 35),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
}

