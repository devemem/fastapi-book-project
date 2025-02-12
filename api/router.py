from fastapi import APIRouter

from api.routes import books

api_router = APIRouter()
api_router.include_router(books.router, prefix="/books", tags=["books"])

from fastapi import APIRouter, HTTPException
from typing import List

router = APIRouter()

# Sample books data
books = [
    {"id": 1, "title": "The Phoenix Project", "author": "Gene Kim"},
    {"id": 2, "title": "Accelerate", "author": "Nicole Forsgren"},
    {"id": 3, "title": "Site Reliability Engineering", "author": "Betsy Beyer"},
]

@router.get("/api/v1/books/{book_id}")
def get_book(book_id: int):
    book = next((b for b in books if b["id"] == book_id), None)
    if not book:
        raise HTTPException(status_code=404, detail="Book not found")
    return book

from fastapi import APIRouter
from api.routes.books import router as books_router

router = APIRouter()

router.include_router(books_router)
