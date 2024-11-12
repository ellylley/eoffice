<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .disabled-field {
            pointer-events: none;
            background-color: #e9ecef;
        }

        .img-circle {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
        }

        
    </style>
</head>

<body>
    <div class="main-content container-fluid">
        <div class="page-title">
            <div class="row">
                <div class="col-12 col-md-6 order-md-2 order-first">
                    <nav aria-label="breadcrumb" class='breadcrumb-header'></nav>
                </div>
            </div>
        </div>

        <div class="row" id="table-bordered">
            <div class="col-12">
                <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
    <h4 class="card-title">PERMOHONAN CUTI</h4>
    <div class="d-flex align-items-center">
        <div class="input-group">
            <input type="text" class="form-control" id="searchInput" placeholder="Cari Permohonan Cuti...">
            <button class="btn btn-warning" onclick="filterTable()">Cari</button>
           
        </div>
        <button class="btn btn-success ms-3" data-bs-toggle="modal" data-bs-target="#addUserModal">Tambah</button>
    </div>
</div>

                    <div class="card-content">
                        <!-- table bordered -->
                        <div class="table-responsive">
                            <table class="table table-bordered mb-0">
                                <thead>
    <tr>
        <th>No</th>
        <th>Nama</th>
        <th>NIK</th>
        <th>Jabatan</th>
        <th>Cabang SPH</th>
        

        <?php if (in_array(session()->get('level'), [3, 6])): ?>
            <!-- Kolom Persetujuan hanya ditampilkan untuk level 3 dan 6 -->
            <th>Persetujuan</th>
        <?php endif; ?>

        <?php if (in_array(session()->get('level'), [1, 2, 4, 5, 7])): ?>
            <!-- Kolom Status hanya ditampilkan untuk level 1, 2, 4, 5, dan 7 -->
            <th>Status</th>
        <?php endif; ?>

        <th>Aksi</th>
    </tr>
