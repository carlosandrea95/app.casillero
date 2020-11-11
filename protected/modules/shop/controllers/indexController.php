<?php
/**
 *
 */
class indexController extends CController
{

  function __construct()
  {
    parent::__construct();
  }
  public function index()
  {
    if (CSession::get('init')) {

    }else {
      // $this->redirect('admin/login');
    }
  }
}
