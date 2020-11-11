<?php
require_once 'Core/CConfig.php';
spl_autoload_register(function ($className) {

    $arr_dir = array(
        realpath(dirname(__FILE__)),
        WebRoot . 'protected' . DS . 'components',
        // WebRoot . 'protected' . DS . 'reports',
    );
    $arr_ext = array(
        '.php',
        '.class.php',
    );
    foreach ($arr_dir as $dir) {
        $iterator = new RecursiveDirectoryIterator($dir);
        foreach (new RecursiveIteratorIterator($iterator) as $file) {
            foreach ($arr_ext as $ext) {
                if ($className === pathinfo($file, PATHINFO_FILENAME)) {
                    $ruta = pathinfo($file, PATHINFO_DIRNAME) . DS . pathinfo($file, PATHINFO_FILENAME) . $ext;
                    if (file_exists($ruta)) {
                        $fileName = $ruta;
                        break;
                    }
                } elseif ($className . $ext === pathinfo($file, PATHINFO_FILENAME) . '.' . pathinfo($file, PATHINFO_EXTENSION)) {
                    $ruta = pathinfo($file, PATHINFO_DIRNAME) . DS . pathinfo($file, PATHINFO_FILENAME) . '.' . pathinfo($file, PATHINFO_EXTENSION);
                    $fileName = $ruta;
                    break;
                }
            }
        }
        (isset($fileName)) ? require_once ($fileName) : null;
    }
});
