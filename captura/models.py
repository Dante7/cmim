# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

from django.db import models

class MenuContext(models.Model):
    menu = models.CharField(max_length=45, blank=True)
    submenu = models.CharField(max_length=90, blank=True)
    class Meta:
        db_table = u'menu_context'

class Banco(models.Model):
    cod_banco = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=60, blank=True)
    class Meta:
        db_table = u'banco'

	def __unicode__(self):
		return self.nombre

class Ciudad(models.Model):
    cod_ciudad = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=150, blank=True)
    class Meta:
        db_table = u'ciudad'

	def __unicode__(self):
		return self.nombre

class DelMun(models.Model):
    cod_del_mun = models.IntegerField(primary_key=True)
    del_mun = models.CharField(max_length=240, blank=True)
    class Meta:
        db_table = u'del_mun'

	def __unicode__(self):
		return self.del_mun

class Estados(models.Model):
    cod_estado = models.IntegerField(primary_key=True)
    estado = models.CharField(max_length=45, blank=True)
    class Meta:
        db_table = u'estados'

	def __unicode__(self):
		return self.estado

class Filial(models.Model):
    cod_filial = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=75, blank=True)
    cod_ciudad = models.ForeignKey(Ciudad, null=True, db_column='cod_ciudad', blank=True)
    class Meta:
        db_table = u'filial'

	def __unicode__(self):
		return self.nombre

class TipoCursos(models.Model):
    cod_curso = models.IntegerField(primary_key=True)
    nombre_curso = models.CharField(max_length=135, blank=True)
    fecha_curso = models.DateField(null=True, blank=True)
    tipo_curso = models.CharField(max_length=45, blank=True)
    class Meta:
        db_table = u'tipo_cursos'

	def __unicode__(self):
		return self.nombre_curso

class TipoPago(models.Model):
    cod_tpago = models.IntegerField(primary_key=True)
    tipo_pago = models.CharField(max_length=45, blank=True)
    cod_banco = models.ForeignKey(Banco, db_column='cod_banco')
    class Meta:
        db_table = u'tipo_pago'

	def __unicode__(self):
		return self.tipo_pago

class Permisos(models.Model):
    mail = models.CharField(max_length=30)
    password = models.CharField(max_length=50)
    nombre = models.CharField(max_length=90, blank=False)
    apellidos = models.CharField(max_length=120, blank=False)
    class Meta:
        db_table = u'permisos'

class Tbl1DatosGenerales(models.Model):
    # Datos de identificacion del medico
    id_gen = models.IntegerField(primary_key=True)
    cod_socio = models.CharField(max_length=6,blank=True)
    cedula = models.IntegerField(null=True, blank=True)
    cedula_mi = models.CharField(max_length=25,blank=True)
    en_tramite = models.CharField(max_length=2,blank=True)
    nombre = models.CharField(max_length=90, blank=False)
    apellidos = models.CharField(max_length=120, blank=False)
    sexo = models.IntegerField(null=True, blank=True)
    fecha_nac = models.DateField(null=True, blank=True)
    class Meta:
        db_table = u'tbl1_datos_generales'

class Tbl1DatosDomicilio(models.Model):
    # Datos de domicilio del medico
    id_dom = models.IntegerField(primary_key=True)
    cod_socio = models.CharField(max_length=6,blank=True)
    cod_estado = models.ForeignKey(Estados, null=True, db_column='cod_estado', blank=True)
    cod_del_mun = models.ForeignKey(DelMun, null=True, db_column='cod_del_mun', blank=True)
    colonia = models.CharField(max_length=135, blank=True)
    direccion = models.CharField(max_length=450, blank=True)
    calle = models.CharField(max_length=450, blank=True)
    num_int = models.IntegerField(null=True, blank=True)
    num_ext = models.IntegerField(null=True, blank=True)
    cp = models.CharField(max_length=18, blank=True)
    pais = models.CharField(max_length=18, blank=True)
    class Meta:
        db_table = u'tbl1_datos_domicilio'

class Tbl1DatosContacto(models.Model):
    # Datos de conacto del medico
    id_con = models.IntegerField(primary_key=True)
    cod_socio = models.CharField(max_length=6,blank=True)
    tel_casa = models.CharField(max_length=45, blank=True)
    tel_oficina = models.CharField(max_length=45, blank=True)
    fax = models.CharField(max_length=25, blank=True)
    tel_celular = models.CharField(max_length=45, blank=True)
    mail = models.CharField(max_length=45, blank=True)
    class Meta:
        db_table = u'tbl1_datos_contacto'

class Tbl1DatosEspecialidad(models.Model):
    # Especialidad del medico
    id_esp = models.IntegerField(primary_key=True)
    cod_socio = models.CharField(max_length=6,blank=True)
    espe = models.CharField(max_length=20,blank=True)
    nivel_espe = models.CharField(max_length=20,blank=True)
    univ = models.CharField(max_length=100,blank=True)
    facultad = models.CharField(max_length=100,blank=True)
    gradu_a = models.DateField(null=True, blank=True)
    # Datos de afiliacion
    f_afiliacion = models.DateField(null=True, blank=True)
    cod_filial = models.ForeignKey(Filial, db_column='cod_filial')
    class Meta:
        db_table = u'tbl1_datos_especialidad'

class Tbl2Certificaciones(models.Model):
    cod_socio = models.IntegerField(null=True, blank=True)
    tbl2_id = models.IntegerField(primary_key=True)
    certificado =models.CharField(max_length=10,blank=True)
    consejo = models.CharField(max_length=25,blank=True)
    f_cert = models.DateField(null=True,blank=True)
    class Meta:
        db_table = u'tbl2_certificaciones'

class Tbl3Pagos(models.Model):
    cod_socio = models.IntegerField(null=True, blank=True)
    tbl3_id = models.IntegerField(primary_key=True)
    a_pago = models.IntegerField(null=True, blank=True)
    cod_tpago = models.ForeignKey(TipoPago, null=True, db_column='cod_tpago', blank=True)
    folio_pago = models.CharField(max_length=135, blank=True)
    status_pago = models.CharField(max_length=135, blank=True)
    referencia = models.CharField(max_length=135, blank=True)
    f_pago = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'tbl3_pagos'

class Tbl4Cursos(models.Model):
    cod_socio = models.IntegerField(null=True, blank=True)
    tbl4_id = models.IntegerField(primary_key=True)
    fecha_a = models.IntegerField(null=True, blank=True)
    cod_curso = models.ForeignKey(TipoCursos, null=True, db_column='cod_curso', blank=True)
    asistencia = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'tbl4_cursos'

