<?php
/**
 *
 */
class CBoot
{

    public function __construct(CRequest $peticion)
    {
        $modulo = $peticion->getModulo();
        $controlador = $peticion->getControlador() . 'Controller';
        $metodo = $peticion->getMetodo();
        $args = $peticion->getArgumentos();

        if ($modulo) {
            $rutaControlador = WebRoot . 'protected' . DS . 'modules' . DS . $modulo . DS . 'controllers' . DS . $controlador . '.php';
        } else {
            $rutaControlador = WebRoot . 'protected' . DS . 'controllers' . DS . $controlador . '.php';
        }
        if (is_readable($rutaControlador)) {
            require_once $rutaControlador;
            $controlador = new $controlador;
            if (is_callable(array($controlador, $metodo))) {
                $metodo = $peticion->getMetodo();
            } else {
                $metodo = DEFAULT_METHOD;
            }
            if (isset($args)) {
                call_user_func_array(array($controlador, $metodo), $args);
            } else {
                call_user_func(array($controlador, $metodo));
            }
        } else {
            throw new Exception("CONTROLADOR NO ENCONTRADO", 1);
        }
    }
}
