<?php
if (isset($_SESSION['SES_ADMIN'])) {
	echo "<h2 style='margin:-5px 0px 5px 0px; padding:0px;'>Selamat datang ........!</h2></p>";
	echo "<b> Anda login sebagai Admin";
	exit;
} else if (isset($_SESSION['SES_PETUGAS'])) {
	echo "<h2 style='margin:-5px 0px 5px 0px; padding:0px;'>Selamat datang ........!</h2></p>";
	echo "<b> Anda login sebagai Petugas";
	include "login_info.php";
	exit;
} else {
	echo "<h2 style='margin:-5px 0px 5px 0px; padding:0px;'>Selamat datang ........!</h2></p>";
	echo "<b>Anda belum login, silahkan <a href='?open=Login' alt='Login'>login </a>untuk mengakses sitem ini ";
}
