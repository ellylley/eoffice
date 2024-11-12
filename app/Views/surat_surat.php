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
    <h4 class="card-title">SURAT</h4>
    <div class="d-flex align-items-center">
        <div class="input-group">
            <input type="text" class="form-control" id="searchInput" placeholder="Cari Surat...">
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
                        
                                        <th>Nomor Surat</th>
                                        <th>Perihal</th>
                                       
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
                    
                                                <td><?= $gou->nomor_surat ?></td>
                                                <td><?= $gou->perihal?></td>
                                               

                                                <td>
                                                    <div class="dropdown">
                                                        <button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="actionMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                                            Aksi
                                                        </button>
                                                        <ul class="dropdown-menu" aria-labelledby="actionMenu">
                                                            <li>
                                                                <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#editUserModal" data-id="<?= $gou->id_surat ?>"data-perihal="<?= $gou->perihal  ?>" data-lampiran="<?= $gou->lampiran  ?>" data-jenis="<?= $gou->id_jenis ?>" data-nosurat="<?= $gou->nomor_surat ?>" >
                                                                    Edit
                                                                </button>
                                                            </li>
                                                            <li><a class="dropdown-item" href="<?= base_url('home/hapussurat/' . $gou->id_surat) ?>">Hapus</a></li>

                                                            <?php if (isset($backup_surat[$gou->id_surat])) : ?>
                                                                <li>
                                                                    <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#undoEditModal" data-id="<?= $backup_surat[$gou->id_surat]->id_surat ?>"  data-perihal="<?= $backup_surat[$gou->id_surat]->perihal ?>" data-lampiran="<?= $backup_surat[$gou->id_surat]->lampiran ?>" data-jenis="<?= $backup_surat[$gou->id_surat]->id_jenis ?>"data-nosurat="<?= $backup_surat[$gou->id_surat]->nomor_surat ?>">
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
                        <h5 class="modal-title" id="addUserModalLabel">Tambah Surat</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="<?= base_url('home/aksi_tambah_surat') ?>" method="POST" enctype="multipart/form-data">
                            <div class="row">
                               
                            <div class="col-md-4">
    <label>Jenis Surat</label>
</div>
<div class="col-md-8 form-group">
    <select class="form-control" name="jenis">
    <option value="">Pilih</option>
                                    <?php foreach($jenis as $gou){ ?>
                                        <option value="<?=$gou->id_jenis?>"><?=$gou->nama_jenis?></option>
                                    <?php } ?>
    </select>
</div>


                                <div class="col-md-4">
                                    <label>Nomor Surat</label>
                                </div>
                                <div class="col-md-8 form-group">
                                    <input type="text" class="form-control" name="nomor" placeholder="Nomor Surat">
                                </div>
                                <div class="col-md-4">
                                    <label>Perihal</label>
                                </div>
                                <div class="col-md-8 form-group">
                                    <textarea class="form-control" name="perihal"  rows="5"  placeholder="Perihal"></textarea>
                                </div>
                                
                                <div class="col-md-4">
                                    <label>Lampiran</label>
                                </div>
                                <div class="col-md-8 form-group">
                                    <input type="file" class="form-control" name="lampiran" placeholder="Lampiran">
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
                    <h5 class="modal-title" id="editUserModalLabel">Edit Surat</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editUserForm" action="<?= base_url('home/aksi_edit_surat') ?>" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            
                        <div class="col-md-4">
    <label>Jenis Dokumen</label>
</div>
<div class="col-md-8 form-group">
    <select id="editjenis" class="form-control" name="jenis">
    <option value="">Pilih</option>
                                    <?php foreach($jenis as $gou){ ?>
                                        <option value="<?=$gou->id_jenis?>"><?=$gou->nama_jenis?></option>
                                    <?php } ?>
    </select>
