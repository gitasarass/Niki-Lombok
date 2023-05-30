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
   <title>Destinasi</title>
   
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
            <h3>DESTINASI DI PULAU LOMBOK</h3>
         </div>
      </div>

   </div>

   </div>

</section>

</div>


<section class="category">

   <h1 class="heading">KATEGORI DESTINASI</h1>

   <div class="swiper category-slider">

   <div class="swiper-wrapper">

   <a href="category.php?category=laptop" class="swiper-slide slide">
      <img src="images/icon1.png" alt="">
      <h3>Pantai</h3>
   </a>

   <a href="category.php?category=tv" class="swiper-slide slide">
      <img src="images/icon2.png" alt="">
      <h3>Gunung</h3>
   </a>

   <a href="category.php?category=camera" class="swiper-slide slide">
      <img src="images/icon3.png" alt="">
      <h3>Air Terjun</h3>
   </a>

   <a href="category.php?category=mouse" class="swiper-slide slide">
      <img src="images/icon4.png" alt="">
      <h3>Gili</h3>
   </a>

   <a href="category.php?category=fridge" class="swiper-slide slide">
      <img src="images/icon5.png" alt="">
      <h3>Taman & Hiburan</h3>
   </a>

   <a href="category.php?category=washing" class="swiper-slide slide">
      <img src="images/icon6.png" alt="">
      <h3>Budaya</h3>
   </a>

   </div>

   <div class="swiper-pagination"></div>

   </div>

</section>


<section class="products">
   <div class="box-container">
      <?php
         $select_destination = $conn->prepare("SELECT * FROM `products`"); 
         $select_destination->execute();
         if($select_destination->rowCount() > 0){
            while($fetch_destination = $select_destination->fetch(PDO::FETCH_ASSOC)){
      ?>

         <form action="quick_view.php" method="get" class="box">
            <input type="hidden" name="pid" value="<?= $fetch_destination['id']; ?>">
            <input type="hidden" name="name" value="<?= $fetch_destination['name']; ?>">
            <input type="hidden" name="image" value="<?= $fetch_destination['image_01']; ?>">
            <button class="fas fa-heart" type="submit" name="add_to_wishlist"></button>
            <a href="quick_view.php?pid=<?= $fetch_destination['id']; ?>" class="fas fa-eye"></a>
            <img src="uploaded_img/<?= $fetch_destination['image_01']; ?>" alt="">
            <div class="name"><?= $fetch_destination['name']; ?></div>
            <div class="location"><?= $fetch_destination['location']; ?></div>
            <div class="details_mini"><?= $fetch_destination['details_mini']; ?></div>
            <a href="quick_view.php?pid=<?= $fetch_destination['id']; ?>">
               <input type="button" value="Lihat Detail" class="btn">
            </a>
         </form>
      <?php
            }
         } else {
            echo '<p class="empty">no products added yet!</p>';
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


</script>

</body>
</html>