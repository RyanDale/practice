from django.db import models

class League(models.Model):
    name=models.CharField(max_length=30)


class Team(models.Model):
    league = models.ForeignKey(League)
    name=models.CharField(max_length=30)
    wins=models.IntegerField()
    loss=models.IntegerField()

class Game(models.Model):
    #team_1 = models.ForeignKey(Team)
    #team_2 = models.ForeignKey(Team)
    week = models.IntegerField()
    #Game's results are randomly generated, but they do make use of player ratings which means
    #teams with higher skilled players are more likely to win.
    def generate_result():
        pass
        #insert whatever logic we're going to use to decide the results here.

class Player(models.Model):
    team = models.ForeignKey(Team)
    name = models.CharField(max_length=40)
    date_of_birth = models.CharField(max_length=20)
    college = models.CharField(max_length=20)

    #This will either be QB (quarterback), RB (running back), WR (wide receiver), or TE (tight end).
    position = models.CharField(max_length=20)

    #We will use these basic ratings to make players less random. These stats can be used when
    #determining game results. Some positions may not use certain ratings (i.e. running backs
    #will not be judged based on their passing).
    passing=models.IntegerField()
    speed=models.IntegerField()
    agility=models.IntegerField()
    strength=models.IntegerField()

class Statistic(models.Model):
    #receiving and rushing touchdowns/yards are worth the same so I'm lumping them into one attribute.
    player = models.ForeignKey(Player)
    receiving_yards=models.IntegerField()
    passing_yards=models.IntegerField()
    receiving_touchdowns=models.IntegerField()
    passing_touchdowns=models.IntegerField()

    #This is a basic way of calculating how many points a player has.
    def calculate_points():
        return (receiving_yards/10)+(passing_yards/25)+(receiving_touchdowns*6)+(passing_touchdowns*4)




