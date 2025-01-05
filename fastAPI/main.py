import uvicorn
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware # cors issue
from pydantic import BaseModel
from typing import List

app = FastAPI()

# cors 이슈
origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 기존 Todo 모델 확장
class Todo(BaseModel):
    id: int
    title: str
    description: str
    completed: bool = False
    due_date: str  # 마감 기한 추가
    priority: str  # 우선순위 (low, medium, high) 추가

# 초기 데이터 추가
todos_db: List[Todo] = [
    Todo(id=1, title="장보기", description="우유, 계란, 빵 구매", completed=False, due_date="2024-12-31", priority="high"),
    Todo(id=2, title="운동", description="헬스장에서 1시간 유산소 운동", completed=False, due_date="2024-12-26", priority="medium"),
    Todo(id=3, title="회의 준비", description="프레젠테이션 자료 작성", completed=True, due_date="2024-12-25", priority="high"),
    Todo(id=4, title="책 읽기", description="플러터 강의책 읽기", completed=False, due_date="2024-12-27", priority="low"),
    Todo(id=5, title="친구 만나기", description="카페에서 3시 약속", completed=False, due_date="2024-12-29", priority="medium"),
    Todo(id=6, title="업데이트 작업", description="FastAPI 서버 코드 리팩토링", completed=True, due_date="2024-12-30", priority="high"),
    Todo(id=7, title="저녁 준비", description="요리 재료 준비 및 요리", completed=False, due_date="2024-12-25", priority="medium"),
    Todo(id=8, title="청소", description="방 정리 및 청소기 돌리기", completed=False, due_date="2024-12-28", priority="low"),
    Todo(id=9, title="개발 공부", description="Dart 언어 공부하기", completed=False, due_date="2024-12-30", priority="medium"),
    Todo(id=10, title="주간 계획 작성", description="다음 주 일정 정리", completed=False, due_date="2024-12-31", priority="low"),
]


@app.post("/todos/", response_model=Todo)
async def create_todo(todo: Todo):
    # ID 중복 확인
    for existing_todo in todos_db:
        if existing_todo.id == todo.id:
            raise HTTPException(status_code=400, detail="해당 ID를 가진 Todo 항목이 이미 존재합니다.")

    todos_db.append(todo)
    return todo

@app.get("/todos/", response_model=List[Todo])
async def get_all_todos():
    return todos_db

@app.get("/todos/{todo_id}", response_model=Todo)
async def get_todo(todo_id: int):
    for todo in todos_db:
        if todo.id == todo_id:
            return todo

    raise HTTPException(status_code=404, detail="해당 ID의 Todo 항목을 찾을 수 없습니다.")

@app.put("/todos/{todo_id}", response_model=Todo)
async def update_todo(todo_id: int, updated_todo: Todo):
    for index, existing_todo in enumerate(todos_db):
        if existing_todo.id == todo_id:
            todos_db[index] = updated_todo
            return updated_todo

    raise HTTPException(status_code=404, detail="해당 ID의 Todo 항목을 찾을 수 없습니다.")

@app.delete("/todos/{todo_id}")
async def delete_todo(todo_id: int):
    for index, todo in enumerate(todos_db):
        if todo.id == todo_id:
            todos_db.pop(index)
            return {"message": "Todo 항목이 성공적으로 삭제되었습니다."}

    raise HTTPException(status_code=404, detail="해당 ID의 Todo 항목을 찾을 수 없습니다.")

if __name__ == "__main__":
    uvicorn.run("main:app", host="127.0.0.1", port=5000, reload=True)