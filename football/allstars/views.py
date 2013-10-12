from django.shortcuts import render
from django.http import Http404

from allstars.models import Player

def home(request):
    return render(request, 'allstars/home.html', {
    })

def player_detail(request, player_name):
	try:
		p = Player.objects.get(name = player_name)
	except: #todo name exception
		raise Http404
	return render(request, 'allstars/player_detail.html', {
		'player':p,
		})

def players(request):
	return render(request, 'allstars/players.html', {
	})
