<?php

$url = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$parts = parse_url($url);
parse_str($parts['query'], $query);

echo generate_wsse_header($query['usr'], $query['pwd']);
	
function generate_wsse_header($username, $secret)
{
  date_default_timezone_set('America/Denver');
  $nonce = UUIDv4();
  $created = gmdate('c');
 
  $digest = base64_encode(sha1($nonce.$created.$secret,true));
  $b64nonce = base64_encode($nonce);
 
  return sprintf('X-WSSE: UsernameToken Username="%s", PasswordDigest="%s", Nonce="%s", Created="%s"',
    $username,
    $digest,
    $b64nonce,
    $created
  );
}
 
function UUIDv4()
{
  return sprintf('%04x%04x-%04x-%03x4-%04x-%04x%04x%04x',
           mt_rand(0, 65535), mt_rand(0, 65535),
           mt_rand(0, 65535),
           mt_rand(0, 4095),
           bindec(substr_replace(sprintf('%016b', mt_rand(0, 65535)), '01', 6, 2)),
           mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535)
  );
}
?>