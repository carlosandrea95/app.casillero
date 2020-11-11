<?php
/**
 *
 */
class siteController extends CController
{

    public function __construct()
    {
        parent::__construct();
        $this->setCssDir('style.css', 'dist/css/');
        $this->setCssDir('style-starter.css', 'dist/css/');
        $this->setCssDir('all.min.css', 'plugins/fontawesome-free/css/');
    }
    public function index()
    {
        $m=$this->loadModel('usuarios');
        $m->filds(
            array(
                'id_usuario','nombres'
            )
        );        
        $this->render('index', array(
            'title' => AppName . ' - Inicio',
            'pageActive',
        ));
    }
    public function about()
    {
        $this->render('about');
    }
}
