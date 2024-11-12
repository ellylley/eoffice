<?php

namespace App\Controllers;

use Codeigniter\Controllers;
use App\models\M_office;
use CodeIgniter\Session\Session;
use Dompdf\Dompdf;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use App\Models\LevelPermissionModel;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use CURLFile;
// Tambahkan namespace Twilio di bagian atas file PHP Anda
use Twilio\Rest\Client;

class Home extends BaseController
{
    public function index()
    {
        if (session()->get('level')>0){
            $model= new M_office();
            $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman dashboard'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
       
            $where=array(
                'id_setting'=> 1
              );
              $data['setting'] = $model->getWhere('setting',$where);
              $data['currentMenu'] = 'dashboard';
        echo view('header', $data);
        echo view('menu', $data);
        echo view('dashboard', $data);
        echo view('footer');
    }else{
        return redirect()->to('home/login');
 
    } 
    }

    public function login()
    {
        $model= new M_office();
        $where=array(
            'id_setting'=> 1
          );
          $data['setting'] = $model->getWhere('setting',$where);
        echo view('header', $data);
        echo view('login', $data);

} 
public function aksilogin()
{
    $name = $this->request->getPost('nama');
    $pw = $this->request->getPost('password');
    $captchaResponse = $this->request->getPost('g-recaptcha-response');
    $backupCaptcha = $this->request->getPost('backup_captcha');
    
    $secretKey = '6LdLhiAqAAAAAPxNXDyusM1UOxZZkC_BLCgfyoQf'; // Ganti dengan secret key Anda yang sebenarnya
    $recaptchaSuccess = false;

    $captchaModel = new M_office();

    // Cek koneksi internet
    if ($this->isInternetAvailable()) {
        // Verifikasi reCAPTCHA
        $response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$secretKey&response=$captchaResponse");
        $responseKeys = json_decode($response, true);
        $recaptchaSuccess = $responseKeys["success"];
    }
    
    if ($recaptchaSuccess) {
        // reCAPTCHA berhasil
        $where = [
            'nama_user' => $name,
            'password' => md5($pw),
        ];

        $model = new M_office();
        $check = $model->getWhere('user', $where);

        if ($check) {
            session()->set('id', $check->id_user);
            session()->set('nama', $check->nama_user);
            session()->set('nik', $check->nik);
            session()->set('level', $check->level);
            session()->set('foto', $check->foto);
            session()->set('editmodul', $check->editmodul);
            return redirect()->to('home');
        } else {
            return redirect()->to('home/login')->with('error', 'Invalid username or password.');
        }
    } else {
        // Validasi CAPTCHA offline
        $storedCaptcha = session()->get('captcha_code'); // Retrieve stored CAPTCHA from session
        
        if ($storedCaptcha !== null) {
            if ($storedCaptcha === $backupCaptcha) {
                // CAPTCHA valid
                $where = [
                    'nama_user' => $name,
                    'password' => md5($pw),
                ];

                $model = new M_office();
                $check = $model->getWhere('user', $where);

                if ($check) {
                    session()->set('id', $check->id_user);
                    session()->set('nama', $check->nama_user);
                    session()->set('nik', $check->nik);
                    session()->set('level', $check->level);
                    session()->set('foto', $check->foto);
                    session()->set('editmodul', $check->editmodul);

                    return redirect()->to('home');
                } else {
                    return redirect()->to('home/login')->with('error', 'Invalid username or password.');
                }
            } else {
                // CAPTCHA tidak valid
                return redirect()->to('home/login')->with('error', 'Invalid CAPTCHA.');
            }
        } else {
            return redirect()->to('home/login')->with('error', 'CAPTCHA session is not set.');
        }
    }
}




    public function generateCaptcha()
{
    $code = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 6);

    // Store the CAPTCHA code in the session
    session()->set('captcha_code', $code);

    // Generate the image
    $image = imagecreatetruecolor(120, 40);
    $bgColor = imagecolorallocate($image, 255, 255, 255);
    $textColor = imagecolorallocate($image, 0, 0, 0);

    imagefilledrectangle($image, 0, 0, 120, 40, $bgColor);
    imagestring($image, 5, 10, 10, $code, $textColor);

    // Set the content type header - in this case image/png
    header('Content-Type: image/png');

    // Output the image
    imagepng($image);

    // Free up memory
    imagedestroy($image);
}

private function isInternetAvailable()
{
    $connected = @fsockopen("www.google.com", 80);
    if ($connected) {
        fclose($connected);
        return true;
    }
    return false;
}

public function logout()
        {
           session()->destroy();
            return redirect()->to('Home/login');
    
        }

        //log

public function log() 
{
    if (session()->get('level') == 0 || session()->get('level') == 1) {

        $model = new M_office();

        // Menambahkan log aktivitas ketika user mengakses halaman log
        $id_user = session()->get('id');
        $activity = 'Mengakses halaman log aktivitas';
        $this->addLog($id_user, $activity);
        
        // Ambil data pencarian dari input GET
        $id_user_search = $this->request->getGet('id_user');
        $nama_user_search = $this->request->getGet('nama_user');
        $activity_search = $this->request->getGet('activity');
        $timestamp_search = $this->request->getGet('timestamp');

        // Mengambil data log aktivitas dengan filter
        $data['logs'] = $model->searchActivityLogs($id_user_search, $nama_user_search, $activity_search, $timestamp_search);
        
        // Menambahkan data pencarian ke array data
        $data['id_user'] = $id_user_search;
        $data['nama_user'] = $nama_user_search;
        $data['activity'] = $activity_search;
        $data['timestamp'] = $timestamp_search;

        // Ambil setting seperti biasa
        $where = array('id_setting' => 1);
        $data['setting'] = $model->getWhere('setting', $where);

        $data['currentMenu'] = 'log';
        echo view('header', $data);
        echo view('menu', $data);
        echo view('log', $data);
        echo view('footer');
    } else {
        return redirect()->to('home/error');
    }
}


    public function addLog($id_user, $activity)
{
    $model = new M_office(); // Gunakan model M_kedaikopi
    $id_user = session()->get('id');
    $data = [
        'id_user' => $id_user,
        'activity' => $activity,
        'timestamp' => date('Y-m-d H:i:s'),
    ];
    $model->tambah('activity_log', $data); // Pastikan 'activity_log' adalah nama tabel yang benar
}

//setting

public function setting()
{
    // Memeriksa level akses user
    if (session()->get('level') == 0||session()->get('level') == 1 ) {
      
        $model = new M_office();
        
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman setting'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
       

    
        $id = 1; // id_toko yang diinginkan

        // Menyusun kondisi untuk query
        $where = array('id_setting' => $id);

        // Mengambil data dari tabel 'toko' berdasarkan kondisi
        $data['user'] = $model->getWhere('setting', $where);
 
        // Memuat view
        $where=array(
          'id_setting'=> 1
        );
        $data['setting'] = $model->getWhere('setting',$where);
        $data['currentMenu'] = 'setting'; 
        echo view('header', $data);
        echo view('menu', $data);
        echo view('setting', $data);
        echo view('footer', $data);
    } else {
        return redirect()->to('home/error');
    } 
}

public function aksisetting()
{
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengubah data setting'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
      
    
       
    $nama = $this->request->getPost('nama');
    $alamat = $this->request->getPost('alamat');
    $nohp = $this->request->getPost('nohp');
    $sekolah = $this->request->getPost('sekolah');
    $id = $this->request->getPost('id');
    $uploadedFile = $this->request->getFile('foto');

    $where = array('id_setting' => $id);

    $isi = array(
        'nama_setting' => $nama,
        'alamat' => $alamat,
        'nohp' => $nohp,
        'nama_sekolah'=> $sekolah,
        'updated_at' => date('Y-m-d H:i:s'), // Waktu saat produk dibuat
        'updated_by' => $id_user // ID user yang login
    );

    // Cek apakah ada file yang diupload
    if ($uploadedFile && $uploadedFile->isValid() && !$uploadedFile->hasMoved()) {
        $foto = $uploadedFile->getName();
        $model->upload($uploadedFile); // Mengupload file baru
        $isi['logo'] = $foto; // Menambahkan nama file baru ke array data
    }

    $model->edit('setting', $isi, $where);

    return redirect()->to('home/setting/'.$id);
}


//user

