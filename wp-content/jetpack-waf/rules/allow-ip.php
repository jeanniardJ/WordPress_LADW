<?php
$waf_allow_list = array (
  0 => '2a01:cb11:8006:16e4:0:35:6d98:e501',
  1 => '2a09:bac5:32ae:14dc::214:8b',
);
return $waf->is_ip_in_array( $waf_allow_list );
