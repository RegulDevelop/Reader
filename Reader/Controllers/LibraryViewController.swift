//
//  ViewController.swift
//  Reader
//
//  Created by Anton Tyurin on 16.04.2023.
//

import UIKit

class LibraryViewController: UIViewController {
    
    let animalsButton = UIButton()
    let shineButton = UIButton()
    let miseryButton = UIButton()
    let walkButton = UIButton()
    
    let animalsLabel = UILabel()
    let shineLabel = UILabel()
    let miseryLabel = UILabel()
    let walkLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createMethod()
    }
    
    func createMethod() {
        createButton()
        createLabel()
    }
    
    func createButton() {
        animalsButton.frame = CGRect(x: 25, y: 120, width: 160, height: 230)
        animalsButton.setImage(UIImage(named: "animals"), for: .normal)
        view.addSubview(animalsButton)
        
        animalsButton.addTarget(self, action: #selector(animalsButtonAction), for: .touchDown)
        
        shineButton.frame = CGRect(x: 210, y: 120, width: 160, height: 230)
        shineButton.setImage(UIImage(named: "shine"), for: .normal)
        view.addSubview(shineButton)
        
        shineButton.addTarget(self, action: #selector(shineButtonAction), for: .touchDown)
        
        miseryButton.frame = CGRect(x: 25, y: 410, width: 160, height: 230)
        miseryButton.setImage(UIImage(named: "misery"), for: .normal)
        view.addSubview(miseryButton)
        
        miseryButton.addTarget(self, action: #selector(miseryButtonAction), for: .touchDown)
        
        walkButton.frame = CGRect(x: 210, y: 410, width: 160, height: 230)
        walkButton.setImage(UIImage(named: "walk"), for: .normal)
        view.addSubview(walkButton)
        
        walkButton.addTarget(self, action: #selector(walkButtonAction), for: .touchDown)
    }
    
    func createLabel() {
        animalsLabel.frame = CGRect(x: 25, y: 344, width: 160, height: 50)
        animalsLabel.text = "С. Кинг: Кладбище домашних животных"
        animalsLabel.textColor = .lightGray
        animalsLabel.font = UIFont.systemFont(ofSize: 13)
        animalsLabel.numberOfLines = 0
        view.addSubview(animalsLabel)
        
        shineLabel.frame = CGRect(x: 210, y: 344, width: 160, height: 35)
        shineLabel.text = "С. Кинг: Сияние"
        shineLabel.textColor = .lightGray
        shineLabel.font = UIFont.systemFont(ofSize: 13)
        shineLabel.numberOfLines = 0
        view.addSubview(shineLabel)
        
        miseryLabel.frame = CGRect(x: 25, y: 627, width: 160, height: 50)
        miseryLabel.text = "С. Кинг: Мизери"
        miseryLabel.textColor = .lightGray
        miseryLabel.font = UIFont.systemFont(ofSize: 13)
        miseryLabel.numberOfLines = 0
        view.addSubview(miseryLabel)
        
        walkLabel.frame = CGRect(x: 210, y: 635, width: 160, height: 35)
        walkLabel.text = "С. Кинг: Долгая прогулка"
        walkLabel.textColor = .lightGray
        walkLabel.font = UIFont.systemFont(ofSize: 13)
        walkLabel.numberOfLines = 0
        view.addSubview(walkLabel)
    }
    
    @objc func animalsButtonAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let readerViewController = storyboard.instantiateViewController(withIdentifier: "ReaderID") as? ReaderViewController {
            
            readerViewController.nameBookLabel.text = "Кладбище домашних животных"
            readerViewController.myTextView.text = "Роман, который сам Кинг, считая «слишком страшным», долго не хотел отдавать в печать, но только за первый год было продано 657 000 экземпляров! Роман лег в основу одноименного фильма Мэри Ламберт (где Кинг, кстати, сыграл небольшую роль). Казалось бы, семейство Крид – это настоящее воплощение «американской мечты»: отец – преуспевающий врач, красавица мать, прелестные дети. Для полной идиллии им не хватает лишь большого старинного дома, куда они вскоре и переезжают. Но идиллия вдруг стала превращаться в кошмар. Потому что в окружающих их новое жилище вековых лесах скрывается НЕЧТО, более ужасное, чем сама смерть и... более могущественное."
            readerViewController.pageLabel.text = "Страниц 334"
            
            
            self.present(readerViewController, animated: true)
        }
    }
    
    @objc func shineButtonAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let readerViewController = storyboard.instantiateViewController(withIdentifier: "ReaderID") as? ReaderViewController {
            
            readerViewController.nameBookLabel.text = "Сияние"
            readerViewController.myTextView.text = "Страшно захватывающий роман о мрачных глубинах человеческой сущности....Проходят годы, десятилетия, но потрясающая история писателя Джека Торранса, его сынишки Дэнни, наделенного необычным даром, и поединка с темными силами, обитающими в роскошном отеле «Оверлук», по-прежнему завораживает и держит в неослабевающем напряжении читателей самого разного возраста...Джек Торренс устраивается на работу зимнего сторожа в горный отель «Оверлук» и переезжает туда со своей семьей: женой Венди и пятилетним сыном Денни. Шикарный на первый взгляд отель имеет дурную славу: в нем происходят странные и жуткие вещи, с которыми героям предстоит столкнуться лицом к лицу."
            readerViewController.pageLabel.text = "Страниц 534"
            
            
            self.present(readerViewController, animated: true)
        }
    }
    
    @objc func miseryButtonAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let readerViewController = storyboard.instantiateViewController(withIdentifier: "ReaderID") as? ReaderViewController {
            
            readerViewController.nameBookLabel.text = "Мизери"
            readerViewController.myTextView.text = "Роман, название которого в переводе означает \"Страдание\" приснился автору. Может ли спасение от верной гибели обернуться таким кошмаром, что даже смерть покажется милосердным даром судьбы? Может. Ибо именно так случилось с Полом Шелдоном, автором бесконечного сериала книг о злоключениях Мизери. Раненый писатель оказался в руках Энни Уилкс — женщины, потерявшей рассудок на почве его романов. Уединенный домик одержимой бесами фурии превратился в камеру пыток, а существование Пола — в ад, полный боли и ужаса..."
            readerViewController.pageLabel.text = "Страниц 381"
            
            
            self.present(readerViewController, animated: true)
        }
    }
    
    @objc func walkButtonAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let readerViewController = storyboard.instantiateViewController(withIdentifier: "ReaderID") as? ReaderViewController {
            
            readerViewController.nameBookLabel.text = "Долгая прогулка"
            readerViewController.myTextView.text = "Это была страшная игра – игра на выживание. Это была Долгая Прогулка. Прогулка со Смертью, ибо смерть ожидала каждого упавшего. Дорога к счастью – потому что победивший в игре получал все. На долгую прогулку вышли многие – но закончит ее только один. Остальные лягут мертвыми на дороге – потому что дорога к счастью для одного станет последней дорогой для многих.Год 2025-й.Здесь царит нищета и безнадежность.Здесь люди участвуют не в президентских гонках, а в гонках со Смертью.Бен Ричардс потерял работу, а вместе с ней и надежду спасти умирающую дочь. Но у человека из трущоб всегда остается один, последний выход: участие в смертельно опасном реалити-шоу, в котором свою «жертву» преследует команда профессиональных убийц.Если Бен выиграет – денежный приз будет огромен, если же проиграет – погибнет.И теперь он бежит, сражаясь за свою жизнь, а у зрителей этой жестокой битвы есть возможность помочь ему – или его преследователям..."
            readerViewController.pageLabel.text = "Страниц 352"
            
            
            self.present(readerViewController, animated: true)
        }
    }


}

