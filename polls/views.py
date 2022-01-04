from django.http import HttpRequest, HttpResponse
from django.shortcuts import render


def index(request: HttpRequest) -> HttpResponse:
    return HttpResponse("Hello, world. You're at the polls index")


def detail(request: HttpRequest, question_id: int) -> HttpResponse:
    return HttpResponse(f"You're looking at question {question_id}")


def results(request: HttpRequest, question_id: int) -> HttpResponse:
    response = "You're looking at the results of question %s."
    return HttpResponse(response % question_id)


def vote(request: HttpRequest, question_id: int) -> HttpResponse:
    return HttpResponse("You're voting on question %s." % question_id)