public function user()
{
    if (session()->get('level') == 0 || session()->get('level') == 1) {

        $model = new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman user'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);

     
        $data['elly'] = $model->tampil('user', 'id_user');
        $data['backup_users'] = []; // Inisialisasi array untuk backup user

        foreach ($data['elly'] as $user) {
            $data['backup_users'][$user->id_user] = $model->getBackupUser($user->id_user);
        }



        $data['satu'] = $model->getWhere('user', ['id_user' => $id_user]);

        $where = ['id_setting' => 1];
        $data['setting'] = $model->getWhere('setting', $where);
        $data['currentMenu'] = 'user'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view('menu', $data);
        echo view('user', $data);
        echo view('footer');
    } else {
        return redirect()->to('home/error');
    }
}


public function aksi_tambah_user()
    {
        $model = new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Menambah user'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
       
      
        $a = $this->request->getPost('nama');
        $b = $this->request->getPost('level');
        $c = md5($this->request->getPost('password'));
        $g = $this->request->getPost('jk');
        $h = $this->request->getPost('lahir');
        $i = $this->request->getPost('email');
        $j = $this->request->getPost('nohp');
        $k = $this->request->getPost('nik');
        $l = $this->request->getPost('nuptk');
        
        // $g = $this->request->getPost('editmodul');
        $uploadedFile = $this->request->getFile('foto');

        // Cek apakah file foto di-upload atau tidak
        if ($uploadedFile && $uploadedFile->isValid() && !$uploadedFile->hasMoved()) {
            $foto = $uploadedFile->getName();
            $model->upload($uploadedFile);
        } else {
            // Set foto default jika tidak ada file yang di-upload
            $foto = 'default.jpg';
        }
        
    
        
        $isi = array(
            'nama_user' => $a,
            'level' => $b,
            'password' => $c,
            'jk' => $g,
            'tgl_lhr' => $h,
            'email' => $i,
            'nohp' => $j,
            'nik' => $k,
            'nuptk' => $l,
            'foto' => $foto,
            'created_at' => date('Y-m-d H:i:s'), // Waktu saat produk dibuat
            'created_by' => $id_user // ID user yang login
            

        );
        $model ->tambah('user', $isi);
        
        return redirect()->to('home/user');
    }

    public function aksi_edit_user()
{
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengubah data user'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
        // Mengambil data log aktivitas dari model
       
    $a = $this->request->getPost('nama');
    $b = $this->request->getPost('level');
    $c = ($this->request->getPost('password'));
    $g = $this->request->getPost('jk');
    $h = $this->request->getPost('lahir');
    $i = $this->request->getPost('email');
    $j = $this->request->getPost('nohp');
    $k = $this->request->getPost('nik');
    $l = $this->request->getPost('nuptk');
    $id = $this->request->getPost('id');
    $fotoName = $this->request->getPost('old_foto'); // Mengambil nama foto lama
    $foto = $this->request->getFile('foto');


    $backupWhere = ['id_user' => $id];
    $existingBackup = $model->getWhere('backup_user', $backupWhere);

    if ($existingBackup) {
        // Hapus data lama di user_backup jika ada
        $model->hapus('backup_user', $backupWhere);
    }

    // Ambil data user lama berdasarkan id_user
    $userLama = $model->getUserById($id);

    // Simpan data user lama ke tabel user_backup
    $backupData = (array) $userLama;  // Ubah objek menjadi array
    $model->tambah('backup_user', $backupData);


    if ($foto && $foto->isValid()) {
        // Generate a new name for the uploaded file
        $newName = $foto->getRandomName();
        // Move the file to the target directory
        $foto->move(ROOTPATH . 'public/images', $newName);
        // Set the new file name to be saved in the database
        $fotoName = $newName;
    }

    if ($b == 1) {
       
        $l = null;
       
       
    }

    $isi = array(
        'nama_user' => $a,
        'level' => $b,
        'password' => $c,
        'jk' => $g,
        'tgl_lhr' => $h,
        'email' => $i,
        'nohp' => $j,
        'nik' => $k,
        'nuptk' => $l,
        'foto' => $fotoName,
        'updated_at' => date('Y-m-d H:i:s'), // Waktu saat produk dibuat
        'updated_by' => $id_user // ID user yang login
    );

    $where = array('id_user' => $id);
    $model->edit('user', $isi, $where);

    return redirect()->to('home/user');
}

public function aksi_reset($id)
{
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mereset password user'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
       
      
    $where = array('id_user' => $id);
    
    $isi = array(
        'password' => md5('12345'),
        'updated_at' => date('Y-m-d H:i:s'),
        'updated_by' => $id_user
    );
    $model->edit('user', $isi, $where);

    return redirect()->to('home/user');
}

public function hapususer($id){
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Menghapus data user'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    $data = [
        'isdelete' => 1,
        'deleted_by' => $id_user,
        'deleted_at' => date('Y-m-d H:i:s') // Format datetime untuk deleted_at
    ];
      
    $model->edit('user', $data, ['id_user' => $id]);

$where = array('id_user' => $id);
$model->hapus('backup_user', $where);
    return redirect()->to('home/user');
}

public function restore_user()
    {   
        if (session()->get('level') == 0 || session()->get('level') == 1) {
    	$model= new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman restore user'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
        
        $data['elly'] = $model->tampil('user', 'id_user');
        $where=array(
            'id_setting'=> 1
          );
          $data['setting'] = $model->getWhere('setting',$where);
          $data['currentMenu'] = 'restore_user'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view ('menu',$data);
        echo view('restore_user',$data);
        echo view ('footer');
         }else{
        return redirect()->to('home/error');
 
    } 
    }

    public function aksi_restore_user($id) {
        $model = new M_office();
         $id_user = session()->get('id'); // Ambil ID user dari session
            $activity = 'Merestore user'; // Deskripsi aktivitas
            $this->addLog($id_user, $activity);
        
        // Data yang akan diupdate untuk mengembalikan produk
        $data = [
            'isdelete' => 0,
            'deleted_by' => null,
            'deleted_at' => null
        ];
    
        // Update data produk dengan kondisi id_produk sesuai
        $model->edit('user', $data, ['id_user' => $id]);
    
        return redirect()->to('home/restore_user');
    }

    public function aksi_unedit_user()
{
    $model = new M_office();
    $id = $this->request->getPost('id'); // Ambil ID dari POST data
    
    if (!$id) {
        return redirect()->to('home/user')->with('error', 'ID user tidak ditemukan.');
    }
    
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Undo edit data user'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    // Ambil data dari tabel user_backup berdasarkan id_user
    $backupData = $model->getWhere('backup_user', ['id_user' => $id]);

    if ($backupData) {
        // Konversi data backup menjadi array
        $restoreData = (array) $backupData;

        // Hapus id_user dari array karena id_user tidak perlu di-update
        unset($restoreData['id_user']);

        // Update data di tabel user dengan data dari user_backup
        $model->edit('user', $restoreData, ['id_user' => $id]);

        // Hapus data dari tabel user_backup setelah di-restore
        $model->hapus('backup_user', ['id_user' => $id]);
    }

    return redirect()->to('home/user');
}



    //profile

public function profile($id)
{
    if (session()->get('level') >= 1 && session()->get('level') <= 7) {
        $model = new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman profile'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
        
        $where= array('user.id_user'=>$id);
        $where=array('id_user'=>session()->get('id'));
        
        $data['user']=$model->getWhere('user',$where);
        $where=array(
            'id_setting'=> 1
          );
          $data['setting'] = $model->getWhere('setting',$where);

        echo view('header',$data);
        echo view ('menu',$data);
        echo view('profile',$data);
        echo view ('footer');
        }else{
        return redirect()->to('home/error');
        }
        
}
public function aksieprofile() 
{
    $model = new M_office();

    $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengubah data profile'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
       

    $a = $this->request->getPost('nama');
    $b = $this->request->getPost('email');
    $c = $this->request->getPost('nohp');
    $id = $this->request->getPost('id');
    $fotoName = $this->request->getPost('old_foto'); // Mengambil nama foto lama
    $foto = $this->request->getFile('foto');

    if ($foto && $foto->isValid()) {
        // Generate a new name for the uploaded file
        $newName = $foto->getRandomName();
        // Move the file to the target directory
        $foto->move(ROOTPATH . 'public/images', $newName);
        // Set the new file name to be saved in the database
        $fotoName = $newName;
    }

    $backupWhere = ['id_user' => $id];
    $existingBackup = $model->getWhere('backup_user', $backupWhere);

    if ($existingBackup) {
        // Hapus data lama di user_backup jika ada
        $model->hapus('backup_user', $backupWhere);
    }

    // Ambil data user lama berdasarkan id_user
    $userLama = $model->getUserById($id);

    // Simpan data user lama ke tabel user_backup
    $backupData = (array) $userLama;  // Ubah objek menjadi array
    $model->tambah('backup_user', $backupData);

    

    $isi = array(
        'nama_user' => $a,
        'email' => $b,
        'nohp' => $c,
        'foto' => $fotoName,
        'updated_at' => date('Y-m-d H:i:s'), // Waktu saat produk dibuat
        'updated_by' => $id_user // ID user yang login
    );

    $where = array('id_user' => $id);
    $model->edit('user', $isi, $where);

    return redirect()->to('home/profile/'.$id);
}

