<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Your</b> Brand</a>
  </div>
  <!-- /.login-logo -->
  <div class="card boxed">
    <div class="card-body boxed login-card-body">
      <div class="row justify-content-center">
        <img src="<?php echo CUrl::baseUrl();?>assets/adminlte/img/avatar5.png" class="img-responsive img-circle login-avatar mb-1" alt="">
      </div>
      <p class="login-box-msg">Intruduce tus credenciales para ingresar</p>
      <form class="form-ajax" action="/admin/login/auth" data-form='save' method="POST" autocomplete="on">
        <div class="input-group mb-4">
          <input type="email" name="email" class="form-control form-boxed-append" placeholder="Correo Electronico">
          <div class="input-group-append">
            <div class="input-group-text form-boxed-append-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-4">
          <input type="password" name="password" class="form-control form-boxed-append" placeholder="Contraseña">
          <div class="input-group-append">
            <div class="input-group-text form-boxed-append-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-8 ">
            <div class="icheck-primary">
              <input type="checkbox" name="remenber" id="remember">
              <label for="remember">
                Recordarme
              </label>
            </div>
          </div>
          <!-- /.col -->

          <!-- /.col -->
        </div>
        <div class="col-12">
          <button type="submit" class="btn btn-primary btn-boxed btn-block" > <i class="fa fa-sign-in-alt"></i> Ingresar</button>
        </div>
      </form>


      <!-- <div class="social-auth-links text-center mb-3">
        <p>- OR -</p>
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
        </a>
      </div> -->
      <!-- /.social-auth-links -->

      <!-- <p class="mb-1">
        <a href="forgot-password.html">I forgot my password</a>
      </p>
      <p class="mb-0">
        <a href="register.html" class="text-center">Register a new membership</a>
      </p> -->
      <div class="RespuestaAjax">
      </div>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>

<!-- /.login-box -->
