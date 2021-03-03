//
//  ContentView.swift
//  flexolk_hw1
//
//  Created by User22 on 2021/3/3.
//

import SwiftUI
import CoreData

var questionList : Array<Question> = [
    Question(question: "長的少，短的多，腳去踩，手去摸(提示:日常用品)", answer:"梯子"),
    Question(question: "看看沒有，摸摸倒有，似冰不化，似水不流(提示:日常用品)", answer:"鏡子"),
    Question(question: "兩姐妹，一樣長，酸甜苦辣她先嚐(提示:日常用品)", answer:"筷子"),
    Question(question: "在家臉上白，出門臉上花，遠近都能到，一去不回家(提示:日常用品)", answer:"信"),
    Question(question: "身小力不小，團結又勤勞。有時搬糧食，有時挖地道(提示:動物)", answer:"螞蟻"),
    Question(question: "說馬不像馬，路上沒有它。若用它做藥，要到海中抓(提示:動物)", answer:"海馬"),
    Question(question: "黑臉包丞相，坐在大堂上。扯起八卦旗，專拿飛天將(提示:動物)", answer:"蜘蛛"),
    Question(question: "吃進的是草，擠出的是寶。捨己為人類，功勞可不小(提示:動物)", answer:"奶牛"),
    Question(question: "百姐妹，千姐妹，同床睡，各蓋被(提示:水果)", answer:"石榴"),
    Question(question: "左手五個，左手五個。拿去十個，還剩十個(提示:日常用品)", answer:"手套"),
    Question(question: "一物生得巧，地位比人高。戴上御風寒，脫下有禮貌(提示:日常用品)", answer:"帽子"),
    Question(question: "屋裡一座亭，亭中有個人，天天盪鞦韆，不盪就有病(提示:日常用品)", answer:"鐘擺"),
    Question(question: "頭上亮光光，出門就成雙。背上縛繩子，馱人走四方(提示:日常用品)", answer: "皮鞋"),
    Question(question: "不是點心不是糖,軟軟涼涼肚裡藏,不能吃來不能喝,每天也要嘗一嘗(提示:日常用品)", answer: "牙膏"),
    Question(question: "樓台接樓台，一層一層接起來，上面冒白氣，下面水開花(提示:日常用品)", answer: "蒸籠"),
    Question(question: "一間小藥房，藥品裡面藏。房子塗白色，十字畫中央(提示:日常用品)", answer: "醫藥箱"),
    Question(question: "薄薄一張口，能啃硬骨頭。吃肉不喝湯，吃瓜不嚼豆(提示:日常用品)", answer: "菜刀"),
    Question(question: "有硬有軟，有長有寬。白天空閒，夜晚上班(提示:日常用品)", answer: "床"),
]

struct Question{
    let question:String
    let answer:String
}

struct ContentView: View {
    @State private var index = 0
    @State private var isPlay = false
    @State private var isEnd = false
    @State private var showAns = false
    
    var body: some View {
        ZStack{
            VStack{
                if isPlay {
                    if isEnd {
                        Text("結束")
                            .foregroundColor(Color.pink)
                        Button(action:{
                            index = 0
                            isPlay = true
                            isEnd = false
                            showAns = false
                        },label:{Text("play again")})
                    }else{
                        Text("\(index+1). \(questionList[index].question)")
                            .foregroundColor(Color.pink)
                        if showAns {
                            Text("\(questionList[index].answer)")
                                .foregroundColor(Color.pink)
                                .padding(.top, 15.0)
                        }
                        Button(action:{dec2()},label:{Text("show ans")})
                            .padding(.top, 15.0)
                        Button(action:{detect()},label:{Text("next")})
                            .padding(.top, 15.0)
                    }
                }else{
                    Text("猜燈謎")
                        .foregroundColor(Color.pink)
                    Button(action:{play()},label:{Text("Play")})
                }
            }
        }
    }
        
    func dec2(){
        if showAns {
            showAns = false
        }else{
            showAns = true
        }
    }
    
    func play(){
        questionList.shuffle()
        index = 0
        isPlay = true
        isEnd = false
        showAns = false
    }
    
    func detect(){
        index+=1
        if index>=10{
            isEnd = true
        }
        showAns = false
    }

}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
