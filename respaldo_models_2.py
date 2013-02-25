# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

from django.db import models

class AuthGroup(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=240, unique=True)
    class Meta:
        db_table = u'auth_group'

class AuthGroupPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    group = models.ForeignKey(AuthGroup)
    permission = models.ForeignKey(AuthPermission)
    class Meta:
        db_table = u'auth_group_permissions'

class AuthPermission(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=150)
    content_type = models.ForeignKey(DjangoContentType)
    codename = models.CharField(max_length=300, unique=True)
    class Meta:
        db_table = u'auth_permission'

class AuthUser(models.Model):
    id = models.IntegerField(primary_key=True)
    username = models.CharField(max_length=90, unique=True)
    first_name = models.CharField(max_length=90)
    last_name = models.CharField(max_length=90)
    email = models.CharField(max_length=225)
    password = models.CharField(max_length=384)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    is_superuser = models.IntegerField()
    last_login = models.DateTimeField()
    date_joined = models.DateTimeField()
    class Meta:
        db_table = u'auth_user'

class AuthUserGroups(models.Model):
    id = models.IntegerField(primary_key=True)
    user = models.ForeignKey(AuthUser)
    group = models.ForeignKey(AuthGroup)
    class Meta:
        db_table = u'auth_user_groups'

class AuthUserUserPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    user = models.ForeignKey(AuthUser)
    permission = models.ForeignKey(AuthPermission)
    class Meta:
        db_table = u'auth_user_user_permissions'

class Banco(models.Model):
    cod_banco = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=180)
    class Meta:
        db_table = u'banco'

class Ciudad(models.Model):
    cod_ciudad = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=450)
    class Meta:
        db_table = u'ciudad'

class DelMun(models.Model):
    cod_del_mun = models.IntegerField(primary_key=True)
    del_mun = models.CharField(max_length=720)
    class Meta:
        db_table = u'del_mun'

class DjangoAdminLog(models.Model):
    id = models.IntegerField(primary_key=True)
    action_time = models.DateTimeField()
    user = models.ForeignKey(AuthUser)
    content_type = models.ForeignKey(DjangoContentType, null=True, blank=True)
    object_id = models.TextField(blank=True)
    object_repr = models.CharField(max_length=600)
    action_flag = models.IntegerField()
    change_message = models.TextField()
    class Meta:
        db_table = u'django_admin_log'

class DjangoContentType(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=300)
    app_label = models.CharField(max_length=300, unique=True)
    model = models.CharField(max_length=300, unique=True)
    class Meta:
        db_table = u'django_content_type'

class DjangoSession(models.Model):
    session_key = models.CharField(max_length=120, primary_key=True)
    session_data = models.TextField()
    expire_date = models.DateTimeField()
    class Meta:
        db_table = u'django_session'

class DjangoSite(models.Model):
    id = models.IntegerField(primary_key=True)
    domain = models.CharField(max_length=300)
    name = models.CharField(max_length=150)
    class Meta:
        db_table = u'django_site'

class Estados(models.Model):
    cod_estado = models.IntegerField(primary_key=True)
    estado = models.CharField(max_length=135)
    class Meta:
        db_table = u'estados'

class Filial(models.Model):
    cod_filial = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=225)
    cod_ciudad = models.ForeignKey(Ciudad, null=True, db_column='cod_ciudad', blank=True)
    class Meta:
        db_table = u'filial'

class MenuContext(models.Model):
    menu = models.CharField(max_length=45, blank=True)
    submenu = models.CharField(max_length=90, blank=True)
    class Meta:
        db_table = u'menu_context'

class Permisos(models.Model):
    id = models.IntegerField(primary_key=True)
    mail = models.CharField(max_length=90)
    password = models.CharField(max_length=150)
    nombre = models.CharField(max_length=270)
    apellidos = models.CharField(max_length=360)
    class Meta:
        db_table = u'permisos'

