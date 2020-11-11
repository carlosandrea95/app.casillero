<?php
/**
 *
 */
class CUrl
{

    public static function baseUrl()
    {
        if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
            $protocolo = 'https';
        } else {
            $protocolo = 'http';
        }
        $server_name = $_SERVER['SERVER_NAME'];
        return $protocolo . '://' . $server_name . '/';
    }
    public static function sudoUrl($subdomain)
    {
        if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
            $protocolo = 'https';
        } else {
            $protocolo = 'http';
        }
        $server_name = $_SERVER['SERVER_NAME'];
        header("location:" . $protocolo . '://' . $subdomain . '.' . $server_name . '/');
        exit;
    }
}
