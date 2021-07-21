-- aqui voy a escribir los que voy haciendo para crear la base de datos como
-- respaldo del diseño de base de datos

create table tb_adeudos_tarjetas
(
    id                 int auto_increment
        primary key,
    idCaso             int           not null,
    propietarioTarjeta varchar(300)  null,
    bancoTarjeta       varchar(100)  null,
    tipoTarjeta        varchar(100)  null,
    adeudoTarjeta      varchar(100)  null,
    limiteTarjeta      varchar(100)  null,
    activo             int default 1 null
)
    comment 'datos sobre propiedades de los candidatos' engine = InnoDB;

create table tb_analistas
(
    id         int auto_increment
        primary key,
    nombre     varchar(300) charset latin1                                    not null,
    app        varchar(300) charset latin1                                    null,
    apm        varchar(300) charset latin1                                    null,
    fecha_auto timestamp                   default CURRENT_TIMESTAMP          null,
    activa     tinyint                     default 1                          null,
    email      varchar(500) charset latin1                                    not null,
    foto       varchar(500) charset latin1 default 'foto_usuario_default.png' null,
    constraint correos_analistas
        unique (email)
)
    engine = InnoDB;

create table tb_apoyo_visual
(
    id            int auto_increment
        primary key,
    idCaso        int                                 not null,
    nombreArchivo varchar(100) charset latin1         null,
    tag           varchar(100) charset latin1         not null,
    fecha_auto    timestamp default CURRENT_TIMESTAMP null,
    comentario    varchar(300) charset latin1         null,
    fecha_upload  timestamp                           null on update CURRENT_TIMESTAMP,
    upload        tinyint   default 0                 null
)
    engine = InnoDB;

create table tb_avisos_privacidad
(
    id            int auto_increment
        primary key,
    idCaso        int                                 not null,
    nombreArchivo varchar(100) charset latin1         null,
    tag           varchar(100) charset latin1         not null,
    fecha_auto    timestamp default CURRENT_TIMESTAMP null,
    comentario    varchar(300) charset latin1         null,
    fecha_upload  timestamp                           null on update CURRENT_TIMESTAMP,
    upload        tinyint   default 0                 null
)
    engine = InnoDB;

create table tb_bienes_adeudos
(
    id                      int auto_increment
        primary key,
    idCaso                  int          not null,
    propietarioAuto         varchar(300) null,
    marcaAuto               varchar(100) null,
    modeloAuto              varchar(100) null,
    valor_comercialAuto     varchar(100) null,
    propietarioInmueble     varchar(300) null,
    ubicacionInmueble       varchar(500) null,
    tipoInmueble            varchar(100) null,
    valor_comercialInmueble varchar(100) null,
    propietarioTarjeta      varchar(300) null,
    bancoTarjeta            varchar(100) null,
    tipoTarjeta             varchar(100) null,
    adeudoTarjeta           varchar(100) null,
    limiteTarjeta           varchar(100) null
)
    comment 'datos sobre propiedades de los candidatos' engine = InnoDB;

create table tb_bienes_autos
(
    id                  int auto_increment
        primary key,
    idCaso              int           not null,
    propietarioAuto     varchar(300)  null,
    marcaAuto           varchar(100)  null,
    modeloAuto          varchar(100)  null,
    anio                varchar(4)    null,
    valor_comercialAuto varchar(100)  null,
    activo              int default 1 null
)
    comment 'datos sobre autos de los candidatos' engine = InnoDB;

create table tb_bienes_inmuebles
(
    id                      int auto_increment
        primary key,
    idCaso                  int           not null,
    propietarioInmueble     varchar(300)  null,
    ubicacionInmueble       varchar(500)  null,
    tipoInmueble            varchar(100)  null,
    valor_comercialInmueble float         null,
    activo                  int default 1 null
)
    comment 'datos sobre propiedades de los candidatos' engine = InnoDB;

create table tb_bitacora_acceso
(
    id        int auto_increment
        primary key,
    login     varchar(200) charset latin1         not null,
    fechaHora timestamp default CURRENT_TIMESTAMP null,
    datos     text charset latin1                 null,
    data      text charset latin1                 null
)
    engine = InnoDB;

create table tb_cartas_laborales
(
    id            int auto_increment
        primary key,
    idCaso        int                                 not null,
    nombreArchivo varchar(100) charset latin1         not null,
    fecha_auto    timestamp default CURRENT_TIMESTAMP null,
    comentario    varchar(300) charset latin1         null,
    upload        tinyint   default 0                 null
)
    engine = InnoDB;

create table tb_categorias_productos
(
    id             int auto_increment
        primary key,
    nombre         varchar(200)         not null,
    nombre_corto   varchar(45)          null,
    fecha_auto     datetime             null,
    fecha_update   datetime             null,
    usuario_crea   varchar(45)          null,
    usuario_update varchar(45)          null,
    activa         tinyint(1) default 1 null
)
    engine = InnoDB;

create table tb_comentarios_clientes
(
    id               int auto_increment
        primary key,
    id_crh_cliente   varchar(10)          not null,
    tipo             varchar(100)         not null,
    texto            text                 not null,
    fecha_auto       datetime             null,
    usuario_registra varchar(100)         null,
    activo           tinyint(1) default 1 null
)
    comment 'comentarios relacionados con los clientes o cuentas';

create index fk_comentarios_to_clientes
    on tb_comentarios_clientes (id_crh_cliente);

create table tb_comentarios_facturacion
(
    id                int auto_increment comment 'id unico'
        primary key,
    id_factura        int                                 not null comment 'id de la factura de la que se comenta',
    tipo              tinyint                             not null comment 'tipo de comentario, error:1, seguimiento:2, general:3',
    texto             text                                not null,
    usuario           varchar(200)                        not null comment 'usuario que escribe el comentario',
    fecha_auto        timestamp default CURRENT_TIMESTAMP null comment 'fecha de captura',
    activo            tinyint   default 1                 null comment 'si esta activo o no el comentario',
    fecha_desactivado datetime                            null,
    usuario_desactiva varchar(200)                        null
)
    comment 'datos comentarios de la facturación' engine = InnoDB;

