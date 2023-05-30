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
   <title>Penginapan</title>
   
   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>


<div class="home-bg">

<section class="home">

   <div class="swiper home-slider">
   
   <div class="swiper-wrapper">

      <div class="swiper-slide slide">
         <div class="content">
            <span>Eksploritasi Lebih Dekat</span>
            <h3>PENGINAPAN DI PULAU LOMBOK</h3>
         </div>
      </div>

   </div>

   </div>

</section>

</div>

<section class="products">
   <div class="box-container">
      <?php
         $select_villas = $conn->prepare("SELECT * FROM `villas`"); 
         $select_villas->execute();
         if($select_villas->rowCount() > 0){
            while($fetch_villas = $select_villas->fetch(PDO::FETCH_ASSOC)){
      ?>

         <form action="" method="post" class="box">
            <input type="hidden" name="pid" value="<?= $fetch_villas['id']; ?>">
            <input type="hidden" name="name" value="<?= $fetch_villas['name']; ?>">
            <input type="hidden" name="image" value="<?= $fetch_villas['image_01']; ?>">
            <a href="view_villa.php?pid=<?= $fetch_villas['id']; ?>" class="fas fa-eye"></a>
            <img src="uploaded_img/<?= $fetch_villas['image_01']; ?>" alt="">
            <div class="name"><?= $fetch_villas['name']; ?></div>
            <div class="location"><?= $fetch_villas['location']; ?></div>
            <div class="details_mini"><?= $fetch_villas['details_mini']; ?></div>
            <a href="checkout.php" class="btn">Booking Sekarang</a>
         </form>
      <?php
            }
         } else {
            echo '<p class="empty">no villa added yet!</p>';
         }
      ?>
   </div>
</section>

<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>


<script>

var swiper = new Swiper(".home-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
    },
});

 var swiper = new Swiper(".category-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
   breakpoints: {
      0: {
         slidesPerView: 2,
       },
      650: {
        slidesPerView: 3,
      },
      768: {
        slidesPerView: 4,
      },
      1024: {
        slidesPerView: 5,
      },
   },
});

var swiper = new Swiper(".products-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
   breakpoints: {
      550: {
        slidesPerView: 2,
      },
      768: {
        slidesPerView: 2,
      },
      1024: {
        slidesPerView: 3,
      },
   },
});

</script>

</body>
</html>