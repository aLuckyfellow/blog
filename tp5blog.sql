-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2018-04-02 21:15:19
-- 服务器版本： 5.6.30-1
-- PHP Version: 7.0.20-2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tp5blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `blog_admin`
--

CREATE TABLE `blog_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_password` varchar(21) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_admin`
--

INSERT INTO `blog_admin` (`admin_id`, `admin_name`, `admin_password`) VALUES
(1, '马文欢', '123');

-- --------------------------------------------------------

--
-- 表的结构 `blog_arc_tag`
--

CREATE TABLE `blog_arc_tag` (
  `arc_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_arc_tag`
--

INSERT INTO `blog_arc_tag` (`arc_id`, `tag_id`) VALUES
(2, 5),
(1, 2),
(2, 4);

-- --------------------------------------------------------

--
-- 表的结构 `blog_article`
--

CREATE TABLE `blog_article` (
  `arc_id` int(11) NOT NULL,
  `arc_title` varchar(45) NOT NULL,
  `arc_author` varchar(45) NOT NULL COMMENT '作者',
  `arc_digest` varchar(2000) NOT NULL COMMENT '摘要',
  `arc_content` text NOT NULL,
  `sendtime` varchar(30) NOT NULL DEFAULT '0',
  `updatetime` int(11) NOT NULL DEFAULT '0',
  `arc_click` int(11) NOT NULL COMMENT '点击次数',
  `is_recycle` tinyint(4) NOT NULL DEFAULT '2' COMMENT '1代表在回收站，2代表不在',
  `arc_img` varchar(100) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `arc_sort` int(10) NOT NULL DEFAULT '100',
  `admin_name` varchar(110) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_article`
--