create table tb_complemento_laboral
(
    id             int auto_increment
        primary key,
    idCaso         int                                 not null,
    inicioPeriodo  varchar(20)                         null,
    finPeriodo     varchar(20)                         null,
    ocupacion      varchar(200)                        null,
    fuenteIngresos varchar(200)                        null,
    fechaCreacion  timestamp default CURRENT_TIMESTAMP not null,
    activo         tinyint   default 1                 null,
    llaveRow       varchar(10)                         null
)
    comment 'datos de los periodos en los que no tuvo trabajo' engine = InnoDB;

create table tb_conctactos_cliente
(
    id             int auto_increment
        primary key,
    id_crh         varchar(20)          not null,
    id_ejecutivo   int        default 1 null comment 'id del ejecutivo // asignado',
    saludo         varchar(45)          null,
    nombre         varchar(300)         not null,
    app            varchar(300)         null,
    apm            varchar(300)         null,
    puesto         varchar(200)         null,
    departamento   varchar(500)         null,
    direccion      varchar(500)         null,
    estado         varchar(100)         null,
    telefono1      varchar(100)         null,
    telefono2      varchar(100)         null,
    email1         text                 null,
    email2         text                 null,
    activo         tinyint(1) default 1 null,
    fecha_auto     datetime             null,
    fecha_update   datetime             null,
    usuario_crea   varchar(100)         null,
    usuario_update varchar(100)         null,
    movil          varchar(100)         null,
    observacion    text                 null
)
    comment 'personas asociadas a las empresas' engine = InnoDB;

create table tb_costos_por_cliente
(
    id              int auto_increment
        primary key,
    id_cliente      int                  not null,
    id_producto     int                  not null,
    costo           float                not null,
    activo          tinyint(1) default 1 null,
    fecha_auto      datetime             null,
    fecha_update    datetime             null,
    usuario_update  varchar(100)         null,
    usuario_ingresa varchar(100)         null
)
    comment 'costo por servicios a clientes' engine = InnoDB;

create table tb_croquis
(
    id            int auto_increment
        primary key,
    idCaso        int                                 not null,
    nombreArchivo varchar(100) charset latin1         null,
    tag           varchar(100) charset latin1         not null,
    fecha_auto    timestamp default CURRENT_TIMESTAMP null,
    comentario    varchar(300) charset latin1         null,
    fecha_upload  timestamp                           null on update CURRENT_TIMESTAMP,
    upload        tinyint   default 0                 null
)
    engine = InnoDB;

create table tb_datos_entorno_familiar
(
    id               int auto_increment
        primary key,
    idCaso           int               not null,
    nombre_completo  varchar(500)      null,
    parentesco       varchar(200)      null,
    telefono         varchar(11)       null,
    ocupacion        varchar(200)      null,
    detalleOcupacion text              null,
    viveConCandidato enum ('SI', 'NO') null,
    activo           int default 1     null
)
    comment 'datos de los familiares de los candidatos' engine = InnoDB;

create table tb_datos_escolares
(
    id                              int auto_increment
        primary key,
    idCaso                          int           not null,
    ultimoNivelEstudios             int           null,
    aniosCursados                   int default 0 null,
    periodoInicio                   int           null,
    periodoFin                      int           null,
    nombreInstitucion               varchar(300)  null,
    especialidadCursada             varchar(300)  null,
    tipoInstitucion                 varchar(100)  null,
    ciudad                          varchar(300)  null,
    estado                          varchar(300)  null,
    comprobante                     varchar(100)  null,
    folioComprobante                varchar(20)   null,
    idiomasDomina                   varchar(200)  null,
    porcentaje                      varchar(10)   null,
    idioma2                         varchar(200)  null,
    porcentaje2                     varchar(10)   null,
    idioma3                         varchar(200)  null,
    porcentaje3                     varchar(10)   null,
    observacionesCRH                text          null,
    licenturaAnteriorAlPosgrado     varchar(300)  null,
    institucionAnteriorAlPosgrado   varchar(300)  null,
    anioInicioLicenciaturaEscPrevia int           null,
    anioFinLicenciaturaEscPrevia    int           null,
    estadoEscPrevia                 varchar(300)  null,
    comprobanteEscPrevia            varchar(100)  null,
    folioComprobanteEscPrevia       varchar(20)   null,
    tipoInstitucionEscPrevia        varchar(100)  null
)
    comment 'datos escolares de los candidatos' engine = InnoDB;

create table tb_datos_personales
(
    id                          int auto_increment
        primary key,
    idCaso                      int          not null,
    puesto                      varchar(100) null,
    calle_numero                varchar(200) null,
    colonia                     varchar(300) null,
    cp                          varchar(5)   null,
    municipio                   varchar(300) null,
    estado                      varchar(300) null,
    domicilioAnterior           varchar(300) null,
    antiguedadDomicilioAnterior varchar(300) null,
    antiguedadEnDomicilio       varchar(300) null,
    telefono                    varchar(20)  null,
    telefono2                   varchar(12)  null,
    email                       varchar(300) null,
    genero                      varchar(100) null,
    curp                        varchar(18)  null,
    nss                         varchar(11)  null,
    fechaNacimiento             date         null,
    lugarNacimiento             varchar(500) null,
    estadoNacimiento            varchar(500) null,
    estadoCivil                 varchar(500) null,
    tipoIdentificacion          varchar(200) null,
    IdIdentificacion            varchar(100) null,
    edad                        varchar(30)  null,
    ultimoUpdate                timestamp    null on update CURRENT_TIMESTAMP,
    observacionesCRH            text         null,
    comprobante_presentado      varchar(500) null
)
    comment 'datos personales de los candidatos' engine = InnoDB;

