<?php
class CHtml
{

    public static function link($href, $content, $attrs = array())
    {
        $attr = null;
        foreach ($attrs as $key => $value) {
            $attr .= "$key='$value'";
        }
        return "<a href='" . CUrl::baseUrl() . $href . "' " . $attr . ">" . $content . "</a>";
    }
    public static function img($src, $attrs = array())
    {
        $attr = null;
        foreach ($attrs as $key => $value) {
            $attr .= "$key='$value'";
        }
        return "<img src='" . $src . "' " . $attr . "/>";
    }
}