</div>
                            <div class="col-md-4">
                                <label>Nomor Surat</label>
                            </div>
                            <div class="col-md-8 form-group">
                                <input type="text" id="editnomor" class="form-control" name="nomor" placeholder="Nomor Surat">
                            </div>

                            <div class="col-md-4">
                                <label>Perihal</label>
                            </div>
                            <div class="col-md-8 form-group">
                                <textarea id="editperihal" class="form-control" name="perihal"  rows="5" placeholder="Perihal"></textarea>
                            </div>
                            <div class="col-md-4">
    <label>Lampiran</label>
</div>
<div class="col-md-8 form-group">
    <input type="file" id="editlampiran" class="form-control" name="lampiran" placeholder="Lampiran">
    <div id="existingFileContainer" class="mt-2">
        <!-- Tautan file akan ditampilkan di sini jika ada file -->
    </div>
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
        <h5 class="modal-title" id="undoEditModalLabel">Undo Edit Surat</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="undoEditForm" action="<?= base_url('home/aksi_unedit_surat') ?>" method="POST" enctype="multipart/form-data">
            <input type="hidden" id="undoUserId" name="id">
            <div class="row">
                
                <div class="col-md-4">
                    <label>Jenis Dokumen</label>
                </div>
                <div class="col-md-8 form-group">
    <select id="undojenis" class="form-control disabled-field" name="jenis">
    <option value="">Pilih</option>
                                    <?php foreach($jenis as $gou){ ?>
                                        <option value="<?=$gou->id_jenis?>"><?=$gou->nama_jenis?></option>
                                    <?php } ?>
    </select>
</div>
                 <div class="col-md-4">
                    <label>Nomor Surat</label>
                </div>
                <div class="col-md-8 form-group">
                    <input type="text" id="undonomor" class="form-control disabled-field" name="nomor" placeholder="Nomor Surat">
                </div>
                <div class="col-md-4">
                    <label>Perihal</label>
                </div>
                <div class="col-md-8 form-group">
                    <textarea id="undoperihal" class="form-control disabled-field" name="perihal"  rows="5" placeholder="Perihal"></textarea>
                </div>

                <div class="col-md-4">
    <label>Lampiran</label>
</div>
<div class="col-md-8 form-group">
    <div id="existingFileContainerundo"></div> <!-- Menampilkan link file yang ada -->
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
        var jenis = button.getAttribute('data-jenis');
        var perihal = button.getAttribute('data-perihal');
        var lampiran = button.getAttribute('data-lampiran');
        var nomor = button.getAttribute('data-nosurat');
        

        var modal = document.getElementById('editUserModal');
        modal.querySelector('#editId').value = id;
        modal.querySelector('#editjenis').value = jenis;
        modal.querySelector('#editperihal').value = perihal;
        modal.querySelector('#editnomor').value = nomor;
        

        var existingFileContainer = modal.querySelector('#existingFileContainer');
    existingFileContainer.innerHTML = ''; // Kosongkan elemen saat modal dibuka

    if (lampiran) {
        var fileUrl = "<?= base_url() ?>" + '/' + lampiran;
        existingFileContainer.innerHTML = `<a href="${fileUrl}" target="_blank">Lihat File</a>`;
    }

        var modal = document.getElementById('undoEditModal');
        modal.querySelector('#undoUserId').value = id;
        modal.querySelector('#undojenis').value = jenis;
        modal.querySelector('#undoperihal').value = perihal;
        modal.querySelector('#undonomor').value = nomor;
        var existingFileContainerundo = modal.querySelector('#existingFileContainerundo');
    existingFileContainerundo.innerHTML = ''; // Kosongkan elemen saat modal dibuka

    if (lampiran) {
    var fileUrl = "<?= base_url() ?>" + '/' + lampiran;
    existingFileContainerundo.innerHTML = `<a href="${fileUrl}" target="_blank">Lihat File</a>`;
} else {
    existingFileContainerundo.innerHTML = 'Tidak memiliki PDF'; // Tampilkan pesan jika tidak ada file
}

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