INSERT INTO `blog_article` (`arc_id`, `arc_title`, `arc_author`, `arc_digest`, `arc_content`, `sendtime`, `updatetime`, `arc_click`, `is_recycle`, `arc_img`, `cate_id`, `arc_sort`, `admin_name`) VALUES
(2, '优秀的程序员是不用机械键盘的', '知乎作者', '优秀的程序员是不用机械键盘的', '前几天我面试一个码农，连续几个专业问题他都没答上来。\r\n\r\n\r\n\r\n尴尬之余，我问他：「你没有什么理想吗？你现在最渴望得到的是什么？」\r\n\r\n\r\n\r\n码农转悠着大眼睛，不假思索道：「买个机械键盘！」\r\n\r\n\r\n\r\n真没想到在面试中居然还有这种操作。\r\n\r\n\r\n\r\n我问为什么这能成为现阶段最渴望的东西，他反问「你就没有写代码写的手疼的夜晚吗？寂寞长夜，总想轻轻松松的写代码，宽慰下双手啊。」\r\n\r\n\r\n\r\n好有道理我竟无法反驳。\r\n\r\n\r\n\r\n这么能说会道的码农，一定是个不可多得的人才！\r\n\r\n\r\n\r\n于是，我决定：不录取他。\r\n\r\n\r\n\r\n这几年，在中关村和后厂村闯来闯去，原本内向型人格的我，做事风格也逐渐变得风风火火，在高强度快节奏下像个工作机器，不带一丝情感绝对执行工作计划。\r\n\r\n\r\n\r\n无论是大公司，还是创业公司，这两个圈子的码农各个都能独挡一面，久而久之，我认识了太多优秀的码农，然后，我发现一个残酷的共同点——\r\n\r\n\r\n\r\n他们都不用机械键盘。\r\n\r\n\r\n\r\n不写代码吗？一个个都很能写代码，代码风格和优化水平都没得说。\r\n\r\n\r\n\r\n不独立吗？他们各个走南闯北，文能设计前端武能优化后端，面对千万bug无惧色。\r\n\r\n\r\n\r\n我问过其中一个码农，问：你渴望买一个机械键盘吗？\r\n\r\n\r\n\r\n他说：废话，肯定渴望。\r\n\r\n\r\n\r\n我问：为什么不买？钱不够？\r\n\r\n\r\n\r\n他叹气：不，太忙。\r\n\r\n\r\n\r\n他意味深长道：优秀的程序员都不用机械键盘的。\r\n\r\n\r\n\r\n跟我聊天的这个程序员，本身就是个富二代，电脑耳机都是几万的那种，想换就换，在工作之余，他用几年的时间上线了十几个app。\r\n\r\n\r\n\r\n他先前去美国读研，在美国工作了几年，回国后，并没有拿家里的钱，拿着在美国工作存下的积蓄，自己跑到北京创业。\r\n\r\n\r\n\r\n最开始半年，几乎把钱赔光了，死咬着牙不跟家里说，又死要面子不肯找投资，他拿信用卡贷款，终于在又一个半年后，转亏为盈。\r\n\r\n\r\n\r\n他还从来没有放弃过植发、抢包邮的格子衫。\r\n\r\n\r\n\r\n这样的男孩子，恐怕绝大多数机械键盘说买就买。\r\n\r\n\r\n\r\n我还认识一个后端。\r\n\r\n\r\n\r\n他是那种可以手动写汇编，他写过的代码不需要review就可以直接上线那种。这几年来，他的所有电子物品，包括iMac顶配、5K屏幕，都靠他一把装机送的戴尔8115键盘笔写出来的。\r\n\r\n\r\n\r\n程序员这个圈子，大多数人都苦苦挣扎，能写到他这个程度的，基本上出场就是千万QPS，压根不像传统意义上大家印象里的bug制造者。\r\n\r\n\r\n\r\n然而这个编程男孩却是程序员里的一股清流。\r\n\r\n\r\n\r\n他最大的爱好便是在家里学习新的技术，import tensorflow，include cublas，活得像是买不起机械键盘的小学生。\r\n\r\n\r\n\r\n程序员这个行业，只有走到金字塔塔尖才可以任性，他也一样，在圈子里有时候身不由己，会在奇葩产品经理的要求写一些脑残功能。\r\n\r\n\r\n\r\n同为IT产业的人，在面对市场仍是庸俗当道的大环境时，绝大多数人都被迫无奈会去买一把误以为能提高写代码速度的机械键盘，不同的牌子挑来挑去，人都会变得浮躁。\r\n\r\n\r\n\r\n他却不会受到影响。\r\n\r\n\r\n\r\n我问他：你到底怎么保持一颗平常心的，面对这么大的工作强度，却仍然可以用薄膜键盘应对一切？\r\n\r\n\r\n\r\n他笑，说：你小时候没考过试啊？尤其是必须用黑色签字笔的考试？\r\n\r\n\r\n\r\n我立刻懂了。\r\n\r\n\r\n\r\n即便是不喜欢的东西，也可以用专业态度去应对，在适度妥协的同时，依旧保持自己本真的创作。\r\n\r\n\r\n\r\n就好比小时候参加考试，我们都有几只五颜六色的笔，获得应试的分数保证自己不被家长、老师训斥后，依旧会在自己的作业本用自己真正想用的笔。\r\n\r\n\r\n\r\n这种本真，不是每个人都能坚持的，尤其是在出社会后，看尽繁华世界依旧不骄不躁，分得清妥协和执着的度，是非常难得的。\r\n\r\n\r\n\r\n他在写完那些代码后，依然在默默用自己的薄膜键盘，实在令人钦佩。\r\n\r\n\r\n\r\n像他这样仿佛活成仙的程序员，对于键盘，肯定不会有着庸俗的期待，他知道他会遇见怎样的需求和怎样的生产环境，所以，他不着急。\r\n\r\n\r\n\r\n我希望你明白，程序员的价值从来都是由自己的双手体现，而非由他的用的键盘。\r\n\r\n\r\n\r\n上周跟朋友吃饭，他说他认识的一些刚入门的程序员，总会认为程序员没必要太累去拼搏，应该多花些时间去选一个合适的键盘。\r\n\r\n\r\n\r\n他跟我说，「可你不一样，你会一直提醒我，要我远离舒适区，要我不能把问题归咎在键盘上，要我有危机意识，你好像特别看重程序员的独立思考。」\r\n\r\n\r\n\r\n好的程序员，在写代码时，手当然会累，也会想去挑一个合适的机械键盘。\r\n\r\n\r\n\r\n但是，若一个程序员真想成为他理想中的样子，仍是要不屈服于这个硬件至上的庸俗时代，仍是要不妥协于这个机械键盘满天飞的主流社会。\r\n\r\n\r\n\r\n仍是要永远年轻，永远热泪盈眶。', '2018-04-02 12:11:46', 0, 0, 2, 'http://image20.it168.com/201404_800x800/1802/6aec4cb20e41b81a.jpg', 4, 100, '马文欢');