public function aksi_changepass() {
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'mengubah password profile'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
       
    $oldPassword = $this->request->getPost('old');
    $newPassword = $this->request->getPost('new');
   

    // Dapatkan password lama dari database
    $currentPassword = $model->getPassword($id_user);

    // Verifikasi apakah password lama cocok
    if (md5($oldPassword) !== $currentPassword) {
        // Set pesan error jika password lama salah
        session()->setFlashdata('error', 'Password lama tidak valid.');
        return redirect()->back()->withInput();
    }
 
    // Update password baru
    $data = [
        'password' => md5($newPassword),
        'updated_by' => $id_user,
        'updated_at' => date('Y-m-d H:i:s')
    ];
    $where = ['id_user' => $id_user];
    
    $model->edit('user', $data, $where);
    
    // Set pesan sukses
    session()->setFlashdata('success', 'Password berhasil diperbarui.');
    return redirect()->to('home/profile/'.$id_user);
}

//surat keluar

public function surat_keluar()
    {
        if (session()->get('level') >= 1 && session()->get('level') <= 6) {
            $model= new M_office();
            $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman surat keluar'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);

        $data['elly'] = $model->tampil('surat_keluar', 'id_keluar');
        
        $data['backup_suratk'] = []; // Inisialisasi array untuk backup user

         foreach ($data['elly'] as $suratk) {
            $data['backup_suratk'][$suratk->id_keluar] = $model->getBackupsuratk($suratk->id_keluar);
         }
       
            $where=array(
                'id_setting'=> 1
              );
              $data['setting'] = $model->getWhere('setting',$where);
        $data['currentMenu'] = 'surat_keluar'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view('menu', $data);
        echo view('surat_keluar', $data);
        echo view('footer');
    }else{
        return redirect()->to('home/login');
 
    } 
    }

    public function aksi_tambah_suratk()
{
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Menambah data surat keluar'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);

    // Data input pengguna
    $b = $this->request->getPost('penerima');
    $c = $this->request->getPost('perihal');
    $d = $this->request->getPost('nomor');


    // Cek apakah file diunggah
    $uploadedFile = $this->request->getFile('lampiran');
    $filePath = null;

    if ($uploadedFile && $uploadedFile->isValid()) {
        // Tentukan path target dengan getRandomName
        $newFileName = $uploadedFile->getName();
        $filePath = 'lampiran/' . $newFileName;

        if (!is_dir('lampiran/')) {
            mkdir('lampiran/', 0777, true); // Buat folder jika belum ada
        }

        try {
            $uploadedFile->move('lampiran/', $newFileName);
        } catch (\Exception $e) {
            die("Gagal memindahkan file: " . $e->getMessage());
        }
    }

    $isi = array(
        'nomor_surat' => $nomorSurat, // Nomor surat otomatis
        'penerima' => $b,
        'perihal' => $c,
        'nomor_surat' => $d,
        'tgl_kirim' => date('Y-m-d'), // Tanggal kirim sekarang
        'id_jenis' => 5,
        'lampiran' => $filePath, // Path file
        'created_at' => date('Y-m-d H:i:s'),
        'created_by' => $id_user
    );

    $model->tambah('surat_keluar', $isi);
    
    return redirect()->to('home/surat_keluar');
}

public function aksi_edit_suratk()
{
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Mengubah data surat keluar'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    $b = $this->request->getPost('penerima');
    $c = $this->request->getPost('perihal');
    $d = $this->request->getPost('nomor');
    $id = $this->request->getPost('id');
   
    $backupWhere = ['id_keluar' => $id];
    $existingBackup = $model->getWhere('backup_suratk', $backupWhere);

    if ($existingBackup) {
        // Hapus data lama di backup_pengumuman jika ada
        $model->hapus('backup_suratk', $backupWhere);
    }

    // Ambil data pengumuman lama berdasarkan id_pengumuman
    $pengumumanLama = $model->getsuratkById($id);

    // Simpan data pengumuman lama ke tabel backup_pengumuman
    $backupData = (array) $pengumumanLama;  // Ubah objek menjadi array
    $model->tambah('backup_suratk', $backupData);
    
    // Cek apakah ada file yang diunggah
    $uploadedFile = $this->request->getFile('lampiran');
    $filePath = $pengumumanLama->lampiran; // Default ke file lama jika tidak ada file baru

    if ($uploadedFile && $uploadedFile->isValid()) {
        // Tentukan nama file baru dan path
        $newFileName = $uploadedFile->getName();
        $filePath = 'lampiran/' . $newFileName;
    
        // Cek apakah direktori tujuan sudah ada
        if (!is_dir('lampiran/')) {
            mkdir('lampiran/', 0777, true); // Buat folder jika belum ada
        }
    
        try {
            // Pindahkan file ke folder tujuan dan hapus file lama jika ada
            $uploadedFile->move('lampiran/', $newFileName);
            if ($pengumumanLama->file && file_exists($pengumumanLama->lampiran)) {
                unlink($pengumumanLama->file); // Hapus file lama
            }
        } catch (\Exception $e) {
            die("Gagal memindahkan file: " . $e->getMessage());
        }
    }
    
    // Array data yang akan diperbarui
    $isi = array(
        'penerima' => $b,
        'perihal' => $c,
        'nomor_surat' => $d,
        'lampiran' => $filePath, // Simpan path file baru
        'updated_at' => date('Y-m-d H:i:s'), // Waktu saat produk dibuat
        'updated_by' => $id_user // ID user yang login
    );

    $where = array('id_keluar' => $id);
    $model->edit('surat_keluar', $isi, $where);
    
    return redirect()->to('home/surat_keluar');
}


public function aksi_unedit_suratk()
{
    $model = new M_office();
    $id = $this->request->getPost('id'); // Ambil ID dari POST data
    
    if (!$id) {
        return redirect()->to('home/surat_keluar')->with('error', 'ID user tidak ditemukan.');
    }
    
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Undo edit surat keluar'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    // Ambil data dari tabel user_backup berdasarkan id_user
    $backupData = $model->getWhere('backup_suratk', ['id_keluar' => $id]);

    if ($backupData) {
        // Konversi data backup menjadi array
        $restoreData = (array) $backupData;

        // Hapus id_user dari array karena id_user tidak perlu di-update
        unset($restoreData['id_keluar']);

        // Update data di tabel user dengan data dari user_backup
        $model->edit('surat_keluar', $restoreData, ['id_keluar' => $id]);

        // Hapus data dari tabel user_backup setelah di-restore
        $model->hapus('backup_suratk', ['id_keluar' => $id]);
    }

    return redirect()->to('home/surat_keluar');
}

public function hapussuratk($id){
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Menghapus data surat keluar'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    $data = [
        'isdelete' => 1,
        'deleted_by' => $id_user,
        'deleted_at' => date('Y-m-d H:i:s') // Format datetime untuk deleted_at
    ];
      
    $model->edit('surat_keluar', $data, ['id_keluar' => $id]);

    // Hapus data dari tabel backup_kelas
$where = array('id_keluar' => $id);
$model->hapus('backup_suratk', $where);
    return redirect()->to('home/surat_keluar');
}




//surat masuk

