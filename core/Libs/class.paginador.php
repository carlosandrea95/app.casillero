<?php
class Paginador
{
    private $_datos, $_paginacion;
    public function __construct()
    {
        $this->_datos = array();
        $this->_paginacion = array();
    }
    public function paginar($query, $pagina = false, $limite = false, $paginacion = false)
    {
        if ($limite && is_numeric($limite)) {
            $limite = $limite;
        } else {
            $limite = 25;
        }
        if ($pagina && is_numeric($pagina)) {
            $pagina = $pagina;
            $inicio = ($pagina - 1) * $limite;
        } else {
            $pagina = 1;
            $inicio = 0;
        }
        // $consulta=mysqli_query(db::connect(),$query);
        $reguistros = mysqli_num_rows($consulta);
        $total = ceil($reguistros / $limite);
        // $query=$query.' LIMIT '.$inicio.','.$limite;
        // $consulta=mysqli_query(db::connect(),$query);
        $this->_paginacion = array_slice($query, $inicio, $limite);
        while ($regs = $consulta->fetch_array(MYSQLI_ASSOC)) {
            $this->_datos[] = $regs;
        }
        $paginacion = array();
        $paginacion['actual'] = $pagina;
        $paginacion['total'] = $total;

        if ($pagina > 1) {
            $paginacion['primero'] = 1;
            $paginacion['anterior'] = $pagina - 1;
        } else {
            $paginacion['primero'] = '';
            $paginacion['anterior'] = '';
        }
        if ($pagina < $total) {
            $paginacion['ultimo'] = $total;
            $paginacion['siguiente'] = $pagina + 1;
        } else {
            $paginacion['ultimo'] = '';
            $paginacion['siguiente'] = '';
        }
        $this->_paginacion = $paginacion;
        $this->_rangoPaginacion($paginacion);
        return $this->_datos;

    }
    private function _rangoPaginacion($limite = false)
    {
        if ($limite && is_numeric($limite)) {
            $limite = $limite;
        } else {
            $limite = 10;
        }
        $total_paginas = $this->_paginacion['total'];
        $pagina_acutal = $this->_paginacion['actual'];
        $rango = ceil($limite / 2);
        $paginas = array();
        $rango_derecho = $total_paginas - $pagina_acutal;
        if ($rango_derecho < $rango) {
            $resto = $rango - $rango_derecho;
        } else {
            $resto = 0;
        }
        $rango_izquierdo = $pagina_acutal - ($rango + $resto);
        for ($i = $pagina_acutal; $i > $rango_izquierdo; $i--) {
            if ($i == 0) {
                break;
            }
            $paginas[] = $i;
        }
        sort($paginas);
        if ($pagina_acutal < $rango) {
            $rango_derecho = $limite;
        } else {
            $rango_derecho = $pagina_acutal + $rango;
        }
        for ($i = $pagina_acutal + 1; $i <= $rango_derecho; $i++) {
            if ($i > $total_paginas) {
                break;
            }
            $paginas[] = $i;
        }
        $this->_paginacion['rango'] = $paginas;
        return $this->_paginacion;
    }
    public function getVista($vista, $link = false)
    {
        $rutaView = WebRoot . 'protected' . DS . 'views' . DS . '_paginador' . DS . $vista . '.php';
    }
}
