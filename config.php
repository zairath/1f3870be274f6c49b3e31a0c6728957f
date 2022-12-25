<?php
require_once 'vendor/autoload.php';
require_once 'class-db.php';
  
define('GOOGLE_CLIENT_ID', '474802096897-feon645dq67sjjhuvpu6niq3mgct2kv3.apps.googleusercontent.com');
define('GOOGLE_CLIENT_SECRET', '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');
  
$config = [
    'callback' => 'http://localhost:8080/callback.php',
    'keys'     => [
                    'id' => GOOGLE_CLIENT_ID,
                    'secret' => GOOGLE_CLIENT_SECRET
                ],
    'scope'    => 'https://mail.google.com',
    'authorize_url_parameters' => [
            'approval_prompt' => 'force',
            'access_type' => 'offline'
    ]
];

$adapter = new Hybridauth\Provider\Google($config);