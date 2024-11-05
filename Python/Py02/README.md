# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 강소안
- 리뷰어 : 김대환


# PRT(Peer Review Template)
- [ ]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 코랩에서 코더팀과의 결과물 정리가 미비되어 구현할 수 없는 상태였습니다.
    - 텍스트 처리, 단어 빈도수 계산, 결과 출력 등 기본 기능은 구현되었으나 구현된 이후의 값에 오류가 있었습니다.
    - process_text() 함수가 반환값 없이 return만 있었습니다.
    ```
     # 빈도수 딕셔너리 출력
        print("단어 빈도수 (정렬된 결과):")
    
        for index, (word, count) in indexed_freq.items():
            print(f"{index}: {word} - {count}")
    
        return
    ```
    
- [x]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 각 코드 블럭이 주석으로 잘 요약돼 있습니다. 
    - doc string은 없었습니다. 
    - 해당 코드의 기능과 작동 원리가 주석으로 기재돼었습니다. 
    - 코드가 간결하여 주석과 잘 매칭되었습니다. 
    
        
- [ ]  **3. 에러가 난 부분을 디버깅하여 문제를 해결한 기록을 남겼거나
새로운 시도 또는 추가 실험을 수행해봤나요?**
    -  디버깅에 대한 기록은 없었지만
    -  lambda 함수를 일반 함수(get_freq_count)로 대체한 시도를 명시했고 docstring으로 제시하면 좋을 것 같습니다.
        
- [ ]  **4. 회고를 잘 작성했나요?**
    - 회고에 대한 부분은 없었습니다. 
        
- [x]  **5. 코드가 간결하고 효율적인가요?**
    - 코드가 간결하고 효율적이었습니다.
    - 출력에 관한 중복이 있었습니다.
  ```
      def process_text(text):
    # 출력문이 함수 내에서 반복됨
    print("단어 리스트:", words)
    # ... 중간 로직 ...
    print("단어 빈도수 (정렬된 결과):")
    for index, (word, count) in indexed_freq.items():
        print(f"{index}: {word} - {count}")
   ```


# 회고(참고 링크 및 코드 개선)
```
# process_text() 함수 내에서 반복적인 print 문들이 있는데 
  별도의 함수로 분리하면 좋을 것 같습니다.

def process_text(text):
    """텍스트 처리 로직만 담당"""
    text = text.lower()
    text = re.sub(r'[^\w\s]', '', text)
    words = text.split()
    return words, word_freq(words)

def display_results(words, indexed_freq):
    """결과 출력만 담당"""
    print("단어 리스트:", words)
    print("단어 빈도수 (정렬된 결과):")
    for index, (word, count) in indexed_freq.items():
        print(f"{index}: {word} - {count}")

def process_user_input():
    """사용자 입력 처리"""
    text = input("단어를 입력하세요: \n")
    words, freq = process_text(text)
    display_results(words, freq)

# 이렇게 텍스트 처리 로직만 분리하면 좋을 것 같아요
```
