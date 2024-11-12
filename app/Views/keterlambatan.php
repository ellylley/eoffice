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
    <h4 class="card-title">KETERLAMBATAN KEHADIRAN</h4>
    <div class="d-flex align-items-center">
        <div class="input-group">
            <input type="text" class="form-control" id="searchInput" placeholder="Cari Keterlambatan Kehadiran...">
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
                                        <th>Bagian</th>
                                       
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
                    
                                                <td><?= $gou->nama ?></td>
                                                <td><?= $gou->nik?></td>
                                                <td><?= $gou->bagian?></td>
                                               

                                                <td>
                                                    <div class="dropdown">
                                                        <button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="actionMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                                            Aksi
                                                        </button>
                                                        <ul class="dropdown-menu" aria-labelledby="actionMenu">
                                                            <li>
                                                                <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#editUserModal" 
                                                                data-id="<?= $gou->id_keterlambatan ?>"
                                                                data-nama="<?= $gou->nama  ?>" 
                                                                data-nik="<?= $gou->nik  ?>" 
                                                                data-bagian="<?= $gou->bagian ?>"
                                                                data-tgl="<?= $gou->tgl ?>"
                                                                data-datang="<?= $gou->jam_datang ?>" 
                                                                data-jumlah="<?= $gou->jumlah_telat ?>" 
                                                                data-alasan="<?= $gou->alasan_telat ?>" >
                                                                    Edit
                                                                </button>
                                                            </li>
                                                            <li><a class="dropdown-item" href="<?= base_url('home/hapustelat/' . $gou->id_keterlambatan) ?>">Hapus</a></li>

                                                            <?php if (isset($backup_keterlambatan[$gou->id_keterlambatan])) : ?>
                                                                <li>
                                                                    <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#undoEditModal" 
                                                                    data-id="<?= $backup_keterlambatan[$gou->id_keterlambatan]->id_keterlambatan ?>"
                                                                    data-nama="<?= $backup_keterlambatan[$gou->id_keterlambatan]->nama  ?>" 
                                                                    data-nik="<?= $backup_keterlambatan[$gou->id_keterlambatan]->nik  ?>" 
                                                                    data-bagian="<?= $backup_keterlambatan[$gou->id_keterlambatan]->bagian ?>"
                                                                    data-tgl="<?= $backup_keterlambatan[$gou->id_keterlambatan]->tgl ?>"
                                                                    data-datang="<?= $backup_keterlambatan[$gou->id_keterlambatan]->jam_datang ?>" 
                                                                    data-jumlah="<?= $backup_keterlambatan[$gou->id_keterlambatan]->jumlah_telat ?>" 
                                                                    data-alasan="<?= $backup_keterlambatan[$gou->id_keterlambatan]->alasan_telat ?>" >
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

        
       <!-- Add User Modal -->
       <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addUserModalLabel">Tambah</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="<?= base_url('home/aksi_tambah_keterlambatan') ?>" method="POST" enctype="multipart/form-data">
                            <div class="row">
                               
                           

                                
                                
                                <div class="col-md-4">
                                    <label>Bagian</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="bagian" class="form-control" name="bagian" placeholder="Bagian" >
                                </div>
                                <div class="col-md-4">
                                    <label>Hari/Tanggal</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="tanggal" class="form-control" name="tanggal" placeholder="Hari/Tanggal" >
                                </div>
                                <div class="col-md-4">
                                    <label>Jam Kedatangan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="time" id="datang" class="form-control" name="datang" placeholder="Jam Datang" >
                                </div>
                                <div class="col-md-4">
                                    <label>Jumlah Keterlambatan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="jumlah" class="form-control" name="jumlah" placeholder="Jumlah Keterlambatan...........Jam/Menit" readonly >
                                </div>
                                <div class="col-md-4">
                                    <label>Alasan Keterlambatan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                    <textarea class="form-control" id="alasan" name="alasan"  rows="5"  placeholder="Alasan Keterlambatan"></textarea>
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
                    <form id="editUserForm" action="<?= base_url('home/aksi_edit_keterlambatan') ?>" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            
                        

                                
                                
                                <div class="col-md-4">
                                    <label>Bagian</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="editbagian" class="form-control" name="bagian" placeholder="Bagian" >
                                </div>
                                <div class="col-md-4">
                                    <label>Hari/Tanggal</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="edittanggal" class="form-control" name="tanggal" placeholder="Hari/Tanggal" >
                                </div>
                                <div class="col-md-4">
                                    <label>Jam Kedatangan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="time" id="editdatang" class="form-control" name="datang" placeholder="Jam Datang" >
                                </div>
                                <div class="col-md-4">
                                    <label>Jumlah Keterlambatan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="editjumlah" class="form-control" name="jumlah" placeholder="Jumlah Keterlambatan...........Jam/Menit" readonly>
                                </div>
                                <div class="col-md-4">
                                    <label>Alasan Keterlambatan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                    <textarea class="form-control" id="editalasan" name="alasan"  rows="5"  placeholder="Alasan Keterlambatan"></textarea>
                                </div>
                            

                           
                            <input type="hidden" id="editnosurat" name="nomor_surat">
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
        <form id="undoEditForm" action="<?= base_url('home/aksi_unedit_keterlambatan') ?>" method="POST" enctype="multipart/form-data">
            <input type="hidden" id="undoUserId" name="id">
            <div class="row">
                
                
                                
                                <div class="col-md-4">
                                    <label>Bagian</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="undobagian" class="form-control disabled-field" name="bagian" placeholder="Bagian" >
                                </div>
                                <div class="col-md-4">
                                    <label>Hari/Tanggal</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="date" id="undotanggal" class="form-control disabled-field" name="tanggal" placeholder="Hari/Tanggal" >
                                </div>
                                <div class="col-md-4">
                                    <label>Jam Kedatangan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="time" id="undodatang" class="form-control disabled-field" name="datang" placeholder="Jam Datang" >
                                </div>
                                <div class="col-md-4">
                                    <label>Jumlah Keterlambatan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                <input type="text" id="undojumlah" class="form-control disabled-field" name="jumlah" placeholder="Jumlah Keterlambatan...........Jam/Menit" >
                                </div>
                                <div class="col-md-4">
                                    <label>Alasan Keterlambatan</label>
                                </div>
                                <div class="col-md-8 form-group">
                                    <textarea class="form-control disabled-field" id="undoalasan" name="alasan"  rows="5"  placeholder="Alasan Keterlambatan"></textarea>
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
    // Script asli yang sudah ada sebelumnya untuk show.bs.modal
    document.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;
        var id = button.getAttribute('data-id');
        var bagian = button.getAttribute('data-bagian');
        var tgl = button.getAttribute('data-tgl');
        var datang = button.getAttribute('data-datang');
        var jumlah = button.getAttribute('data-jumlah');
        var alasan = button.getAttribute('data-alasan');
        

        var modal = document.getElementById('editUserModal');
        modal.querySelector('#editId').value = id;
        modal.querySelector('#editbagian').value = bagian;
        modal.querySelector('#edittanggal').value = tgl;
        modal.querySelector('#editdatang').value = datang;
        modal.querySelector('#editjumlah').value = jumlah;
        modal.querySelector('#editalasan').value = alasan;
       

        var modal = document.getElementById('undoEditModal');
        modal.querySelector('#undoUserId').value = id;
        modal.querySelector('#undobagian').value = bagian;
        modal.querySelector('#undotanggal').value = tgl;
        modal.querySelector('#undodatang').value = datang;
        modal.querySelector('#undojumlah').value = jumlah;
        modal.querySelector('#undoalasan').value = alasan;
        

    });

    
    document.addEventListener("DOMContentLoaded", function () {
    const datangInput = document.getElementById("datang");
    const jumlahTelatInput = document.getElementById("jumlah");

    datangInput.addEventListener("input", function () {
        const datangTime = datangInput.value;
        const limitTime = "07:00";
        
        if (datangTime > limitTime) {
            const datangDate = new Date(`1970-01-01T${datangTime}:00`);
            const limitDate = new Date(`1970-01-01T${limitTime}:00`);
            
            const difference = datangDate - limitDate;
            const hoursLate = Math.floor(difference / (1000 * 60 * 60));
            const minutesLate = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));

            jumlahTelatInput.value = `${hoursLate > 0 ? hoursLate + ' jam ' : ''}${minutesLate} menit`;
        } else {
            jumlahTelatInput.value = "Tepat Waktu";
        }
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const datangEditInput = document.getElementById("editdatang");
    const jumlahTelatEditInput = document.getElementById("editjumlah");

    datangEditInput.addEventListener("input", function () {
        const datangTime = datangEditInput.value;
        const limitTime = "07:00";
        
        if (datangTime > limitTime) {
            const datangDate = new Date(`1970-01-01T${datangTime}:00`);
            const limitDate = new Date(`1970-01-01T${limitTime}:00`);
            
            const difference = datangDate - limitDate;
            const hoursLate = Math.floor(difference / (1000 * 60 * 60));
            const minutesLate = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));

            jumlahTelatEditInput.value = `${hoursLate > 0 ? hoursLate + ' jam ' : ''}${minutesLate} menit`;
        } else {
            jumlahTelatEditInput.value = "Tepat Waktu";
        }
    });
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
            
            const jenisText = jenisCell ? jenisCell.textContent.toLowerCase() : "";
            const nosuText = nosuCell ? nosuCell.textContent.toLowerCase() : "";
            const perihalText = nosuCell ? nosuCell.textContent.toLowerCase() : "";
            

            if (jenisText.includes(searchInput) || nosuText.includes(searchInput) || perihalText.includes(searchInput) ) {
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