create table tb_datos_vivienda
(
    id                       int auto_increment
        primary key,
    idCaso                   int           not null,
    propiedadInmueble        varchar(50)   null,
    prestadoDetalle          varchar(300)  null,
    numeroPersonasEnInmueble int default 0 null,
    detallePersonas          varchar(300)  null,
    observacionesCRH         text          null,
    distribucion             varchar(300)  null,
    calles_colinda           varchar(300)  null,
    colonias_colinda         varchar(300)  null
)
    comment 'datos de vivienda de los candidatose' engine = InnoDB;

create table tb_demandas_laborales
(
    id                 int auto_increment
        primary key,
    idCaso             int                                 not null,
    antecedenteDemanda tinyint                             not null,
    nombreEmpresa      varchar(300)                        null,
    comentarios        varchar(300)                        null,
    fechaCreacion      timestamp default CURRENT_TIMESTAMP not null,
    estatusDemanda     varchar(100)                        null,
    fallo              varchar(100)                        null,
    column_9           int                                 null
)
    comment 'datos sobre sus antecedentes en demandas' engine = InnoDB;

create table tb_ejecutivos_ventas
(
    id                   int auto_increment comment 'id unico de indentificación'
        primary key,
    nombre               varchar(300)                        not null comment 'nombre ejecutivo',
    app                  varchar(300)                        not null comment 'apellido paterno ejecutivo',
    apm                  varchar(300)                        not null comment 'apellido materno ejecutivo',
    telefono             varchar(15)                         null comment 'número telefonico',
    direccion            varchar(300)                        null comment 'número telefonico',
    municipio_residencia varchar(300)                        null,
    estado_residencia    varchar(300)                        null,
    cp                   varchar(10)                         null,
    fecha_nacimiento     date                                null,
    fecha_auto           timestamp default CURRENT_TIMESTAMP null comment 'fecha de captura',
    fecha_ultimo_cambio  datetime                            null,
    usuario_actualizo    varchar(300)                        null
)
    comment 'datos de los ejecutivos de ventas' engine = InnoDB;

create table tb_clientes
(
    idCliente                        int auto_increment
        primary key,
    id_crh                           varchar(100)         not null comment 'clave que hereda de la base del depto de ventas',
    es_cuenta_padre                  tinyint(1) default 0 null,
    id_mienbro_de                    varchar(100)         null comment 'clave de la cuenta padre',
    activo                           tinyint    default 1 null,
    nombre                           varchar(300)         not null,
    razon_social                     varchar(300)         null,
    rfc                              varchar(20)          null,
    direccion_fiscal                 text                 null,
    estatus_anterior                 varchar(200)         null comment 'estado en el que se tenia en la base de excel',
    correo_principal                 varchar(300)         null,
    correo_notificaciones            varchar(300)         null,
    dias_credito                     int        default 0 null,
    requerimientos                   text                 null,
    metodo_pago                      varchar(150)         null,
    requiere_factura                 tinyint    default 1 null,
    requiere_orden_compra            tinyint    default 0 null,
    aumento_costo                    float      default 0 null,
    periodicidad_aumento_costo       varchar(300)         null comment 'cada cuanto se va aplicar el aumento de costos',
    cuenta_receptora                 varchar(50)          null comment '-cuenta de pago- de la hoja costos - datos fiscales // PALU // SARH',
    cuenta_pago                      varchar(100)         null comment 'cuenta con la que el cliente emite el pago',
    entrega_reporte                  tinyint    default 0 null,
    dias_facturacion                 varchar(200)         null,
    serie_facturacion                varchar(20)          null,
    dias_pago                        varchar(200)         null,
    id_ejecutivo                     int        default 1 null,
    ejecutivo                        varchar(100)         null,
    ejecutivo_recuperacion           varchar(100)         null,
    fecha_registro                   datetime             null,
    fecha_ingreso_crh                date                 null,
    fecha_baja                       date                 null,
    fecha_reingreso                  datetime             null,
    fecha_update                     datetime             null,
    motivo_baja                      varchar(500)         null,
    servicio                         varchar(300)         null,
    zona                             varchar(100)         null,
    demanda                          varchar(100)         null,
    check_rfc                        tinyint(1) default 0 null,
    check_fmto                       tinyint(1) default 0 null,
    check_id_r_legal                 tinyint(1) default 0 null,
    check_acta_constitutiva          tinyint(1) default 0 null,
    check_list                       tinyint(1) default 0 null,
    estatus_contrato                 varchar(50)          null,
    medio_ingreso                    varchar(200)         null,
    recuperacion                     tinyint(1) default 0 null,
    quien_recupero                   varchar(200)         null,
    giro                             varchar(100)         null,
    actividad                        varchar(500)         null,
    facturacion_por_ejecutivo_cuenta tinyint(1) default 0 null comment 'Por ejecutivo y/o Agencia',
    facturacion_por_candidato        tinyint(1) default 1 null comment 'Facturacion por candidato',
    pagina_web                       text                 null,
    constraint idCRH
        unique (id_crh),
    constraint tb_clientes_tb_ejecutivos_ventas_id_fk
        foreign key (id_ejecutivo) references tb_ejecutivos_ventas (id)
)
    comment 'datos clientes registrados' engine = InnoDB;

create table tb_empleos_ocultos
(
    id               int auto_increment
        primary key,
    idCaso           int                         not null,
    empresa          varchar(300) charset latin1 not null,
    fecha_inicio     varchar(50) charset latin1  not null,
    fecha_fin        varchar(50) charset latin1  not null,
    comentario       text charset latin1         null,
    activo           tinyint default 1           null,
    mostarEnCaratula tinyint default 0           null
)
    comment 'empleos no declarados por el candidato pero encontrados en el resumen de semanas cotizadas'
    engine = InnoDB;

create table tb_entidades_facturacion
(
    id               int auto_increment
        primary key,
    rfc              varchar(30)       not null,
    nombre           varchar(200)      not null,
    razon_social     varchar(500)      not null,
    direccion_fiscal varchar(500)      not null,
    activa           tinyint default 1 null,
    fecha_auto       datetime          null,
    fecha_update     datetime          null
)
    comment 'razones sociales con las que factura la empresa' engine = InnoDB;

