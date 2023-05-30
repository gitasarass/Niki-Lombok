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
   <title>Kategori</title>
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="products">

   <h1 class="heading">Kategori Destinasi</h1>

   <div class="box-container">

   <?php
      $category = $_GET['category'];
      $select_destination = $conn->prepare("SELECT * FROM `products` WHERE category = ?"); 
      $select_destination->execute([$category]);if($select_destination->rowCount() > 0){
         while($fetch_destination = $select_destination->fetch(PDO::FETCH_ASSOC)){
            ?>
      <form action="" method="post" class="box">
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
      }else{
      echo '<p class="empty">Tidak ada produk yang ditemukan!</p>';
      }
   ?>
   </div>

</section>

<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>