</thead>
                                <tbody>
                                    <?php
                                    $no = 1;
                                    foreach ($elly as $gou) {
                                        if ($gou->isdelete == 0) {
                                           
                                    ?>
                                            <tr>
                                                <td><?= $no++ ?></td>
                    
                                                <td><?= $gou->nama_cuti ?></td>
                                                <td><?= $gou->nik_cuti?></td>
                                                <td><?= $gou->jabatan?></td>
                                                <td><?= $gou->cabang?></td>
                                                <!-- Misalkan data cuti adalah objek -->
                                                <?php if (in_array(session()->get('level'), [3, 6])): ?>
                <!-- Kolom Persetujuan untuk level 3 dan 6 -->
                <td>
                    <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#persetujuanModal" data-id="<?= $gou->id_cuti; ?>" data-issetuju="<?= $gou->issetuju; ?>">Persetujuan</button>
                </td>
            <?php endif; ?>

            <?php if (in_array(session()->get('level'), [1, 2, 4, 5, 7])): ?>
                <!-- Kolom Status untuk level 1, 2, 4, 5, dan 7 -->
                <td>
                    <?php
                    if ($gou->issetuju == 0) {
                        echo "Menunggu Persetujuan";
                    } elseif ($gou->issetuju == 1) {
                        echo "Menunggu Persetujuan HRD";
                    } elseif ($gou->issetuju == 2) {
                        echo "Ditolak";
                    } elseif ($gou->issetuju == 3) {
                        echo "Disetujui HRD dan Kepala Sekolah";
                    } elseif ($gou->issetuju == 4) {
                        echo "Ditolak";
                    }
                    ?>
                </td>
            <?php endif; ?>



                                                <td>
                                                    <div class="dropdown">
                                                        <button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="actionMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                                            Aksi
                                                        </button>
                                                        <ul class="dropdown-menu" aria-labelledby="actionMenu">
                                                            <li>
                                                                <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#editUserModal" 
                                                                data-id="<?= $gou->id_cuti ?>"
                                                                data-nama="<?= $gou->nama_cuti  ?>" 
                                                                data-nik="<?= $gou->nik_cuti  ?>" 
                                                                data-cabang="<?= $gou->cabang ?>"
                                                                data-tgl="<?= $gou->tgl_pengajuan ?>"
                                                                data-jenis="<?= $gou->jenis_cuti ?>" 
                                                                data-mulai="<?= $gou->tgl_mulai ?>" 
                                                                data-akhir="<?= $gou->tgl_terakhir ?>" 
                                                                data-total="<?= $gou->total_hari  ?>  "
                                                                data-balik="<?= $gou->tgl_kembali ?>" 
                                                                data-alih="<?= $gou->ambil_alih ?> "
                                                                data-alamat="<?= $gou->alamat_cuti ?>  "
                                                                data-alasan="<?= $gou->alasan_cuti ?> "
                                                                data-jatah="<?= $gou->jatah_cuti ?>"  
                                                                data-diajukan="<?= $gou->cuti_diajukan ?>" 
                                                                data-sisa="<?= $gou->sisa_cuti ?>"  
                                                                data-catatan="<?= $gou->catatan ?>" 
                                                                
                                                               
                                                                >
                                                                    Edit
                                                                </button>
                                                            </li>
                                                            <li><a class="dropdown-item" href="<?= base_url('home/hapuscuti/' . $gou->id_cuti) ?>">Hapus</a></li>

                                                            <?php if (isset($backup_cuti[$gou->id_cuti])) : ?>
                                                                <li>
                                                                    <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#undoEditModal" 
                                                                data-id="<?= $backup_cuti[$gou->id_cuti]->id_cuti ?>"
                                                                data-nama="<?= $backup_cuti[$gou->id_cuti]->nama_cuti  ?>" 
                                                                data-nik="<?= $backup_cuti[$gou->id_cuti]->nik_cuti  ?>" 
                                                                data-cabang="<?= $backup_cuti[$gou->id_cuti]->cabang ?>"
                                                                data-tgl="<?= $backup_cuti[$gou->id_cuti]->tgl_pengajuan ?>"
                                                                data-jenis="<?= $backup_cuti[$gou->id_cuti]->jenis_cuti ?>" 
                                                                data-mulai="<?= $backup_cuti[$gou->id_cuti]->tgl_mulai ?>" 
                                                                data-akhir="<?= $backup_cuti[$gou->id_cuti]->tgl_terakhir ?>" 
                                                                data-total="<?= $backup_cuti[$gou->id_cuti]->total_hari  ?>  "
                                                                data-balik="<?= $backup_cuti[$gou->id_cuti]->tgl_kembali ?>"
                                                                data-alih="<?= $backup_cuti[$gou->id_cuti]->ambil_alih ?> "
                                                                data-alamat="<?= $backup_cuti[$gou->id_cuti]->alamat_cuti ?>  "
                                                                data-alasan="<?= $backup_cuti[$gou->id_cuti]->alasan_cuti ?> "
                                                                data-jatah="<?= $backup_cuti[$gou->id_cuti]->jatah_cuti ?>"  
                                                                data-diajukan="<?= $backup_cuti[$gou->id_cuti]->cuti_diajukan ?>" 
                                                                data-sisa="<?= $backup_cuti[$gou->id_cuti]->sisa_cuti ?>"  
                                                                data-catatan="<?= $backup_cuti[$gou->id_cuti]->catatan ?>" 
                                                                 
                                                               
                                                             >
                                                                        Undo Edit
                                                                    </button>
                                                                </li>
                                                            <?php endif; ?>
                                                        </ul>
                                                    </div>
                                                </td>

                                               
                                            </tr>
                                    <?php
                                        }
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

       <!-- Modal Persetujuan -->
<div class="modal fade" id="persetujuanModal" tabindex="-1" aria-labelledby="persetujuanModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="persetujuanModalLabel">Persetujuan Cuti</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="persetujuanForm" action="<?= base_url('home/aksi_persetujuan_cuti') ?>" method="POST">
                    <input type="hidden" id="persetujuanId" name="id">
                    <div class="form-group">
    <label for="persetujuan">Pilih Persetujuan</label>
    <select class="form-control" id="persetujuan" name="issetuju">
       
        <?php if (session()->get('level') == 3): // Kepala Sekolah ?>
            <option value="1">Setuju</option>
            <option value="2">Tolak</option>
        <?php elseif (session()->get('level') == 6): ?>
            <option value="3">Setuju</option>
            <option value="4">Tolak</option>
        <?php endif; ?>
    </select>
</div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Update</button>
                        
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


       <!-- Add User Modal -->
       <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addUserModalLabel">Tambah</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="<?= base_url('home/aksi_tambah_cuti') ?>" method="POST" enctype="multipart/form-data">
                            <div class="row">
                               
                           

                                
                                <div class="col-md-4">
                                    <label>SPH Cabang</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="cabang" class="form-control" name="cabang" placeholder="SPH Cabang" >
                                </div>
                                <div class="col-md-4">
                                    <label>Tanggal Pengajuan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="tanggal" class="form-control" name="tanggal" placeholder="Tanggal Pengajuan" >
                                </div>
                                <div class="col-md-4">
    <label>Jenis Pengajuan</label>
</div>
<div class="col-md-8 form-group">
    <select id="jeniscuti" class="form-control" name="jeniscuti">
        <option value="">Pilih Jenis Cuti</option>
        <option value="Cuti Tahunan">Cuti Tahunan</option>
        <option value="Cuti Khusus">Cuti Khusus</option>
        <option value="WFH">WFH</option>
        <option value="Sakit dengan Surat Dokter">Sakit dengan Surat Dokter</option>
        <option value="Sakit tanpa Surat Dokter">Sakit tanpa Surat Dokter</option>
        <option value="Izin Tanpa Bayar">Izin Tanpa Bayar</option>
    </select>
</div>

                                <div class="col-md-4">
                                    <label>Tanggal Mulai Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="mulai" class="form-control" name="mulai" placeholder="Tanggal Mulai Cuti" >
                                </div>

                                <div class="col-md-4">
                                    <label>Tanggal Terakhir Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="terakhir" class="form-control" name="terakhir" placeholder="Tanggal Terakhir Cuti" >
                                </div>

                                <div class="col-md-4">
                                    <label>Total Hari Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="total" class="form-control" name="total" placeholder="Total Hari Cuti" readonly >
                                </div>

                                <div class="col-md-4">
                                    <label>Tanggal Kembali Kerja</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="balik" class="form-control" name="balik" placeholder="Tanggal Kembali Kerja" >
                                </div>

                                

                                <div class="col-md-4">
                                    <label>Selama Cuti Tugas Diambil Alih Oleh</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="alih" class="form-control" name="alih" placeholder="Selama Cuti Tugas Diambil Alih Oleh" >
                                </div>

                                <div class="col-md-4">
                                    <label>Alamat Selama Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="alamat" class="form-control" name="alamat" placeholder="Alamat Selama Cuti" >
                                </div>

                                

                                <div class="col-md-4">
                                    <label>Alasan Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                    <textarea class="form-control" id="alasan" name="alasan"  rows="5"  placeholder="Alasan Cuti"></textarea>
                                </div>

                                <div class="col-md-4">
                                    <label>Jumlah Jatah Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="jatah" class="form-control" name="jatah" placeholder="Jumlah Jatah Cuti" >
                                </div>

                                <div class="col-md-4">
                                    <label>Cuti Yang Diajukan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="diajukan" class="form-control" name="diajukan" placeholder="Cuti Yang Diajukan" >
                                </div>

                                <div class="col-md-4">
                                    <label>Sisa Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="sisa" class="form-control" name="sisa" placeholder="Sisa Cuti" >
                                </div>

                                <div class="col-md-4">
                                    <label>Catatan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                    <textarea class="form-control" id="catatan" name="catatan"  rows="5"  placeholder="Catatan"></textarea>
                                </div>

                                
                                
                                <div class="col-sm-12 d-flex justify-content-end">
                                    <button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
                                    <button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


    <!-- Edit User Modal -->
    <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editUserModalLabel">Edit</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editUserForm" action="<?= base_url('home/aksi_edit_cuti') ?>" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            
                        

                       
                                <div class="col-md-4">
                                    <label>SPH Cabang</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="editcabang" class="form-control" name="cabang" placeholder="SPH Cabang" >
                                </div>
                                <div class="col-md-4">
                                    <label>Tanggal Pengajuan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="edittanggal" class="form-control" name="tanggal" placeholder="Tanggal Pengajuan" >
                                </div>
                                <div class="col-md-4">
    <label>Jenis Pengajuan</label>
</div>
<div class="col-md-8 form-group">
    <select id="editjeniscuti" class="form-control" name="jeniscuti">
        <option value="">Pilih Jenis Cuti</option>
        <option value="Cuti Tahunan">Cuti Tahunan</option>
        <option value="Cuti Khusus">Cuti Khusus</option>
        <option value="WFH">WFH</option>
        <option value="Sakit dengan Surat Dokter">Sakit dengan Surat Dokter</option>
        <option value="Sakit tanpa Surat Dokter">Sakit tanpa Surat Dokter</option>
        <option value="Izin Tanpa Bayar">Izin Tanpa Bayar</option>
    </select>
</div>

                                <div class="col-md-4">
                                    <label>Tanggal Mulai Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="editmulai" class="form-control" name="mulai" placeholder="Tanggal Mulai Cuti" >
                                </div>

                                <div class="col-md-4">
                                    <label>Tanggal Terakhir Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="editterakhir" class="form-control" name="terakhir" placeholder="Tanggal Terakhir Cuti" >
                                </div>

                                <div class="col-md-4">
                                    <label>Total Hari Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="edittotal" class="form-control" name="total" placeholder="Total Hari Cuti" readonly >
                                </div>

                                <div class="col-md-4">
                                    <label>Tanggal Kembali Kerja</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="editbalik" class="form-control" name="balik" placeholder="Tanggal Kembali Kerja" >
                                </div>

                                
                                <div class="col-md-4">
                                    <label>Selama Cuti Tugas Diambil Alih Oleh</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="editalih" class="form-control" name="alih" placeholder="Selama Cuti Tugas Diambil Alih Oleh" >
                                </div>

                                <div class="col-md-4">
                                    <label>Alamat Selama Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="editalamat" class="form-control" name="alamat" placeholder="Alamat Selama Cuti" >
                                </div>

                                

                                <div class="col-md-4">
                                    <label>Alasan Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                    <textarea class="form-control" id="editalasan" name="alasan"  rows="5"  placeholder="Alasan Cuti"></textarea>
                                </div>

                                <div class="col-md-4">
                                    <label>Jumlah Jatah Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="editjatah" class="form-control" name="jatah" placeholder="Jumlah Jatah Cuti" >
                                </div>

                                <div class="col-md-4">
                                    <label>Cuti Yang Diajukan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="editdiajukan" class="form-control" name="diajukan" placeholder="Cuti Yang Diajukan" >
                                </div>

                                <div class="col-md-4">
                                    <label>Sisa Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="editsisa" class="form-control" name="sisa" placeholder="Sisa Cuti" >
                                </div>

                                <div class="col-md-4">
                                    <label>Catatan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                    <textarea class="form-control" id="editcatatan" name="catatan"  rows="5"  placeholder="Catatan"></textarea>
                                </div>

                                
                            

                           
        
                            <input type="hidden" id="editId" name="id">

                            <div class="col-sm-12 d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary me-1 mb-1">Update</button>
                                <button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Undo Edit Modal -->
    <div class="modal fade" id="undoEditModal" tabindex="-1" aria-labelledby="undoEditModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="undoEditModalLabel">Undo Edit</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="undoEditForm" action="<?= base_url('home/aksi_unedit_cuti') ?>" method="POST" enctype="multipart/form-data">
            <input type="hidden" id="undoUserId" name="id">
            <div class="row">
                
                
           
                                <div class="col-md-4">
                                    <label>SPH Cabang</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="undocabang" class="form-control disabled-field" name="cabang" placeholder="SPH Cabang" >
                                </div>
                                <div class="col-md-4">
                                    <label>Tanggal Pengajuan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="undotanggal" class="form-control disabled-field" name="tanggal" placeholder="Tanggal Pengajuan" >
                                </div>
                                <div class="col-md-4">
    <label>Jenis Pengajuan</label>
</div>
<div class="col-md-8 form-group">
    <select id="undojeniscuti" class="form-control disabled-field" name="jeniscuti">
    <option value="">Pilih Jenis Cuti</option>
        <option value="Cuti Tahunan">Cuti Tahunan</option>
        <option value="Cuti Khusus">Cuti Khusus</option>
        <option value="WFH">WFH</option>
        <option value="Sakit dengan Surat Dokter">Sakit dengan Surat Dokter</option>
        <option value="Sakit tanpa Surat Dokter">Sakit tanpa Surat Dokter</option>
        <option value="Izin Tanpa Bayar">Izin Tanpa Bayar</option>
    </select>
</div>

                                <div class="col-md-4">
                                    <label>Tanggal Mulai Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="undomulai" class="form-control disabled-field" name="mulai" placeholder="Tanggal Mulai Cuti" >
                                </div>

                                <div class="col-md-4">
                                    <label>Tanggal Terakhir Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="undoakhir" class="form-control disabled-field" name="terakhir" placeholder="Tanggal Terakhir Cuti" >
                                </div>

                                <div class="col-md-4">
                                    <label>Total Hari Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="undototal" class="form-control disabled-field" name="total" placeholder="Total Hari Cuti" >
                                </div>

                                <div class="col-md-4">
                                    <label>Tanggal Kembali Kerja</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="undobalik" class="form-control disabled-field" name="balik" placeholder="Tanggal Kembali Kerja" >
                                </div>

                                <div class="col-md-4">
                                    <label>Selama Cuti Tugas Diambil Alih Oleh</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="undoalih" class="form-control disabled-field" name="alih" placeholder="Selama Cuti Tugas Diambil Alih Oleh" >
                                </div>

                                <div class="col-md-4">
                                    <label>Alamat Selama Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="undoalamat" class="form-control disabled-field" name="alamat" placeholder="Alamat Selama Cuti" >
                                </div>

                                

                                <div class="col-md-4">
                                    <label>Alasan Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                    <textarea class="form-control disabled-field" id="undoalasan" name="alasan"  rows="5"  placeholder="Alasan Cuti"></textarea>
                                </div>

                                <div class="col-md-4">
                                    <label>Jumlah Jatah Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="undojatah" class="form-control disabled-field" name="jatah" placeholder="Jumlah Jatah Cuti" >
                                </div>

                                <div class="col-md-4">
                                    <label>Cuti Yang Diajukan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="undodiajukan" class="form-control disabled-field" name="diajukan" placeholder="Cuti Yang Diajukan" >
                                </div>

                                <div class="col-md-4">
                                    <label>Sisa Cuti</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="undosisa" class="form-control disabled-field" name="sisa" placeholder="Sisa Cuti" >
                                </div>

                                <div class="col-md-4">
                                    <label>Catatan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                    <textarea class="form-control disabled-field" id="undocatatan" name="catatan"  rows="5"  placeholder="Catatan"></textarea>
                                </div>

                                
                

                

                <div class="col-sm-12 d-flex justify-content-end">
                    
                    <button type="submit" class="btn btn-primary me-1 mb-1">Undo Edit</button>
                </div>
                
            </div>
        </form>
      </div>
    </div>
  </div>
</div>



</div>
<script>


document.getElementById('mulai').addEventListener('change', calculateTotalDays);
    document.getElementById('terakhir').addEventListener('change', calculateTotalDays);

    function calculateTotalDays() {
        const mulai = document.getElementById('mulai').value;
        const terakhir = document.getElementById('terakhir').value;

        if (mulai && terakhir) {
            const startDate = new Date(mulai);
            const endDate = new Date(terakhir);

            const diffTime = Math.abs(endDate - startDate);
            const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;

            document.getElementById('total').value = diffDays;
        } else {
            document.getElementById('total').value = '';
        }
    }

    document.getElementById('editmulai').addEventListener('change', calculateEditTotalDays);
    document.getElementById('editterakhir').addEventListener('change', calculateEditTotalDays);

    function calculateEditTotalDays() {
        const mulai = document.getElementById('editmulai').value;
        const terakhir = document.getElementById('editterakhir').value;

        if (mulai && terakhir) {
            const startDate = new Date(mulai);
            const endDate = new Date(terakhir);

            // Menghitung selisih hari
            const diffTime = Math.abs(endDate - startDate);
            const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;

            document.getElementById('edittotal').value = diffDays;
        } else {
            document.getElementById('edittotal').value = ''; // Kosongkan jika tanggal belum lengkap
        }
    }

    // Script asli yang sudah ada sebelumnya untuk show.bs.modal
    document.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;
        var id = button.getAttribute('data-id');
       
        var cabang = button.getAttribute('data-cabang');
        var tgl = button.getAttribute('data-tgl');
        var jenis = button.getAttribute('data-jenis');
        var mulai = button.getAttribute('data-mulai');
        var akhir = button.getAttribute('data-akhir');
        var total = button.getAttribute('data-total');
        var balik = button.getAttribute('data-balik');
        var alih = button.getAttribute('data-alih');
        var alamat = button.getAttribute('data-alamat');
        var alasan = button.getAttribute('data-alasan');
        var jatah = button.getAttribute('data-jatah');
        var diajukan = button.getAttribute('data-diajukan');
        var sisa = button.getAttribute('data-sisa');
        var catatan = button.getAttribute('data-catatan');
        
        
        

        var modal = document.getElementById('editUserModal');
        modal.querySelector('#editId').value = id;
       
        modal.querySelector('#editcabang').value = cabang;
        modal.querySelector('#edittanggal').value = tgl;
        modal.querySelector('#editjeniscuti').value = jenis;
        modal.querySelector('#editmulai').value = mulai;
        modal.querySelector('#editterakhir').value = akhir;
        modal.querySelector('#edittotal').value = total;
        modal.querySelector('#editbalik').value = balik;
        modal.querySelector('#editalih').value = alih;
        modal.querySelector('#editalamat').value = alamat;
        modal.querySelector('#editalasan').value = alasan;
        modal.querySelector('#editjatah').value = jatah;
        modal.querySelector('#editdiajukan').value = diajukan;
        modal.querySelector('#editsisa').value = sisa;
        modal.querySelector('#editcatatan').value = catatan;
        
       
       

        var modal = document.getElementById('undoEditModal');
        modal.querySelector('#undoUserId').value = id;
       
        modal.querySelector('#undocabang').value = cabang;
        modal.querySelector('#undotanggal').value = tgl;
        modal.querySelector('#undojeniscuti').value = jenis;
        modal.querySelector('#undomulai').value = mulai;
        modal.querySelector('#undoakhir').value = akhir;
        modal.querySelector('#undototal').value = total;
        modal.querySelector('#undobalik').value = balik; 
        modal.querySelector('#undoalih').value = alih;
        modal.querySelector('#undoalamat').value = alamat;
        modal.querySelector('#undoalasan').value = alasan;
        modal.querySelector('#undojatah').value = jatah;
        modal.querySelector('#undodiajukan').value = diajukan;
        modal.querySelector('#undosisa').value = sisa;
        modal.querySelector('#undocatatan').value = catatan;
        
       
       

    });
    document.addEventListener('show.bs.modal', function (event) {
    var button = event.relatedTarget; // Tombol yang diklik
    var id = button.getAttribute('data-id'); // Ambil ID
    var issetuju = button.getAttribute('data-issetuju'); // Ambil nilai issetuju

    var modal = document.getElementById('persetujuanModal');
    modal.querySelector('#persetujuanId').value = id; // Masukkan ID ke dalam form

    // Pilih nilai issetuju di dropdown
    var select = modal.querySelector('#persetujuan');
    select.value = issetuju; // Set nilai pada select sesuai dengan issetuju
});


    

   


