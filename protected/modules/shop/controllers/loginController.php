<?php
/**
 *
 */
class loginController extends CController
{

  function __construct()
  {
    parent::__construct();
    $this->layout='login';
  }
  public function index()
  {
    $this->render('index');
  }
}
