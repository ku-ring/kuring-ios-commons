//  Copyright © 2022 Kuring. All rights reserved.
//

/**
 MIT License

 Copyright (c) 2022 Kuring

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */
public struct KuringCommons {
    public init() {
        print("날 왜 만들었는가...")
    }
    
    public static func welcome() {
        print("""
        🔔 쿠링! 건국대학교 공지사항, 보통은 학과 단톡방, 동아리 단톡방에서 알려주는 것에 의존을 하거나 매번 학교 홈페이지에 접속해서 확인했어야 했습니다. 종종 놓치곤 했던 교환학생 공지사항, 장학금 신청 등... 이제 걱정하지 마세요. 우리 대학 공지사항, 쿠링이 알려드립니다!
        💖 쿠링의 스폰서가 되고 싶으시다면 언제든지 kuring.korea@gmail.com 또는 인스타그램 @kuring.konkuk 으로 연락주세요!
        📦 쿠링 SDK 를 사용하시려면 Kuring 클래스를 호출해주세요. 감사합니다.
        """)
    }
}