document.addEventListener('DOMContentLoaded', function () {
        var searchButton = document.getElementById('searchButton'); // Ambil tombol Cari
        searchButton.addEventListener('click', filterTable); // Panggil filterTable saat tombol diklik
    });

    function filterTable() {
        const searchInput = document.getElementById("searchInput").value.toLowerCase();
        const table = document.querySelector("table tbody");
        const rows = table.getElementsByTagName("tr");

        for (let i = 0; i < rows.length; i++) {
            const jenisCell = rows[i].getElementsByTagName("td")[1];
            const nosuCell = rows[i].getElementsByTagName("td")[2];
            const perihalCell = rows[i].getElementsByTagName("td")[3];
            const cabangCell = rows[i].getElementsByTagName("td")[4];
            const statusCell = rows[i].getElementsByTagName("td")[5];
            
            const jenisText = jenisCell ? jenisCell.textContent.toLowerCase() : "";
            const nosuText = nosuCell ? nosuCell.textContent.toLowerCase() : "";
            const perihalText = nosuCell ? nosuCell.textContent.toLowerCase() : "";
            const cabangText = cabangCell ? cabangCell.textContent.toLowerCase() : "";
            const statusText = statusCell ? statusCell.textContent.toLowerCase() : "";
            

            if (jenisText.includes(searchInput) || nosuText.includes(searchInput) || perihalText.includes(searchInput) || cabangText.includes(searchInput)|| statusText.includes(searchInput) ) {
                rows[i].style.display = "";
            } else {
                rows[i].style.display = "none";
            }
        }
    }
</script>


<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