-- --------------------------------------------------------

--
-- 表的结构 `blog_cate`
--

CREATE TABLE `blog_cate` (
  `cate_id` int(11) NOT NULL,
  `cate_name` varchar(40) NOT NULL,
  `cate_pid` int(11) NOT NULL COMMENT '父id',
  `cate_sort` int(11) NOT NULL COMMENT '栏目排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目管理';

--
-- 转存表中的数据 `blog_cate`
--

INSERT INTO `blog_cate` (`cate_id`, `cate_name`, `cate_pid`, `cate_sort`) VALUES
(1, 'PHP', 0, 1),
(3, 'JAVA', 0, 2),
(4, '程序员修养', 0, 3),
(5, '人生感悟', 0, 5);

-- --------------------------------------------------------

--
-- 表的结构 `blog_link`
--

CREATE TABLE `blog_link` (
  `link_id` int(10) NOT NULL,
  `link_name` varchar(50) NOT NULL,
  `link_url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_link`
--

INSERT INTO `blog_link` (`link_id`, `link_name`, `link_url`) VALUES
(1, '源宝网', 'www.ybao.org'),
(2, '诗词名句网', 'www.shicimingju.com');

-- --------------------------------------------------------

--
-- 表的结构 `blog_tag`
--

CREATE TABLE `blog_tag` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_tag`
--

INSERT INTO `blog_tag` (`tag_id`, `tag_name`) VALUES
(2, 'PHP'),
(3, 'JAVA '),
(4, '程序员的自我修养'),
(5, '程序员故事'),
(6, 'php基础知识');

-- --------------------------------------------------------

--
-- 表的结构 `blog_web`
--

CREATE TABLE `blog_web` (
  `web_name` varchar(50) NOT NULL,
  `web_id` int(10) NOT NULL,
  `web_melie` varchar(50) NOT NULL,
  `web_conypt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_web`
--

INSERT INTO `blog_web` (`web_name`, `web_id`, `web_melie`, `web_conypt`) VALUES
('潇欢博客', 1, '243484014@qq.com', '@北华大学');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_admin`
--
ALTER TABLE `blog_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `blog_article`
--
ALTER TABLE `blog_article`
  ADD PRIMARY KEY (`arc_id`);

--
-- Indexes for table `blog_cate`
--
ALTER TABLE `blog_cate`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `blog_link`
--
ALTER TABLE `blog_link`
  ADD PRIMARY KEY (`link_id`);

--
-- Indexes for table `blog_tag`
--
ALTER TABLE `blog_tag`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `blog_web`
--
ALTER TABLE `blog_web`
  ADD PRIMARY KEY (`web_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `blog_admin`
--
ALTER TABLE `blog_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `blog_article`
--
ALTER TABLE `blog_article`
  MODIFY `arc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `blog_cate`
--
ALTER TABLE `blog_cate`
  MODIFY `cate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `blog_link`
--
ALTER TABLE `blog_link`
  MODIFY `link_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `blog_tag`
--
ALTER TABLE `blog_tag`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `blog_web`
--
ALTER TABLE `blog_web`
  MODIFY `web_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
