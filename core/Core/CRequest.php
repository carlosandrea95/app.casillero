<?php

class CRequest
{
    private $_controlador, $_metodo, $_argumentos, $_modulo, $_modulos;
    public function __construct()
    {
        if (isset($_GET['url'])) {
            $url = filter_input(INPUT_GET, 'url', FILTER_SANITIZE_URL);
            $url = explode('/', $url);
            $this->_modules = APP_MODULOS;
            $this->_modulo = strtolower(array_shift($url));
            if (!$this->_modulo) {
                $this->_controlador = strtolower(array_shift($url));
                $this->_modulo = false;
            } else {
                if (array_key_exists($this->_modulo, $this->_modules)) {
                    if (is_array($this->_modules)) {
                        if (in_array($this->_modulo, $this->_modules, true)) {
                            $this->_controlador = $this->_modulo;
                            $this->_modulo = false;
                        } else {
                            $this->_controlador = strtolower(array_shift($url));
                            if (!$this->_controlador) {
                                if (is_array($this->_modules[$this->_modulo])) {
                                    if (array_key_exists('Controller', $this->_modules[$this->_modulo])) {
                                        $this->_controlador = $this->_modules[$this->_modulo]['Controller'];
                                    } else {
                                        $this->_controlador = 'index';
                                    }
                                } else {
                                    $this->_controlador = 'index';
                                }
                            }
                        }
                    } else {
                        if ($this->_modulo != $this->_modules) {
                            $this->_controlador = $this->_modulo;
                            $this->_modulo = false;
                        } else {
                            $this->_controlador = strtolower(array_shift($url));
                            if (!$this->_controlador) {
                                if (is_array($this->_modules[$this->_modulo])) {
                                    if (array_key_exists('Controller', $this->_modules[$this->_modulo])) {
                                        $this->_controlador = $this->_modules[$this->_modulo]['Controller'];
                                    } else {
                                        $this->_controlador = 'index';
                                    }
                                } else {
                                    $this->_controlador = 'index';
                                }
                            }
                        }
                    }
                } else {
                    $this->_controlador = $this->_modulo;
                    $this->_modulo = false;
                }
            }
            $this->_metodo = strtolower(array_shift($url));
            $this->_argumentos = $url;
        }
        if (!$this->_controlador) {
            $this->_controlador = DEFAULT_CONTROLLER;
        }
        if (!$this->_metodo) {
            $this->_metodo = DEFAULT_METHOD;
        }
        if (!$this->_argumentos) {
            $this->_argumentos = array();
        }
    }
    public function getModulo()
    {
        return $this->_modulo;
    }
    public function getControlador()
    {
        return $this->_controlador;
    }
    public function getMetodo()
    {
        return $this->_metodo;
    }
    public function getArgumentos()
    {
        return $this->_argumentos;
    }
}
