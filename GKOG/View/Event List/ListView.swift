//
//  ListView.swift
//  GKOG
//
//  Created by Suji Lee on 11/7/23.
//

import SwiftUI

struct ListView: View {
    let systemWidth : CGFloat = UIScreen.main.bounds.width
    let systemHeight : CGFloat = UIScreen.main.bounds.height
    
    @State var eventSearchText: String = ""
    
    var body: some View {
        VStack(spacing: 40) {
            //이벤트 모아보기 제목
            HStack {
                Text("# 진행중")
                    .font(.system(size: 24, weight: .semibold))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, -17)
            //이벤트 검색창
            RoundedRectangle(cornerRadius: 20)
                .stroke()
                .frame(width: systemWidth * 0.9, height: systemHeight * 0.045)
                .overlay(alignment: .leading, content: {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("", text: $eventSearchText)
                    }
                    .padding(16)
                })
                .foregroundColor(.hexBABABA)
            //이벤트 카드
            ScrollView(content: {
                assignedEventCard(category: Category.smallMeeting, title: "이벤트", tag: "#iOS #비정규 #노회식", time: "23-12-06 - 23-12-06", location: "지존iOS 광진구 정복")
                assignedEventCard(category: Category.smallMeeting, title: "이벤트", tag: "#iOS #비정규 #노회식", time: "23-12-06 - 23-12-06", location: "지존iOS 광진구 정복")
                assignedEventCard(category: Category.study, title: "이벤트", tag: "#iOS #비정규 #노회식", time: "23-12-06 - 23-12-06", location: "지존iOS 광진구 정복")
                assignedEventCard(category: Category.impromptu, title: "이벤트", tag: "#iOS #비정규 #노회식", time: "23-12-06 - 23-12-06", location: "지존iOS 광진구 정복")
                
            })
            //이벤트 생성 버튼
//            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.hexB38DE2)
                    .frame(width:systemWidth * 0.92, height: systemHeight * 0.063)
                    .overlay(content: {
                        Text("이벤트 생성")
                            .font(.system(size: 15))
                            .foregroundColor(.hexFFFFFF)
                    })
            })
            
        }
        .padding()
        
    }
    //이벤트 카드
    @ViewBuilder
    func assignedEventCard(category: Category, title: String, tag: String, time: String, location: String) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: 3, height: 50)
                .foregroundColor(category.representColor)
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.hex4E483C)
                    Text(tag)
                        .font(.system(size: 10))
                        .foregroundColor(.hex8161A8)
                    Spacer()
                    Text(time)
                        .font(.system(size: 10))
                        .foregroundColor(.hex8F8F8F)
                }
                .padding(.bottom, 9)
                //장소?
                Text(location)
                    .font(.system(size: 11))
                    .foregroundStyle(.hex4E483C)
            }
            .padding()
        }
    }
    // Category enum으로 설정해서 공유하고 싶은데 혹시 충돌날까봐 안으로 들여옴.
    enum Category {
        case study
        case smallMeeting
        case impromptu
        case publicRelation
        var representColor: Color {
            switch self {
            case .study:
                return Color.hexF4E698
            case .smallMeeting:
                return Color.hexC8E48B
            case .impromptu:
                return Color.hexBBE8F6
            case .publicRelation:
                return Color.hexF6BFBB
            }
        }
    }
}

#Preview {
    ListView()
}