create table tb_estilo_vida
(
    id                    int auto_increment
        primary key,
    idCaso                int          not null,
    alergia               varchar(200) null,
    deficienciaFisica     varchar(200) null,
    intervenciones        varchar(200) null,
    accidentes            varchar(200) null,
    enfermedadCronica     varchar(200) null,
    bebidasAlcoholicas    varchar(200) null,
    nombreEmergencia      varchar(200) null,
    telefonoEmergencias   varchar(20)  null,
    parentescoEmergencias varchar(200) null,
    fuma                  varchar(100) null,
    observacionesCRH      text         null
)
    comment 'datos sobre salud de los candidatos' engine = InnoDB;

create table tb_expedientes_clientes
(
    id         int auto_increment
        primary key,
    id_cliente int               not null,
    tipo       varchar(100)      not null,
    nombre     text              not null,
    fecha_auto timestamp         null,
    delete_at  datetime          null,
    update_at  datetime          null,
    activo     tinyint default 1 null
)
    comment 'archivos subidos relacionados con el expediente de los clientes';

create table tb_facturacion
(
    id                               int auto_increment comment 'id único'
        primary key,
    id_entidad_facturacion           int                       not null,
    clv_factura                      varchar(20)               not null comment 'clave que se le asigno a la factura cuando fue emitida por el sub-departamento de facturación',
    id_cliente                       int                       not null comment 'id del cliente al que se le facturó dicha factura',
    fecha_emision                    date                      not null comment 'fecha de emisión de la factura',
    fecha_vencimiento                date                      not null comment 'fecha de vencimiento de la factura',
    importe                          float(30, 2)              not null comment 'importe de la factura',
    iva                              float(30, 2)              not null comment 'iva correspondiente a la factura',
    retencion_iva                    float(30, 2) default 0.00 null comment 'retención del iva correspondiente a la factura',
    importe_total                    float(30, 2)              not null comment 'importe total de la factura: importe+iva-retencion',
    metodo_pago_en_factura           tinyint      default 0    not null comment 'metodo de pago que se registro en la fatura emitida',
    metodo_final_de_pago             tinyint      default 0    null comment 'metodo con el que realmente el cliente realizó el pago',
    fecha_pago                       date                      null comment 'fecha y hora de registro de pago',
    pagado                           tinyint      default 0    null comment 'bandera de estado pagado o no',
    fecha_compromiso_pago            date                      null comment 'fecha en la que se pacto realizar el pago por el cliente',
    cuenta_de_pago                   varchar(5)                null comment 'últimos 4 digitos de la cuenta de pago',
    es_complelmento_de_pago          tinyint      default 0    null comment 'bandera de tipo, es o no un complemento de pago',
    clv_factura_padre                varchar(20)               null comment 'clave de la factura de donde se origino este complemento de pago',
    id_ejecutivo                     int          default 0    null comment 'ejecutivo de ventas ligado a este cliente',
    activa                           tinyint      default 1    null comment 'si esta activa o no la factura',
    usuario_desactiva_pago           varchar(200)              null comment 'usuario que desactiva la factura',
    fecha_auto                       timestamp                 null comment 'fecha de captura',
    fecha_ultimo_cambio              timestamp                 null on update CURRENT_TIMESTAMP comment 'fecha auto - on update',
    usuario_ultimo_cambio            varchar(20)               null comment 'usuario que realiza el último cambio',
    cancelada                        tinyint      default 0    null,
    fecha_autorizacion_cancelacion   datetime                  null comment 'fecha en la que se autorizó por el cliente la cancelación de dicha factura',
    persona_autorizacion_cancelacion varchar(300)              null comment 'contacto/persona que autorizó la cancelacion de dicha factura',
    fecha_cancelacion_sat            datetime                  null comment 'fecha en la que se cancela en el portal del SAT',
    usuario_registra_cancelacion_sat varchar(200)              null comment 'usuario que captura la cancelación del SAT',
    cancelada_sat                    tinyint      default 0    null comment 'si esta cancelada o no en el SAT',
    clv_factura_sustituya            varchar(40)               null comment 'clave(s) de facturas que sustituye dicho registro',
    clasificacion_error              tinyint      default 0    null comment 'tipo de error, sinError:0, administracion:1, ventas:2',
    observacion_error                varchar(500)              null,
    fecha_registro_cancelacion       timestamp                 null,
    fecha_registro_pago              timestamp                 null,
    constraint clave_factura
        unique (clv_factura),
    constraint tb_facturacion_tb_clientes__fk_id_clientes
        foreign key (id_cliente) references tb_clientes (idCliente),
    constraint tb_facturacion_tb_ejecutivos_ventas__fk_id_ejecutivo
        foreign key (id_ejecutivo) references tb_ejecutivos_ventas (id)
)
    comment 'datos comentarios de la facturación' engine = InnoDB;

create table tb_facturacion_comentarios
(
    id           int auto_increment
        primary key,
    id_factura   int               not null comment 'id de la factura a la que pertenece el comentario',
    fecha_auto   timestamp         null comment 'fecha / hora en la que se registrar el comentario',
    usuario      varchar(30)       not null comment 'usuario que registra el comentario',
    texto        varchar(500)      not null comment 'contenido del comentario',
    tipo         tinyint default 3 not null comment 'tipo de comentario {"1":"error","2":"seguimiento","3":"general"}',
    fecha_update timestamp         null on update CURRENT_TIMESTAMP
)
    comment 'comentarios relacionados con la facturación' engine = InnoDB;

create table tb_fotos_cedulas
(
    id            int auto_increment
        primary key,
    idCaso        int                                 not null,
    nombreArchivo varchar(100) charset latin1         null,
    tag           varchar(100) charset latin1         not null,
    fecha_auto    timestamp default CURRENT_TIMESTAMP null,
    comentario    varchar(300) charset latin1         null,
    fecha_upload  timestamp                           null on update CURRENT_TIMESTAMP,
    upload        tinyint   default 0                 null
)
    engine = InnoDB;

