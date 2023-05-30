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
   <title>NikiLombok</title>

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
         <div class="image">
            <img src="images/Vector.png" alt="">
         </div>
         <div class="content">
            <span>Eksploritasi Lebih Dekat</span>
            <h3>DESTINASI DI PULAU LOMBOK</h3>
            <a href="shop.php" class="btn">Destinasi</a>
         </div>
      </div>

      <div class="swiper-slide slide">
         <div class="image">
            <img src="images/Vector1.png" alt="">
         </div>
         <div class="content">
            <span>Eksploritasi Lebih Dekat</span>
            <h3>PENGINAPAN DENGAN VIEW MENARIK</h3>
            <a href="shop.php" class="btn">Penginapan</a>
         </div>
      </div>

      <div class="swiper-slide slide">
         <div class="image">
            <img src="images/Vector2.png" alt="">
         </div>
         <div class="content">
            <span>Eksploritasi Lebih Dekat</span>
            <h3>BUDAYA LOKAL LOMBOK</h3>
            <a href="shop.php" class="btn">Destinasi Budaya</a>
         </div>
      </div>

   </div>

      <div class="swiper-pagination"></div>

   </div>

</section>

</div>


<section class="category">

   <h1 class="heading">KATEGORI DESTINASI</h1>

   <div class="swiper category-slider">

   <div class="swiper-wrapper">

   <a href="category.php?category=pantai" class="swiper-slide slide">
      <img src="images/icon1.png" alt="">
      <h3>Pantai</h3>
   </a>

   <a href="category.php?category=gunung" class="swiper-slide slide">
      <img src="images/icon2.png" alt="">
      <h3>Gunung</h3>
   </a>

   <a href="category.php?category=air_terjun" class="swiper-slide slide">
      <img src="images/icon3.png" alt="">
      <h3>Air Terjun</h3>
   </a>

   <a href="category.php?category=gili" class="swiper-slide slide">
      <img src="images/icon4.png" alt="">
      <h3>Gili</h3>
   </a>

   <a href="category.php?category=taman" class="swiper-slide slide">
      <img src="images/icon5.png" alt="">
      <h3>Taman & Hiburan</h3>
   </a>

   <a href="category.php?category=budaya" class="swiper-slide slide">
      <img src="images/icon6.png" alt="">
      <h3>Budaya</h3>
   </a>

   </div>

   <div class="swiper-pagination"></div>

   </div>

</section>


<section class="home-about">

   <div class="flex">

      <div class="image">
         <img src="images/about.png" alt="">
      </div>

      <div class="content">
         <h3>Keindahan Pulau Lombok</h3>
         <p>Pulau Lombok merupakan pulau terbesar di gugusan kepulauan di provinsi NTB. Pulau Lombok menawarkan beragam destinasi wisata bagi para traveler yang ingin berkunjung, mulai wisata religi, keindahan pantai yang sangat eksotis, keindahan bawah laut, keindahan alam, air terjun yang sangat indah, pegunungan yang memukau, kaya ragam budaya, kenikmatan kuliner, dan lainnya.</p>
      </div>

   </div>

</section>


<section class="home-products">

   <h1 class="heading">Rekomendasi Destinasi</h1>

   <div class="swiper products-slider">

   <div class="swiper-wrapper">

   <?php
     $select_destination = $conn->prepare("SELECT * FROM `products` LIMIT 3"); 
     $select_destination->execute();
     if($select_destination->rowCount() > 0){
      while($fetch_destination = $select_destination->fetch(PDO::FETCH_ASSOC)){
   ?>
   <form action="quick_view.php" method="post" class="swiper-slide slide">
      <input type="hidden" name="pid" value="<?= $fetch_destination['id']; ?>">
      <input type="hidden" name="name" value="<?= $fetch_destination['name']; ?>">
      <input type="hidden" name="image" value="<?= $fetch_destination['image_01']; ?>">
      <a href="quick_view.php?pid=<?= $fetch_destination['id']; ?>" class="fas fa-eye"></a>
      <button class="fas fa-heart" type="submit" name="add_to_wishlist"></button>
      <img src="uploaded_img/<?= $fetch_destination['image_01']; ?>" alt="">
      <div class="name"><?= $fetch_destination['name']; ?></div>
      <div class="location"><?= $fetch_destination['location']; ?></div>
      <div class="details_mini"><?= $fetch_destination['details_mini']; ?></div>
      <a href="view.php?pid=<?= $fetch_destination['id']; ?>">
      <input type="submit" value="lihat detail" class="btn">
      </a>
   </form>
   <?php
      }
   }else{
      echo '<p class="empty">no products added yet!</p>';
   }
   ?>

   </div>

   <div class="swiper-pagination"></div>

   </div>

</section>

<section class="home2-about">

   <div class="flex">

      <div class="content">
         <h3>JANGAN LUPA JUGA KUNJUNGI VILLA DI LOMBOK </h3>
         <p>Anda pasti sudah pernah mendengar tentang penginapan di Lombok yang menghadap pantai dengan harga dibawah satu juta rupiah, tetapi apakah Anda tidak menginginkan sesuatu yang lebih mewah namun dengan harga yang rasional?
            Di sini kami telah menemukan pilihan penginapan menghadap lautan yang terbaik untuk Anda, dan tentunya jika Anda berpikir akan penginapan mewah yang terjangkau harganya di Lombok!</p>
      </div>

      <div class="image">
         <img src="images/216022879.jpg" alt="">
      </div>

   </div>

</section>


<section class="home-products">

   <h1 class="heading">Rekomendasi Villa</h1>

   <div class="swiper products-slider">

   <div class="swiper-wrapper">

   <?php
     $select_villas = $conn->prepare("SELECT * FROM `villas` LIMIT 3"); 
     $select_villas->execute();
     if($select_villas->rowCount() > 0){
      while($fetch_villas = $select_villas->fetch(PDO::FETCH_ASSOC)){
   ?>
   <form action="" method="post" class="swiper-slide slide">
      <input type="hidden" name="pid" value="<?= $fetch_villas['id']; ?>">
      <input type="hidden" name="name" value="<?= $fetch_villas['name']; ?>">
      <input type="hidden" name="price" value="<?= $fetch_villas['price']; ?>">
      <input type="hidden" name="image" value="<?= $fetch_villas['image_01']; ?>">
      <a href="view_villa.php?pid=<?= $fetch_villas['id']; ?>" class="fas fa-eye"></a>
      <img src="uploaded_img/<?= $fetch_villas['image_01']; ?>" alt="">
      <div class="name"><?= $fetch_villas['name']; ?></div>
      <div class="location"><?= $fetch_villas['location']; ?></div>
      <div class="details_mini"><?= $fetch_villas['details_mini']; ?></div>
      <a href="view_villa.php?pid=<?= $fetch_villas['id']; ?>"></a>
      <a href="checkout.php" class="btn">Booking Sekarang</a>
   </form>
   <?php
      }
   }else{
      echo '<p class="empty">no villa added yet!</p>';
   }
   ?>

   </div>

   <div class="swiper-pagination"></div>

   </div>

</section>







<?php include 'components/footer.php'; ?>

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<script src="js/script.js"></script>

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