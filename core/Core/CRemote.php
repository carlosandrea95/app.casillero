                                                                                                                                                                                                                                                                                                                             <?php
class CRemote extends PDO {
    public function __construct() {
        parent::__construct("mysql:host=orizontsystems.com.ve;dbname=orizonts_remote_easypay", "orizo_root", "harcanox58**",array(PDO::MYSQL_ATTR_INIT_COMMAND=>'SET NAMES '.DB_CSET,PDO::MYSQL_ATTR_USE_BUFFERED_QUERY=>false));

    }

}