create table tb_fotos_semanas_cotizadas
(
    id            int auto_increment
        primary key,
    idCaso        int                                 not null,
    nombreArchivo varchar(100) charset latin1         null,
    tag           varchar(100) charset latin1         not null,
    fecha_auto    timestamp default CURRENT_TIMESTAMP null,
    comentario    varchar(300) charset latin1         null,
    fecha_upload  timestamp                           null on update CURRENT_TIMESTAMP,
    upload        tinyint   default 0                 null
)
    engine = InnoDB;

create table tb_gastos_mensuales
(
    id               int auto_increment
        primary key,
    idCaso           int             not null,
    alimentacion     float default 0 null,
    renta            float default 0 null,
    luz              float default 0 null,
    agua             float default 0 null,
    gas              float default 0 null,
    telefonia        float default 0 null,
    ropa             float default 0 null,
    transporte       float default 0 null,
    gastosEscolares  float default 0 null,
    gastosMedicos    float default 0 null,
    diversion        float default 0 null,
    otros            float default 0 null,
    suma             float default 0 null,
    observacionesCRH text            null
)
    comment 'gastos fijos de los candidatos' engine = InnoDB;

create table tb_gestores
(
    id                   int auto_increment
        primary key,
    nombre               varchar(500) charset latin1         not null,
    estado               varchar(500) charset latin1         not null,
    municipio            varchar(500) charset latin1         not null,
    coberturaSinViaticos varchar(500) charset latin1         not null,
    coberturaConViaticos varchar(900) charset latin1         not null,
    email                varchar(500) charset latin1         not null,
    telefono1            varchar(100) charset latin1         not null,
    telefono2            varchar(100) charset latin1         not null,
    telefono3            varchar(100) charset latin1         null,
    costo                float                               not null,
    desempenio           varchar(500) charset latin1         null,
    observaciones        text charset latin1                 null,
    activo               tinyint   default 1                 not null,
    fecha_auto           timestamp default CURRENT_TIMESTAMP null,
    fecha_update         datetime                            null on update CURRENT_TIMESTAMP,
    foto                 text charset latin1                 null,
    usuario_update       varchar(100) charset latin1         null
)
    comment 'datos de los gestores' engine = InnoDB;

create table tb_casos
(
    idCaso                         int auto_increment
        primary key,
    idCliente                      int                                 not null,
    paso                           int       default 0                 not null,
    nombre                         varchar(300)                        not null,
    app                            varchar(300)                        not null,
    apm                            varchar(300)                        not null,
    fechaCaptura                   timestamp default CURRENT_TIMESTAMP not null,
    estadoCRH                      varchar(50)                         null,
    observaciones                  text                                null,
    fechaCierre                    timestamp                           null,
    stringSeguimiento              varchar(30)                         null,
    ultimoUpdate                   timestamp                           null on update CURRENT_TIMESTAMP,
    email_notificacion             varchar(500)                        null,
    vacante                        varchar(300)                        null,
    sucursal                       varchar(300)                        null comment 'sucursal y/o cuidad',
    fecha_entrevista               datetime                            null comment 'fecha de la entrevista',
    fecha_entrega                  datetime                            null comment 'fecha de entrega del reporte',
    estatus_resultado              varchar(300)                        null comment 'recomendable, reconmendable con reservas, no recomendable',
    quienElaboro                   varchar(300)                        null comment 'persona que elaboro el estudio',
    tipoDocumento                  int       default 1                 null comment 'campo para determinar el tipo de documento que necesita para el resultado',
    idAnalista                     int                                 null,
    asignacionAnalista             timestamp                           null,
    fecha_cancelacion              timestamp                           null,
    usuario_cancela                varchar(200)                        null,
    cambio_etapa_manual            tinyint   default 0                 null,
    usuario_cambia_etapa           varchar(200)                        null,
    fecha_cambio_etapa             timestamp                           null,
    tipo_cancelacion               int       default 0                 null,
    estatus_general                varchar(100)                        null,
    usuario_update_estatus_general varchar(100)                        null,
    id_gestor                      int                                 null,
    fecha_asignacion_gestor        datetime                            null,
    pago_gestor                    float     default 0                 null,
    pago_viaticos                  float     default 0                 null,
    costo_total                    float     default 0                 null,
    texto_caratula                 text                                null,
    requiereVerificacionCedula     tinyint   default 0                 null comment 'bandera de configuración',
    primeraRevision                tinyint   default 0                 null comment 'bandera de finalización //  ya no se usa',
    terminaCapturaCandidato        datetime                            null comment 'marca de fecha',
    terminaRevisionValidadora      datetime                            null comment 'marca de fecha',
    terminaAnalistaReferencias     datetime                            null comment 'marca de fecha',
    autorizacionViaticos           varchar(300)                        null comment 'texto de autorización',
    terminaReferenciasPersonales   tinyint   default 0                 null comment 'bandera de finalización',
    terminaReferenciasVecinales    tinyint   default 0                 null comment 'bandera de finalización',
    upload_archivos                tinyint   default 0                 null comment 'bandera de finalización',
    referencias_laborales          tinyint   default 0                 null comment 'bandera de finalización',
    revisionFinal                  tinyint   default 0                 null comment 'bandera de finalización',
    banderaTerminaCaptura          tinyint   default 0                 null comment 'bandera de finalización',
    banderaTerminaValidacion       tinyint   default 0                 null comment 'bandera de finalización',
    liberado                       tinyint   default 0                 null comment 'bandera de termino de estudio',
    semanas_cotizadas_por_pagina   int       default 1                 null,
    link_factura                   tinyint   default 0                 null comment 'campo_bandera para indicar si el estudio ya fue asignado a una factura',
    constraint tb_casos_FK
        foreign key (idAnalista) references tb_analistas (id),
    constraint tb_casos_FK_1
        foreign key (id_gestor) references tb_gestores (id),
    constraint tb_casos_ibfk_1
        foreign key (idCliente) references tb_clientes (idCliente)
)
    comment 'datos de cada uno de estudios SocioEconomicos' engine = InnoDB;

create index fk_idCliente_tb_clientes
    on tb_casos (idCliente);

