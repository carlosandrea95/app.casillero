<?php
class CWidget
{
    public static function Menu($menu = array())
    {
        // echo "<pre>".print_r($menu)."</pre>";//muestra del array
        if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
            $protocolo = 'https';
        } else {
            $protocolo = 'http';
        }
        $server_name = $_SERVER['SERVER_NAME'];
        $baseUrl = $protocolo . '://' . $server_name . '/';
        $attrs = null;
        if (array_key_exists('nav-options', $menu)) {
            foreach ($menu['nav-options'] as $key => $value) {
                echo '<nav ' . $key . '="' . $value . '">';
            }
        } else {
            echo "<nav>";
        }
        if (array_key_exists('ul-options', $menu)) {
            foreach ($menu['ul-options'] as $key => $value) {
                echo '<ul ' . $key . '="' . $value . '">';
            }
        } else {
            echo "<ul>";
        }
        if (array_key_exists('items', $menu)) {

            for ($i = 0; $i < count($menu['items']); $i++) {
                if (array_key_exists('atts', $menu['items'][$i])) {
                    // echo '<pre>';
                    // print_r($menu['items'][2]);
                    // exit;
                    $attrs = null;
                    foreach ($menu['items'][$i]['atts'] as $key => $value) {
                        $attrs .= "$key='$value'";
                    }
                    echo '<li ' . $attrs . '>';

                    if (is_array($menu['items'][$i]['link'])) {
                        if (array_key_exists('atts', $menu['items'][$i]['link'])) {
                            $attrs = null;
                            foreach ($menu['items'][$i]['link']['atts'] as $key => $value) {
                                $attrs .= "$key='$value'";
                            }
                            echo '<a ' . $attrs . ' " href="' . $baseUrl . $menu['items'][$i]['link']['link'] . '">';
                        } else {
                            echo '<a href="' . $baseUrl . $menu['items'][$i]['link']['link'] . '">';
                        }
                    } else {
                        if ($menu['items'][$i]['link']) {
                            echo '<a href="' . $baseUrl . $menu['items'][$i]['link'] . '">';
                        }
                    }

                    echo $menu['items'][$i]['title'];
                    if ($menu['items'][$i]['link']) {
                        echo "</a>";
                    }
                    if (array_key_exists('subitems', $menu['items'][$i])) {
                        if (count($menu['items'][$i]['subitems']) > 0) {
                            echo '<div class="dropdown-menu" aria-labelledby="navbarDropdown">';
                            for ($x = 0; $x < count($menu['items'][$i]['subitems']); $x++) {
                                if (array_key_exists('atts', $menu['items'][$i]['subitems'][$x])) {
                                    $attrs = null;
                                    foreach ($menu['items'][$i]['subitems'][$x]['atts'] as $key => $value) {
                                        $attrs .= "$key='$value'";
                                    }
                                    echo '<a ' . $attrs . ' href="' . $baseUrl . $menu['items'][$i]['subitems'][$x]['link'] . '"> ' . $menu['items'][$i]['subitems'][$x]['title'] . '';
                                } else {
                                    echo '<a href="' . $baseUrl . $menu['items'][$i]['subitems'][$x]['link'] . '"> ' . $menu['items'][$i]['subitems'][$x]['title'] . '';
                                }
                                echo '</a>';
                            }
                            echo '</div>';
                        }
                    }

                    echo "</li>";
                } else {

                    echo "<li>";
                    if (is_array($menu['items'][$i]['link'])) {
                        if (array_key_exists('atts', $menu['items'][$i]['link'])) {
                            $attrs = null;
                            foreach ($menu['items'][$i]['link']['atts'] as $key => $value) {
                                $attrs .= "$key='$value'";
                            }
                            echo '<a ' . $attrs . ' href="' . $baseUrl . $menu['items'][$i]['link']['link'] . '">';
                        } else {
                            echo '<a href="' . $baseUrl . $menu['items'][$i]['link']['link'] . '">';
                        }
                    } else {
                        if ($menu['items'][$i]['link']) {
                            echo '<a href="' . $baseUrl . $menu['items'][$i]['link'] . '">';
                        }
                    }
                    echo $menu['items'][$i]['title'];
                    if ($menu['items'][$i]['link']) {
                        echo "</a>";
                    }
                    echo "</li>";
                }

            }
        }
        echo "</ul>";
        echo "</nav>";
    }
    public static function BreadCrumb($bread = array())
    {
        // echo "<pre>".print_r($bread)."</pre>";//muestra del array
        if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
            $protocolo = 'https';
        } else {
            $protocolo = 'http';
        }
        $server_name = $_SERVER['SERVER_NAME'];
        $baseUrl = $protocolo . '://' . $server_name . '/';

        if ($bread['items']) {
            if (array_key_exists('div-options', $bread)) {
                foreach ($bread['div-options'] as $key => $value) {
                    echo '<div ' . $key . '="' . $value . '">';
                }
            } else {
                echo "<div>";
            }
            if (array_key_exists('ol-options', $bread)) {
                foreach ($bread['ol-options'] as $key => $value) {
                    echo '<ol ' . $key . '="' . $value . '">';
                }
            } else {
                echo "<ol>";
            }
            for ($i = 0; $i < count($bread['items']); $i++) {
                if (array_key_exists('atts', $bread['items'][$i])) {
                    foreach ($bread['items'][$i]['atts'] as $key => $value) {
                        echo '<li ' . $key . '="' . $value . '">';
                        if (array_key_exists('link', $bread['items'][$i])) {
                            if ($bread['items'][$i]['link']) {
                                echo '<a href="' . $baseUrl . $bread['items'][$i]['link'] . '">';
                            }
                            echo $bread['items'][$i]['title'];
                            echo "</a>";
                            echo "</li>";
                        } else {
                            echo $bread['items'][$i]['title'];
                            echo "</li>";
                        }
                    }
                } else {
                    echo '<li>';
                    if ($bread['items'][$i]['link']) {
                        echo '<a href="' . $baseUrl . $bread['items'][$i]['link'] . '">';
                    }
                    echo $bread['items'][$i]['title'];
                    echo "</a>";
                    echo "</li>";
                }
            }
            echo "</ol>";
            echo "</div>";
        }
    }
}
