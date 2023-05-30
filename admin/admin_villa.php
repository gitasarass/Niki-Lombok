<?php

include '../components/connect.php';

session_start();

$admin_id = $_SESSION['admin_id'];

if(isset($_POST['add_product'])){

   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $price = $_POST['price'];
   $price = filter_var($price, FILTER_SANITIZE_STRING);
   $location = $_POST['location'];
   $location = filter_var($location, FILTER_SANITIZE_STRING);
   $details = $_POST['details'];
   $details = filter_var($details, FILTER_SANITIZE_STRING);
   $details_mini = $_POST['details_mini'];
   $details_mini = filter_var($details_mini, FILTER_SANITIZE_STRING);

   $image_01 = $_FILES['image_01']['name'];
   $image_01 = filter_var($image_01, FILTER_SANITIZE_STRING);
   $image_size_01 = $_FILES['image_01']['size'];
   $image_tmp_name_01 = $_FILES['image_01']['tmp_name'];
   $image_folder_01 = '../uploaded_img/'.$image_01;

   $image_02 = $_FILES['image_02']['name'];
   $image_02 = filter_var($image_02, FILTER_SANITIZE_STRING);
   $image_size_02 = $_FILES['image_02']['size'];
   $image_tmp_name_02 = $_FILES['image_02']['tmp_name'];
   $image_folder_02 = '../uploaded_img/'.$image_02;

   $image_03 = $_FILES['image_03']['name'];
   $image_03 = filter_var($image_03, FILTER_SANITIZE_STRING);
   $image_size_03 = $_FILES['image_03']['size'];
   $image_tmp_name_03 = $_FILES['image_03']['tmp_name'];
   $image_folder_03 = '../uploaded_img/'.$image_03;

   $select_villas = $conn->prepare("SELECT * FROM `villas` WHERE name = ?");
   $select_villas->execute([$name]);

   if($select_villas->rowCount() > 0){
      $message[] = 'Nama villa sudah ada!';
   }else{

      $insert_villas = $conn->prepare("INSERT INTO `villas`(name, price, details, details_mini, location, image_01, image_02, image_03) VALUES(?,?,?,?,?,?,?,?)");
      $insert_villas->execute([$name, $price, $details, $details_mini, $location, $image_01, $image_02, $image_03]);

      if($insert_villas){
         if($image_size_01 > 2000000 OR $image_size_02 > 2000000 OR $image_size_03 > 2000000){
            $message[] = 'ukuran gambar terlalu besar!';
         }else{
            move_uploaded_file($image_tmp_name_01, $image_folder_01);
            move_uploaded_file($image_tmp_name_02, $image_folder_02);
            move_uploaded_file($image_tmp_name_03, $image_folder_03);
            $message[] = 'villa telah ditembahkan!';
         }

      }

   }

};

if(isset($_GET['delete'])){

   $delete_id = $_GET['delete'];
   $delete_product_image = $conn->prepare("SELECT * FROM `villas` WHERE id = ?");
   $delete_product_image->execute([$delete_id]);
   $fetch_delete_image = $delete_product_image->fetch(PDO::FETCH_ASSOC);
   unlink('../uploaded_img/'.$fetch_delete_image['image_01']);
   unlink('../uploaded_img/'.$fetch_delete_image['image_02']);
   unlink('../uploaded_img/'.$fetch_delete_image['image_03']);
   $delete_product = $conn->prepare("DELETE FROM `villas` WHERE id = ?");
   $delete_product->execute([$delete_id]);
   $delete_cart = $conn->prepare("DELETE FROM `cart` WHERE pid = ?");
   $delete_cart->execute([$delete_id]);
   $delete_wishlist = $conn->prepare("DELETE FROM `wishlist` WHERE pid = ?");
   $delete_wishlist->execute([$delete_id]);
   header('location:admin_villa.php');


}


?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title> VILLA </title>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <link rel="stylesheet" href="../css/admin_style.css">

</head>
<body>

<?php include '../components/admin_header.php'; ?>

<section class="add-products">

   <h1 class="heading"> TAMBAH VILLA </h1>

   <form action="" method="POST" enctype="multipart/form-data">
      
   <form action="" method="post" enctype="multipart/form-data">
      <div class="flex">
         <div class="inputBox">
            <span> Nama Villa </span>
            <input type="text" class="box" required maxlength="100" placeholder="ketik nama villa" name="name">
         </div>
         <div class="inputBox">
            <span> Lokasi </span>
            <input type="text" class="box" required maxlength="100" placeholder=" ketik lokasi " name="location">
         </div>
         <div class="inputBox">
            <span> Harga </span>
            <input type="number" min="0" name="price" class="box" required placeholder="enter product price">
         </div>
        <div class="inputBox">
            <span>Gambar 1</span>
            <input type="file" name="image_01" accept="image/jpg, image/jpeg, image/png, image/webp" class="box" required>
        </div>
        <div class="inputBox">
            <span>Gambar 2</span>
            <input type="file" name="image_02" accept="image/jpg, image/jpeg, image/png, image/webp" class="box" required>
        </div>
        <div class="inputBox">
            <span>Gambar 3</span>
            <input type="file" name="image_03" accept="image/jpg, image/jpeg, image/png, image/webp" class="box" required>
        </div>
         <div class="inputBox">
            <span>Deskripsi</span>
            <textarea name="details" placeholder="ketik deskripsi" class="box" required maxlength="5000" cols="300" rows="100"></textarea>
         </div>
         <div class="inputBox">
            <span>Deskripsi Singkat</span>
            <textarea name="details_mini" placeholder="ketik deskripsi" class="box" required maxlength="500" cols="30" rows="10"></textarea>
         </div>
      </div>
      
      <input type="submit" value="tambah villa" class="btn" name="add_product">
   </form>

</section>

<section class="show-products">

   <h1 class="heading">VILLA DITAMBAHKAN</h1>

   <div class="box-container">

   <?php
      $show_villas = $conn->prepare("SELECT * FROM `villas`");
      $show_villas->execute();
      if($show_villas->rowCount() > 0){
         while($fetch_villas = $show_villas->fetch(PDO::FETCH_ASSOC)){  
   ?>
   <div class="box">
   <div class="price">IDR <?= $fetch_villas['price']; ?>K</div>
      <img src="../uploaded_img/<?= $fetch_villas['image_01']; ?>" alt="">
      <div class="name"><?= $fetch_villas['name']; ?></div>
      <div class="location"><?= $fetch_villas['location']; ?></div>
      <div class="details_mini"><?= $fetch_villas['details_mini']; ?></div>
      <div class="flex-btn">
         <a href="update_villas.php?update=<?= $fetch_villas['id']; ?>" class="option-btn">Ubah</a>
         <a href="admin_villas.php?delete=<?= $fetch_villas['id']; ?>" class="delete-btn" onclick="return confirm('delete this product?');">Hapus</a>
      </div>
   </div>
   <?php
      }
   }else{
      echo '<p class="empty">Tambah Villa sekarang!</p>';
   }
   ?>
   
   </div>

</section>








<script src="../js/admin_script.js"></script>
   
</body>
</html>