create table tb_historial_empleos
(
    id                  int auto_increment
        primary key,
    idCaso              int                                 not null,
    numero_consecutivo  int                                 not null,
    nombreEmpresa       varchar(200)                        null,
    razonSocial         varchar(200)                        null,
    numeroTelefonico    varchar(20)                         null,
    telefonoJefe        varchar(12)                         null,
    telefonoEmpresa     varchar(12)                         null,
    respuestaLlamar     varchar(10)                         null,
    ultimoPuesto        varchar(200)                        null,
    ultimoSueldo        varchar(200)                        null,
    domicilio           varchar(200)                        null,
    constanciaLaboral   varchar(200)                        null,
    presentoDemanda     varchar(500)                        null,
    statusDemanda       varchar(300)                        null,
    fechaIngreso        date      default '1900-01-01'      null,
    fechaBaja           date      default '1900-01-01'      null,
    detalleFechaIngreso varchar(20)                         null,
    motivoSeparacion    varchar(200)                        null,
    mombreJefeInmediato varchar(200)                        null,
    puestoJefeInmediato varchar(200)                        null,
    fechaCreacion       timestamp default CURRENT_TIMESTAMP null,
    ultimoUpdate        timestamp                           null on update CURRENT_TIMESTAMP,
    observacionesCRH    text                                null
)
    comment 'información sobre los empleos del candidato' engine = InnoDB;

create table tb_informacion_laboral
(
    id                   int auto_increment
        primary key,
    idCaso               int                                 not null,
    nombreEmpresa1       varchar(200)                        null,
    razonSocial1         varchar(200)                        null,
    numeroTelefonico1    varchar(20)                         null,
    telefonoJefe1        varchar(12)                         null,
    telefonoEmpresa1     varchar(12)                         null,
    respuestaLlamar      varchar(10)                         null,
    ultimoPuesto1        varchar(200)                        null,
    ultimoSueldo1        varchar(200)                        null,
    domicilio1           varchar(200)                        null,
    constanciaLaboral1   varchar(200)                        null,
    presentoDemanda1     varchar(500)                        null,
    statusDemanda1       varchar(300)                        null,
    fechaIngreso1        date      default '1900-01-01'      null,
    fechaBaja1           date      default '1900-01-01'      null,
    detalleFechaIngreso1 varchar(20)                         null,
    motivoSeparacion1    varchar(200)                        null,
    mombreJefeInmediato1 varchar(200)                        null,
    puestoJefeInmediato1 varchar(200)                        null,
    nombreEmpresa2       varchar(200)                        null,
    razonSocial2         varchar(200)                        null,
    numeroTelefonico2    varchar(20)                         null,
    telefonoJefe2        varchar(12)                         null,
    telefonoEmpresa2     varchar(12)                         null,
    ultimoPuesto2        varchar(200)                        null,
    ultimoSueldo2        varchar(200)                        null,
    domicilio2           varchar(200)                        null,
    constanciaLaboral2   varchar(200)                        null,
    presentoDemanda2     varchar(500)                        null,
    statusDemanda2       varchar(300)                        null,
    fechaIngreso2        date      default '1900-01-01'      null,
    fechaBaja2           date      default '1900-01-01'      null,
    detalleFechaIngreso2 varchar(20)                         null,
    motivoSeparacion2    varchar(200)                        null,
    mombreJefeInmediato2 varchar(200)                        null,
    puestoJefeInmediato2 varchar(200)                        null,
    nombreEmpresa3       varchar(300)                        null,
    razonSocial3         varchar(300)                        null,
    numeroTelefonico3    varchar(30)                         null,
    telefonoJefe3        varchar(12)                         null,
    telefonoEmpresa3     varchar(12)                         null,
    ultimoPuesto3        varchar(300)                        null,
    ultimoSueldo3        varchar(300)                        null,
    domicilio3           varchar(300)                        null,
    constanciaLaboral3   varchar(300)                        null,
    presentoDemanda3     varchar(500)                        null,
    statusDemanda3       varchar(300)                        null,
    fechaIngreso3        date      default '1900-01-01'      null,
    fechaBaja3           date      default '1900-01-01'      null,
    detalleFechaIngreso3 varchar(20)                         null,
    motivoSeparacion3    varchar(300)                        null,
    mombreJefeInmediato3 varchar(300)                        null,
    puestoJefeInmediato3 varchar(300)                        null,
    fechaCreacion        timestamp default CURRENT_TIMESTAMP null,
    ultimoUpdate         timestamp                           null on update CURRENT_TIMESTAMP,
    observacionesCRH     text                                null
)
    comment 'datos ultimos 3 trabajos del candidato' engine = InnoDB;

create table tb_ingresos_fijos
(
    id               int auto_increment
        primary key,
    idCaso           int             not null,
    otrosIngresos    float default 0 null,
    ultimaAportacion float default 0 null,
    sumaIngresos     float default 0 null,
    respuestaDeficit varchar(500)    null,
    observCRHdeficit text            null,
    observacionesCRH text            null
)
    comment 'datos de los sumas para los ingresos fijos de los candidatos' engine = InnoDB;

