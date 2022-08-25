<?php
include_once "library/inc.seslogin.php";
include_once "library/inc.library.php";
include_once "library/inc.hakakses.php";

# Hak akses (Yes = diijinkan, No = dilarang)
if($aksesData['mu_data_inventaris'] == "Yes") {

$Kode	= isset($_GET['Kode']) ? $_GET['Kode'] : '-';
$infoSql = "SELECT IB.*, barang.nm_barang, barang.merek, barang.tipe, pegawai.nm_pegawai FROM barang_inventaris As IB 
			LEFT JOIN barang ON IB.kd_barang = barang.kd_barang
      inner join pegawai on IB.pegawai_yang_menggunakan = pegawai.kd_pegawai
			WHERE IB.kd_inventaris='$Kode'";  
$infoQry= mysql_query($infoSql, $koneksidb) or die ("Query ambil data salah : ".mysql_error());
$infoData= mysql_fetch_array($infoQry);
?>
<table width="800" border="0" cellpadding="2" cellspacing="1" class="table-list">
<tr>
  <td bgcolor="#CCCCCC"><b>DETIL  BARANG </b></td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td><strong>Kode</strong></td>
  <td><b>:</b></td>
  <td><?php echo $infoData['kd_barang']; ?></td>
</tr>
<tr>
  <td width="184"><strong>Nama Barang </strong></td>
  <td width="5"><b>:</b></td>
  <td width="595"><?php echo $infoData['nm_barang']; ?></td>
</tr>
<tr>
  <td><strong>Merek</strong></td>
  <td><b>:</b></td>
  <td><?php echo $infoData['merek']; ?></td>
</tr>
<tr>
  <td><strong>Tipe</strong></td>
  <td><b>:</b></td>
  <td><?php echo $infoData['tipe']; ?></td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td width="184"><strong>Kode Aset </strong></td>
  <td width="5"><strong>:</strong></td>
  <td><?php echo $infoData['kd_inventaris']; ?></td>
</tr>
<tr>
  <td><b>Tahun Datang </b></td>
  <td><b>:</b></td>
  <td><?php echo $infoData['tahun_datang']; ?></td>
</tr>
<tr>
  <td><b>Tahun Digunakan</b></td>
  <td><b>:</b></td>
  <td><?php echo $infoData['tahun_digunakan']; ?></td>
</tr>
<tr>
  <td><b>Nomor Seri</b></td>
  <td><b>:</b></td>
  <td><?php echo $infoData['nomor_seri']; ?></td>
</tr>
<tr>
  <td><b>Masa Habis Kalibrasi </b></td>
  <td><strong>:</strong></td>
  <td><?php echo $infoData['masa_habis_kalibrasi']; ?></td>
</tr>
<tr>
  <td><b>No. Sertifikat  Kalibrasi </b></td>
  <td><strong>:</strong></td>
  <td><?php echo $infoData['no_sertifikat_kalibrasi']; ?></td>
</tr>
<tr>
  <td><b>Pembuat Sertifikat </b></td>
  <td><strong>:</strong></td>
  <td><?php echo $infoData['pembuat_sertifikat']; ?></td>
</tr>
<tr>
  <td><b>Asal Barang </b></td>
  <td><strong>:</strong></td>
  <td><?php echo $infoData['asal_barang']; ?></td>
</tr>
<tr>
  <td><b>Harga Barang (Rp.) </b></td>
  <td><strong>:</strong></td>
  <td><?php echo format_angka($infoData['harga_barang']); ?></td>
</tr>
<tr>
  <td><b>Keterangan</b></td>
  <td><strong>:</strong></td>
  <td><?php echo $infoData['keterangan']; ?></td>
</tr>
<tr>
  <td><b>Pegawai Yang Menggunakan</b></td>
  <td><strong>:</strong></td>
  <td><?php echo $infoData['nm_pegawai']; ?></td>
</tr>
</table>

<a href="cetak/inventaris_cetak.php?Kode=<?php echo $Kode; ?>" target="_blank"><img src="images/btn_print2.png" height="18" border="0" title="Cetak ke Format HTML"/></a>
<?php
# Penutup Hak Akses
}
else {
	echo "TIDAK BOLEH MENGAKSES HALAMAN INI";
}
?>
