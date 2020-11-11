<?php
class CAuthenticator
{
  private $_db,$_id,$_rol,$_permisos;
  public function __construct($id=false)
  {
    if ($id) {
      $this->_id = (int) $id;
    }else {
      if (CSession::get('id_usuario')) {
        $this->_id=CSession::get('id_usuario');
      }
      else {
        $this->_id=0;
      }
    }
    $this->_db = new CDatabase();
    $this->_rol = $this->getRol();
    $this->_permisos = $this->getPermisosRoles();
    $this->CompilarAcl();
  }
  public function CompilarAcl()
  {
    $this->_permisos=array_merge(
      $this->_permisos,
      $this->getPermisosUsuario()
    );
  }
  public function getRol()
  {
    $rol=$this->_db->query("SELECT id_rol FROM sys_usuarios WHERE id_usuario='".$this->_id."'");
    $rol=$rol->fetch();
    echo $rol['id_rol']; exit;
    return $rol['id_rol'];
  }
  public function getPermisosRolesId()
  {
    $ids = $this->_db->query(
        "SELECT id_permiso FROM sys_permisos_roles WHERE id_rol ='".$this->_rol."'"
    );
    $ids=$ids->fetchAll(PDO::FETCH_ASSOC);
    $id=array();
    for ($i=0; $i < count($ids) ; $i++) {
      $id[]=$ids[$i]['id_permiso'];
    }
    return $id;
  }
  public function getPermisosRoles()
  {
    $permisos=$this->_db->query(
        "SELECT * FROM sys_permisos_roles WHERE id_rol ='".$this->_rol."'"
      );
    $permisos=$permisos->fetchAll(PDO::FETCH_ASSOC);
    $data = array();
    for ($i=0; $i < count($permisos) ; $i++) {
      $key= $this->getPermisosKey($permisos[$i]['id_permiso']);
      if ($key=="") {
        continue;
      }
      if ($permisos[$i]['valor']==1) {
        $v=true;
      }else {
        $v=false;
      }
      $data[$key]=array(
        'nombre'=>$this->getPermisosNombre($permisos[$i]['id_permiso']),
        'llave' =>$key,
        'valor' => $v,
        'heredado' => true,
        'id'=>$permisos[$i]['id_permiso'],
      );
    }
    return $data;
  }
  public function getPermisosKey($permisoId)
  {
    $permisoId = (int) $permisoId;
    $key=$this->_db->query(
        "SELECT llave from sys_permisos where id_permiso ='".$permisoId."'"
      );
    $key=$key->fetch();
    return $key['llave'];
  }
  public function getPermisosNombre($permisoId)
  {
    $permisoId = (int) $permisoId;
    $nombre=$this->_db->query(
        "SELECT nombre from sys_permisos where id_permiso ='".$permisoId."'"
      );
    $nombre=$nombre->fetch();
    return $nombre['nombre'];
  }
  public function getPermisosUsuario()
  {
    $ids = $this->getPermisosRolesId();
    if (count($ids)) {
      $permisos= $this->_db->query(
        "SELECT * FROM sys_permisos_usuarios WHERE id_usuario='".$this->_id."' AND id_permiso in(".implode(",", $ids).")"
      );
      $permisos=$permisos->fetchAll(PDO::FETCH_ASSOC);
    }else {
      $permisos=array();
    }

      $data = array();
      for ($i=0; $i < count($permisos) ; $i++) {
        $key= $this->getPermisosKey($permisos[$i]['id_permiso']);
        if ($key=="") {
          continue;
        }
        if ($permisos[$i]['valor']==1) {
          $v=true;
        }else {
          $v=false;
        }
        $data[$key]=array(
          'nombre'=>$this->getPermisosNombre($permisos[$i]['id_permiso']),
          'llave' =>$key,
          'valor' => $v,
          'heredado' => false,
          'id'=>$permisos[$i]['id_permiso'],
        );
      }
      return $data;
  }
  public function getPermisos()
  {
    if (isset($this->_permisos) && count($this->_permisos)) {
      return $this->_permisos;
    }
  }
  public function permiso($key)
  {
    if (array_key_exists($key, $this->_permisos)) {
      if ($this->_permisos[$key]['valor']==true || $this->_permisos[$key]['valor']==1) {
        return  true;
      }
    }
    return false;
  }
  public function acceso($key)
  {
    if ($this->permiso($key)) {
      return;
    }
    header('location:'.CUrl::baseUrl().'error/acceso/5050');
  }
}
