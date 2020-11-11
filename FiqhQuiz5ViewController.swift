import UIKit

class FiqhQuiz5ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        gameQ.append(Question(text: "What is special about the 12 Imams?", answers: [
        Answer(text: "They are Masoom (sinless)", correct: true),
        Answer(text: "They can perform miracles", correct: false),
        Answer(text: "They can not die", correct: false),
        Answer(text: "Nothing", correct: false),
    ]))
        gameQ.append(Question(text: "What does Islam mean?", answers: [
        Answer(text: "Muslim", correct: false),
        Answer(text: "God", correct: false),
        Answer(text: "Peace", correct: true),
        Answer(text: "Religion", correct: false),
    ]))
        gameQ.append(Question(text: "Which country does Hajj take place?", answers: [
        Answer(text: "Iraq", correct: false),
        Answer(text: "Saudi Arabia", correct: true),
        Answer(text: "UAE", correct: false),
        Answer(text: "Iran", correct: false),
    ]))
        gameQ.append(Question(text: "How many Prophets are mentioned in the Quran?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "17", correct: false),
        Answer(text: "25", correct: true),
        Answer(text: "124000", correct: false),
    ]))
        gameQ.append(Question(text: "Which Prophet was labeled as Allah's friend in the Quran?", answers: [
        Answer(text: "Prophet Muhammed", correct: false),
        Answer(text: "Prophet Ibrahim", correct: true),
        Answer(text: "Prophet Adam", correct: false),
        Answer(text: "Prophet Musa", correct: false),
    ]))
        gameQ.append(Question(text: "Which of the following meat are we not allowed to eat?", answers: [
        Answer(text: "Chicken", correct: false),
        Answer(text: "Lamb", correct: false),
        Answer(text: "Beef", correct: false),
        Answer(text: "Pork", correct: true),
    ]))
        gameQ.append(Question(text: "Which of these are acceptable islamic sources?", answers: [
        Answer(text: "Quran", correct: false),
        Answer(text: "Islamic Scholars", correct: false),
        Answer(text: "Reliable Hadith", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        gameQ.append(Question(text: "Which one of these is our duty to do as a muslim?", answers: [
        Answer(text: "Zakat", correct: false),
        Answer(text: "Daily Prayers", correct: false),
        Answer(text: "Being Kind", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        gameQ.append(Question(text: "How many versions of the Quran are there?", answers: [
        Answer(text: "114", correct: false),
        Answer(text: "1", correct: true),
        Answer(text: "32", correct: false),
        Answer(text: "4", correct: false),
    ]))
        gameQ.append(Question(text: "Why is Fiqh important?", answers: [
        Answer(text: "It teaches us our duties", correct: false),
        Answer(text: "It teaches us right and wrong", correct: false),
        Answer(text: "It teaches us to be good humans", correct: false),
        Answer(text: "All of the above", correct: true),
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
