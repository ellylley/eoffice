<div class="main-content container-fluid">
    <div class="page-title">
        <div class="row">
        </div>
    </div>

    <section id="dokumen-detail">
        <div class="row">
            <?php foreach ($jenis as $j): ?>
                <div class="col-12">
                    <h4>Dokumen: <?= $j->nama_jenis ?></h4>
                </div>
            <?php endforeach; ?>

            <?php if ($id_jenis == 3 && !empty($cuti)): ?>
                <!-- Tabel untuk Cuti -->
                <h5>Data <?= $j->nama_jenis ?></h5>
                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <th>Nama</th>
                            <th>NIK</th>
                            <th>Cabang</th>
                            <th>Tanggal Pengajuan</th>
                            <th>Jenis Cuti</th>
                            <th>Tanggal Mulai</th>
                            <th>Tanggal Terakhir</th>
                            <th>Total Hari</th>
                            <th>Tanggal Kembali</th>
                            <th>Ambil Alih</th>
                            <th>Alamat Cuti</th>
                            <th>Alasan Cuti</th>
                            <th>Jatah Cuti</th>
                            <th>Cuti Diajukan</th>
                            <th>Sisa Cuti</th>
                            <th>Catatan</th>
                            <th>Status</th>
                        </tr>
                        <?php foreach ($cuti as $c): ?>
                            <tr>
                                <td><?= $c->nama_cuti ?></td>
                                <td><?= $c->nik_cuti ?></td>
                                <td><?= $c->cabang ?></td>
                                <td><?= $c->tgl_pengajuan ?></td>
                                <td><?= $c->jenis_cuti ?></td>
                                <td><?= $c->tgl_mulai ?></td>
                                <td><?= $c->tgl_terakhir ?></td>
                                <td><?= $c->total_hari ?></td>
                                <td><?= $c->tgl_kembali ?></td>
                                <td><?= $c->ambil_alih ?></td>
                                <td><?= $c->alamat_cuti ?></td>
                                <td><?= $c->alasan_cuti ?></td>
                                <td><?= $c->jatah_cuti ?></td>
                                <td><?= $c->cuti_diajukan ?></td>
                                <td><?= $c->sisa_cuti ?></td>
                                <td><?= $c->catatan ?></td>
                                <td>
                                    <?php
                                        if ($c->issetuju == 1) {
                                            echo "Disetujui";
                                        } elseif ($c->issetuju == 2) {
                                            echo "Ditolak";
                                        } else {
                                            echo "Menunggu Persetujuan";
                                        }
                                    ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </table>
                </div>
            <?php elseif ($id_jenis == 4 && !empty($keterlambatan)): ?>
                <!-- Tabel untuk Keterlambatan -->
                <h5>Data <?= $j->nama_jenis ?></h5>
                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <th>Nama</th>
                            <th>Bagian</th>
                            <th>Tanggal</th>
                            <th>Jam Datang</th>
                            <th>Jumlah Telat</th>
                            <th>Alasan Telat</th>
                        </tr>
                        <?php foreach ($keterlambatan as $k): ?>
                            <tr>
                                <td><?= $k->nama ?></td>
                                <td><?= $k->bagian ?></td>
                                <td><?= $k->tgl ?></td>
                                <td><?= $k->jam_datang ?></td>
                                <td><?= $k->jumlah_telat ?></td>
                                <td><?= $k->alasan_telat ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </table>
                </div>
            <?php elseif ($id_jenis == 5 && !empty($surat_keluar)): ?>
                <!-- Tabel untuk Surat Keluar -->
                <h5>Data <?= $j->nama_jenis ?></h5>
                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <th>Nomor Surat</th>
                            <th>Tanggal Kirim</th>
                            <th>Perihal</th>
                            <th>Penerima</th>
                            <th>Lampiran</th>
                        </tr>
                        <?php foreach ($surat_keluar as $sk): ?>
                            <tr>
                                <td><?= $sk->nomor_surat ?></td>
                                <td><?= $sk->tgl_kirim ?></td>
                                <td><?= $sk->perihal ?></td>
                                <td><?= $sk->penerima ?></td>
                                <td>
                                    <?php if (!empty($sk->lampiran)): ?>
                                        <a href="<?= '/lampiran/' . basename($sk->lampiran) ?>" target="_blank">Lihat Lampiran</a>
                                    <?php else: ?>
                                        Tidak Ada Lampiran
                                    <?php endif; ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </table>
                </div>
            <?php elseif ($id_jenis == 6 && !empty($surat_masuk)): ?>
                <!-- Tabel untuk Surat Masuk -->
                <h5>Data <?= $j->nama_jenis ?></h5>
                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <th>Nomor Surat</th>
                            <th>Tanggal Terima</th>
                            <th>Perihal</th>
                            <th>Pengirim</th>
                            <th>Lampiran</th>
                        </tr>
                        <?php foreach ($surat_masuk as $sm): ?>
                            <tr>
                                <td><?= $sm->nomor_surat ?></td>
                                <td><?= $sm->tgl_terima ?></td>
                                <td><?= $sm->perihal ?></td>
                                <td><?= $sm->pengirim ?></td>
                                <td>
                                    <?php if (!empty($sm->lampiran)): ?>
                                        <a href="<?= '/lampiran/' . basename($sm->lampiran) ?>" target="_blank">Lihat Lampiran</a>
                                    <?php else: ?>
                                        Tidak Ada Lampiran
                                    <?php endif; ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </table>
                </div>
            <?php else: ?>
                <!-- Default Tabel -->
                <h5>Data <?= $j->nama_jenis ?></h5>
                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <th>Nomor Surat</th>
                            <th>Perihal</th>
                            <th>Lampiran</th>
                        </tr>
                        <?php foreach ($surat_surat as $ss): ?>
                            <tr>
                                <td><?= $ss->nomor_surat ?></td>
                                <td><?= $ss->perihal ?></td>
                                <td>
                                    <?php if (!empty($ss->lampiran)): ?>
                                        <a href="<?= '/lampiran/' . basename($ss->lampiran) ?>" target="_blank">Lihat Lampiran</a>
                                    <?php else: ?>
                                        Tidak Ada Lampiran
                                    <?php endif; ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </table>
                </div>
            <?php endif; ?>
        </div>
    </section>
</div>

<style>
    .table-responsive {
        overflow-x: auto; /* Enable horizontal scroll */
        -webkit-overflow-scrolling: touch; /* Smooth scrolling for mobile */
        background-color: #f8f9fa; /* Optional: Set background color */
        border: 1px solid #ddd; /* Optional: Add border for better structure */
        padding: 10px; /* Optional: Add padding */
    }
</style>