public function surat_masuk()
    {
        if (session()->get('level') >= 1 && session()->get('level') <= 6) {
            $model= new M_office();
            $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman surat masuk'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);

        $data['elly'] = $model->tampil('surat_masuk', 'id_masuk');
        
        $data['backup_suratk'] = []; // Inisialisasi array untuk backup user

         foreach ($data['elly'] as $suratm) {
            $data['backup_suratm'][$suratm->id_masuk] = $model->getBackupsuratm($suratm->id_masuk);
         }
       
            $where=array(
                'id_setting'=> 1
              );
              $data['setting'] = $model->getWhere('setting',$where);
        $data['currentMenu'] = 'surat_masuk'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view('menu', $data);
        echo view('surat_masuk', $data);
        echo view('footer');
    }else{
        return redirect()->to('home/login');
 
    } 
    }

    public function aksi_tambah_suratm()
{
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Menambah data surat masuk'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);

    // Data input pengguna
    $b = $this->request->getPost('pengirim');
    $c = $this->request->getPost('perihal');
    $d = $this->request->getPost('nomor');

    // Cek apakah file diunggah
    $uploadedFile = $this->request->getFile('lampiran');
    $filePath = null;

    if ($uploadedFile && $uploadedFile->isValid()) {
        // Tentukan path target dengan getRandomName
        $newFileName = $uploadedFile->getName();
        $filePath = 'lampiran/' . $newFileName;

        if (!is_dir('lampiran/')) {
            mkdir('lampiran/', 0777, true); // Buat folder jika belum ada
        }

        try {
            $uploadedFile->move('lampiran/', $newFileName);
        } catch (\Exception $e) {
            die("Gagal memindahkan file: " . $e->getMessage());
        }
    }

    $isi = array(
        'nomor_surat' => $nomorSurat, // Nomor surat otomatis
        'pengirim' => $b,
        'perihal' => $c,
        'nomor_surat' => $d,
        'tgl_terima' => date('Y-m-d'), // Tanggal kirim sekarang
        'id_jenis' => 6,
        'lampiran' => $filePath, // Path file
        'created_at' => date('Y-m-d H:i:s'),
        'created_by' => $id_user
    );

    $model->tambah('surat_masuk', $isi);
    
    return redirect()->to('home/surat_masuk');
}


public function aksi_edit_suratm()
{
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Mengubah data surat masuk'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    $b = $this->request->getPost('pengirim');
    $c = $this->request->getPost('perihal');
    $d = $this->request->getPost('nomor');
    $id = $this->request->getPost('id');
   
    $backupWhere = ['id_masuk' => $id];
    $existingBackup = $model->getWhere('backup_suratm', $backupWhere);

    if ($existingBackup) {
        // Hapus data lama di backup_pengumuman jika ada
        $model->hapus('backup_suratm', $backupWhere);
    }

    // Ambil data pengumuman lama berdasarkan id_pengumuman
    $pengumumanLama = $model->getsuratmById($id);

    // Simpan data pengumuman lama ke tabel backup_pengumuman
    $backupData = (array) $pengumumanLama;  // Ubah objek menjadi array
    $model->tambah('backup_suratm', $backupData);
    
    // Cek apakah ada file yang diunggah
    $uploadedFile = $this->request->getFile('lampiran');
    $filePath = $pengumumanLama->lampiran; // Default ke file lama jika tidak ada file baru

    if ($uploadedFile && $uploadedFile->isValid()) {
        // Tentukan nama file baru dan path
        $newFileName = $uploadedFile->getName();
        $filePath = 'lampiran/' . $newFileName;
    
        // Cek apakah direktori tujuan sudah ada
        if (!is_dir('lampiran/')) {
            mkdir('lampiran/', 0777, true); // Buat folder jika belum ada
        }
    
        try {
            // Pindahkan file ke folder tujuan dan hapus file lama jika ada
            $uploadedFile->move('lampiran/', $newFileName);
            if ($pengumumanLama->file && file_exists($pengumumanLama->lampiran)) {
                unlink($pengumumanLama->file); // Hapus file lama
            }
        } catch (\Exception $e) {
            die("Gagal memindahkan file: " . $e->getMessage());
        }
    }
    
    // Array data yang akan diperbarui
    $isi = array(
        'pengirim' => $b,
        'perihal' => $c,
        'nomor_surat' => $d,
        'lampiran' => $filePath, // Simpan path file baru
        'updated_at' => date('Y-m-d H:i:s'), // Waktu saat produk dibuat
        'updated_by' => $id_user // ID user yang login
    );

    $where = array('id_masuk' => $id);
    $model->edit('surat_masuk', $isi, $where);
    
    return redirect()->to('home/surat_masuk');
}

public function aksi_unedit_suratm()
{
    $model = new M_office();
    $id = $this->request->getPost('id'); // Ambil ID dari POST data
    
    if (!$id) {
        return redirect()->to('home/surat_masuk')->with('error', 'ID user tidak ditemukan.');
    }
    
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Undo edit surat masuk'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    // Ambil data dari tabel user_backup berdasarkan id_user
    $backupData = $model->getWhere('backup_suratm', ['id_masuk' => $id]);

    if ($backupData) {
        // Konversi data backup menjadi array
        $restoreData = (array) $backupData;

        // Hapus id_user dari array karena id_user tidak perlu di-update
        unset($restoreData['id_masuk']);

        // Update data di tabel user dengan data dari user_backup
        $model->edit('surat_masuk', $restoreData, ['id_masuk' => $id]);

        // Hapus data dari tabel user_backup setelah di-restore
        $model->hapus('backup_suratm', ['id_masuk' => $id]);
    }

    return redirect()->to('home/surat_masuk');
}

public function hapussuratm($id){
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Menghapus data surat masuk'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    $data = [
        'isdelete' => 1,
        'deleted_by' => $id_user,
        'deleted_at' => date('Y-m-d H:i:s') // Format datetime untuk deleted_at
    ];
      
    $model->edit('surat_masuk', $data, ['id_masuk' => $id]);

    // Hapus data dari tabel backup_kelas
$where = array('id_masuk' => $id);
$model->hapus('backup_suratm', $where);
    return redirect()->to('home/surat_masuk');
}


//surat surat

public function surat_surat()
    {
        if (session()->get('level') >= 1 && session()->get('level') <= 6) {
            $model= new M_office();
            $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman surat keluar'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);

        $data['jenis'] = $model->tampilkondisi('jenis', 'id_jenis', ['isdelete' => 0]);

        $data['elly'] = $model->tampil('surat_surat', 'id_surat');
        
        $data['backup_suratk'] = []; // Inisialisasi array untuk backup user

         foreach ($data['elly'] as $surat) {
            $data['backup_surat'][$surat->id_surat] = $model->getBackupsurat($surat->id_surat);
         }
       
            $where=array(
                'id_setting'=> 1
              );
              $data['setting'] = $model->getWhere('setting',$where);
        $data['currentMenu'] = 'surat_surat'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view('menu', $data);
        echo view('surat_surat', $data);
        echo view('footer');
    }else{
        return redirect()->to('home/login');
 
    } 
    }

    public function aksi_tambah_surat()
    {
        $model = new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Menambah data surat'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
    
        // Data input pengguna
        $a = $this->request->getPost('jenis');
        $b = $this->request->getPost('perihal');
        $d = $this->request->getPost('nomor');
       
    
        // Cek apakah file diunggah
        $uploadedFile = $this->request->getFile('lampiran');
        $filePath = null;
    
        if ($uploadedFile && $uploadedFile->isValid()) {
            // Tentukan path target dengan getRandomName
            $newFileName = $uploadedFile->getName();
            $filePath = 'lampiran/' . $newFileName;
    
            if (!is_dir('lampiran/')) {
                mkdir('lampiran/', 0777, true); // Buat folder jika belum ada
            }
    
            try {
                $uploadedFile->move('lampiran/', $newFileName);
            } catch (\Exception $e) {
                die("Gagal memindahkan file: " . $e->getMessage());
            }
        }
    
        $isi = array(
            'nomor_surat' => $nomorSurat, // Nomor surat otomatis
            'id_jenis' => $a,
            'perihal' => $b,
            'nomor_surat' => $d,
            'lampiran' => $filePath, // Path file
            'created_at' => date('Y-m-d H:i:s'),
            'created_by' => $id_user
        );
    
        $model->tambah('surat_surat', $isi);
        
        return redirect()->to('home/surat_surat');
    }

    public function aksi_edit_surat()
{
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Mengubah data surat'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    $a = $this->request->getPost('jenis');
    $b = $this->request->getPost('perihal');
    $d = $this->request->getPost('nomor');
    $id = $this->request->getPost('id');
   
    $backupWhere = ['id_surat' => $id];
    $existingBackup = $model->getWhere('backup_surat', $backupWhere);

    if ($existingBackup) {
        // Hapus data lama di backup_pengumuman jika ada
        $model->hapus('backup_surat', $backupWhere);
    }

    // Ambil data pengumuman lama berdasarkan id_pengumuman
    $pengumumanLama = $model->getsuratById($id);

    // Simpan data pengumuman lama ke tabel backup_pengumuman
    $backupData = (array) $pengumumanLama;  // Ubah objek menjadi array
    $model->tambah('backup_surat', $backupData);
    
    // Cek apakah ada file yang diunggah
    $uploadedFile = $this->request->getFile('lampiran');
    $filePath = $pengumumanLama->lampiran; // Default ke file lama jika tidak ada file baru

    if ($uploadedFile && $uploadedFile->isValid()) {
        // Tentukan nama file baru dan path
        $newFileName = $uploadedFile->getName();
        $filePath = 'lampiran/' . $newFileName;
    
        // Cek apakah direktori tujuan sudah ada
        if (!is_dir('lampiran/')) {
            mkdir('lampiran/', 0777, true); // Buat folder jika belum ada
        }
    
        try {
            // Pindahkan file ke folder tujuan dan hapus file lama jika ada
            $uploadedFile->move('lampiran/', $newFileName);
            if ($pengumumanLama->file && file_exists($pengumumanLama->lampiran)) {
                unlink($pengumumanLama->file); // Hapus file lama
            }
        } catch (\Exception $e) {
            die("Gagal memindahkan file: " . $e->getMessage());
        }
    }
    
    // Array data yang akan diperbarui
    $isi = array(
        'id_jenis' => $a,
        'perihal' => $b,
        'nomor_surat' => $d,
        'lampiran' => $filePath, // Simpan path file baru
        'updated_at' => date('Y-m-d H:i:s'), // Waktu saat produk dibuat
        'updated_by' => $id_user // ID user yang login
    );

    $where = array('id_surat' => $id);
    $model->edit('surat_surat', $isi, $where);
    
    return redirect()->to('home/surat_surat');
}

