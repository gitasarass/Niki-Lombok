<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

include 'components/wishlist_cart.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>DETAIL</title>
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="quick-view">

   <?php
     $pid = $_GET['pid'];
     $select_destination = $conn->prepare("SELECT * FROM `products` WHERE id = ?"); 
     $select_destination->execute([$pid]);
     if($select_destination->rowCount() > 0){
      while($fetch_destination = $select_destination->fetch(PDO::FETCH_ASSOC)){
   ?>
   <form action="" method="post" class="box">
      <input type="hidden" name="pid" value="<?= $fetch_destination['id']; ?>">
      <input type="hidden" name="name" value="<?= $fetch_destination['name']; ?>">
      <input type="hidden" name="image" value="<?= $fetch_destination['image_01']; ?>">
      <div class="row">
         <div class="image-container">
            <div class="main-image">
               <img src="uploaded_img/<?= $fetch_destination['image_01']; ?>" alt="">
            </div>
            <div class="sub-image">
               <img src="uploaded_img/<?= $fetch_destination['image_01']; ?>" alt="">
               <img src="uploaded_img/<?= $fetch_destination['image_02']; ?>" alt="">
               <img src="uploaded_img/<?= $fetch_destination['image_03']; ?>" alt="">
            </div>
         </div>
         <div class="content">
            <div class="name"><?= $fetch_destination['name']; ?></div>
            <div class="details">
               <h3>DESKRIPSI</h3>
               <?= $fetch_destination['details']; ?></div>
            <div class="location">
               <h3>LOKASI</h3>
               <?= $fetch_destination['location']; ?></div>
            <div class="maps">
               <h3>MAPS</h3>
               <?= $fetch_destination['maps']; ?></div>
            <div class="flex-btn">
               <input class="option-btn" type="submit" name="add_to_wishlist" value="add to wishlist">
            </div>
         </div>
      </div>
   </form>
   <?php
      }
   }else{
      echo '<p class="empty">no products added yet!</p>';
   }
   ?>

</section>













<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>