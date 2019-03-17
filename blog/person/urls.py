from django.conf.urls import url
from . import views
from . import search_views

app_name = 'person'

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^about/$', views.about, name='about'),
    url(r'^stayhungry/(\d+)/(\d+)/$', views.stayhungry, name='stayhungry'),
    url(r'^slowlife/$', views.slowlife, name='slowlife'),
    url(r'^message/$', views.message, name='message'),
    url(r'^pageAjax/$', views.pageAjax, name='pageAjax'),
    url(r'^chartInfo/$', views.change_info, name='chartInfo'),
    url(r'^detail/(\d+)/$', views.detail, name='detail'),
    url(r'^search/', search_views.MySearchView(), name='haystack_search'),
]