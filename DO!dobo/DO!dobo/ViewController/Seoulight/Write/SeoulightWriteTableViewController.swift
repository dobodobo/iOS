//
//  SeoulightWriteTableViewController.swift
//  DO!dobo
//
//  Created by 김예은 on 2018. 9. 21..
//  Copyright © 2018년 kyeahen. All rights reserved.
//

import UIKit
import GooglePlaces

class SeoulightWriteTableViewController: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var cultureButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var festButton: UIButton!
    @IBOutlet weak var eatButton: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var etcButton: UIButton!
    var category: String?
    
    @IBOutlet weak var languageTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var finishTextField: UITextField!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var courseSearchTextField: UITextField!
    @IBOutlet weak var courseCollectionView: UICollectionView!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    @IBOutlet weak var minPeopleTextField: UITextField!
    @IBOutlet weak var maxPeopleTextField: UITextField!
    
    var datePicker = UIDatePicker()
    
    let pickerView = UIPickerView()
    var categoryArr = [#imageLiteral(resourceName: "group2Copy.png"), #imageLiteral(resourceName: "group4Copy.png"), #imageLiteral(resourceName: "group23.png")]
    
    let imagePicker : UIImagePickerController = UIImagePickerController()
    
    var imageArr: [UIImage] = [#imageLiteral(resourceName: "icAdImage")]
    var imageNum: Int = 0
    
    var courseArr: [String] = []
    var courseNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //datePicker
        initDatePicker1()
        initDatePicker2()
        
        //collectionView method
        courseCollectionView.delegate = self
        courseCollectionView.dataSource = self
        
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        courseCollectionView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 카테고리 액션
    @IBAction func categoryAction(_ sender: UIButton) {
        
        if sender == cultureButton {
            cultureButton.isSelected = !cultureButton.isSelected
            cultureButton.setImage(#imageLiteral(resourceName: "cultureGreen"), for: UIControlState.normal)
            historyButton.setImage(#imageLiteral(resourceName: "historyGray"), for: UIControlState.normal)
            festButton.setImage(#imageLiteral(resourceName: "festivalGray"), for: UIControlState.normal)
            eatButton.setImage(#imageLiteral(resourceName: "foodGray"), for: UIControlState.normal)
            activityButton.setImage(#imageLiteral(resourceName: "activityGray"), for: UIControlState.normal)
            etcButton.setImage(#imageLiteral(resourceName: "etcGray"), for: UIControlState.normal)
            category = "문화"
        } else if sender == historyButton {
            historyButton.isSelected = !historyButton.isSelected
            cultureButton.setImage(#imageLiteral(resourceName: "cultureGray"), for: UIControlState.normal)
            historyButton.setImage(#imageLiteral(resourceName: "historyGreen"), for: UIControlState.normal)
            festButton.setImage(#imageLiteral(resourceName: "festivalGray"), for: UIControlState.normal)
            eatButton.setImage(#imageLiteral(resourceName: "foodGray"), for: UIControlState.normal)
            activityButton.setImage(#imageLiteral(resourceName: "activityGray"), for: UIControlState.normal)
            etcButton.setImage(#imageLiteral(resourceName: "etcGray"), for: UIControlState.normal)
            category = "역사"
        } else if sender == festButton {
            festButton.isSelected = !festButton.isSelected
            cultureButton.setImage(#imageLiteral(resourceName: "cultureGray"), for: UIControlState.normal)
            historyButton.setImage(#imageLiteral(resourceName: "historyGray"), for: UIControlState.normal)
            festButton.setImage(#imageLiteral(resourceName: "festivalGreen"), for: UIControlState.normal)
            eatButton.setImage(#imageLiteral(resourceName: "foodGray"), for: UIControlState.normal)
            activityButton.setImage(#imageLiteral(resourceName: "activityGray"), for: UIControlState.normal)
            etcButton.setImage(#imageLiteral(resourceName: "etcGray"), for: UIControlState.normal)
            category = "축제"
        } else if sender == eatButton {
            eatButton.isSelected = !eatButton.isSelected
            cultureButton.setImage(#imageLiteral(resourceName: "cultureGray"), for: UIControlState.normal)
            historyButton.setImage(#imageLiteral(resourceName: "historyGray"), for: UIControlState.normal)
            festButton.setImage(#imageLiteral(resourceName: "festivalGray"), for: UIControlState.normal)
            eatButton.setImage(#imageLiteral(resourceName: "foodGreen"), for: UIControlState.normal)
            activityButton.setImage(#imageLiteral(resourceName: "activityGray"), for: UIControlState.normal)
            etcButton.setImage(#imageLiteral(resourceName: "etcGray"), for: UIControlState.normal)
            category = "먹방"
        } else if sender == activityButton {
            activityButton.isSelected = !activityButton.isSelected
            cultureButton.setImage(#imageLiteral(resourceName: "cultureGray"), for: UIControlState.normal)
            historyButton.setImage(#imageLiteral(resourceName: "historyGray"), for: UIControlState.normal)
            festButton.setImage(#imageLiteral(resourceName: "festivalGray"), for: UIControlState.normal)
            eatButton.setImage(#imageLiteral(resourceName: "foodGray"), for: UIControlState.normal)
            activityButton.setImage(#imageLiteral(resourceName: "activityGreen"), for: UIControlState.normal)
            etcButton.setImage(#imageLiteral(resourceName: "etcGray"), for: UIControlState.normal)
            category = "액티비티"
        } else {
            etcButton.isSelected = !etcButton.isSelected
            cultureButton.setImage(#imageLiteral(resourceName: "cultureGray"), for: UIControlState.normal)
            historyButton.setImage(#imageLiteral(resourceName: "historyGray"), for: UIControlState.normal)
            festButton.setImage(#imageLiteral(resourceName: "festivalGray"), for: UIControlState.normal)
            eatButton.setImage(#imageLiteral(resourceName: "foodGray"), for: UIControlState.normal)
            activityButton.setImage(#imageLiteral(resourceName: "activityGray"), for: UIControlState.normal)
            etcButton.setImage(#imageLiteral(resourceName: "etcGreen"), for: UIControlState.normal)
            category = "기타"
        
        }
        
    }
    
    
    //MARK: dismiss
    @IBAction func dismissAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: 글 등록 액션
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
    }
    
    //MAKR: 코스 카테고리 피커뷰 액션
    @IBAction func categryIconAction(_ sender: UIButton) {
        
    }
    
    
    //MARK: 코스 검색 액션
    @IBAction func courseSearchAction(_ sender: UITextField) {
        
        courseSearchTextField.resignFirstResponder()
        let acController = GMSAutocompleteViewController()
        acController.delegate = self
        present(acController, animated: true, completion: nil)
    }


    // MARK: TableView method
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    //MARK: 코스 목록 창 유동적으로 보이기
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = super.tableView(tableView, heightForRowAt: indexPath)

        if courseNum == 0 {
            if (indexPath.row == 8) {
                height = 0.0

            }
        }

        return height
    }
    
    //MARK: CollectionView method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == courseCollectionView {
            return courseArr.count
        }
        
        else {
            return imageArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == courseCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeoulightAddCourseCollectionViewCell", for: indexPath) as! SeoulightAddCourseCollectionViewCell
            
            cell.nameLabel.text = courseArr[indexPath.row]
            cell.deleteButton.tag = indexPath.row
            cell.deleteButton.addTarget(self, action: #selector(deleteCourseFromButton(button:)), for: .touchUpInside)
            
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeoulightAddImageCollectionViewCell", for: indexPath) as! SeoulightAddImageCollectionViewCell
            
            if indexPath.row == 0 {
                cell.deleteButton.isHidden = true
            } else {
                 cell.deleteButton.isHidden = false
            }
            
            cell.placeImageView.image = imageArr[indexPath.row]
            cell.deleteButton.tag = indexPath.row
            cell.deleteButton.addTarget(self, action: #selector(deleteImageFromButton(button:)), for: .touchUpInside)
            
            return cell
            
        }
    }
    
    //MARK: 사진 갯수 제한
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            if imageNum < 5 {
                openGallery()
            } else  {
                
                self.simpleAlert(title: "사진 개수 초과", message: "사진은 최대 5장까지 첨부 가능합니다.")
            }
        }
    }
    
    //MARK: 코스 삭제
    @objc func deleteCourseFromButton(button: UIButton) {
        
        courseArr.remove(at: button.tag)
        courseNum -= 1
        courseCollectionView.reloadData()
    }
    
    //MARK: 이미지 삭제
    @objc func deleteImageFromButton(button: UIButton) {
        
        imageArr.remove(at: button.tag)
        imageNum -= 1
        imageCollectionView.reloadData()
    }
    
    //1 - 피커뷰의 컴포넌트 수 설정
    //피커뷰에게 컴포넌터의 수를 정수 값으로 넘겨주는 델리게이트 메서드이다.
    //피커뷰의 컴포넌트는 피커 부에 표시되는 열의 개수를 의미 한다.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        //1
        return 1
    }
    
    //1-2 피커뷰의 높이 설정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    //2 - 피커뷰의 개수 설정
    // 피커뷰에게 컴포넌트의 열의 개수를 정수 값으로 넘겨줍니다. 이 값은 피커 뷰의 해당 열에서 선택할 수 있는 행의 개수(데이터개수)를 의미한다.
    // 여기에서는 배열의 개수 값인 4를 넘겨준다.
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return categoryArr.count
    }
    
    //3 - 피커뷰의 각 row의 타이틀 설정
    //titleForRow 인수를 가지는 델리게이트 메서드입니다. 피커 뷰에게 컴포넌트의 각 열의 타이틀을 문자열 값으로 넘겨준다.
    //여기서는 파일명을 넘겨 준다.
    //func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //  return imageFileName[row]
    //}
    
    
    //4 피커뷰의 각 row의 view 설정
    //롤렛에 문자대신 이미지 넣기
    //피커뷰에게 컴포넌트의 각 열의 뷰를 uiview타입의 값으로 넘겨준다.
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let imageView = UIImageView(image:categoryArr[row])//선택된 row에 해당하는 이미지를 imageArray에서 가져 온다.
        imageView.frame = CGRect(x: 0, y: 0, width:30, height: 30)
        
        return imageView
    }
    
    //5 - 피거뷰가 선택되었을 때 설정
    //사용자가 피커뷰의 롤렛에서 선택한 row값을 사용하여 배열에서 row값에 해당하는 문자열을 가지고 온다.
    //그리고 가져운 문자열을 레이블의 아울렛변수에 저장한다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //피커뷰의 롤렛이 선택되었을 때 동작하는 didselectrow 인수가 포함된 델리게이트 메서드의 맨 아랫 부분에
        //선택한 이미지를 이미지뷰에 나타내주는 코드를 추가한다.ㅇ
        
        categoryButton.setImage(categoryArr[row], for: .normal)
    }
    

}

//MARK: Google Place API extension
extension SeoulightWriteTableViewController: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        // Get the place name from 'GMSAutocompleteViewController'
        // Then display the name in textField
        courseSearchTextField.text = place.name
        
        courseArr.append(gsno(courseSearchTextField.text))
        courseNum += 1
        
        // Dismiss the GMSAutocompleteViewController when something is selected
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // Handle the error
        print("Error: ", error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        // Dismiss when the user canceled the action
        dismiss(animated: true, completion: nil)
    }
}

// MARK: 이미지 첨부
extension SeoulightWriteTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Method
    @objc func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.delegate = self
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: { print("이미지 피커 나옴") })
        }
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.imagePicker.sourceType = .camera
            self.imagePicker.delegate = self
            self.present(self.imagePicker, animated: true, completion: { print("이미지 피커 나옴") })
        }
    }
    
    // imagePickerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("사용자가 취소함")
        self.dismiss(animated: true) {
            print("이미지 피커 사라짐")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //        defer {
        //            self.dismiss(animated: true) {
        //                print("이미지 피커 사라짐")
        //            }
        //        }
        
        if let editedImage: UIImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            imageArr.append(editedImage)
            imageNum += 1
        } else if let originalImage: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageArr.append(originalImage)
            imageNum += 1
        }
        
        self.dismiss(animated: true) {
            print("이미지 피커 사라짐")
            self.imageCollectionView.reloadData()
        }
    }
}


//MARK: date picker extension
extension SeoulightWriteTableViewController {
    
    func initDatePicker1(){
        
        datePicker.datePickerMode = .date
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: "1996.01.29") else {
            fatalError("포맷과 맞지 않아 데이터 변환이 실패했습니다")
        }
        
        datePicker.date = date
        
        datePicker.maximumDate = Date()
        
        setTextfieldView(textField: dateTextField, selector: #selector(selectedDatePicker1), inputView: datePicker)
    }
    
    func initDatePicker2(){
        
        datePicker.datePickerMode = .date
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: "1996-01-29") else {
            fatalError("포맷과 맞지 않아 데이터 변환이 실패했습니다")
        }
        
        datePicker.date = date
        
        datePicker.maximumDate = Date()
        
        setTextfieldView(textField: finishTextField, selector: #selector(selectedDatePicker2), inputView: datePicker)
    }
    
    func setTextfieldView(textField:UITextField, selector : Selector, inputView : Any){
        
        let bar = UIToolbar()
        bar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "확인", style: .done
            , target: self, action: selector)
        
        bar.setItems([doneButton], animated: true)
        textField.inputAccessoryView = bar
        
        if let tempView = inputView as? UIView {
            textField.inputView = tempView
        }
        if let tempView = inputView as? UIControl {
            textField.inputView = tempView
        }
        
    }
    
    @objc func selectedDatePicker1(){
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateformatter.string(from: datePicker.date)
        
        dateTextField.text = date
        
        view.endEditing(true)
    }
    
    @objc func selectedDatePicker2(){
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateformatter.string(from: datePicker.date)
        
        finishTextField.text = date
        
        view.endEditing(true)
    }
    
}