create table tb_investigacion_laboral
(
    id                   int auto_increment
        primary key,
    idCaso               int                                   not null,
    nombreEmpresa1       varchar(200)                          null,
    razonSocial1         varchar(200)                          null,
    numeroTelefonico1    varchar(20)                           null,
    telefonoJefe1        varchar(12)                           null,
    telefonoEmpresa1     varchar(12)                           null,
    respuestaLlamar      varchar(10)                           null,
    ultimoPuesto1        varchar(200)                          null,
    ultimoSueldo1        varchar(200)                          null,
    domicilio1           varchar(200)                          null,
    constanciaLaboral1   varchar(200)                          null,
    presentoDemanda1     varchar(500)                          null,
    statusDemanda1       varchar(300)                          null,
    fechaIngreso1        date        default '2014-01-01'      null,
    fechaBaja1           date        default '2014-01-01'      null,
    detalleFechaIngreso1 varchar(20) default '2014-01-01'      null,
    motivoSeparacion1    varchar(200)                          null,
    mombreJefeInmediato1 varchar(200)                          null,
    puestoJefeInmediato1 varchar(200)                          null,
    nombreEmpresa2       varchar(200)                          null,
    razonSocial2         varchar(200)                          null,
    numeroTelefonico2    varchar(20)                           null,
    telefonoJefe2        varchar(12)                           null,
    telefonoEmpresa2     varchar(12)                           null,
    respuestaLlamar2     varchar(10)                           null,
    ultimoPuesto2        varchar(200)                          null,
    ultimoSueldo2        varchar(200)                          null,
    domicilio2           varchar(200)                          null,
    constanciaLaboral2   varchar(200)                          null,
    presentoDemanda2     varchar(500)                          null,
    statusDemanda2       varchar(300)                          null,
    fechaIngreso2        date        default '2014-01-01'      null,
    fechaBaja2           date        default '2014-01-01'      null,
    detalleFechaIngreso2 varchar(20) default '2014-01-01'      null,
    motivoSeparacion2    varchar(200)                          null,
    mombreJefeInmediato2 varchar(200)                          null,
    puestoJefeInmediato2 varchar(200)                          null,
    nombreEmpresa3       varchar(300)                          null,
    razonSocial3         varchar(300)                          null,
    numeroTelefonico3    varchar(30)                           null,
    telefonoJefe3        varchar(12)                           null,
    telefonoEmpresa3     varchar(12)                           null,
    respuestaLlamar3     varchar(10)                           null,
    ultimoPuesto3        varchar(300)                          null,
    ultimoSueldo3        varchar(300)                          null,
    domicilio3           varchar(300)                          null,
    constanciaLaboral3   varchar(300)                          null,
    presentoDemanda3     varchar(500)                          null,
    statusDemanda3       varchar(300)                          null,
    fechaIngreso3        date        default '2014-01-01'      null,
    fechaBaja3           date        default '2014-01-01'      null,
    detalleFechaIngreso3 varchar(20) default '2014-01-01'      null,
    motivoSeparacion3    varchar(300)                          null,
    mombreJefeInmediato3 varchar(300)                          null,
    puestoJefeInmediato3 varchar(300)                          null,
    fechaCreacion        timestamp   default CURRENT_TIMESTAMP null,
    ultimoUpdate         timestamp                             null on update CURRENT_TIMESTAMP
)
    comment 'datos de la investigacion sobre los ultimos 3 trabajos del candidato' engine = InnoDB;

create table tb_listaCorreos
(
    id         int auto_increment
        primary key,
    correo     varchar(500) charset latin1         not null,
    origen     varchar(45) charset latin1          not null,
    fecha_auto timestamp default CURRENT_TIMESTAMP null
)
    engine = InnoDB;

create table tb_log_cambios
(
    id         int auto_increment
        primary key,
    tabla      text charset latin1                 not null,
    id_row     text charset latin1                 not null,
    campo      text charset latin1                 not null,
    old        text charset latin1                 not null,
    new        text charset latin1                 not null,
    fecha_auto timestamp default CURRENT_TIMESTAMP null,
    usuario    varchar(300) charset latin1         not null
)
    engine = InnoDB;

create table tb_mensajes
(
    id                 int auto_increment
        primary key,
    from_id            int                                 not null,
    to_id              int                                 not null,
    llave              varchar(30) charset latin1          not null,
    asunto             varchar(100) charset latin1         not null,
    msj                text charset latin1                 not null,
    id_msj_seguimiento int                                 null,
    fecha_auto         timestamp default CURRENT_TIMESTAMP null,
    leido              tinyint   default 0                 null,
    fecha_leido        datetime                            null
)
    comment 'mensajes entre usuarios de la plataforma' engine = InnoDB;

create table tb_observaciones
(
    id             int auto_increment
        primary key,
    idCaso         int                                 not null,
    texto          text charset latin1                 null,
    tipo           varchar(200) charset latin1         not null,
    fecha_auto     timestamp default CURRENT_TIMESTAMP null,
    fecha_update   timestamp                           null on update CURRENT_TIMESTAMP,
    usuario_update varchar(200) charset latin1         null
)
    engine = InnoDB;

create table tb_otros_documentos
(
    id            int auto_increment
        primary key,
    idCaso        int                                 not null,
    nombreArchivo varchar(100) charset latin1         not null,
    fecha_auto    timestamp default CURRENT_TIMESTAMP null,
    comentario    varchar(300) charset latin1         null,
    upload        tinyint   default 0                 null,
    disposicion   int       default 0                 null comment '0 -> horizontal y 1 -> vertical'
)
    engine = InnoDB;

create table tb_otros_empleos
(
    id               int auto_increment
        primary key,
    idCaso           int                         not null,
    empresa          varchar(300) charset latin1 not null,
    fecha_inicio     varchar(50) charset latin1  null,
    fecha_fin        varchar(50) charset latin1  null,
    persona_informa  varchar(300) charset latin1 null,
    telefono_jefe    varchar(30) charset latin1  null,
    telefono_empresa varchar(30) charset latin1  null,
    comentario       text charset latin1         null,
    activo           tinyint default 1           null
)
    comment 'otros empleos declarados por el candidato' engine = InnoDB;

create table tb_personas_aportan
(
    id                 int auto_increment
        primary key,
    idCaso             int             not null,
    nombre_aporta      varchar(300)    null,
    parentesco         varchar(300)    null,
    cantidadAportacion float default 0 null,
    activo             int   default 1 null
)
    comment 'datos de los personas que aportan en el hogar de los candidatos' engine = InnoDB;

create table tb_productos
(
    id             int auto_increment
        primary key,
    id_categoria   int                  not null,
    nombre         varchar(200)         not null,
    nombre_corto   varchar(45)          null comment 'abreviatura o siglas',
    costo          float                not null,
    descripcion    varchar(500)         null,
    fecha_auto     datetime             null,
    fecha_update   datetime             null,
    usuario_crea   varchar(45)          null,
    usuario_update varchar(45)          null,
    activo         tinyint(1) default 1 null,
    constraint fk_tb_categoria_producto
        foreign key (id_categoria) references tb_categorias_productos (id)
)
    engine = InnoDB;

