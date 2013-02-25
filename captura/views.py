#encoding:utf-8

# Create your views here.

#Importar modelos de la aplicacion
from captura.models import *
from captura.forms import *

#Modulos de Django
from django.core.mail import *
from email.mime.image import MIMEImage
from django.contrib import auth
from django.contrib.humanize.templatetags.humanize import *
from django.contrib.auth.decorators import login_required
from django.utils.numberformat import *
from django.utils.html import strip_tags
from django.shortcuts import render_to_response
from django.http import HttpResponse,HttpResponseRedirect
from django.template.loader import render_to_string
from django.template.context import RequestContext
from django.db.models import Q
from django.db.models import Count
from django.views.decorators.csrf import csrf_exempt

# Primer formulario

@csrf_exempt
def Registro(request):
	template = 'registro.html' #nombre de la plantilla
	if request.method == 'POST':
		mail = request.POST['mail']
		nombre = request.POST['nombre']
		apellidos = request.POST['apellidos']
		form = FrmReg(request.POST)
		if form.is_valid():
			try:
				permisos = Permisos.objects.get(Q(nombre=nombre) & Q(apellidos=apellidos) & Q(mail=mail))
			except Permisos.DoesNotExist:
				permisosNew = Permisos()
				permisosNew.nombre = nombre
				permisosNew.apellidos = apellidos
				permisosNew.mail = mail
				permisosNew.save()

				NewReg = Permisos.objects.get(mail=mail)

				p = str(NewReg.id)

				if len(p) == 1:
					p = '00000' + p
				elif len(p) == 2:
					p = '0000' + p
				elif len(p) == 3:
					p = '000' + p
				elif len(p) == 4:
					p = '00' + p
				elif len(p) == 5:
					p = '0' + p

				NewReg.password = p
				NewReg.save()

				# Llena los datos con los que se llenara el mail
				password = p
				subject, to = 'Confirmacion de registro', mail
				lista = {'mail':mail, 'nombre':nombre, 'apellidos':apellidos, 'password':password}

				# Renderea el contenido del testo del cuerpo de html
				html_content = render_to_string('mail.html', {'lista':lista})
				text_content = strip_tags(html_content)

				# Crea el mail y hace el attach del contenido rendereado como contenido en html
				msg = EmailMultiAlternatives(subject, text_content, 'dante.arkade7@gmail.com', [to])
				msg.attach_alternative(html_content, "text/html")

				# Abre y lee esta imagen
				image_file = open('C:/www/cmim/cmim/templates/css/logo_home.png', 'rb')
				msg_image = MIMEImage(image_file.read())
				image_file.close()
				
				# Hace el attach dentro del mail
				msg_image.add_header('Content-ID', '<image1>')
				msg.attach(msg_image)

				# Envia el mail
				msg.send()				

				return HttpResponseRedirect('/')
	else:
		form = FrmReg()
	#Enviar parametros al 'render_to_response'
	lista = {'form': form}
	return render_to_response(template, lista, context_instance=RequestContext(request))

# Formulario de logeo
# Validacion de usuario y contraseña

@csrf_exempt
def Login(request):
	template = 'login.html' #nombre de la plantilla
	if request.method == 'POST':
		form = FrmLogin(request.POST)
		if form.is_valid():
			try:
				m = Permisos.objects.get(mail=request.POST['mail'])
				if m.password == request.POST['password']:					
					request.session['mail'] = m.mail
					request.session['nombre'] = m.nombre
					request.session['apellidos'] = m.apellidos
					request.session['id'] = m.id
					return HttpResponseRedirect('perfil')
			except Permisos.DoesNotExist:
				return HttpResponseRedirect('/')
	else:			
		form = FrmLogin()
	return render_to_response(template,{'form':form} , context_instance=RequestContext(request))

# Vistas para los formularios
# Vistas para guardar informacion en los formularios

@csrf_exempt
def VistaGenerales(request):
	template = 'panel.html' #nombre de la plantilla
	elementos = MenuContext.objects.values('menu','submenu').filter(menu='perfil')

	try:
		editar = Tbl1DatosGenerales.objects.get(Q(nombre=request.session['nombre']) & Q(apellidos=request.session['apellidos']))
	except Tbl1DatosGenerales.DoesNotExist:
		m = Tbl1DatosGenerales()
		m.id_gen = request.session['id']
		m.nombre = request.session['nombre']
		m.apellidos = request.session['apellidos']
		m.save()

		editar = Tbl1DatosGenerales.objects.get(Q(nombre=request.session['nombre']) & Q(apellidos=request.session['apellidos']))

	if request.method == 'POST':
		form = Generales(request.POST, instance=editar) 
		if form.is_valid():
			form.save()
			return HttpResponseRedirect('VistaGenerales')
	else:
		form = Generales(instance=editar)
	#Enviar parametros al 'render_to_response'
	lista = {'lista':elementos,'form': form}
	return render_to_response(template, lista, context_instance=RequestContext(request))

@csrf_exempt
def VistaAcademica(request):
	template = 'panel.html' #nombre de la plantilla
	elementos = MenuContext.objects.values('menu','submenu').filter(menu='perfil')

	try:
		editar = Tbl1DatosEspecialidad.objects.get(Q(nombre=request.session['nombre']) & Q(apellidos=request.session['apellidos']))
	except Tbl1DatosEspecialidad.DoesNotExist:
		m = Tbl1DatosEspecialidad()
		m.id_gen = request.session['id']
		m.nombre = request.session['nombre']
		m.apellidos = request.session['apellidos']
		m.save()

		editar = Tbl1DatosEspecialidad.objects.get(Q(nombre=request.session['nombre']) & Q(apellidos=request.session['apellidos']))

	if request.method == 'POST':
		form = Especialidad(request.POST, instance=editar) 
		if form.is_valid():
			form.save()
			return HttpResponseRedirect('VistaAcademica')
	else:
		form = Especialidad(instance=editar)
	#Enviar parametros al 'render_to_response'
	lista = {'lista':elementos,'form': form}
	return render_to_response(template, lista, context_instance=RequestContext(request))

# Vistas de menus principales

@csrf_exempt
def PanelPerfil(request):
	template = 'panel.html' #nombre de la plantilla
	elementos = MenuContext.objects.values('menu','submenu').filter(menu='perfil')
	lista = {'lista':elementos}
	return render_to_response(template,lista,RequestContext(request))

@csrf_exempt
def PanelAnualidades(request):
	template = 'panel.html' #nombre de la plantilla
	elementos = MenuContext.objects.values('menu','submenu').filter(menu='anualidades')
	lista = {'lista':elementos}
	return render_to_response(template,lista,RequestContext(request))

@csrf_exempt
def PanelCursos(request):
	template = 'panel.html' #nombre de la plantilla
	elementos = MenuContext.objects.values('menu','submenu').filter(menu='cursos')
	lista = {'lista':elementos}
	return render_to_response(template,lista,RequestContext(request))

'''@csrf_exempt
def PanelPromociones(request):
	template = 'panel.html' #nombre de la plantilla
	elementos = MenuContext.objects.values('menu','submenu').filter(menu='perfil')
	lista = {'lista':elementos}
	return render_to_response(template,lista)'''