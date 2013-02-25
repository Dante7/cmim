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

class Tbl1Datos(models.Model):
    cedula = models.IntegerField(primary_key=True)
    cedula_mi = models.CharField(max_length=25,blank=True)
    en_tramite = models.CharField(max_length=2,blank=True)
    id_socio = models.CharField(max_length=21, blank=True)
    nombre = models.CharField(max_length=90, blank=True)
    ape_paterno = models.CharField(max_length=45, blank=True)
    ape_materno = models.CharField(max_length=45, blank=True)
    sexo = models.IntegerField(null=True, blank=True)
    fecha_nac = models.DateField(null=True, blank=True)
    class Meta:
        db_table = u'tbl1_datos'

class Tbl2Academica(models.Model):
    cedula = models.ForeignKey(Tbl1Generales, db_column='cedula',)
    espe = models.CharField(max_length=20,blank=True)
    nivel_espe = models.CharField(max_length=20,blank=True)
    univ = models.CharField(max_length=100,blank=True)
    facultad = models.CharField(max_length=100,blank=True)
    gradu_a = models.DateField(null=True, blank=True)
    class Meta:
        db_table = u'tbl2_academica'

class Tbl3Profesional(models.Model):
    cedula = models.ForeignKey(Tbl1Generales, db_column='cedula')
    certificado =models.CharField(max_length=10,blank=True)
    consejo = models.CharField(max_length=25,blank=True)
    f_cert = models.DateField(null=True,blank=True)
    class Meta:
        db_table = u'tbl3_profesional'

class Tbl4Direccion(models.Model):
    cedula = models.ForeignKey(Tbl1Generales, db_column='cedula')
    cod_estado = models.ForeignKey(Estados, null=True, db_column='cod_estado', blank=True)
    cod_del_mun = models.ForeignKey(DelMun, db_column='cod_del_mun')
    colonia = models.CharField(max_length=135, blank=True)
    direccion = models.CharField(max_length=450, blank=True)
    calle = models.CharField(max_length=450, blank=True)
    num_int = models.IntegerField(null=True, blank=True)
    num_ext = models.IntegerField(null=True, blank=True)
    cp = models.CharField(max_length=18, blank=True)
    pais = models.CharField(max_length=18, blank=True)
    class Meta:
        db_table = u'tbl4_direccion'

class Tbl5Contacto(models.Model):
    cedula = models.ForeignKey(Tbl1Generales, db_column='cedula')
    tel_casa = models.CharField(max_length=45, blank=True)
    tel_oficina = models.CharField(max_length=45, blank=True)
    fax = models.CharField(max_length=25, blank=True)
    tel_celular = models.CharField(max_length=45, blank=True)
    mail = models.CharField(max_length=45, blank=True)
    class Meta:
        db_table = u'tbl5_contacto'

class Tbl6Afiliacion(models.Model):
    tbl6_id = models.IntegerField(primary_key=True)
    cedula = models.ForeignKey(Tbl1Generales, db_column='cedula')
    f_afiliacion = models.DateField(null=True, blank=True)
    cod_filial = models.ForeignKey(Filial, db_column='cod_filial')
    cod_socio = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'tbl6_afiliacion'

class Tbl7Suscripcion(models.Model):
    tbl7_id = models.IntegerField(primary_key=True)
    id_tbl6 = models.ForeignKey(Tbl6Afiliacion, null=True, db_column='id_tbl6', blank=True)
    f_suscripcion = models.IntegerField(null=True, blank=True)
    cod_tpago = models.ForeignKey(TipoPago, null=True, db_column='cod_tpago', blank=True)
    folio_pago = models.CharField(max_length=135, blank=True)
    f_pago = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'tbl7_suscripcion'

class Tbl8Cursos(models.Model):
    tbl8_id = models.IntegerField(primary_key=True)
    id_tbl7 = models.ForeignKey(Tbl7Suscripcion, null=True, db_column='id_tbl7', blank=True)
    fecha_a = models.IntegerField(null=True, blank=True)
    cod_curso = models.ForeignKey(TipoCursos, null=True, db_column='cod_curso', blank=True)
    asistencia = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'tbl8_cursos'

class Permisos(models.Model):
    usuario = models.CharField(max_length=30)
    clave = models.CharField(max_length=24) # Field renamed because it was a Python reserved word.
    cedula = models.ForeignKey(Tbl1Generales, primary_key=True, db_column='cedula')
    class Meta:
        db_table = u'permisos'
