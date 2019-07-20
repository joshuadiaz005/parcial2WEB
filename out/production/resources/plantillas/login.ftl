<#import "/plantillas/base.ftl" as base>
<@base.pagina>
    <div class="col-lg-5 col-md-10 col-sm-10 mx-auto">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-10 mt-2 bg-light px-4 rounded-0 login">
                <div class="row">
                    <form class="col-11 py-5" method="post" action="/login">
                        <div class="panel px-2 py-3 bg-white">
                            <label for="user"><strong>Nombre de usuario</strong> </label>
                            <input type="text" class="form-control rounded-0" name="username" placeholder="usuario"
                                   required=""
                                   autofocus=""/>
                            <br>
                            <label for="password"><strong>Contraseña</strong></label>
                            <input type="password" class="form-control rounded-0" name="password" placeholder="contraseña"
                                   required=""/>
                            <br>
                            <hr noshade>
                            <input class="form-check-input" type="radio" name="guardarSesion">
                            <label class="form-check-label" for="guardarSesion">
                                <strong>Mantener Sesion</strong>
                            </label>
                        </div>
                        <button class="btn btn-outline-dark btn-block my-3" type="submit">
                            Iniciar Sesion
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</@base.pagina>