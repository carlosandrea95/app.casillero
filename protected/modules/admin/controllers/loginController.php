<?php
/**
 *
 */
class loginController extends CController
{
    private $_model;
    public function __construct()
    {
        parent::__construct();
        $this->layout = 'login';
        $this->loadJs('maestro-ajax');
        $this->_model = $this->loadModel('login');
    }
    public function index()
    {
        $this->render('index');
    }
    public function auth()
    {
        if ($this->isAjaxRequest()) {
            if ($this->methodPost('email')) {
                $email = $this->methodPost('email');
                $pass = $this->methodPost('password');
                if ($this->_model->veficar_usuario($email, $pass) == true) {
                    $this->ajaxResponse(array('location' => CUrl::baseUrl() . 'admin/dashboard'));
                } else {
                    $this->ajaxResponse(array('sweetAlert' => true, 'alertType' => 'error', 'alertMessage' => 'Ups. el correo electronico y/o contraseña son incorrectos, intenta nuevamente.'));
                }
            }
        }
    }
    public function logout()
    {
        $this->redirect('admin');
    }

}
