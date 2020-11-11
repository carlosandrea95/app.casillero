<?php
/* Smarty version 3.1.34-dev-7, created on 2020-09-17 01:18:36
  from 'C:\xampp\htdocs\framework\protected\views\layouts\site\site.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.34-dev-7',
  'unifunc' => 'content_5f62f1aced7e77_59272011',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'be953058a947b136d02cfeb7d2286c03530a016d' => 
    array (
      0 => 'C:\\xampp\\htdocs\\framework\\protected\\views\\layouts\\site\\site.tpl',
      1 => 1600319101,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f62f1aced7e77_59272011 (Smarty_Internal_Template $_smarty_tpl) {
?><!--
Author: W3layouts
Author URL: http://w3layouts.com
-->
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title><?php echo (($tmp = @$_smarty_tpl->tpl_vars['titulo']->value)===null||$tmp==='' ? 'sin titulo' : $tmp);?>
</title>
        <!-- web fonts -->
        <link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700,900&display=swap" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Nunito:200,300,400,600,700,800,900&display=swap" rel="stylesheet">
        <!-- //web fonts -->
        <!-- Template CSS -->
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['templateParams']->value['cssDir'], 'css');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['css']->value) {
?>
        <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['css']->value;?>
">
        <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
    </head>

    <body>
        <div class="w3l-bootstrap-header fixed-top">
            <nav class="navbar navbar-expand-lg navbar-light p-2">
                <div class="container">
                    <a class="navbar-brand" href="index.html"><?php echo '<?php ';?>
echo AppName <?php echo '?>';?>
</a>
                    <!-- if logo is image enable this
    <a class="navbar-brand" href="#index.html">
        <img src="image-path" alt="Your logo" title="Your logo" style="height:35px;" />
    </a> -->
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                            </div>
                    <!-- <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.html">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.html">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">Contact</a>
          </li>
        </ul> -->
                    <div class="form-inline">
                        <a href="#login.html" class="login mr-4">Log in</a>
                        <a href="#signup.html" class="btn btn-primary btn-theme">Create Free Account</a>
                    </div>
                </div>
        </div>
        </nav>
        </div>
        <?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['content']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>

        <!-- / index-block8 -->
        <!-- footer-28 block -->
        <section class="w3l-market-footer">
            <footer class="footer-28">
                <div class="footer-bg-layer">
                    <div class="container py-lg-3">
                        <div class="row footer-top-28">
                            <div class="col-md-6 footer-list-28 mt-5">
                                <h6 class="footer-title-28">Contact information</h6>
                                <ul>
                                    <li>
                                        <p><strong>Address</strong> : #135 block, Barnard St. Brooklyn, NY 10036, USA</p>
                                    </li>
                                    <li>
                                        <p><strong>Phone</strong> : <a href="tel:+404-11-22-89">+404-11-22-89</a></p>
                                    </li>
                                    <li>
                                        <p><strong>Email</strong> : <a href="mailto:example@mail.com">example@mail.com</a></p>
                                    </li>
                                </ul>

                                <div class="main-social-footer-28 mt-3">
                                    <ul class="social-icons">
                                        <li class="facebook">
                                            <a href="#link" title="Facebook">
                                                <span class="fab fa-facebook" aria-hidden="true"></span>
                                            </a>
                                        </li>
                                        <li class="dribbble">
                                            <a href="#link" title="instagram">
                                                <span class="fab fa-instagram" aria-hidden="true"></span>
                                            </a>
                                        </li>
                                        <li class="google">
                                            <a href="#link" title="youtube">
                                                <span class="fab fa-youtube" aria-hidden="true"></span>
                                            </a>
                                        </li>
                                        <li class="twitter">
                                            <a href="#link" title="twitter">
                                                <span class="fab fa-twitter" aria-hidden="true"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-4 footer-list-28 mt-5">
                                        <h6 class="footer-title-28">Company</h6>
                                        <ul>
                                            <li><a href="about.html">About</a></li>
                                            <li><a href="#blog.html">Blog Posts</a></li>
                                            <li><a href="#pricing.html">FAQ</a></li>
                                            <li><a href="#pricing.html">Pricing</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-4 footer-list-28 mt-5">
                                        <h6 class="footer-title-28">Support</h6>
                                        <ul>
                                            <li><a href="contact.html">Contact Us</a></li>
                                            <li><a href="#signup.html">Create account</a></li>
                                            <li><a href="#learn.html">Learning Center</a></li>
                                            <li><a href="#career.html">Team</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-4 footer-list-28 mt-5">
                                        <h6 class="footer-title-28">Product</h6>
                                        <ul>
                                            <li><a href="#URL">Market</a></li>
                                            <li><a href="#URL">VIP</a></li>
                                            <li><a href="#URL">Resources</a></li>
                                            <li><a href="#URL">Sale</a></li>
                                            <li><a href="#URL">Admin UI</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="midd-footer-28 align-center py-lg-4 py-3 mt-5">
                        <div class="container">
                            <p class="copy-footer-28 text-center"> &copy; 2020 Market. All Rights Reserved. Design by <a href="https://w3layouts.com/">W3Layouts</a></p>
                        </div>
                    </div>
                </div>
            </footer>

            <!-- move top -->
            <button onclick="topFunction()" id="movetop" title="Subir">
                &#10548;
            </button>
            <?php echo '<script'; ?>
>
                // When the user scrolls down 20px from the top of the document, show the button
                window.onscroll = function() {
                    scrollFunction()
                };

                function scrollFunction() {
                    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                        document.getElementById("movetop").style.display = "block";
                    } else {
                        document.getElementById("movetop").style.display = "none";
                    }
                }

                // When the user clicks on the button, scroll to the top of the document
                function topFunction() {
                    document.body.scrollTop = 0;
                    document.documentElement.scrollTop = 0;
                }
            <?php echo '</script'; ?>
>
            <!-- /move top -->
        </section>
        <!-- //footer-28 block -->

        <!-- jQuery, Bootstrap JS -->
        <?php echo '<script'; ?>
 src="<?php echo '<?php ';?>
echo CUrl::baseUrl(); <?php echo '?>';?>
assets/plugins/jquery/jquery.min.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo '<?php ';?>
echo CUrl::baseUrl(); <?php echo '?>';?>
assets/plugins/bootstrap/js/bootstrap.bundle.min.js"><?php echo '</script'; ?>
>

        <!-- Template JavaScript -->

        <?php echo '<script'; ?>
 src="<?php echo '<?php ';?>
echo CUrl::baseUrl(); <?php echo '?>';?>
assets/dist/js/owl.carousel.js"><?php echo '</script'; ?>
>

        <!-- script for owlcarousel -->
        <?php echo '<script'; ?>
>
            $(document).ready(function() {
                $('.owl-one').owlCarousel({
                    loop: true,
                    margin: 0,
                    nav: true,
                    responsiveClass: true,
                    autoplay: false,
                    autoplayTimeout: 5000,
                    autoplaySpeed: 1000,
                    autoplayHoverPause: false,
                    responsive: {
                        0: {
                            items: 1,
                            nav: false
                        },
                        480: {
                            items: 1,
                            nav: false
                        },
                        667: {
                            items: 1,
                            nav: true
                        },
                        1000: {
                            items: 1,
                            nav: true
                        }
                    }
                })
            })
        <?php echo '</script'; ?>
>
        <!-- //script for owlcarousel -->

        <!-- disable body scroll which navbar is in active -->
        <?php echo '<script'; ?>
>
            $(function() {
                $('.navbar-toggler').click(function() {
                    $('body').toggleClass('noscroll');
                })
            });
        <?php echo '</script'; ?>
>
        <!-- disable body scroll which navbar is in active -->

        <?php echo '<script'; ?>
 src="<?php echo '<?php ';?>
echo CUrl::baseUrl(); <?php echo '?>';?>
assets/dist/js/jquery.magnific-popup.min.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
>
            $(document).ready(function() {
                $('.popup-with-zoom-anim').magnificPopup({
                    type: 'inline',

                    fixedContentPos: false,
                    fixedBgPos: true,

                    overflowY: 'auto',

                    closeBtnInside: true,
                    preloader: false,

                    midClick: true,
                    removalDelay: 300,
                    mainClass: 'my-mfp-zoom-in'
                });

                $('.popup-with-move-anim').magnificPopup({
                    type: 'inline',

                    fixedContentPos: false,
                    fixedBgPos: true,

                    overflowY: 'auto',

                    closeBtnInside: true,
                    preloader: false,

                    midClick: true,
                    removalDelay: 300,
                    mainClass: 'my-mfp-slide-bottom'
                });
            });
        <?php echo '</script'; ?>
>

    </body>

</html><?php }
}
