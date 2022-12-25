<?php
use Symfony\Component\Mailer\Transport;
use Symfony\Component\Mailer\Mailer;
use Symfony\Component\Mime\Email;
require_once 'vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();
 
send_email_to_user($_ENV['to_email']);
 
function send_email_to_user($email) {
    require_once 'config.php';

    $db = new DB();
    $arr_token = (array) $db->get_access_token();
 
    try {
        $transport = Transport::fromDsn('gmail+smtp://'.urlencode($_ENV['from_email']).':'.urlencode($arr_token['access_token']).'@default');
 
        $mailer = new Mailer($transport);

        $subject = $_ENV['subject'];
        $html = $_ENV['html'];
        $from = $_ENV['from_email'];
 
        $message = (new Email())
            ->from($from)
            ->to($email)
            ->subject($subject)
            ->html('<h2>'.$html.'</h2>');
 
        // Send the message
        $mailer->send($message);

        pg_connect($_ENV['pgdbconnect']);
        pg_query("INSERT INTO sent_emails(to_email, subject, html) VALUES('$email', '$subject', '$html')");
 
        echo 'Email sent successfully.';
    } catch (Exception $e) {
        if( !$e->getCode() ) {
            $refresh_token = $db->get_refersh_token();
 
            $response = $adapter->refreshAccessToken([
                "grant_type" => "refresh_token",
                "refresh_token" => $refresh_token,
                "client_id" => GOOGLE_CLIENT_ID,
                "client_secret" => GOOGLE_CLIENT_SECRET,
            ]);
             
            $data = (array) json_decode($response);
            $data['refresh_token'] = $refresh_token;
 
            $db->update_access_token(json_encode($data));
 
            send_email_to_user($email);
        } else {
            echo $e->getMessage(); //print the error
        }
    }
}