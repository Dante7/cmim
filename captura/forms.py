#encoding:utf-8
from django.forms import ModelForm
from django import forms
from django.forms import widgets, PasswordInput
from captura.models import *
from django.forms.extras.widgets import SelectDateWidget

years = ('1980', '1981', '1982')
generos = (('1', 'Hombre'), ('2', 'Mujer'))
sino = (('si', 'Si'), ('no', 'No'))
estados = (('mexico','mexico'),('df','df'))
municipios = (('uno','uno'),('dos','dos'))

class FrmLogin(forms.Form):
	"""docstring for FrmLogin"""
	mail = forms.EmailField()
	password = forms.CharField(widget=PasswordInput())

class FrmReg(forms.Form):
	"""docstring for Registro"""
	mail = forms.EmailField()
	nombre = forms.CharField()
	apellidos = forms.CharField()

class Generales(forms.ModelForm):
	"""docstring for Generales"""

	id_gen = forms.IntegerField(label='Identificador')
	cod_socio = forms.CharField(label='Codigo de socio')
	cedula = forms.IntegerField(label='Cedula')
	cedula_mi = forms.CharField(label='Cedula de Medico Internista')
	en_tramite = en_tramite = forms.ChoiceField(label='¿Esta en tramite?', choices=sino)
	nombre = forms.CharField(label='Nombre')
	apellidos = forms.CharField(label='Apellidos')
	sexo = forms.ChoiceField(label='Sexo', choices=generos)
	fecha_nac = forms.DateField(label='Fecha de nacimiento', widget=SelectDateWidget(years=years))
	
	class Meta:
		model = Tbl1DatosGenerales

class Especialidad(forms.ModelForm):
	"""docstring for Especialidad"""
	id_esp = forms.IntegerField(label='Identificador')
	cod_socio = forms.CharField(label='Codigo de socio')
	espe = forms.CharField(label='Especialidad')
	nivel_espe = forms.CharField(label='Nivel de especialidad')
	univ = forms.CharField(label='Universidad de egreso')
	facultad = forms.CharField(label='Facultad')
	gradu_a = forms.DateField(label='Fecha de graduacion', widget=SelectDateWidget(years=years))
	# Datos de afiliacion
	cod_filial = forms.ForeignKey(label='Codigo de filial')
	f_afiliacion = forms.DateField(label='Fecha de afiliacion', widget=SelectDateWidget(years=years))
	class Meta:
		model = Tbl1DatosEspecialidad


class Certificaciones(forms.ModelForm):
	"""docstring for Certificaciones"""
	cedula = forms.CharField()
	certificado = forms.ChoiceField(choices=sino)
	consejo = forms.CharField()
	f_cert = forms.DateField(widget=SelectDateWidget(years=years))
	class Meta:
		model = Tbl2Certificaciones

class Domicilio(forms.ModelForm):
	"""docstring for Direccion"""
	cedula = forms.CharField()
	cod_estado = forms.ChoiceField(choices=estados)
	cod_del_mun = forms.ChoiceField(choices=municipios)
	colonia = forms.CharField()
	direccion = forms.CharField()
	calle = forms.CharField()
	num_int = forms.IntegerField()
	num_ext = forms.IntegerField()
	cp = forms.CharField()
	pais = forms.CharField()
	class Meta:
		model = Tbl1DatosDomicilio

class Contacto(forms.ModelForm):
	"""docstring for Contacto"""
	cedula = forms.CharField()
	tel_casa = forms.CharField()
	tel_oficina = forms.CharField()
	fax = forms.CharField()
	tel_celular = forms.CharField()
	mail = forms.EmailField()
	class Meta:
		model = Tbl1DatosContacto