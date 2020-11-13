#!/usr/bin/env python3
from random import *

rounds = score = 0
prob = 1

def check(answer, a):
	global  score
	if answer == a:
		print("Correct!")
		score += 1
	else:
		print("Oops, incorrect. The answer was {}.".format(a))

def userAnswer():
	while True:
		try:
			answer = int(input("> "))
			break
		except ValueError:
			print("Invalid entry, try again.")
			continue
	return answer

def finalScore():
	global rounds, score
	final = score/rounds
	print("You scored {num} out of {rounds} for a total of {:.0%}!".format(final, num=score, rounds=rounds))
	if final == 1.0:
		print("A Perfect score! Woohoo!")
	elif 0.9 < final < 1.0:
		print("Awesome, you get an A!")
	elif 0.8 <= final < 0.9:
		print("Good job, you got a B.")
	elif 0.7 <= final < 0.8:
		print("Ok, but could be better! You got a C.")
	elif 0.6 <= final < 0.7:
		print("Not great, you got a D. Try again!")
	else:
		print("Oof, that's an F. Not good, try again!")

def add():
	global rounds, prob
	x = randint(1, 12)
	y = randint(1, 12)
	a = x+y
	print("{prob}. {x} + {y} = ?".format(prob=prob, x=x, y=y))
	answer = userAnswer()
	check(answer, a)
	prob += 1

def sub():
	global rounds, prob
	x = randint(1, 12)
	y = randint(1, 12)
	a = x-y
	print("{prob}. {x} - {y} = ?".format(prob=prob, x=x, y=y))
	answer = userAnswer()
	check(answer, a)
	prob += 1

def mult():
	global rounds, prob
	x = randint(1, 12)
	y = randint(1, 12)
	a = x*y
	print("{prob}. {x} * {y} = ?".format(prob=prob, x=x, y=y))
	answer = userAnswer()
	check(answer, a)
	prob += 1

def div():
	global rounds, prob
	while True:
		x = randint(2, 100)
		y = randint(2, 12)
		if x%y == 0:
			a = x // y
			break
		else:
			continue
	print("{prob}. {x} / {y} = ?".format(prob=prob, x=x, y=y))
	answer = userAnswer()
	check(answer, a)
	prob += 1

print("FlashyCards v.4.0\nBy: Marco Salsiccia")

while True:
	print("""
	Choose your operand:
	\t 1. Addition
	\t 2. Subtraction
	\t 3. Multiplication
	\t 4. Division
	\t 5. Surprise me!
	""")

	while True:
		try:
			selection = input("> ")
			break
		except ValueError:
			print("Invalid entry, try again!")
			continue

	print("And how many rounds do you want?")
	while True:
		try:
			rounds = int(input(">"))
			break
		except ValueError:
			print("That wasn't a number!")
			continue

	if selection == "1":
		while prob <= rounds:
			add()
	elif selection == "2":
		while prob <= rounds:
			sub()
	elif selection == "3":
		while prob <= rounds:
			mult()
	elif selection == "4":
		while prob <= rounds:
			div()
	elif selection == "5":
		while prob <= rounds:
			picker = randint(1, 4)
			if picker == 1:
				add()
			elif picker == 2:
				sub()
			elif picker == 3:
				mult()
			elif picker == 4:
				div()
			continue
	else:
		print("You forgot to choose something!")
		continue

	finalScore()
	print("Care to try again?")
	user = input("y/n?")
	if user == "y":
		rounds = 0
		prob = 1
		score = 0
		continue
	else:
		break