create index fk_tb_categoria_producto_idx
    on tb_productos (id_categoria);

create table tb_referencias_laborales
(
    id               int auto_increment
        primary key,
    idCaso           int                                 not null,
    numeroEmpleo     int                                 not null,
    fechaIngreso     date      default '1950-01-01'      null,
    fechaBaja        date      default '1950-01-01'      null,
    puesto           varchar(200) charset latin1         null,
    sueldo           varchar(200) charset latin1         null,
    tipoContrato     varchar(100) charset latin1         null,
    desempenio       varchar(100) charset latin1         null,
    personalACargo   varchar(200) charset latin1         null,
    motivoSalida     varchar(500) charset latin1         null,
    esRecomendable   tinyint   default 0                 null,
    esRecontratable  tinyint   default 0                 null,
    presentoDemanda  tinyint   default 0                 null,
    estatusDemanda   varchar(500) charset latin1         null,
    nombreInformante varchar(200) charset latin1         null,
    puestoInformante varchar(200) charset latin1         null,
    observaciones    text charset latin1                 null,
    fecha_auto       timestamp default CURRENT_TIMESTAMP null,
    fecha_update     datetime                            null,
    usuario_update   varchar(100) charset latin1         null,
    ordenAparicion   int                                 null,
    nombreEmpresa    varchar(300) charset latin1         null,
    fechaValidacion  date                                null
)
    comment 'datos de la investigacion que hacen las analista para checar las referencias laborales' engine = InnoDB;

create table tb_referencias_personales
(
    id               int auto_increment
        primary key,
    idCaso           int          not null,
    nombre1          varchar(300) null,
    numeroTelefono1  varchar(300) null,
    tiempoConocerlo1 varchar(300) null,
    relacion1        varchar(300) null,
    comentario1      text         null,
    nombre2          varchar(300) null,
    numeroTelefono2  varchar(300) null,
    tiempoConocerlo2 varchar(300) null,
    relacion2        varchar(300) null,
    comentario2      text         null,
    nombre3          varchar(300) null,
    numeroTelefono3  varchar(300) null,
    tiempoConocerlo3 varchar(300) null,
    relacion3        varchar(300) null,
    comentario3      text         null
)
    comment 'referencias personales de cada candidato' engine = InnoDB;

create table tb_referencias_vecinales
(
    id                               int auto_increment
        primary key,
    idCaso                           int                                 not null,
    nombre_informante                varchar(300) charset latin1         not null,
    tiempo_conocer_solicitante       varchar(100) charset latin1         not null,
    conoce_estado_civil              tinyint   default 0                 not null,
    estado_civil_solicitante         varchar(100) charset latin1         null,
    tiempo_viviendo_en_ese_domicilio varchar(100) charset latin1         null,
    con_quien_vive                   varchar(300) charset latin1         null,
    le_conoce_algun_empleo           varchar(300) charset latin1         null,
    comentarios_del_candidato        varchar(500) charset latin1         not null,
    fecha_auto                       timestamp default CURRENT_TIMESTAMP null,
    vacia                            tinyint   default 0                 null,
    razonVacia                       text charset latin1                 null,
    fecha_update                     datetime                            null on update CURRENT_TIMESTAMP
)
    comment 'datos que introducen los gestores sobre las referencias investigadas con los vecinos de los cadidatos'
    engine = InnoDB;

create table tb_resultados_finales
(
    id            int auto_increment
        primary key,
    categoria     varchar(100) charset latin1         not null,
    texto         text charset latin1                 null,
    fecha_auto    timestamp default CURRENT_TIMESTAMP null,
    fecha_update  datetime                            null,
    activo        tinyint   default 1                 null,
    palabrasClave varchar(100) charset latin1         null
)
    comment 'aqui almacenamos los posibles resultados del estudio ' engine = InnoDB;

create table tb_usuarios
(
    idUsuario     int auto_increment
        primary key,
    email         varchar(200)                                    not null,
    nombre        varchar(255)                                    not null,
    app           varchar(255)                                    null,
    apm           varchar(255)                                    null,
    login         varchar(200)                                    not null,
    clave         varchar(500)                                    not null,
    perfil        varchar(45)                                     not null comment '{SA:superAdmin, admin:admin, ana:analista, cli:cliente, sv:supervisor, ge:gestor, co:coordinador}',
    depto         varchar(100)                                    null,
    activo        tinyint      default 1                          null,
    fechaRegistro timestamp    default CURRENT_TIMESTAMP          null,
    idAsociado    int          default 0                          null comment 'id del cliente / del analista / ',
    foto          varchar(500) default 'foto_usuario_default.png' null,
    crypt         varchar(500)                                    null,
    constraint tb_usuarios_email_uindex
        unique (email),
    constraint tb_usuarios_logins
        unique (login)
)
    comment 'datos necesarios para el ingreso al sistema' engine = InnoDB;

create table tb_viaticosPorCuidad
(
    id         int auto_increment
        primary key,
    id_gestor  int                         not null,
    cuidad     varchar(300) charset latin1 not null,
    costo      float                       not null,
    kilometros float default 0             null comment 'kilometros que se desplaza a la cuidad dicho gestor',
    constraint tb_viaticosPorCuidad_FK
        foreign key (id_gestor) references tb_gestores (id)
)
    comment 'viaticos que registrados para cada cuidad' engine = InnoDB;

create table tb_viaticos_gestores
(
    id               int auto_increment
        primary key,
    idGestor         int                                 not null,
    cuidad           varchar(300) charset latin1         not null,
    costo            float     default 0                 not null,
    activo           tinyint   default 1                 null,
    fecha_auto       timestamp default CURRENT_TIMESTAMP null,
    usuario_registra varchar(100) charset latin1         null
)
    comment 'viaticos registrados para cada gestor, dependiendo de cada cuidad' engine = InnoDB;