public function aksi_unedit_surat()
{
    $model = new M_office();
    $id = $this->request->getPost('id'); // Ambil ID dari POST data
    
    if (!$id) {
        return redirect()->to('home/surat_surat')->with('error', 'ID user tidak ditemukan.');
    }
    
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Undo edit surat'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    // Ambil data dari tabel user_backup berdasarkan id_user
    $backupData = $model->getWhere('backup_surat', ['id_surat' => $id]);

    if ($backupData) {
        // Konversi data backup menjadi array
        $restoreData = (array) $backupData;

        // Hapus id_user dari array karena id_user tidak perlu di-update
        unset($restoreData['id_surat']);

        // Update data di tabel user dengan data dari user_backup
        $model->edit('surat_surat', $restoreData, ['id_surat' => $id]);

        // Hapus data dari tabel user_backup setelah di-restore
        $model->hapus('backup_surat', ['id_surat' => $id]);
    }

    return redirect()->to('home/surat_surat');
}


public function hapussurat($id){
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Menghapus data surat'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    $data = [
        'isdelete' => 1,
        'deleted_by' => $id_user,
        'deleted_at' => date('Y-m-d H:i:s') // Format datetime untuk deleted_at
    ];
      
    $model->edit('surat_surat', $data, ['id_surat' => $id]);

    // Hapus data dari tabel backup_kelas
$where = array('id_surat' => $id);
$model->hapus('backup_surat', $where);
    return redirect()->to('home/surat_surat');
}   


    //jenis

    public function jenis()
    {
        if (session()->get('level')>0){
            $model= new M_office();
            $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman jenis surat'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);

        $data['elly'] = $model->tampil('jenis', 'id_jenis');
        
        $data['backup_suratk'] = []; // Inisialisasi array untuk backup user

         foreach ($data['elly'] as $jenis) {
            $data['backup_jenis'][$jenis->id_jenis] = $model->getBackupjenis($jenis->id_jenis);
         }
       
            $where=array(
                'id_setting'=> 1
              );
              $data['setting'] = $model->getWhere('setting',$where);
        $data['currentMenu'] = 'jenis'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view('menu', $data);
        echo view('jenis', $data);
        echo view('footer');
    }else{
        return redirect()->to('home/login');
 
    } 
    }

    public function aksi_tambah_jenis()
    {
        $model = new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Menambah jenis surat'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
       
      
        $a = $this->request->getPost('jenis');
       
        
       
        
    
        
        $isi = array(
            'nama_jenis' => $a,
           
            'created_at' => date('Y-m-d H:i:s'), // Waktu saat produk dibuat
            'created_by' => $id_user // ID user yang login
            

        );
        $model ->tambah('jenis', $isi);
        
        return redirect()->to('home/jenis');
    }

    public function aksi_edit_jenis()
    {
        $model = new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
            $activity = 'Mengubah data jenis surat'; // Deskripsi aktivitas
            $this->addLog($id_user, $activity);
            
            // Mengambil data log aktivitas dari model
           
        $a = $this->request->getPost('jenis');
       
        $id = $this->request->getPost('id');
       
    
        $backupWhere = ['id_jenis' => $id];
        $existingBackup = $model->getWhere('backup_jenis', $backupWhere);
    
        if ($existingBackup) {
            // Hapus data lama di user_backup jika ada
            $model->hapus('backup_jenis', $backupWhere);
        }
    
        // Ambil data user lama berdasarkan id_user
        $userLama = $model->getjenisById($id);
    
        // Simpan data user lama ke tabel user_backup
        $backupData = (array) $userLama;  // Ubah objek menjadi array
        $model->tambah('backup_jenis', $backupData);
    
    
    
        $isi = array(
            'nama_jenis' => $a,
            'updated_at' => date('Y-m-d H:i:s'), // Waktu saat produk dibuat
            'updated_by' => $id_user // ID user yang login
        );
    
        $where = array('id_jenis' => $id);
        $model->edit('jenis', $isi, $where);
    
        return redirect()->to('home/jenis');
    }
    
    public function aksi_unedit_jenis()
    {
        $model = new M_office();
        $id = $this->request->getPost('id'); // Ambil ID dari POST data
        
        if (!$id) {
            return redirect()->to('home/jenis')->with('error', 'ID user tidak ditemukan.');
        }
        
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Undo edit data jenis surat'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
        // Ambil data dari tabel user_backup berdasarkan id_user
        $backupData = $model->getWhere('backup_jenis', ['id_jenis' => $id]);
    
        if ($backupData) {
            // Konversi data backup menjadi array
            $restoreData = (array) $backupData;
    
            // Hapus id_user dari array karena id_user tidak perlu di-update
            unset($restoreData['id_jenis']);
    
            // Update data di tabel user dengan data dari user_backup
            $model->edit('jenis', $restoreData, ['id_jenis' => $id]);
    
            // Hapus data dari tabel user_backup setelah di-restore
            $model->hapus('backup_jenis', ['id_jenis' => $id]);
        }
    
        return redirect()->to('home/jenis');
    }

    public function hapusjenis($id){
        $model = new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Menghapus data jenis surat'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
        $data = [
            'isdelete' => 1,
            'deleted_by' => $id_user,
            'deleted_at' => date('Y-m-d H:i:s') // Format datetime untuk deleted_at
        ];
          
        $model->edit('jenis', $data, ['id_jenis' => $id]);
    
    $where = array('id_jenis' => $id);
    $model->hapus('backup_jenis', $where);
        return redirect()->to('home/jenis');
    }



    //terlambat

    public function keterlambatan()
    {
        if (session()->get('level') >= 1 && session()->get('level') <= 7) {
            $model= new M_office();
            $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman keterlambatan kehadiran'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);

        if (session()->get('level') == 7) {
            $data['elly'] = $model->tampilkondisi('keterlambatan', 'id_keterlambatan', ['created_by' => $id_user]); // Tambahkan filter berdasarkan created_by
        } else {
            // Untuk level 1 hingga 5, ambil semua data
            $data['elly'] = $model->tampil('keterlambatan', 'id_keterlambatan');
        }
        
        $data['backup_keterlambatan'] = []; // Inisialisasi array untuk backup user

         foreach ($data['elly'] as $keterlambatan) {
            $data['backup_keterlambatan'][$keterlambatan->id_keterlambatan] = $model->getBackupterlambat($keterlambatan->id_keterlambatan);
         }
       
            $where=array(
                'id_setting'=> 1
              );
              $data['setting'] = $model->getWhere('setting',$where);
        $data['currentMenu'] = 'keterlambatan'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view('menu', $data);
        echo view('keterlambatan', $data);
        echo view('footer');
    }else{
        return redirect()->to('home/login');
 
    } 
    }


    public function aksi_tambah_keterlambatan()
{
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Menambah keterlambatan kehadiran'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);

    // Ambil nama dan nik dari session
    $a = session()->get('nama');
    $b = session()->get('nik');
    $c = $this->request->getPost('bagian');
    $g = $this->request->getPost('tanggal');
    $h = $this->request->getPost('datang');
    $i = $this->request->getPost('jumlah');
    $j = $this->request->getPost('alasan');

    $isi = array(
        'nama' => $a,
        'nik' => $b,
        'bagian' => $c,
        'tgl' => $g,
        'jam_datang' => $h,
        'jumlah_telat' => $i,
        'alasan_telat' => $j,
        'id_jenis' => 4,
        'created_at' => date('Y-m-d H:i:s'), // Waktu saat produk dibuat
        'created_by' => $id_user // ID user yang login
    );

    $model->tambah('keterlambatan', $isi);
    
    return redirect()->to('home/keterlambatan');
}



    public function aksi_edit_keterlambatan()
{
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengubah data keterlambatan kehadiran'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
        // Mengambil data log aktivitas dari model
       
        
        $c = $this->request->getPost('bagian');
        $g = $this->request->getPost('tanggal');
        $h = $this->request->getPost('datang');
        $i = $this->request->getPost('jumlah');
        $j = $this->request->getPost('alasan');
        $id = $this->request->getPost('id');
   


    $backupWhere = ['id_keterlambatan' => $id];
    $existingBackup = $model->getWhere('backup_keterlambatan', $backupWhere);

    if ($existingBackup) {
        // Hapus data lama di user_backup jika ada
        $model->hapus('backup_keterlambatan', $backupWhere);
    }

    // Ambil data user lama berdasarkan id_user
    $userLama = $model->gettelatById($id);

    // Simpan data user lama ke tabel user_backup
    $backupData = (array) $userLama;  // Ubah objek menjadi array
    $model->tambah('backup_keterlambatan', $backupData);


    $isi = array(
       
        'bagian' => $c,
        'tgl' => $g,
        'jam_datang' => $h,
        'jumlah_telat' => $i,
        'alasan_telat' => $j,
        'updated_at' => date('Y-m-d H:i:s'), // Waktu saat produk dibuat
        'updated_by' => $id_user // ID user yang login
    );

    $where = array('id_keterlambatan' => $id);
    $model->edit('keterlambatan', $isi, $where);

    return redirect()->to('home/keterlambatan');
}

