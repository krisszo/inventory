<?php
include_once "library/inc.seslogin.php";
include_once "library/inc.hakakses.php";

# Hak akses (Yes = diijinkan, No = dilarang)
if($aksesData['mlap_pengadaan_departemen'] == "Yes") {

// Variabel SQL
$filterSQL= "";

// Temporary Variabel form
$kodeDepartemen	= isset($_GET['kodeDepartemen']) ? $_GET['kodeDepartemen'] : 'Semua'; // dari URL
$dataDepartemen	= isset($_POST['cmbDepartemen']) ? $_POST['cmbDepartemen'] : $kodeDepartemen; // dari Form

#
$barangTersedia	= isset($_GET['barangTersedia']) ? $_GET['barangTersedia'] : 'Semua'; // dari URL
$dataBarang	= isset($_POST['cmbBarang']) ? $_POST['cmbBarang'] : $barangTersedia; // dari Form

#  Tahun Terpilih
$tahun	   	= isset($_GET['tahun']) ? $_GET['tahun'] : date('Y'); // Baca dari URL, jika tidak ada diisi tahun sekarang
$dataTahun 	= isset($_POST['cmbTahun']) ? $_POST['cmbTahun'] : $tahun; // Baca dari form Submit, jika tidak ada diisi dari $tahun


// Membuat filter SQL
if ($dataDepartemen=="Semua") {
	// Semua Departemen, dan Tahun terpilih
	$filterSQL 	= "WHERE LEFT(pengadaan.tgl_pengadaan,4)='$dataTahun'";
}
else {
	// Departemen terpilih, dan Tahun Terpilih
	$filterSQL 	= " WHERE pengadaan.kd_departemen ='$dataDepartemen' AND LEFT(pengadaan.tgl_pengadaan,4)='$dataTahun'";
}

# TMBOL CETAK DIKLIK
if (isset($_POST['btnCetak'])) {
		// Buka file
		echo "<script>";
		echo "window.open('cetak/pengadaan_departemen.php?kodeDepartemen=$dataDepartemen&tahun=$dataTahun')";
		echo "</script>";
}

# UNTUK PAGING (PEMBAGIAN HALAMAN)
$baris 	= 50;
$hal 	= isset($_GET['hal']) ? $_GET['hal'] : 0;
$pageSql = "SELECT * FROM pengadaan $filterSQL";
$pageQry = mysql_query($pageSql, $koneksidb) or die ("error paging: ".mysql_error());
$jml	 = mysql_num_rows($pageQry);
$max	 = ceil($jml/$baris);
?>
<h2>LAPORAN DATA  PENGADAAN PER DEPARTEMEN </h2>
<form action="<?php $_SERVER['PHP_SELF']; ?>" method="post" name="form1" target="_self">
  <table width="900" border="0"  class="table-list">
    <tr>
      <td colspan="3" bgcolor="#F5F5F5"><strong>FILTER DATA </strong></td>
    </tr>
    <tr>
      <td width="111"><strong> Departemen </strong></td>
      <td width="5"><strong>:</strong></td>
      <td width="770">
	  <select name="cmbDepartemen">
        <option value="Semua"> ... </option>
        <?php
	  $tampilSql = "SELECT * FROM departemen ORDER BY kd_departemen";
	  $tampilQry = mysql_query($tampilSql, $koneksidb) or die ("Gagal Query".mysql_error());
	  while ($tampilData = mysql_fetch_array($tampilQry)) {
		if ($tampilData['kd_departemen'] == $dataDepartemen) {
			$cek = " selected";
		} else { $cek=""; }
		echo "<option value='$tampilData[kd_departemen]' $cek> $tampilData[nm_departemen]</option>";
	  }
	  ?>
      </select></td>
    </tr>

    <tr>
      <td><strong>Status Barang </strong></td>
      <td><strong>:</strong></td>
      <td><select name="cmbBarang">
          <?php
		# Baca tahun terendah(kecil), dan tahun tertinggi(besar) di tabel Transaksi
		$thnSql = "SELECT (LEFT(status_barang,4)), (LEFT(status_barang,4)) FROM barang_inventaris";
		$thnQry	= mysql_query($thnSql, $koneksidb) or die ("Error".mysql_error());
		$thnRow	= mysql_fetch_array($thnQry);
		
		
		// Menampilkan daftar Tahun, dari tahun terkecil sampai Terbesar (tahun sekarang)
		for($thn= $thnKecil; $thn <= $thnBesar; $thn++) {
			if ($thn == $dataTahun) {
				$cek = " selected";
			} else { $cek=""; }
			echo "<option value='$thn' $cek>$thn</option>";
		}
	  ?>
    </tr>


    <tr>
      <td><strong>Periode Tahun </strong></td>
      <td><strong>:</strong></td>
      <td><select name="cmbTahun">
          <?php
		# Baca tahun terendah(kecil), dan tahun tertinggi(besar) di tabel Transaksi
		$thnSql = "SELECT MIN(LEFT(tgl_pengadaan,4)) As tahun_kecil, MAX(LEFT(tgl_pengadaan,4)) As tahun_besar FROM pengadaan";
		$thnQry	= mysql_query($thnSql, $koneksidb) or die ("Error".mysql_error());
		$thnRow	= mysql_fetch_array($thnQry);
		
		// Membaca tahun
		$thnKecil = $thnRow['tahun_kecil'];
		$thnBesar = $thnRow['tahun_besar'];
		
		// Menampilkan daftar Tahun, dari tahun terkecil sampai Terbesar (tahun sekarang)
		for($thn= $thnKecil; $thn <= $thnBesar; $thn++) {
			if ($thn == $dataTahun) {
				$cek = " selected";
			} else { $cek=""; }
			echo "<option value='$thn' $cek>$thn</option>";
		}
	  ?>
        </select>
          <input name="btnTampil" type="submit" value=" Tampilkan " />
          <input name="btnCetak" type="submit" id="btnCetak" value=" Cetak " /></td>
    </tr>
    
  </table>
</form>

<table class="table-list" width="900" border="0" cellspacing="1" cellpadding="2">
  <tr>
    <td width="28" align="center" bgcolor="#F5F5F5"><b>No</b></td>
    <td width="106" bgcolor="#F5F5F5"><b>Tanggal</b></td>
    <td width="126" bgcolor="#F5F5F5"><b>No. Pengadaan </b></td>
    <td width="378" bgcolor="#F5F5F5"><strong>Keterangan</strong></td>
    <td width="96" align="right" bgcolor="#F5F5F5"><strong>Total Barang  </strong></td>
    <td width="135" align="right" bgcolor="#F5F5F5"><strong>Total Belanja  (Rp) </strong></td>
  </tr>
  <?php
    // Definisikan variabel angka
    $totalBarang = 0; 
  $totalBelanja= 0;
  
  # Skrip untuk menampilkan Data Trans Pengadaan, dilengkapi informasi departemen dari tabel relasi
  $mySql = "SELECT pengadaan.*, departemen.nm_departemen FROM pengadaan
        LEFT JOIN departemen ON pengadaan.kd_departemen=departemen.kd_departemen 
        $filterSQL
        ORDER BY pengadaan.no_pengadaan ASC";
  $myQry = mysql_query($mySql, $koneksidb)  or die ("Query 1 salah : ".mysql_error());
  $nomor  = 0; 
  while ($myData = mysql_fetch_array($myQry)) {
    $nomor++;
    
    # Membaca Kode pengadaan/ Nomor transaksi
    $Kode = $myData['no_pengadaan'];
    
    # Menghitung Total pengadaan (belanja) setiap nomor transaksi
    $my2Sql = "SELECT SUM(jumlah) AS total_barang,  
              SUM(harga_beli * jumlah) AS total_belanja 
           FROM pengadaan_item WHERE no_pengadaan='$Kode'";
    $my2Qry = mysql_query($my2Sql, $koneksidb)  or die ("Query 2 salah : ".mysql_error());
    $my2Data = mysql_fetch_array($my2Qry);
    
    // Hitung Total (Semua data)
    $totalBarang  = $totalBarang + $my2Data['total_barang'];    
    $totalBelanja = $totalBelanja + $my2Data['total_belanja'];
  ?>
  <tr>
    <td align="center"><?php echo $nomor; ?></td>
    <td><?php echo IndonesiaTgl($myData['tgl_pengadaan']); ?></td>
    <td><?php echo $myData['no_pengadaan']; ?></td>
    <td><?php echo $myData['keterangan']; ?></td>
    <td align="right"><?php echo format_angka($my2Data['total_barang']); ?></td>
    <td align="right"><?php echo format_angka($my2Data['total_belanja']); ?></td>
  </tr>
  <?php } ?>
  <tr>
    <td colspan="4" align="right"><strong>GRAND TOTAL   : </strong></td>
    <td align="right" bgcolor="#F5F5F5"><strong><?php echo format_angka($totalBarang); ?></strong></td>
    <td align="right" bgcolor="#F5F5F5"><strong>Rp. <?php echo format_angka($totalBelanja); ?></strong></td>
  </tr>
</table>

<br />
<a href="cetak/pengadaan_Departemen.php?kodeDepartemen=<?php echo $dataDepartemen; ?>&tahun=<?php echo $dataTahun; ?>" target="_blank"><img src="images/btn_print2.png" height="18" border="0" title="Cetak ke Format HTML"/></a>
<?php
# Penutup Hak Akses
}
else {
	echo "TIDAK BOLEH MENGAKSES HALAMAN INI";
}
?>
