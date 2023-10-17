-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2023 at 02:53 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(2, 'Cat4', 1),
(3, 'Cat1', 1),
(5, 'Cat6', 1),
(7, 'Cat9', 1),
(8, 'Joggers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(1, 'Vishal', 'vishal@gmail.com', '1234567890', 'Test Query', '2020-01-14 00:00:00'),
(2, 'vishal@gmail.com', '', '1234567890', 'testing', '2020-01-19 07:59:38'),
(3, 'Vishal', 'vishal@gmail.com', '1234567890', 'testing', '2020-01-19 08:00:09');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `mihpayid` varchar(20) NOT NULL,
  `payu_status` varchar(10) NOT NULL,
  `added_on` date NOT NULL DEFAULT current_timestamp(),
  `expected_on` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `txnid`, `mihpayid`, `payu_status`, `added_on`, `expected_on`) VALUES
(1, 2, 'My Address', 'Bareilly/UP', 110001, 'COD', 102, 'pending', 5, '', '', '', '2020-02-15', '2023-09-10'),
(2, 2, 'My Address', 'Bareilly/UP', 110001, 'COD', 102, 'pending', 3, '', '', '', '2020-02-15', '2023-09-10'),
(3, 2, 'Delhi', 'Delhi', 110076, 'payu', 396, 'pending', 1, '', '', '', '2020-02-26', '2023-09-10'),
(4, 2, 'Delhi', 'Delhi', 110076, 'payu', 882, 'pending', 1, 'cf8359e953961214d4fb', '', '', '2020-02-26', '2023-09-10'),
(5, 2, 'Delhi', 'Delhi', 110076, 'payu', 98, 'success', 1, '91a790fe5652ed21fa43', '403993715520641834', '', '2020-02-26', '2023-09-10'),
(6, 2, 'delhi', 'delhi', 110076, 'payu', 12, 'success', 1, 'c91f6e83dae6bb4e4143', '403993715520641836', '', '2020-02-26', '2023-09-10'),
(7, 5, 'ambika supermarket', 'pune', 411044, 'COD', 99, 'pending', 1, '5f8cf714601c44ce0d24', '', '', '2023-09-09', '2023-09-10'),
(8, 6, 'vadgaon mawal', 'pune/', 411044, 'COD', 98, 'pending', 1, '7bc9d44264c37053f700', '', '', '2023-09-09', '2023-09-10'),
(9, 5, 'wakad', 'pune', 411044, 'COD', 197, 'pending', 1, '8e008ad1d73caddfedbb', '', '', '2023-09-10', '0000-00-00'),
(10, 4, 'warje', 'pune', 445562, 'COD', 3, 'pending', 1, '0deec48bbaf100c7cbd4', '', '', '2023-09-10', '2023-09-15'),
(11, 6, 'puranakila', 'siwan', 841226, 'COD', 99, 'pending', 1, '5b81a4ea146b056f1b09', '', '', '2023-09-10', '2023-09-15');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(1, 1, 4, 1, 99),
(2, 1, 1, 1, 3),
(3, 2, 4, 1, 99),
(4, 2, 1, 1, 3),
(5, 3, 4, 4, 99),
(6, 4, 5, 9, 98),
(7, 5, 5, 1, 98),
(8, 6, 1, 4, 3),
(9, 7, 4, 1, 99),
(10, 8, 5, 1, 98),
(11, 9, 4, 1, 99),
(12, 9, 5, 1, 98),
(13, 10, 1, 1, 3),
(14, 11, 4, 1, 99);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(1, 5, 'Product3', 2, 3, 4, '287733289_3.jpg', '5', '6', '7', '', '9', 1),
(4, 5, 'Product2', 100, 99, 12, '119845920_2.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pellentesque ipsum sed pharetra pellentesque. Nulla tristique, dolor et viverra vestibulum, urna dui finibus massa, vel dapibus ligula sapien eu velit. Sed sit amet semper quam. Nam convallis nunc eget quam porta, nec sodales ligula rutrum. Maecenas volutpat scelerisque facilisis. Maecenas consequat erat vitae mauris iaculis, sit amet bibendum nisl scelerisque. Fusce pellentesque laoreet est, eu porta nunc finibus id. Fusce egestas ante ac augue facilisis, vitae volutpat nunc commodo. Proin consectetur quam at venenatis eleifend. Duis vel libero luctus, iaculis libero congue, molestie tortor.', 'test', '', 'test', 1),
(5, 7, 'Product 1', 100, 98, 8, '578369140_1 (1).jpg', 'test', 'test', 'test', '', 'test', 1),
(6, 8, 'HM', 2000, 1500, 1, '879513514_original-imagj4qqtzbfzpby.png', 'rtrey', 'dgfgdfdfgfdf', 'dfgdfg', 'dfgfd', 'fddfh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(1, 'Vishal Gupta', '', 'vishal@gmail.com', '1234567890', '2020-01-14 00:00:00'),
(2, 'Vishal', 'vishal', 'phpvishal@gmail.com', '12345678980', '2020-01-22 08:33:08'),
(3, 'Vishal', 'vishal', 'phpvishal1@gmail.com', '1234567890', '2020-01-22 08:34:18'),
(4, 'demo', 'demo', 'demo@gmail.com', '789879789879', '2023-09-09 08:58:00'),
(5, 'asif', 'asif', 'asif@gmail.com', '7497910419', '2023-09-09 09:05:44'),
(6, 'laura', 'laura', 'laura@gmail.com', '7894561231', '2023-09-09 11:35:49'),
(7, 'Danish', 'dani@gmail.com', 'dani@gmail.com', '7541902194', '2023-09-09 11:46:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
