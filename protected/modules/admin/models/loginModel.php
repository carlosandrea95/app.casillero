<?php
/**
 *
 */
class loginModel extends CModel
{

    public function __construct()
    {
        parent::__construct();
    }
    public function veficar_usuario($usuario, $clave)
    {
        $parseHash = new CHash;
        $cryto = $parseHash->Hash($clave);
        $this->query("SELECT id_usuario FROM sys_usuarios WHERE da_email='" . $usuario . "' AND co_clave='" . $cryto . "'");
        $response = $this->fetchAssoc();
        if ($response['id_usuario'] != 0) {
            return true;
        } else {
            return false;
        }
    }
}
