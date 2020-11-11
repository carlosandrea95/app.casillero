<?php

class CModel
{
    protected $db;
    private $_sql,$_filds,$_where,$table;
    public function __construct()
    {
        $this->db = new CDatabase();
        $child = get_called_class();
        $this->table = str_replace('Model','',$child);
        $this->table = 'sys_'.$this->table;
    }
    public function create($arr)
    {
        if (is_array($arr)) {
            foreach ($arr as $f => $v) {
                $fild[]=$f;
                $val[]=$v;
            }        
            $filds=implode('`,`',$fild);
            $vals=implode("','",$val);
            $sql='INSERT INTO '.$this->table." (`".$filds."`) VALUES ('".$vals."')";
            $this->db->query($sql);
        }
    }
    public function update($vars, $conds=null)
    {
        if (is_array($vars)) {
            foreach ($vars as $f => $v) {
                $var[]=$f."='".$v."'";
            }
            $sets=implode(",",$var);
            foreach ($conds as $f => $v) {
                $cond[]=$f."='".$v."'";
            }
            $condi=implode(",",$cond);
            $sql='UPDATE '.$this->table." SET ".$sets." WHERE ".$condi;
            $this->db->query($sql);
        }
    }
    public function filds($arr)
    {
        if (is_array($arr)) {
            $filds=implode(",",$arr);
            $this->_filds=$filds;        
        }
    }
    public function where($conds=null)
    {
        if (is_array($conds)) {
            foreach ($conds as $f => $v) {
                $cond[]=$f."='".$v."'";
            }
            $condi=implode(" AND ",$cond);
            $this->_where=$condi;
        }
    }
    public function delete($id)
    {
        $sql="DELETE FROM ".$this->table." WHERE 1='".$id."'";
        $this->db->query($sql);
    }
    public function find($id)
    {
        if($this->_filds){
            $sql="SELECT ".$this->_filds." FROM ".$this->table." WHERE 1='".$id."'";
        }else{
            $sql="SELECT * FROM ".$this->table." WHERE 1='".$id."'";
        }
        $this->_sql = $this->db->query($sql);
        $rtn  = $this->_sql->fetch(PDO::FETCH_ASSOC);
        return $rtn;
    }
    public function all()
    {
        if($this->_where){
            if($this->_filds){
                $sql="SELECT ".$this->_filds." FROM ".$this->table." WHERE ".$this->_where;
            }else{
                $sql="SELECT * FROM ".$this->table ." WHERE ".$this->_where;
            }
        }else{
            if ($this->_filds){
                $sql="SELECT ".$this->_filds." FROM ".$this->table;
            }else{
                $sql="SELECT * FROM ".$this->table;
            }
        }
        $this->_sql = $this->db->query($sql);
        $rtn  = $this->_sql->fetchAll(PDO::FETCH_ASSOC);
        return $rtn;
    }
    // protected function query($value)
    // {
    //     $this->_sql = $this->db->query($value);
    // }
    // protected function prepare($value)
    // {
    //     $this->_sql = $this->db->prepare($value);
    // }
    // protected function bindParam($key, $value)
    // {
    //     $this->_sql->bindParam($key, $value);
    // }
    // protected function execute()
    // {
    //     $this->_sql->execute();
    // }
    // protected function fetchAssoc($type = '')
    // {
    //     $this->_sql = $this->_sql->fetch(PDO::FETCH_ASSOC);
    //     return $this->_sql;
    // }
    // protected function fetchAllAssoc($type = '')
    // {
    //     $this->_sql = $this->_sql->fetchAll(PDO::FETCH_ASSOC);
    //     return $this->_sql;
    // }
}