public function aksi_unedit_keterlambatan()
{
    $model = new M_office();
    $id = $this->request->getPost('id'); // Ambil ID dari POST data
    
    if (!$id) {
        return redirect()->to('home/keterlambatan')->with('error', 'ID user tidak ditemukan.');
    }
    
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Undo edit keterlambatan kehadiran'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    // Ambil data dari tabel user_backup berdasarkan id_user
    $backupData = $model->getWhere('backup_keterlambatan', ['id_keterlambatan' => $id]);

    if ($backupData) {
        // Konversi data backup menjadi array
        $restoreData = (array) $backupData;

        // Hapus id_user dari array karena id_user tidak perlu di-update
        unset($restoreData['id_keterlambatan']);

        // Update data di tabel user dengan data dari user_backup
        $model->edit('keterlambatan', $restoreData, ['id_keterlambatan' => $id]);

        // Hapus data dari tabel user_backup setelah di-restore
        $model->hapus('backup_keterlambatan', ['id_keterlambatan' => $id]);
    }

    return redirect()->to('home/keterlambatan');
}



public function hapustelat($id){
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Menghapus data keterlambatan kehadiran'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    $data = [
        'isdelete' => 1,
        'deleted_by' => $id_user,
        'deleted_at' => date('Y-m-d H:i:s') // Format datetime untuk deleted_at
    ];
      
    $model->edit('keterlambatan', $data, ['id_keterlambatan' => $id]);

$where = array('id_keterlambatan' => $id);
$model->hapus('backup_keterlambatan', $where);
    return redirect()->to('home/keterlambatan');
}


//cuti

public function permohonan_cuti()
{
    if (session()->get('level') >= 1 && session()->get('level') <= 7) {
        $model = new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman permohonan cuti'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);

        // Kondisi untuk pengguna dengan level 6, hanya ambil data yang created_by nya sesuai dengan ID pengguna
        if (session()->get('level') == 7) {
            $data['elly'] = $model->tampilkondisi('cuti', 'id_cuti', ['created_by' => $id_user]); // Tambahkan filter berdasarkan created_by
        } else {
            // Untuk level 1 hingga 5, ambil semua data
            $data['elly'] = $model->tampil('cuti', 'id_cuti');
        }

        $data['backup_cuti'] = []; // Inisialisasi array untuk backup user

        foreach ($data['elly'] as $cuti) {
            $data['backup_cuti'][$cuti->id_cuti] = $model->getBackuptercuti($cuti->id_cuti);
        }

        $where = array(
            'id_setting' => 1
        );
        $data['setting'] = $model->getWhere('setting', $where);
        $data['currentMenu'] = 'permohonan_cuti'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view('menu', $data);
        echo view('permohonan_cuti', $data);
        echo view('footer');
    } else {
        return redirect()->to('home/login');
    }
}

public function aksi_tambah_cuti()
{
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Menambah permohonan cuti'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);

    $a = session()->get('nama');
    $b = session()->get('nik');
    $c = $this->request->getPost('cabang');
    $d = $this->request->getPost('tanggal');
    $e = $this->request->getPost('jeniscuti');
    $f = $this->request->getPost('mulai');
    $g = $this->request->getPost('terakhir');
    $h = $this->request->getPost('total');
    $i = $this->request->getPost('balik');
    $j = $this->request->getPost('alih');
    $l = $this->request->getPost('alamat');
    $m = $this->request->getPost('alasan');
    $n = $this->request->getPost('jatah');
    $o = $this->request->getPost('diajukan');
    $p = $this->request->getPost('sisa');
    $q = $this->request->getPost('catatan');
    
    // Ambil level dari session
    $level = session()->get('level');
    
    // Set jabatan berdasarkan level
    $jabatan = '';
    switch ($level) {
        case 1:
            $jabatan = 'Admin';
            break;
        case 2:
            $jabatan = 'Yayasan';
            break;
        case 3:
            $jabatan = 'Kepala Sekolah';
            break;
        case 4:
            $jabatan = 'Wakil Kepala Sekolah';
            break;
        case 5:
            $jabatan = 'Kesiswaan';
            break;
        case 6:
            $jabatan = 'HRD';
            break;
        case 7:
            $jabatan = 'Guru';
            break;
        default:
            $jabatan = 'Unknown'; // Jika level tidak sesuai
            break;
    }

    $isi = array(
        'nama_cuti' => $a,
        'nik_cuti' => $b,
        'cabang' => $c,
        'tgl_pengajuan' => $d,
        'jenis_cuti' => $e,
        'tgl_mulai' => $f,
        'tgl_terakhir' => $g,
        'total_hari' => $h,
        'tgl_kembali' => $i,
        'ambil_alih' => $j,
        'alamat_cuti' => $l,
        'alasan_cuti' => $m,
        'jatah_cuti' => $n,
        'cuti_diajukan' => $o,
        'sisa_cuti' => $p,
        'catatan' => $q,
        'jabatan' => $jabatan, // Tambahkan jabatan berdasarkan level
        'id_jenis' => 3,
        'created_at' => date('Y-m-d H:i:s'), // Waktu saat produk dibuat
        'created_by' => $id_user // ID user yang login
    );

    $model->tambah('cuti', $isi);
    
    return redirect()->to('home/permohonan_cuti');
}


    public function aksi_edit_cuti()
    {
        $model = new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
            $activity = 'Mengubah data permohonan cuti'; // Deskripsi aktivitas
            $this->addLog($id_user, $activity);
            
            // Mengambil data log aktivitas dari model
           
           
        $c = $this->request->getPost('cabang');
        $d = $this->request->getPost('tanggal');
        $e = $this->request->getPost('jeniscuti');
        $f = $this->request->getPost('mulai');
        $g = $this->request->getPost('terakhir');
        $h = $this->request->getPost('total');
        $i = $this->request->getPost('balik');
        $j = $this->request->getPost('alih');
        $l = $this->request->getPost('alamat');
        $m = $this->request->getPost('alasan');
        $n = $this->request->getPost('jatah');
        $o = $this->request->getPost('diajukan');
        $p = $this->request->getPost('sisa');
        $q = $this->request->getPost('catatan');
            $id = $this->request->getPost('id');
       
    
    
        $backupWhere = ['id_cuti' => $id];
        $existingBackup = $model->getWhere('backup_cuti', $backupWhere);
    
        if ($existingBackup) {
            // Hapus data lama di user_backup jika ada
            $model->hapus('backup_cuti', $backupWhere);
        }
    
        // Ambil data user lama berdasarkan id_user
        $userLama = $model->getcutiById($id);
    
        // Simpan data user lama ke tabel user_backup
        $backupData = (array) $userLama;  // Ubah objek menjadi array
        $model->tambah('backup_cuti', $backupData);
    
    
        $isi = array(
           
            'cabang' => $c,
            'tgl_pengajuan' => $d,
            'jenis_cuti' => $e,
            'tgl_mulai' => $f,
            'tgl_terakhir' => $g,
            'total_hari' => $h,
            'tgl_kembali' => $i,
            'ambil_alih' => $j,
            'alamat_cuti' => $l,
            'alasan_cuti' => $m,
            'jatah_cuti' => $n,
            'cuti_diajukan' => $o,
            'sisa_cuti' => $p,
            'catatan' => $q,
            'updated_at' => date('Y-m-d H:i:s'), // Waktu saat produk dibuat
            'updated_by' => $id_user // ID user yang login
        );
    
        $where = array('id_cuti' => $id);
        $model->edit('cuti', $isi, $where);
    
        return redirect()->to('home/permohonan_cuti');
    }

    public function aksi_unedit_cuti()
{
    $model = new M_office();
    $id = $this->request->getPost('id'); // Ambil ID dari POST data
    
    if (!$id) {
        return redirect()->to('home/cuti')->with('error', 'ID user tidak ditemukan.');
    }
    
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Undo edit permohonan cuti'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    // Ambil data dari tabel user_backup berdasarkan id_user
    $backupData = $model->getWhere('backup_cuti', ['id_cuti' => $id]);

    if ($backupData) {
        // Konversi data backup menjadi array
        $restoreData = (array) $backupData;

        // Hapus id_user dari array karena id_user tidak perlu di-update
        unset($restoreData['id_cuti']);

        // Update data di tabel user dengan data dari user_backup
        $model->edit('cuti', $restoreData, ['id_cuti' => $id]);

        // Hapus data dari tabel user_backup setelah di-restore
        $model->hapus('backup_cuti', ['id_cuti' => $id]);
    }

    return redirect()->to('home/permohonan_cuti');
}

