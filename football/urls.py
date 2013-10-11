from django.conf.urls import patterns, include, url
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', 'allstars.views.home', name='home'),

    url(r'^players/', 'allstars.views.players', name='players'),

    url(r'^admin/', include(admin.site.urls)),
)
