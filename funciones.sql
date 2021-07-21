create
    definer = ya0rw7i24dwg@`%` function conteo_casos_analista(vIdAnalista int) returns int
BEGIN
    declare vConteo int;
    select count(idCaso) into vConteo from tb_casos where idAnalista = vIdAnalista;
    RETURN vConteo;
END;

create
    definer = ya0rw7i24dwg@`%` function conteo_casos_x_cliente(vIdCliente int) returns int
BEGIN
    declare vConteo int;
    select count(idCaso) into vConteo from tb_casos where idCliente = vIdCliente;
    RETURN vConteo;
END;

create
    definer = ya0rw7i24dwg@`%` function cuidad_estado_candidato(vIdCaso int) returns varchar(500)
BEGIN
    declare vDato varchar(500);
    select concat(tb_datos_personales.municipio, ', ', tb_datos_personales.estado)
    into vDato
    from tb_datos_personales
    where tb_datos_personales.idCaso = vIdCaso;
    RETURN vDato;
END;

create
    definer = ya0rw7i24dwg@`%` function foto_usuario(vIdUsuario int) returns varchar(500)
BEGIN
    declare vFoto varchar(500);
    select tb_usuarios.foto into vFoto from tb_usuarios where idUsuario = vIdUsuario;
    RETURN vFoto;
END;

create
    definer = ya0rw7i24dwg@`%` function nombreEmpleo1(vIdCaso int) returns varchar(300)
BEGIN
    declare vNombreEmpleo varchar(200);
    select nombreEmpresa1 into vNombreEmpleo from tb_informacion_laboral where idCaso = vIdCaso;
    RETURN vNombreEmpleo;
END;

create
    definer = ya0rw7i24dwg@`%` function nombreEmpleo2(vIdCaso int) returns varchar(300)
BEGIN
    declare vNombreEmpleo varchar(200);
    select nombreEmpresa2 into vNombreEmpleo from tb_informacion_laboral where idCaso = vIdCaso;
    RETURN vNombreEmpleo;
END;

create
    definer = ya0rw7i24dwg@`%` function nombreEmpleo3(vIdCaso int) returns varchar(300)
BEGIN
    declare vNombreEmpleo varchar(200);
    select nombreEmpresa3 into vNombreEmpleo from tb_informacion_laboral where idCaso = vIdCaso;
    RETURN vNombreEmpleo;
END;

create
    definer = ya0rw7i24dwg@`%` function nombre_analista(vIdAnalista int) returns varchar(500)
BEGIN
    declare vNombre varchar(500);
    select concat(nombre, ' ', app, ' ', apm) into vNombre from tb_analistas where tb_analistas.id = vIdAnalista;
    RETURN vNombre;
END;

create
    definer = ya0rw7i24dwg@`%` function nombre_cliente(vIdCliente int) returns varchar(500)
BEGIN
    declare vNombre varchar(500);
    select tb_clientes.nombre into vNombre from tb_clientes where tb_clientes.idCliente = vIdCliente;
    RETURN vNombre;
END;

create
    definer = ya0rw7i24dwg@`%` function nombre_entidad_facturacion(vIdEntidad int) returns varchar(500)
BEGIN
    declare vNombre varchar(500);
    select tb_entidades_facturacion.nombre
    into vNombre
    from tb_entidades_facturacion
    where tb_entidades_facturacion.id = vIdEntidad;
    RETURN vNombre;
END;

create
    definer = ya0rw7i24dwg@`%` function nombre_gestor(vIdGestor int) returns varchar(500)
BEGIN
    declare vNombre varchar(500);
    select nombre into vNombre from tb_gestores where tb_gestores.id = vIdGestor;
    RETURN vNombre;
END;

create
    definer = ya0rw7i24dwg@`%` function nombre_usuario(vIdUsuario int) returns varchar(500)
BEGIN
    declare vNombre varchar(500);
    select concat(nombre, ' ', app, ' ', apm) into vNombre from tb_usuarios where idUsuario = vIdUsuario;
    RETURN vNombre;
END;

create
    definer = ya0rw7i24dwg@`%` function razonSocial_cliente(vIdCliente int) returns varchar(500)
BEGIN
    declare vNombre varchar(500);
    select tb_clientes.razon_social into vNombre from tb_clientes where tb_clientes.idCliente = vIdCliente;
    RETURN vNombre;
END;
