<!DOCTYPE html>
<html lang="en">
<style>
    h1 {
        font-family: 'Courier New', Courier, monospace;
        font-weight: bold;
    }
</style>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/animations.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/login.css">
    <meta property="og:image" content="../img/doc.jpg" />

    <title> Medical Appointment System</title>



</head>
<link rel="icon" type="image/png" href="img/doc.jpg" />


<body>
    <?php

    //learn from w3schools.com
    //Unset all the server side variables

    session_start();

    $_SESSION["user"] = "";
    $_SESSION["usertype"] = "";

    // Set the new timezone
    date_default_timezone_set('Asia/Kolkata');
    $date = date('Y-m-d');

    $_SESSION["date"] = $date;


    //import database
    include("connection.php");





    if ($_POST) {

        $email = $_POST['useremail'];
        $password = md5($_POST['userpassword']);

        $error = '<label for="promter" class="form-label"></label>';

        $result = $database->query("select * from webuser where email='$email'");

        if ($result->num_rows == 1) {

            $utype = $result->fetch_assoc()['usertype'];

            $res = $database->query("select * from webuser where email='$email'");
            $status = $res->fetch_assoc()['status'];

            if ($status == 0) {
                require('./function.php');

                $otp = mt_rand(100000, 999999);

                // insert into otp table
                $database->query("insert into otp(otp_code, email) values('$otp','$email')");

                $subject = "Medical Appointment System: OTP";
                $message = "Your OTP is: " . $otp;

                if (SendMail($email, $subject, $message)) {
                    $_SESSION['verify-otp'] = $otp;
                    $_SESSION['verify-email'] = $email;
                    header('location: verify-email.php');
                } else {
                    $error = '<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">Something went wrong. Please try again later.</label>';
                }
            } elseif ($status == 1) {

                if ($utype == 'p') {

                    // check the hashed password using md5
                    $checked_password = $password;

                    $checker = $database->query("select * from patient where pemail='$email' and ppassword='$checked_password'");
                    if ($checker->num_rows == 1) {

                        $database->query("insert into patient_logs(email, logs) values('$email', 'login')");

                        //   Patient dashbord
                        $_SESSION['user'] = $email;
                        $_SESSION['usertype'] = 'p';

                        header('location: patient/index.php');
                    } else {
                        $error = '<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">Wrong credentials: Invalid email or password</label>';
                    }
                } elseif ($utype == 'a') {
                    //TODO
                    $checker = $database->query("select * from admin where aemail='$email' and apassword='$password'");
                    if ($checker->num_rows == 1) {


                        //   Admin dashbord
                        $_SESSION['user'] = $email;
                        $_SESSION['usertype'] = 'a';

                        header('location: admin/index.php');
                    } else {
                        $error = '<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">Wrong credentials: Invalid email or password</label>';
                    }
                } elseif ($utype == 'd') {
                    $checked_password = $password;
                    //TODO
                    $checker = $database->query("select * from doctor where docemail='$email' and docpassword='$checked_password'");
                    if ($checker->num_rows == 1) {

                        // insert doctor_logs table
                        $database->query("insert into doctor_logs(email, logs) values('$email', 'login')");

                        //   doctor dashbord
                        $_SESSION['user'] = $email;
                        $_SESSION['usertype'] = 'd';
                        header('location: doctor/index.php');
                    } else {
                        $error = '<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">Wrong credentials: Invalid email or password</label>';
                    }
                }
            } else {
                $error = '<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">Something went wrong. Please try again later.</label>';
            }
        } else {
            $error = '<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">We cant found any acount for this email.</label>';
        }
    } else {
        $error = '<label for="promter" class="form-label">&nbsp;</label>';
    }

    ?>


    <center>
        <h1> MEDICAL APPOINTMENT SYSTEM</h1>
        <div class="container">
            <table border="0" style="margin: 0;padding: 0;width: 60%;">
                <tr>
                    <td>
                        <p class="header-text">Welcome Back!</p>
                    </td>
                </tr>
                <div class="form-body">
                    <tr>
                        <td>
                            <p class="sub-text">Login with your details to continue</p>
                        </td>
                    </tr>
                    <tr>
                        <form action="" method="POST">

                            <td class="label-td">
                                <label for="useremail" class="form-label">Email: </label>
                            </td>
                    </tr>
                    <tr>
                        <td class="label-td">
                            <input type="email" name="useremail" class="input-text" placeholder="Email Address" required>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-td">
                            <label for="userpassword" class="form-label">Password: </label>
                        </td>
                    </tr>

                    <tr>
                        <td class="label-td">
                            <input type="Password" name="userpassword" class="input-text" placeholder="Password" required>
                        </td>
                    </tr>


                    <tr>
                        <td><br>
                            <?php echo $error ?>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <input type="submit" value="Login" class="login-btn btn-primary btn">
                            <a href="get-verified-email.php" class="hover-link1 non-style-link">
                                <label for="" class="sub-text" style="font-weight: 280;">Forgot Password&#63; </label>
                            </a>
                        </td>
                    </tr>
                </div>
                <tr>
                    <td>
                        <br>
                        <label for="" class="sub-text" style="font-weight: 280;">Don't have an account&#63; </label>
                        <a href="signup.php" class="hover-link1 non-style-link">Sign Up</a>
                        <br><br><br>
                    </td>
                </tr>

                </form>
            </table>

        </div>
    </center>
</body>

</html>