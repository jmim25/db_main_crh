-- tb_clientes_potenciales
create table tb_clientes_potenciales
(
    id int auto_increment primary key comment 'numero único para indentificar clientes potenciales',
    ejecutivo_id int not null comment 'numero de indentificación del ejecutivo de ventas',
    nombre varchar(300) not null,
    razon_social varchar(300) not null,
    direccion text not null,
    telefono1 varchar(50) not null,
    telefono2 varchar(50) null,
    email_principal varchar(300) null,
    departamento_conctacto varchar(100) null,
    fecha_auto DATETIME null,
    fecha_update DATETIME null,
    fecha_delete DATETIME null,
    observaciones text null,
    creado_por varchar(100) null,
    fuente_cliente_potencial varchar(300) null,
    descripcion_fuente_cliente_potencial varchar(300) null,
    estatus varchar(100) null,
    descripcion_estatus varchar(100) null,
    id_campania int null,
    convertido  tinyint(1) default 0 null comment 'bandera si ya fue usado para rellenar los datos de un cliente cerrado por eso se llama convertido, convertido a un cliente',
    website text null comment 'sitio o pagina web del cliente'
)
    engine = InnoDB;
