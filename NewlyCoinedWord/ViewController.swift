//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by Y on 2022/07/09.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var tagButton: [UIButton]!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.layer.borderWidth = 3
        searchTextField.layer.cornerRadius = 10
        searchTextField.borderStyle = .roundedRect
        searchTextField.placeholder = "그 신조어 뜻이 뭐지?"
        searchButton.layer.cornerRadius = searchButton.frame.size.width/2
        designTagButton()
        resultLabel.textAlignment = .center
        searchTextField.delegate = self
        searchTextField.keyboardType = .emailAddress
        searchTextField.returnKeyType = .done


    }

    var newlyCoinedWordDictionary: [String:String] = ["식집사":"식물과 집사의 합성어로 반려 식물을 키우는 사람","다꾸":"다이어리 꾸미기","깊꾸":"기프티콘 꾸미기","폴꾸":"폴라로이드 꾸미기","캘박":"캘린더에 박제, 중요한 일정을 잊지 않겠다는 말","웃안웃":"웃긴데 안 웃겨로 웃기지만 슬픈 상황","완내스":"완전 내 스타일","좋댓구알":"좋아요, 댓글, 구독, 알림설정","많관부":"많은 관심 부탁드립니다.","어쩔티비":"어쩌라고, 안 물어봤어로 상대방의 발언을 무시하는 말","쫌쫌따리":"아주 조금씩 적고 하찮은 양을 모으는 모습","갓생":"갓(God)과 인생을 합친 말로 부지런하고 생산적인 삶","억텐":"억지 텐션","스불재":"스스로 불러온 재앙","점메추":"점심 메뉴 추천, 저녁 메뉴 추천의 저메추가 있다","군싹":"군침이 싹 도네","삼귀다":"사귀기 전의 썸. 4귀다->3귀다","알잘딱깔센":"알아서 잘 딱 깔끔하고 센스있게","사바사":"케바케(케이스 바이 케이스)와 같은 말로 사람 바이 사람. 사람마다 다르다","저메추":"저녁 메뉴 추천, 점심 메뉴 추천의 점메추가 있다","억까":"억지로 까다(디스하다)","힘숨찐":"겉으론 찐따 같지만 실제로는 대단한데 숨기는 사람","구취":"구독 취소","임구":"이미 구독","졌잘싸":"졌지만 잘 싸웠다","난죽택":"난 죽음을 택하겠다로 곤란한 상황일 때 쓰는 말","톡디":"톡 아이디","꾸안꾸":"꾸민듯 안 꾸민듯 자연스러운"]
    

    
    lazy var dicCount: Int = newlyCoinedWordDictionary.count
    // lazy 넣었더니 해결됨, 이유 찾아볼 것
    func designTagButton(){
        for item in tagButton{
            item.layer.borderWidth = 2
            item.layer.cornerRadius = 10
            item.setTitle(" \(newlyCoinedWordDictionary.keys.randomElement()!) ", for: .normal)
        }
    }
    
  
    
    func endSearchTextField(){
        var trimTextField = searchTextField.text?.trimmingCharacters(in: .whitespaces)

        var resultText = newlyCoinedWordDictionary[trimTextField!]
        
        
        
        resultLabel.text = "\(resultText)"
        if resultLabel.text == "nil" {
            resultLabel.text = "검색 결과가 없습니다"
        }
        else if resultLabel.text != "nil" {
            resultLabel.text = "\(resultText!)"
        }
        
    }


 
    func textFieldShouldReturn(_ TextField: UITextField) -> Bool {
       
        
        endSearchTextField()
        
        
        searchTextField.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
        self.view.endEditing(true)

        return true
        
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        designTagButton()
        
        view.endEditing(true)
   
        endSearchTextField()
    
                
    }
    
    @IBAction func tagButtonTapped(_ sender: UIButton) {
        
        view.endEditing(true)
        searchTextField.endEditing(true)
        
        var buttonTitle = sender.title(for: .normal)
        var trimTitle = buttonTitle!.trimmingCharacters(in: .whitespaces)
        var resultDicionary = newlyCoinedWordDictionary[trimTitle]
        
        resultLabel.text = resultDicionary!
        
        designTagButton()
        
    }
    
    @IBAction func gestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
  
    @IBAction func doneSearchTextFieldTapped(_ sender: UITextField) {
        endSearchTextField()
        view.endEditing(true)
    }
    
 
    
}

