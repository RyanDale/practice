from django.contrib import admin
from allstars.models import League, Team, Game, Player, Statistic


admin.site.register(League)
admin.site.register(Team)
admin.site.register(Game)
admin.site.register(Player)
admin.site.register(Statistic)