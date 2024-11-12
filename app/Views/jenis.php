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
    <h4 class="card-title">JENIS SURAT</h4>
    <div class="d-flex align-items-center">
        <div class="input-group">
            <input type="text" class="form-control" id="searchInput" placeholder="Cari Jenis Surat...">
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
                                        <th>Jenis</th>
                                        
                                       
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
                                                <td><?= $gou->nama_jenis ?></td>
                                               
                                               

                                                <td>
                                                    <div class="dropdown">
                                                        <button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="actionMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                                            Aksi
                                                        </button>
                                                        <ul class="dropdown-menu" aria-labelledby="actionMenu">
                                                            <li>
                                                                <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#editUserModal" data-id="<?= $gou->id_jenis ?>"  data-jenis="<?= $gou->nama_jenis ?>">
                                                                    Edit
                                                                </button>
                                                            </li>
                                                            <li><a class="dropdown-item" href="<?= base_url('home/hapusjenis/' . $gou->id_jenis) ?>">Hapus</a></li>

                                                            <?php if (isset($backup_jenis[$gou->id_jenis])) : ?>
                                                                <li>
                                                                    <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#undoEditModal" data-id="<?= $backup_jenis[$gou->id_jenis]->id_jenis ?>"  data-jenis="<?= $backup_jenis[$gou->id_jenis]->nama_jenis ?>" >
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
                        <h5 class="modal-title" id="addUserModalLabel">Tambah Jenis Surat</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="<?= base_url('home/aksi_tambah_jenis') ?>" method="POST" enctype="multipart/form-data">
                            <div class="row">
                               
                                <div class="col-md-4">
                                    <label>Nama Jenis</label>
                                </div>
                                <div class="col-md-8 form-group">
                                    <input type="text" class="form-control" name="jenis" placeholder="Jenis Surat">
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
                    <h5 class="modal-title" id="editUserModalLabel">Edit Jenis Surat</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editUserForm" action="<?= base_url('home/aksi_edit_jenis') ?>" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            
                            <div class="col-md-4">
                                <label>Nama Jenis</label>
                            </div>
                            <div class="col-md-8 form-group">
                                <input type="text" id="editjenis" class="form-control" name="jenis" placeholder="Jenis Surat">
                            </div>
                           
                                         
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
        <h5 class="modal-title" id="undoEditModalLabel">Undo Edit Jenis Surat</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="undoEditForm" action="<?= base_url('home/aksi_unedit_jenis') ?>" method="POST" enctype="multipart/form-data">
            <input type="hidden" id="undoUserId" name="id">
            <div class="row">
                
                <div class="col-md-4">
                    <label>Nama Jenis</label>
                </div>
                <div class="col-md-8 form-group">
                    <input type="text" id="undojenis" class="form-control disabled-field" name="jenis" placeholder="Jenis Surat">
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
       
        

        var modal = document.getElementById('editUserModal');
        modal.querySelector('#editId').value = id;
        modal.querySelector('#editjenis').value = jenis;
       
        
        var modal = document.getElementById('undoEditModal');
        modal.querySelector('#undoUserId').value = id;
        modal.querySelector('#undojenis').value = jenis;
       
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
            const penerimaCell = rows[i].getElementsByTagName("td")[1];
            const nosuCell = rows[i].getElementsByTagName("td")[2];
            const perihalCell = rows[i].getElementsByTagName("td")[3];
            
            const penerimaText = penerimaCell ? penerimaCell.textContent.toLowerCase() : "";
            const nosuText = nosuCell ? nosuCell.textContent.toLowerCase() : "";
            const perihalText = nosuCell ? nosuCell.textContent.toLowerCase() : "";
            

            if (penerimaText.includes(searchInput) || nosuText.includes(searchInput) || perihalText.includes(searchInput) ) {
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
