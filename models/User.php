<?php
/**
 * Jobskee - open source job board 
 *
 * @author      Ahmed Almuhayshi
 * @license     MIT
 * @url         http://www.jobskee.com
 * 
 * Pages class handles managing page content
 */

class User
{
    
    public function __construct()
    { 
    
    }

    public  static function getUserIdByEmail($email){
        $user_id = R::getCol('select id from user where email =:email',array(':email'=>$email));
        if(isset($user_id)){
            return $user_id[0];
        }
        return false;
    }

    function addNewUser($data){

        $user = R::dispense('user');

        //
//         `id` int(11) NOT NULL,
//   `group_id` int(11) NOT NULL,
//   `username` varchar(20) NOT NULL,
//   `password` varchar(50) NOT NULL,
//   `firstname` varchar(32) NOT NULL,
//   `secondname` varchar(32) DEFAULT NULL,
//   `lastname` varchar(32) NOT NULL,
//   `email` varchar(96) NOT NULL,
//   `mobile` varchar(15) DEFAULT NULL,
//   `image` varchar(255) NOT NULL,
//   `status` tinyint(1) NOT NULL,
//   `created` datetime NOT NULL
        //
        //$user->job_id = $this->_job_id;
        $user->group_id = $data['user_group'];
        $user->firstname = $data['firstname'];
        $user->secondname = $data['secondname'];
        $user->lastname = $data['lastname'];
        $user->username = $data['username'];
        $user->email = $data['email'];
        $user->mobile = $data['mobile'];
        $user->password = sha1($data['password']);
        $user->status = 1;
        $user->created = R::isoDateTime();

        if(ISSET($data['user_id'])){
            $user->id = $data['user_id'];
        }

        $id = R::store($user);
        
        if(ISSET($data['qualifications'])){

            foreach ($data['qualifications'] as $q) {
                $category = R::getCol('select id from categories where Code =:code',array(':code'=>$q));
               if(ISSET($category[0])){
                    R::exec('INSERT INTO user_category (user_id,category_id) VALUES (:user_id,:category_id)',
                    array(':user_id'=>$id,':category_id'=>$category[0])
                    );
                }

            }
        }

        $data['recipient'] = $data['email'];
        
        $notif = new Notifications();
        // if ($notif->SendSignupMail($data)) {
            
        // }
        return $user;

    }


}