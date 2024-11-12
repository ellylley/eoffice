<div class="main-content container-fluid">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-12" style="text-align: center;">
                <h3>DOKUMEN</h3>
            </div>
        </div>
    </div>

    <!-- Basic card section start -->
    <section id="content-types">
        <div class="row">
            <?php 
            $no = 1; 
            foreach($elly as $gou): 
                if ($gou->isdelete == 0): 
            ?>
                <div class="col-xl-3 col-md-6 col-sm-12">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <h4 class="card-title"><?= $gou->nama_jenis ?></h4> 
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between">
                            <!-- Menampilkan tombol "Akses" hanya untuk level 1 -->
                            <?php if (session()->get('level') == 1): ?>
                                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#aksesModal<?= $gou->id_jenis ?>">Akses</button>
                            <?php endif; ?>
                            <a href="<?= site_url('home/detail_dokumen/' . $gou->id_jenis) ?>" class="btn btn-light-primary">Read More</a>
                        </div>
                    </div>
                </div>

                <!-- Modal untuk checkbox level akses -->
                <div class="modal fade" id="aksesModal<?= $gou->id_jenis ?>" tabindex="-1" role="dialog" aria-labelledby="aksesModalLabel<?= $gou->id_jenis ?>" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="aksesModalLabel<?= $gou->id_jenis ?>">Akses Level untuk <?= $gou->nama_jenis ?></h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="<?= site_url('home/save_access_level') ?>" method="post">
                                <div class="modal-body">
                                    <input type="hidden" name="id_jenis" value="<?= $gou->id_jenis ?>">
                                    
                                    <!-- Checkbox untuk Yayasan -->
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="access_level[]" value="2" id="yayasan<?= $gou->id_jenis ?>"
                                            <?= in_array(2, array_column($gou->access_levels, 'level')) ? 'checked' : '' ?>>
                                        <label class="form-check-label" for="yayasan<?= $gou->id_jenis ?>">Yayasan</label>
                                    </div>

                                    <!-- Checkbox untuk Kepala Sekolah -->
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="access_level[]" value="3" id="kepsek<?= $gou->id_jenis ?>"
                                            <?= in_array(3, array_column($gou->access_levels, 'level')) ? 'checked' : '' ?>>
                                        <label class="form-check-label" for="kepsek<?= $gou->id_jenis ?>">Kepala Sekolah</label>
                                    </div>

                                    <!-- Checkbox untuk Wakil Kepala Sekolah -->
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="access_level[]" value="4" id="wakil<?= $gou->id_jenis ?>"
                                            <?= in_array(4, array_column($gou->access_levels, 'level')) ? 'checked' : '' ?>>
                                        <label class="form-check-label" for="wakil<?= $gou->id_jenis ?>">Wakil Kepala Sekolah</label>
                                    </div>

                                    <!-- Checkbox untuk Kesiswaan -->
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="access_level[]" value="5" id="kesiswaan<?= $gou->id_jenis ?>"
                                            <?= in_array(5, array_column($gou->access_levels, 'level')) ? 'checked' : '' ?>>
                                        <label class="form-check-label" for="kesiswaan<?= $gou->id_jenis ?>">Kesiswaan</label>
                                    </div>

                                    <!-- Checkbox untuk HRD -->
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="access_level[]" value="6" id="hrd<?= $gou->id_jenis ?>"
                                            <?= in_array(6, array_column($gou->access_levels, 'level')) ? 'checked' : '' ?>>
                                        <label class="form-check-label" for="hrd<?= $gou->id_jenis ?>">HRD</label>
                                    </div>

                                      <!-- Checkbox untuk Guru -->
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="access_level[]" value="7" id="guru<?= $gou->id_jenis ?>"
                                            <?= in_array(7, array_column($gou->access_levels, 'level')) ? 'checked' : '' ?>>
                                        <label class="form-check-label" for="guru<?= $gou->id_jenis ?>">Guru</label>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Simpan</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php 
                endif; 
                $no++; 
            endforeach; 
            ?>
        </div>
    </section>
</div>
