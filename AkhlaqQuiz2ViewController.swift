

import UIKit

class AkhlaqQuiz2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var gameQ = [Question]()
    
    var currentQ: Question?

    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setupQuestions()
        configuireUI(question: gameQ.first!)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    private func configuireUI(question: Question) {
        label.text = question.text
        currentQ = question
        table.reloadData()
    }
    
    private func checkA(answer: Answer, question: Question) -> Bool {
        return question.answers.contains(where: { $0.text == answer.text }) && answer.correct
    }
    
    private func setupQuestions() {
        gameQ.append(Question(text: "What determines if someone has good or bad Akhlaq?", answers: [
        Answer(text: "Their manners", correct: true),
        Answer(text: "Their friends", correct: false),
        Answer(text: "Their knowledge", correct: false),
        Answer(text: "Thier past", correct: false),
    ]))
        
        gameQ.append(Question(text: "Which one of the following is a good example of Akhlaq?", answers: [
        Answer(text: "Lying", correct: false),
        Answer(text: "Stealing", correct: false),
        Answer(text: "Helping Parents", correct: true),
        Answer(text: "Showing Greed", correct: false),
    ]))
        gameQ.append(Question(text: "Which one of following is a bad example of Akhlaq?", answers: [
        Answer(text: "Being Lazy", correct: true),
        Answer(text: "Following the teachings of the Ahlulbayt", correct: false),
        Answer(text: "Sharing", correct: false),
        Answer(text: "Caring for others", correct: false),
    ]))
        gameQ.append(Question(text: "Who was first sent by Allah to teach people about Akhlaq?", answers: [
        Answer(text: "Imam Ali (as)", correct: false),
        Answer(text: "Abu Bakr", correct: false),
        Answer(text: "Prophet Adam (PBUH)", correct: false),
        Answer(text: "Prophet Muhammed (PBUH)", correct: true),
    ]))
        gameQ.append(Question(text: "Which foot should we enter the mosque with?", answers: [
        Answer(text: "Right", correct: true),
        Answer(text: "Left", correct: false),
        Answer(text: "Any", correct: false),
        Answer(text: "Our dominant foot", correct: false),
    ]))
        gameQ.append(Question(text: "Why should we say Bismillah before starting anything?", answers: [
        Answer(text: "Gives us good luck", correct: false),
        Answer(text: "Allah helps us in the work we are doing", correct: true),
        Answer(text: "Gives us strength", correct: false),
        Answer(text: "Does nothhing", correct: false),
    ]))
        gameQ.append(Question(text: "Why should we keep clean?", answers: [
        Answer(text: "To impress others", correct: false),
        Answer(text: "Too look good", correct: false),
        Answer(text: "Too feel good", correct: false),
        Answer(text: "Too remain healthy", correct: true),
    ]))
        gameQ.append(Question(text: "What are we told about heaven?", answers: [
        Answer(text: "It lies under the feet of your mother", correct: true),
        Answer(text: "It lies under the feet of your father", correct: false),
        Answer(text: "It lies under the feet of the Holy Prophet", correct: false),
        Answer(text: "It lies under the feet of Imam Ali", correct: false),
    ]))
        gameQ.append(Question(text: "Should we treat our grandparents same as our parents?", answers: [
        Answer(text: "No", correct: false),
        Answer(text: "Sometimes", correct: false),
        Answer(text: "Yes, ofcourse", correct: true),
    ]))
        gameQ.append(Question(text: "Who is our creator?", answers: [
        Answer(text: "Allah", correct: true),
        Answer(text: "Shaitan", correct: false),
        Answer(text: "Prophet Muhammed", correct: false),
        Answer(text: "Iblees", correct: true),
    ]))
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQ?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currentQ?.answers[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = currentQ else {
            return
        }
        
        let answer = question.answers[indexPath.row]
        
        if checkA(answer: answer, question: question) {
            if let index = gameQ.firstIndex(where: { $0.text == question.text }) {
                if index < (gameQ.count - 1) {
                    let nextQ = gameQ[index+1]
                    print("\(nextQ.text)")
                    currentQ = nil
                    configuireUI(question: nextQ)
                    
                }
                else {
                    let alert = UIAlertController(title: "Well Done", message: "You Did It!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    present(alert, animated: true)
                    
                }
        }
        else {
            let alert = UIAlertController(title: "Incorrect", message: "You Can Do It! Try Again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }

    
    



   
}

struct Question {
    let text: String
    let answers: [Answer]
}

struct Answer {
    let text: String
    let correct: Bool
    
}

}

