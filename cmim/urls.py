from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'cmim.views.home', name='home'),
    # url(r'^cmim/', include('cmim.foo.urls')),

    url(r'^accounts/login/$','Login'),
    url(r'^$', 'captura.views.Login'),
    url(r'^registro', 'captura.views.Registro'),

    #Url de el panel
    url(r'^perfil', 'captura.views.PanelPerfil'),
    url(r'^anualidades', 'captura.views.PanelAnualidades'),
    url(r'^cursos', 'captura.views.PanelCursos'),
    #url(r'^promociones', 'captura.views.PanelPromociones'),

    #Dinamicas para formularios
    url(r'^generales/', 'captura.views.VistaGenerales'),
    url(r'^academica/', 'captura.views.VistaAcademica'),
    url(r'^profesional/', 'captura.views.VistaProfesional'),
    url(r'^direccion/', 'captura.views.VistaDireccion'),
    url(r'^contacto/', 'captura.views.VistaContacto'),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
