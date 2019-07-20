<#import "/plantillas/base.ftl" as base>
<@base.pagina logueado=estaLogueado usuario=nombreUsuario permisos=tienePermisos admin=esAdmin>
    <div class="col-12 p-2">
        <div class="row">
            <div class="card-title col-10 mx-auto p-0">
                <div class="card-body">
                    <h5 class="col-12 pt-3">
                        <strong><i class="fas fa-tag"></i> ETIQUETAS</strong>
                        <hr noshade>
                    </h5>
                    <#if articulo.listaEtiquetas?size gt 0>
                        <span class="text-primary pb-3 px-3">
                            <i class="fas fa-hashtag"></i>
                            <#list articulo.listaEtiquetas as etiqueta>
                                <a href="/etiqueta/${etiqueta.id}">${etiqueta.etiqueta}</a>
                            </#list>
                        </span>
                    </#if>
                </div>
                <div class="card-body">
                    <h5 class="card-title">
                        ${articulo.titulo}
                        <strong class="text-warning m-0 float-right">
                            <#if tienePermisos>
                                <a href="/articulo/editar/${articulo.id}" class="text-success ml-2">
                                    <i class="fas fa-edit"></i> Editar artículo
                                </a>
                                <a href="/articulo/eliminar/${articulo.id}" class="text-danger ml-2">
                                    <i class="fas fa-trash-alt"></i> Eliminar artículo
                                </a>
                            </#if>
                        </strong>
                    </h5>
                    <p class="card-text text-muted m-0">${articulo.cuerpo}</p>
                </div>
                <div class="col-12 mt-2 bg-white px-4 rounded-0 login">
                    <div class="row">

                        <h5 class="col-12 pt-3">
                            <strong><i class="fas fa-eye"></i> REACCIONES</strong>
                            <hr noshade>
                        </h5>
                        <form action="/articulo/${articulo.id}/votar" method="post" class="mx-auto pb-3 pl-3">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="voto" value="Me gusta">
                                <label class="form-check-label" for="me-gusta">
                                    <i class="fas fa-thumbs-up fa-2x" style="color: #0099ff" title="Me gusta"></i>
                                    <span class="badge badge-secondary">${votosMeGusta}</span>
                                </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="voto" value="Me disgusta">
                                <label class="form-check-label" for="me-disgusta">
                                    <i class="fas fa-frown fa-2x" style="color: red" title="Me disgusta"></i>
                                    <span class="badge badge-secondary">${votosMeDisgusta}</span>
                                </label>
                            </div>
                            <button type="submit" class="btn btn-outline-dark">Reaccionar</button>
                        </form>
                    </div>
                </div>


                <div class="card-footer p-2">
                    <div class="col-12 mt-2 bg-light px-4 rounded-0 login">
                        <div class="row">
                            <form class="col-12 py-1" method="post" action="/articulo/${articulo.id}/comentar">
                                <textarea name="comentario" class="form-control rounded-0"></textarea>
                        </div>
                        <button class="btn btn-outline-dark btn-block my-3" type="submit">
                            COMENTAR
                        </button>
                        </form>
                    </div>
                </div>
                <div class="col-12 mt-2 bg-light px-4 rounded-0 login">
                    <div class="row">
                        <h5 class="col-12 pt-3">
                            <strong>COMENTARIOS</strong>
                            <hr noshade>
                        </h5>
                        <#list articulo.listaComentarios as comentario>
                            <div class="card col-12 mb-1 p-0">
                                <div class="card-footer">
                                    <h5 class="card-title m-0">
                                        <strong>
                                            <i class="fas fa-user"></i> ${comentario.autor.username}
                                        </strong>
                                    </h5>
                                </div>
                                <div class="card-footer p-2">
                                    <strong class="text-primary m-0">
                                        <i class="far fa-comment"></i> ${comentario.comentario}
                                    </strong>
                                    <form action="/articulo/${comentario.id}/valorar" method="post"
                                          class="mx-auto pb-3 pl-3">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="valoracion" value="Me gusta">
                                            <label class="form-check-label" for="me-gusta">
                                                <i class="fas fa-thumbs-up fa-2x" style="color: #0099ff"
                                                   title="Me gusta"></i>
                                                <span class="badge badge-secondary">${comentario.cantidadMeGusta}</span>
                                            </label>
                                        </div>

                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="valoracion"
                                                   value="Me disgusta">
                                            <label class="form-check-label" for="me-disgusta">
                                                <i class="fas fa-frown fa-2x" style="color: red" title="Me disgusta"></i>
                                                <span class="badge badge-secondary">${comentario.cantidadMeDisgusta}</span>
                                            </label>
                                        </div>

                                        <button type="submit" class="btn btn-outline-dark">Reaccionar</button>
                                    </form>
                                </div>
                            </div>
                        </#list>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</@base.pagina>