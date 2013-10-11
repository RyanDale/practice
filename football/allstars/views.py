from django.shortcuts import render

def home(request):
    return render(request, 'allstars/home.html', {
    })

def players(request):
	return redner(request, 'allstars/players.html', {
	})