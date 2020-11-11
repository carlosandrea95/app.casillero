<?php
/**
 *
 */
use PHPMailer\PHPMailer;

class MailSend extends PHPMailer
{

    public function __construct()
    {
        $this->isSMTP(); // Set mailer to use SMTP
        $this->isHTML(true);
        $this->CharSet = 'UTF-8';
        $this->Host = 'smtp.gmail.com'; // Specify main and backup SMTP servers
        $this->SMTPAuth = true; // Enable SMTP authentication
        $this->Username = 'carlos.sandrea@capre.luz.edu.ve'; // SMTP username
        $this->Password = '7874671152066'; // SMTP password
        $this->SMTPSecure = 'tls'; // Enable TLS encryption, `ssl` also accepted
        $this->Port = 587;
    }
    public function addFiles($dir)
    {
        $this->addAttachment($dir);
    }
    public function emailFrom($mail, $name)
    {
        $this->setFrom($mail, $name);
    }
    public function emailTo($mail)
    {
        $this->addAddress($mail);
    }
    public function emailBody($subject, $body)
    {
        $this->Subject = $subject;
        $this->Body = $body;
    }
    public function sendEmail()
    {
        try {
            $this->send();
        } catch (Exception $e) {
            echo "Message could not be sent. Mailer Error: {$this->ErrorInfo}";
        }
    }
}

$mail = new MailSender();
$mail->emailFrom('cjoseare1995@gmail.com', 'PHPMailer');
$mail->emailTo('bpfm18@gmail.com');
$mail->addFiles('/bme/fsad/fe.pdf');
$mail->emailBody('titulo', 'cuerpo');
$mail->sendEmail();