class Tbl1DatosContacto(models.Model):
    id_con = models.IntegerField(primary_key=True)
    cod_socio = models.CharField(max_length=18, blank=True)
    tel_casa = models.CharField(max_length=135, blank=True)
    tel_oficina = models.CharField(max_length=135, blank=True)
    fax = models.CharField(max_length=75, blank=True)
    tel_celular = models.CharField(max_length=135, blank=True)
    mail = models.CharField(max_length=135, blank=True)
    class Meta:
        db_table = u'tbl1_datos_contacto'

class Tbl1DatosDomicilio(models.Model):
    id_dom = models.IntegerField(primary_key=True)
    cod_socio = models.CharField(max_length=18)
    cod_estado = models.ForeignKey(Estados, null=True, db_column='cod_estado', blank=True)
    cod_del_mun = models.ForeignKey(DelMun, null=True, db_column='cod_del_mun', blank=True)
    colonia = models.CharField(max_length=405)
    direccion = models.CharField(max_length=1350)
    calle = models.CharField(max_length=1350)
    num_int = models.IntegerField(null=True, blank=True)
    num_ext = models.IntegerField(null=True, blank=True)
    cp = models.CharField(max_length=54)
    pais = models.CharField(max_length=54)
    class Meta:
        db_table = u'tbl1_datos_domicilio'

class Tbl1DatosEspecialidad(models.Model):
    id_esp = models.IntegerField(primary_key=True)
    cod_socio = models.CharField(max_length=18)
    espe = models.CharField(max_length=60)
    nivel_espe = models.CharField(max_length=60)
    univ = models.CharField(max_length=300)
    facultad = models.CharField(max_length=300)
    gradu_a = models.DateField(null=True, blank=True)
    f_afiliacion = models.DateField(null=True, blank=True)
    cod_filial = models.ForeignKey(Filial, db_column='cod_filial')
    class Meta:
        db_table = u'tbl1_datos_especialidad'

class Tbl1DatosGenerales(models.Model):
    id_gen = models.IntegerField(primary_key=True)
    cod_socio = models.CharField(max_length=18)
    cedula = models.IntegerField(null=True, blank=True)
    cedula_mi = models.CharField(max_length=75)
    en_tramite = models.CharField(max_length=6)
    id_socio = models.CharField(max_length=63)
    nombre = models.CharField(max_length=270)
    apellidos = models.CharField(max_length=360)
    sexo = models.IntegerField(null=True, blank=True)
    fecha_nac = models.DateField(null=True, blank=True)
    class Meta:
        db_table = u'tbl1_datos_generales'

class Tbl2Certificaciones(models.Model):
    cod_socio = models.IntegerField(null=True, blank=True)
    tbl2_id = models.IntegerField(primary_key=True)
    certificado = models.CharField(max_length=30)
    consejo = models.CharField(max_length=75)
    f_cert = models.DateField(null=True, blank=True)
    class Meta:
        db_table = u'tbl2_certificaciones'

class Tbl3Pagos(models.Model):
    cod_socio = models.IntegerField(null=True, blank=True)
    tbl3_id = models.IntegerField(primary_key=True)
    a_pago = models.IntegerField(null=True, blank=True)
    cod_tpago = models.ForeignKey(TipoPago, null=True, db_column='cod_tpago', blank=True)
    folio_pago = models.CharField(max_length=405)
    status_pago = models.CharField(max_length=405)
    referencia = models.CharField(max_length=405)
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

class TipoCursos(models.Model):
    cod_curso = models.IntegerField(primary_key=True)
    nombre_curso = models.CharField(max_length=405)
    fecha_curso = models.DateField(null=True, blank=True)
    tipo_curso = models.CharField(max_length=135)
    class Meta:
        db_table = u'tipo_cursos'

class TipoPago(models.Model):
    cod_tpago = models.IntegerField(primary_key=True)
    tipo_pago = models.CharField(max_length=135)
    cod_banco = models.ForeignKey(Banco, db_column='cod_banco')
    class Meta:
        db_table = u'tipo_pago'