public function hapuscuti($id){
    $model = new M_office();
    $id_user = session()->get('id'); // Ambil ID user dari session
    $activity = 'Menghapus data permohonan cuti'; // Deskripsi aktivitas
    $this->addLog($id_user, $activity);
    
    $data = [
        'isdelete' => 1,
        'deleted_by' => $id_user,
        'deleted_at' => date('Y-m-d H:i:s') // Format datetime untuk deleted_at
    ];
      
    $model->edit('cuti', $data, ['id_cuti' => $id]);

$where = array('id_cuti' => $id);
$model->hapus('backup_cuti', $where);
    return redirect()->to('home/permohonan_cuti');
}
public function aksi_persetujuan_cuti()
{
    $model = new M_office();  // Inisialisasi model M_office
    
    $id = $this->request->getPost('id');
    $issetuju = $this->request->getPost('issetuju');

    // Update status persetujuan
    $data = [
        'issetuju' => $issetuju
    ];

    $where = ['id_cuti' => $id]; // Tentukan kondisi berdasarkan ID
    
    // Gunakan $model untuk memanggil method edit
    $model->edit('cuti', $data, $where);  // Panggil method edit pada model yang sudah dideklarasikan
    
    return redirect()->to('home/permohonan_cuti');
}


//share

public function aksi_share_surat_keluar()
{
    // Ambil data input dari form
    $emailRecipients = $this->request->getPost('send_to_email'); // Ambil email penerima dari form
    $id = $this->request->getPost('id'); // ID surat keluar

    // Ambil data surat keluar dari database berdasarkan ID
    $suratModel = new M_office();
    $suratData = $suratModel->getsuratkById($id);
    
    if (!$suratData) {
        return redirect()->back()->with('error', 'Data surat tidak ditemukan.');
    }

    $nomor_surat = $suratData->nomor_surat;
    $perihal = $suratData->perihal;
    $lampiranFile = $suratData->lampiran;
    $lampiranPath = FCPATH  . $lampiranFile;


    // Log untuk debugging
    log_message('debug', 'Lampiran file path: ' . $lampiranPath);

    // Subject dan body email
    $subject = "Nomor Surat: $nomor_surat";
    $body = "
        <p><strong>Nomor Surat:</strong> $nomor_surat</p>
        <p><strong>Perihal:</strong> $perihal</p>
        <p>Silakan periksa lampiran untuk detail lebih lanjut.</p>
    ";

    // Mulai PHPMailer
    $mail = new PHPMailer(true);

    try {
        // Konfigurasi SMTP
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com'; // Ganti dengan SMTP server Anda
        $mail->SMTPAuth = true;
        $mail->Username = getenv('EMAIL_USERNAME');
        $mail->Password = getenv('EMAIL_PASSWORD');
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        // Pengaturan email
        $mail->setFrom('tugaselly@gmail.com', 'Sekolah Permata Harapan');
        
        // Tambahkan banyak penerima jika dipisahkan oleh koma
        $recipients = explode(',', $emailRecipients);
        foreach ($recipients as $recipient) {
            $mail->addAddress(trim($recipient));
        }

        // Pengaturan lampiran jika ada
        if ($lampiranFile && file_exists($lampiranPath)) {
            $mail->addAttachment($lampiranPath);
            log_message('debug', 'Lampiran file berhasil ditemukan dan ditambahkan.');
        } else {
            log_message('error', 'Lampiran file tidak ditemukan: ' . $lampiranPath);
        }

        // Pengaturan konten email
        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body    = $body;

        // Kirim email
        if ($mail->send()) {
            return redirect()->back()->with('success', 'Email berhasil dikirim.');
        } else {
            return redirect()->back()->with('error', 'Email gagal dikirim.');
        }
    } catch (Exception $e) {
        // Tampilkan error jika gagal mengirim email
        return redirect()->back()->with('error', 'Email gagal dikirim: ' . $mail->ErrorInfo);
    }
}



//restore

