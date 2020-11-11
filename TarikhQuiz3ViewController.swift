import UIKit

class TarikhQuiz3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        gameQ.append(Question(text: "Who was the first ever women to accept Islam", answers: [
        Answer(text: "Lady Zahra", correct: false),
        Answer(text: "Lady Khadijah", correct: true),
        Answer(text: "Lady Fatima", correct: false),
        Answer(text: "Aisha", correct: false),
    ]))
        gameQ.append(Question(text: "Which women declared war on Imam Ali?", answers: [
        Answer(text: "Aisha", correct: true),
        Answer(text: "Qutaylah", correct: false),
        Answer(text: "Asma", correct: false),
        Answer(text: "Hafsa", correct: false),
    ]))
        gameQ.append(Question(text: "Which Prophet did Allah tell to build an ark?", answers: [
        Answer(text: "Prophet Adam", correct: false),
        Answer(text: "Prophet Ayub", correct: false),
        Answer(text: "Prophet Noah", correct: true),
        Answer(text: "Prophet Isa", correct: false),
    ]))
        gameQ.append(Question(text: "What day was Imam Mahdi (as) born on?", answers: [
        Answer(text: "15th Shaban", correct: true),
        Answer(text: "10th Shaban", correct: false),
        Answer(text: "20th Shaban", correct: false),
        Answer(text: "5th Shaban", correct: false),
    ]))
        gameQ.append(Question(text: "Which Prophet was able to speak to Allah directly?", answers: [
        Answer(text: "Prophet Muhammed", correct: false),
        Answer(text: "Prophet Dawood", correct: false),
        Answer(text: "Prophet Musa", correct: true),
        Answer(text: "Prophet Adam", correct: false),
    ]))
        gameQ.append(Question(text: "Who built the Ka'ba?", answers: [
        Answer(text: "Prophet Muhammed", correct: false),
        Answer(text: "Prophet Ibrahim", correct: false),
        Answer(text: "Prophet Ismail", correct: false),
        Answer(text: "Prophet Ibrahim and Prophet Ismail", correct: true),
    ]))
        gameQ.append(Question(text: "What did Hazarat Mukhtar do which was so significant?", answers: [
        Answer(text: "Avenged Imam Hussain", correct: true),
        Answer(text: "Avenged Imam Ali", correct: false),
        Answer(text: "Avenged the Holy Prophet", correct: false),
        Answer(text: "All of the above", correct: false),
    ]))
        gameQ.append(Question(text: "Who is Imam Alis father", answers: [
        Answer(text: "Abu Talib", correct: true),
        Answer(text: "Prophet Muhammed", correct: false),
        Answer(text: "Imam Hussain", correct: true),
        Answer(text: "None of the above", correct: false),
    ]))
        gameQ.append(Question(text: "What is the name of the sword which was passed down to all the Imams?", answers: [
        Answer(text: "Zuljinar", correct: false),
        Answer(text: "Zulfiqar", correct: true),
        Answer(text: "Zubair", correct: false),
        Answer(text: "Zunair", correct: false),
    ]))
        gameQ.append(Question(text: "What are the two main sects in Islam?", answers: [
        Answer(text: "Sunni and Wahabi", correct: false),
        Answer(text: "There are only muslims", correct: false),
        Answer(text: "Shia and Sunni", correct: true),
        Answer(text: "Salafi and Shia", correct: false),
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
