-- tb_clientes_potenciales
create table tb_clientes_potenciales
(
    id int auto_increment primary key comment 'numero único para indentificar clientes potenciales',
    ejecutivo_id int not null comment 'numero de indentificación del ejecutivo de ventas',
    nombre varchar(300) not null comment 'nombre de la entidad que potencialmente puede ser un cliente más',
    razon_social varchar(300) not null comment 'razon social del cliente potencial',
    direccion text not null comment 'direccion del cliente potencial',
    telefono1 varchar(50) not null comment 'telefono principal del cliente potencial',
    telefono2 varchar(50) null comment 'otro telefono para contactar',
    email_principal varchar(300) null comment 'email para envio de notificaciones o avisos',
    departamento_conctacto varchar(100) null comment 'departamento donde se hace el contacto para el cierre de la venta',
    fecha_auto DATETIME null comment 'fecha de creacion del registro',
    fecha_update DATETIME null comment 'fecha de actualización de los datos del registro',
    fecha_delete DATETIME null comment 'fecha de la desactivación del registro',
    activo tinyint(1) default 0 null  comment 'activo 1 y no activo 0',
    observaciones text null comment 'fecha de creacion del registro',
    creado_por varchar(100) null comment 'nombre del usuario que registro el cliente potencial',
    fuente_cliente_potencial varchar(300) null comment 'como fue el contacto con este cliente, esta propiedas probiene de un catalogo',
    descripcion_fuente_cliente_potencial varchar(300) null comment 'comentarios sobre el primer contacto del cliente',
    estatus varchar(100) null comment 'etapa de conversion o cierre del cliente',
    descripcion_estatus varchar(100) null comment 'comentarios sobre la conversion o cierre del cliente',
    id_campania int null comment 'campaña con la que se alcanzo este cliente',
    convertido  tinyint(1) default 0 null comment 'bandera si ya fue usado para rellenar los datos de un cliente cerrado por eso se llama convertido, convertido a un cliente',
    website text null comment 'sitio o pagina web del cliente'
)
    engine = InnoDB;