public function restore_jenissurat()
    {   
        if (session()->get('level') == 0 || session()->get('level') == 1) {
    	$model= new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman restore jenis surat'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
        
        $data['elly'] = $model->tampil('jenis', 'id_jenis');
        $where=array(
            'id_setting'=> 1
          );
          $data['setting'] = $model->getWhere('setting',$where);
          $data['currentMenu'] = 'restore_jenissurat'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view ('menu',$data);
        echo view('restore_jenissurat',$data);
        echo view ('footer');
         }else{
        return redirect()->to('home/error');
 
    } 
    }

    public function aksi_restore_jenissurat($id) {
        $model = new M_office();
         $id_user = session()->get('id'); // Ambil ID user dari session
            $activity = 'Merestore jenis surat'; // Deskripsi aktivitas
            $this->addLog($id_user, $activity);
        
        // Data yang akan diupdate untuk mengembalikan produk
        $data = [
            'isdelete' => 0,
            'deleted_by' => null,
            'deleted_at' => null
        ];
    
        // Update data produk dengan kondisi id_produk sesuai
        $model->edit('jenis', $data, ['id_jenis' => $id]);
    
        return redirect()->to('home/restore_jenissurat');
    }

    public function restore_suratmasuk()
    {   
        if (session()->get('level') == 0 || session()->get('level') == 1) {
    	$model= new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman restore surat masuk'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
        
        $data['elly'] = $model->tampil('surat_masuk', 'id_masuk');
        $where=array(
            'id_setting'=> 1
          );
          $data['setting'] = $model->getWhere('setting',$where);
          $data['currentMenu'] = 'restore_suratmasuk'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view ('menu',$data);
        echo view('restore_suratmasuk',$data);
        echo view ('footer');
         }else{
        return redirect()->to('home/error');
 
    } 
    }

    public function aksi_restore_suratmasuk($id) {
        $model = new M_office();
         $id_user = session()->get('id'); // Ambil ID user dari session
            $activity = 'Merestore surat masuk'; // Deskripsi aktivitas
            $this->addLog($id_user, $activity);
        
        // Data yang akan diupdate untuk mengembalikan produk
        $data = [
            'isdelete' => 0,
            'deleted_by' => null,
            'deleted_at' => null
        ];
    
        // Update data produk dengan kondisi id_produk sesuai
        $model->edit('surat_masuk', $data, ['id_masuk' => $id]);
    
        return redirect()->to('home/restore_suratmasuk');
    }

    public function restore_suratkeluar()
    {   
        if (session()->get('level') == 0 || session()->get('level') == 1) {
    	$model= new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman restore surat keluar'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
        
        $data['elly'] = $model->tampil('surat_keluar', 'id_keluar');
        $where=array(
            'id_setting'=> 1
          );
          $data['setting'] = $model->getWhere('setting',$where);
          $data['currentMenu'] = 'restore_suratkeluar'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view ('menu',$data);
        echo view('restore_suratkeluar',$data);
        echo view ('footer');
         }else{
        return redirect()->to('home/error');
 
    } 
    }

    public function aksi_restore_suratkeluar($id) {
        $model = new M_office();
         $id_user = session()->get('id'); // Ambil ID user dari session
            $activity = 'Merestore surat keluar'; // Deskripsi aktivitas
            $this->addLog($id_user, $activity);
        
        // Data yang akan diupdate untuk mengembalikan produk
        $data = [
            'isdelete' => 0,
            'deleted_by' => null,
            'deleted_at' => null
        ];
    
        // Update data produk dengan kondisi id_produk sesuai
        $model->edit('surat_keluar', $data, ['id_keluar' => $id]);
    
        return redirect()->to('home/restore_suratkeluar');
    }

    public function restore_cuti()
    {   
        if (session()->get('level') == 0 || session()->get('level') == 1) {
    	$model= new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman restore permohonana cuti'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
        
        $data['elly'] = $model->tampil('cuti', 'id_cuti');
        $where=array(
            'id_setting'=> 1
          );
          $data['setting'] = $model->getWhere('setting',$where);
          $data['currentMenu'] = 'restore_cuti'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view ('menu',$data);
        echo view('restore_cuti',$data);
        echo view ('footer');
         }else{
        return redirect()->to('home/error');
 
    } 
    }

    public function aksi_restore_cuti($id) {
        $model = new M_office();
         $id_user = session()->get('id'); // Ambil ID user dari session
            $activity = 'Merestore permohonan cuti'; // Deskripsi aktivitas
            $this->addLog($id_user, $activity);
        
        // Data yang akan diupdate untuk mengembalikan produk
        $data = [
            'isdelete' => 0,
            'deleted_by' => null,
            'deleted_at' => null
        ];
    
        // Update data produk dengan kondisi id_produk sesuai
        $model->edit('cuti', $data, ['id_cuti' => $id]);
    
        return redirect()->to('home/restore_cuti');
    }

    public function restore_keterlambatan()
    {   
        if (session()->get('level') == 0 || session()->get('level') == 1) {
    	$model= new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman restore keterlambatan kehadiran'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
        
        $data['elly'] = $model->tampil('keterlambatan', 'id_keterlambatan');
        $where=array(
            'id_setting'=> 1
          );
          $data['setting'] = $model->getWhere('setting',$where);
          $data['currentMenu'] = 'restore_keterlambatan'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view ('menu',$data);
        echo view('restore_keterlambatan',$data);
        echo view ('footer');
         }else{
        return redirect()->to('home/error');
 
    } 
    }

    public function aksi_restore_keterlambatan($id) {
        $model = new M_office();
         $id_user = session()->get('id'); // Ambil ID user dari session
            $activity = 'Merestore keterlambatan kehadiran'; // Deskripsi aktivitas
            $this->addLog($id_user, $activity);
        
        // Data yang akan diupdate untuk mengembalikan produk
        $data = [
            'isdelete' => 0,
            'deleted_by' => null,
            'deleted_at' => null
        ];
    
        // Update data produk dengan kondisi id_produk sesuai
        $model->edit('keterlambatan', $data, ['id_keterlambatan' => $id]);
    
        return redirect()->to('home/restore_keterlambatan');
    }


    public function restore_suratsurat()
    {   
        if (session()->get('level') == 0 || session()->get('level') == 1) {
    	$model= new M_office();
        $id_user = session()->get('id'); // Ambil ID user dari session
        $activity = 'Mengakses halaman restore surat'; // Deskripsi aktivitas
        $this->addLog($id_user, $activity);
        
        
        $data['elly'] = $model->tampil('surat_surat', 'id_surat');
        $where=array(
            'id_setting'=> 1
          );
          $data['setting'] = $model->getWhere('setting',$where);
          $data['currentMenu'] = 'restore_suratsurat'; // Sesuaikan dengan menu yang aktif
        echo view('header', $data);
        echo view ('menu',$data);
        echo view('restore_suratsurat',$data);
        echo view ('footer');
         }else{
        return redirect()->to('home/error');
 
    } 
    }

    public function aksi_restore_suratsurat($id) {
        $model = new M_office();
         $id_user = session()->get('id'); // Ambil ID user dari session
            $activity = 'Merestore surat'; // Deskripsi aktivitas
            $this->addLog($id_user, $activity);
        
        // Data yang akan diupdate untuk mengembalikan produk
        $data = [
            'isdelete' => 0,
            'deleted_by' => null,
            'deleted_at' => null
        ];
    
        // Update data produk dengan kondisi id_produk sesuai
        $model->edit('surat_surat', $data, ['id_surat' => $id]);
    
        return redirect()->to('home/restore_suratsurat');
    }


    public function dokumen()
{
    if (session()->get('level') >= 1 && session()->get('level') <= 7) {
        $model = new M_office();
        $id_user = session()->get('id');
        $activity = 'Mengakses halaman dokumen';
        $this->addLog($id_user, $activity);

        $userLevel = session()->get('level');
        $dokumenData = $model->tampil('jenis', 'id_jenis');

        $filteredDokumen = [];
        foreach ($dokumenData as $dokumen) {
            if ($model->checkAccess($userLevel, $dokumen->id_jenis)) {
                // Tambahkan akses level yang sudah dimiliki ke data dokumen
                $dokumen->access_levels = $model->getAccessByJenis($dokumen->id_jenis); 
                $filteredDokumen[] = $dokumen;
            }
        }

        $data['elly'] = $filteredDokumen;
        $where = ['id_setting' => 1];
        $data['setting'] = $model->getWhere('setting', $where);
        $data['currentMenu'] = 'dokumen';
        
        echo view('header', $data);
        echo view('menu', $data);
        echo view('dokumen', $data);
        echo view('footer');
    } else {
        return redirect()->to('home/error');
    }
}




    public function detail_dokumen($id_jenis)
{
    if (session()->get('level') >= 1 && session()->get('level') <= 7) {
        $model = new M_office();
        $id_user = session()->get('id'); 
        $activity = 'Mengakses halaman detail dokumen'; 
        $this->addLog($id_user, $activity);

        // Inisialisasi variabel sebagai array kosong
        $data['jenis'] = [];
        $data['cuti'] = [];
        $data['keterlambatan'] = [];
        $data['surat_masuk'] = [];
        $data['surat_keluar'] = [];
        $data['surat_surat'] = [];

        // Ambil data dari database dengan kondisi isdelete = 0
        $data['jenis'] = $model->getWhereres('jenis', ['id_jenis' => $id_jenis, 'isdelete' => 0]);
        $data['cuti'] = $model->getWhereres('cuti', ['id_jenis' => $id_jenis, 'isdelete' => 0]);
        $data['keterlambatan'] = $model->getWhereres('keterlambatan', ['id_jenis' => $id_jenis, 'isdelete' => 0]);
        $data['surat_masuk'] = $model->getWhereres('surat_masuk', ['id_jenis' => $id_jenis, 'isdelete' => 0]);
        $data['surat_keluar'] = $model->getWhereres('surat_keluar', ['id_jenis' => $id_jenis, 'isdelete' => 0]);
        $data['surat_surat'] = $model->getWhereres('surat_surat', ['id_jenis' => $id_jenis, 'isdelete' => 0]);
        $data['id_jenis'] = $id_jenis;

        $where = array(
            'id_setting' => 1
        );
        $data['setting'] = $model->getWhere('setting', $where);

        $data['currentMenu'] = 'dokumen';
        echo view('header', $data);
        echo view('menu', $data);
        echo view('detail_dokumen', $data); 
        echo view('footer');
    } else {
        return redirect()->to('home/error');
    }
}

    
public function save_access_level()
{
    // Periksa apakah request adalah POST
    if ($this->request->getMethod() === 'post') {
        $model = new M_office();

        // Ambil data dari form
        $id_jenis = $this->request->getPost('id_jenis');
        $access_levels = $this->request->getPost('access_level');

        // Hapus data akses sebelumnya untuk `id_jenis` yang sama (untuk menghindari duplikasi)
        $model->deleteAccessByJenis($id_jenis);

        // Loop setiap level akses yang dicentang dan simpan ke tabel akses
        if (!empty($access_levels)) {
            foreach ($access_levels as $level) {
                $data = [
                    'level' => $level,
                    'id_jenis' => $id_jenis,
                    'can_access' => 1 // 1 artinya memiliki akses
                ];
                $model->saveAccessLevel($data);
            }
        }

        // Redirect kembali ke halaman dokumen dengan pesan sukses
        return redirect()->to('home/dokumen')->with('success', 'Hak akses berhasil disimpan.');
    } else {
        // Redirect jika bukan POST request
        return redirect()->to('home/dokumen');
    }
}
   



}