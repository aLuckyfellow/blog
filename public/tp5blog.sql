-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?03 �?22 �?11:30
-- 服务器版本: 5.5.53
-- PHP 版本: 5.5.38

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `tp5blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `blog_admin`
--

CREATE TABLE IF NOT EXISTS `blog_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `admin_password` varchar(21) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `blog_admin`
--

INSERT INTO `blog_admin` (`admin_id`, `admin_name`, `admin_password`) VALUES
(1, '马文欢', '12');

-- --------------------------------------------------------

--
-- 表的结构 `blog_arc_tag`
--

CREATE TABLE IF NOT EXISTS `blog_arc_tag` (
  `arc_id` int(20) NOT NULL,
  `tag_id` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog_arc_tag`
--

INSERT INTO `blog_arc_tag` (`arc_id`, `tag_id`) VALUES
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(2, 4);

-- --------------------------------------------------------

--
-- 表的结构 `blog_article`
--

CREATE TABLE IF NOT EXISTS `blog_article` (
  `arc_id` int(11) NOT NULL AUTO_INCREMENT,
  `arc_title` varchar(45) NOT NULL,
  `arc_author` varchar(45) NOT NULL COMMENT '作者',
  `arc_digest` varchar(2000) NOT NULL COMMENT '摘要',
  `arc_content` text NOT NULL,
  `sendtime` varchar(30) NOT NULL DEFAULT '0',
  `updatetime` int(11) NOT NULL DEFAULT '0',
  `arc_click` int(11) NOT NULL COMMENT '点击次数',
  `is_recycle` tinyint(4) NOT NULL DEFAULT '2' COMMENT '1代表在回收站，2代表不在',
  `arc_img` varchar(2000) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `arc_sort` int(10) NOT NULL DEFAULT '100',
  `admin_name` varchar(110) NOT NULL,
  PRIMARY KEY (`arc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `blog_article`
--

INSERT INTO `blog_article` (`arc_id`, `arc_title`, `arc_author`, `arc_digest`, `arc_content`, `sendtime`, `updatetime`, `arc_click`, `is_recycle`, `arc_img`, `cate_id`, `arc_sort`, `admin_name`) VALUES
(1, 'PHP 死锁问题分析', 'php100论坛', '对于死锁的问题，人们往往想到出现一些关于访问很缓慢，有白页现象，要是测试环境（我就真实遇到测试环境有本文谈及一样的问题）你也就重启一下PHP的php-fpm进程发现又好了', '背景：对于死锁的问题，人们往往想到出现一些关于访问很缓慢，有白页现象，要是测试环境（我就真实遇到测试环境有本文谈及一样的问题）你也就重启一下PHP的php-fpm进程发现又好了，隔一段时间又出类似的问题，你会看下日志，你会发现有很多日志是“Max execution timeout of 60 seconds exceeded”，你会发现这可能是一些php的守护进程导致的，你为了解决测试环境的问题，于是觉得应该把那个php-fpm的进程数开多点，可能会好一些，于是你开多了，一直没有面对这个问题的原因，为什么呢，因为公司装PHP的是运维装的，你没有办法或时间去装一个debug版本的php，你说这个问题让运维的人来查，你觉得能查出来？So，这个问题一拖再拖，但就是没解决，但是有一天你发现磁盘满了，用du去看整体时发现满了，但是如果一个个目录去看发现并没有占用多少，也万万没有想到PHP的死锁还会导致磁盘空间占用太多，上面这种情况我就真实遇到过，后来重新reboot操作系统，磁盘又回来了，所以，我认为是一篇好文章，所以转了此文，也想说明对于PHP的扩展这方面代码质量把关需要严格，再就是PHP本身关于锁这块要弱化（除开cookie/session和cache锁外，其它能不用就不用），尽可能少用锁，这是博主一点小看法，下面言归正传。\r\n\r\n引子：\r\n\r\n本期我们邀请到了 云盘服务端 团队的技术达人- 徐铁成，一个隐蔽已久的PHP死锁问题被层层掘出，感谢铁成为我们带来这次畅快的体验，小伙伴们，准备好这次技术之旅了么？\r\n\r\n---------------\r\n\r\n发现问题\r\n\r\n近期发现线上很多机器的磁盘空间报警， 且日志文件已经清理，但是磁盘空间没有释放。通过ps aux | grep php-cgi 发现， 很多进程的启动时间在几天到几周甚至几个月之前。我们线上的php-cgi都有最大执行次数的。一般在1天内都会重启一次。初步结论，这些cgi进程有问题。\r\n\r\n通过lsof -p [pid] 发现， 启动时间很久的cgi进程中打开了一些日志文件句柄，并且没有关闭。这些日志文件在文件系统中已经删除了。但是句柄没关闭，导致磁盘空间没有释放。到此，磁盘空间异常的问题基本确定。是由于cgi没有关闭文件句柄造成的。\r\n\r\n进一步分析进程， strace -p [pid]， 发现所有异常的进程都阻塞与 fmutex 状态。换句话所，异常的cgi进程死锁了。进程死锁导致打开的文件句柄没有关闭，所以导致磁盘空间异常。\r\n\r\n为什么cgi进程会死锁呢？\r\n\r\n什么是死锁\r\n\r\n学过操作系统的通同学，都了解多线程的概念。在多线程中访问公共资源，需要对资源加锁。访问结束后，释放锁。如果没有释放锁，那么下一个线程来获取资源的时候就会永远都无法获取资源的锁，于是这个线程死锁了。那么CGI是多线程的公共资源访问导致的死锁吗？ 答案是NO。\r\n\r\n1. CGI 是单线程进程，通过ps 就能看到。（进程状态 Sl的才是多线程进程）。\r\n\r\n2. 即使是多线程的，死锁发生在PHP的shutdown过程中调用glibc 中time 函数的位置，不是php模块造成的。而glibc 中的time相关函数是线程安全的，不会产生死锁。\r\n\r\n那是什么导致的死锁呢？\r\n\r\n通过分析linux中死锁产生的机制，发现除了多线程会产生死锁外，信号处理函数同样会产生死锁。那么cgi是由于信号处理导致的死锁吗？在这之前介绍一个感念。\r\n\r\n函数的可重入性与信号安全\r\n\r\n函数可重入是指，无论第几次进入该函数，函数都能正常执行并返回结果。那么线程安全函数是可重入的吗？答案是NO。 线程安全函数，在第一次访问公共资源时，会获取全局锁。如果函数没有执行完成，锁还没释放，此时进程被中断。那么在中断处理函数中，再次访问该函数，就会产生死锁。那么什么样的函数才可以在中断处理函数中访问呢？ 除了没有使用全局锁的函数，还有一些signal safe的系统调用可以使用。调用任何其他的非signal safe的函数都会产生不可预知的后果（比如 死锁）。 详见 man signal。在分析死锁的原因前，我们先看看cgi执行的流程，分析其中有没有产生死锁的可能。\r\n\r\nPHP-CGI的执行流程\r\n\r\nGlibc中的时间函数使用到了全局锁，保证函数的线程安全，但没有保证信号安全（signal safe）。经过之前的分析，我们初步怀疑死锁是由于PHP-CGI进程接收到了一个信号，然后在signal handle中执行了非signal safe的函数。主流程在中断前，正在执行glibc中的时间函数。在函数获取的锁没释放前，进入中断流程。而中断过程中又访问了glibc中的时间函数。于是导致了死锁。\r\n\r\nPHP-CGI的执行流程，如下图所示：\r\n\r\n\r\n\r\n进一步分析发现，所有死锁的cgi进程的sapi_global中都记录了一个错误信息\r\n\r\n“Max execution timeout of 60 seconds exceeded”.\r\n\r\n60s 是我们php-cgi中设置执行超时。所以我们确认了，cig在执行过程中的确产生了超时异常，然后由于longjmp进入了shutdown过程。在shutdown过程中访问了glibc中的时间函数。导致了死锁。\r\n\r\nvoid zend_set_timeout(long seconds)\r\n\r\n{\r\n\r\nTSRMLS_FETCH();\r\n\r\nEG(timeout_seconds) = seconds;\r\n\r\nif(!seconds) {\r\n\r\nreturn;\r\n\r\n}\r\n\r\n……\r\n\r\nsetitimer(ITIMER_PROF, &t_r, NULL);\r\n\r\nsignal(SIGPROF, zend_timeout); // 此处会调用zend异常处理函数\r\n\r\nsigemptyset(&sigset);\r\n\r\nsigaddset(&sigset, SIGPROF);\r\n\r\n……\r\n\r\n}\r\n\r\n通过gdb调试发现，所有PHP-CGI都阻塞在zend_request_shutdown中。zend_request_shutdown会调用用户自定义的php脚本中实现的shutdown函数。如果CGI执行超市，那么定时器会产生SIGPROF信号使执行流程中断。如果此时脚本刚好处于调用时间函数的状态，且还没有释放锁资源。然后执行流程进入了 timeout 函数，继续跳转到zend_request_shutdown。此时如果自定义的shutdown函数中访问了时间函数。就会产生死锁。我们从代码中找到了证据：\r\n\r\nregister_shutdown_function (''SimpleWebSvc:: shutdown’);\r\n\r\n我们在php代码中使用qalarm系统，qalarm系统会在cgi执行结束（shutdown）的时候，注入一个钩子函数，来分析cgi执行是否正常，如果不正常，则发送报警信息。而刚好qalarm的报警处理函数中访问了时间函数。于是就有一定的概率产生死锁。\r\n\r\n结论\r\n\r\n通过上面的分析，我们找到了cgi死锁产生的原因，是应为在signal handler中使用了非signal safe的函数，导致了死锁。\r\n\r\n解决办法\r\n\r\n去掉或简化qalarm注册到shutdown中的钩子函数。避免不安全的函数调用', '2018-03-22 12:38:02', 0, 0, 2, 'https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=187afb979e82d158af8f51e3e16372bd/2f738bd4b31c870168f8cf9f257f9e2f0708ff79.jpg', 1, 100, '马文欢'),
(2, '怎么都在黑PHP？', '潇欢', '某女:你能让这个论坛的人都吵起来,我就跟你约会. 程序猿:PHP是最好的语言! 某论坛炸锅了,各种吵架… 某女:服了你了,我们走吧 程序猿:今天不行,我一定要说服他们,PHP必须是最好的语言”。其实程序员的世界也很难懂。', '前几天一篇帖子很火，大意是程序员之间有哪些微妙的关系。比如程序员最忌讳什么，最喜欢为什么撕逼等等。文中有些名词较专业，不理解需自行谷歌。\r\n\r\n用函数式编程的工程师鄙视老是把设计模式挂在嘴边的工程师，老是把设计模式挂在嘴边的工程师鄙视会说”你这样写就不OO了啊”的工程师，会说”你这样写就不OO 了啊”的工程师鄙视会说”什么封装调用，不就是把重复的code写成一个function就好了吗？”的工程师，会说”什么封装调用，不就是把重复的code写成一个function就好了吗？”的工程师鄙视把同一段code到处复制粘贴上的工程师，把同一段code到处复制粘贴的工程师鄙视PM。\r\n\r\n写静态语言的工程师鄙视写动态语言的工程师。写组合语言的工程师鄙视写C语言的工程师，C语言工程师鄙视C++工程师，C++工程师鄙视 Java 和 C# 工程师，Java 工程师和 C# 工程师则互相鄙视，而 C# 工程师又鄙视 Visual Basic 工程师和会把 C# 念成「C 井」的工程师，会把 C# 念成「C 井」的工程师则鄙视认为HTML是一种程式语言的设计师。\r\n\r\n用Python 3的工程师鄙视还在用 Python 2 的工程师，用 Python 2 的工程师鄙视遇到 UnicodeEncodeError 的工程师。写 iOS 的工程师鄙视写 Android 的工程师，写 Android 的工程师鄙视写 Windows Phone 的工程师。有 Swift 一年经验的工程师鄙视有 Objective-C 五年经验的工程师，写 Objective-C 的工程师鄙视用 PhoneGap 包装成 native app 的工程师。用 React.js 的工程师鄙视用 AngularJS 的工程师，用 AngularJS 的工程师鄙视用 jQuery 的工程师，用 jQuery 的工程师鄙视用 Vanilla JavaScript 的工程师，用 Vanilla JavaScript 的工程师鄙视 IE 的使用者。会用 debugger 的工程师鄙视用 assert 的工程师，用 assert 的工程师鄙视只会 print() 的工程师；用 console.log() 来 debug 的工程师鄙视用 alert() 来 debug 的工程师。写 Ruby on Rails 的工程师鄙视所有使用其他语言的工程师。\r\n\r\n所有的工程师都鄙视PHP工程师。\r\n\r\n不知道为什么平时温文尔雅，与世无争的程序员一遇到编程语言的讨论，都会异常“活跃”。比如前段时间两个程序员因为争论谁是C语言专家在github上约架的事情……又比如这个笑话“某女:你能让这个论坛的人都吵起来,我就跟你约会. 程序猿:PHP是最好的语言! 某论坛炸锅了,各种吵架… 某女:服了你了,我们走吧 程序猿:今天不行,我一定要说服他们,PHP必须是最好的语言”。其实程序员的世界也很难懂。\r\n\r\nPHP为什么会被鄙视？有很多方面的原因，比如入门太简单，导致大量垃圾代码和垃圾网站充斥互联网，比如不够规范(面向对象支持的不好而已，何必这样)，比如很多历史遗留问题(PHP彩蛋这种)。不过大多数鄙视PHP的人其实都是不怎么用PHP或者跟风的人。PHP是不是很low的一门语言呢？我简单说说使用4年PHP的感受。\r\n\r\nPS：高中的时候学的是VB，在大学修的计算机专业，算是科班出生。使用过汇编，然后是C语言，之后是C++，再然后是Java，C#（平均半年入门一种，然后做个课程设计）。实习的时候做了半年的Delphi开发，大学期间因为玩WordPress，所以自学了PHP。工作后也一直在用PHP，偶尔用Python。其实算一下，主流的语言我基本都撸过一遍……编译性语言，非编译性语言，面向过程编程，面向对象编程，C系列，Pascal系列。\r\n\r\n从语法上评论优劣的话，我还是喜欢C系列的语言。虽然用大括号来限定“域”很多余，但Python让人切换的时候感觉别扭，可能是习惯了一个东西，突然没了不自在，特别是从Python切换到PHP或者C++的时候。但从PHP切换到C++或者Java还是很顺的。另外很多人吐槽PHP的“$”符号，我有时候从C++或者JS切换回PHP的时候也会不适应…所以$符号确实不那么优美。$符号让PHP的变量不需要申明（需要初始化），同样作为弱类型语言JS的变量需要先用var申明，这两种做法我更偏向于用JS这种，因为先申明再使用能减少很多不必要的问题(比如由于程序员不仔细导致bug)，也是很好的编程习惯。所以PHP的$符号的确不优美，除此之外他的语法还是挺不错的，虽然不是特别优美……我使用过的语言里面觉得最痛快，语法最优美的当属C#，不过虽然C#长的好但不也一样被喷！其实大家在意的只是找个点来喷，与语言的丑与美关系不大。\r\n\r\n从语言性能上评价，先说语言运行的性能对项目的影响,如果你是做驱动开发，游戏引擎卡发，GUI开发，选择语言就得慎重，这些与语言性能的关系很大。但是如果你只是做WEB开发，你跟我讲语言性能我就只能喷你了。现在喷PHP性能的人已经很少，主要是小白变少了。我们可以拿JSP与ASP来和PHP说事。WEB开发的主要性能瓶颈是IO操作上,比如数据库读写……所以你看服务器的CPU很少跑到50%的，基本在15%下运行，而内存则是怎么多都不够。所以，解析PHP与解析JSP对CPU来说基本一样。数据库优化好，缓存做好，哪个都能撑起一片天空。', '2018-03-22 12:42:31', 0, 0, 2, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521703818210&di=4e99e43e80c9c787c08016d95d688dac&imgtype=0&src=http%3A%2F%2Fwww.ibeifeng.com%2Fimages%2Fupload%2FImage%2F54b8aac9ae75a.jpg', 3, 100, '马文欢');

-- --------------------------------------------------------

--
-- 表的结构 `blog_cate`
--

CREATE TABLE IF NOT EXISTS `blog_cate` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(40) NOT NULL,
  `cate_pid` int(11) NOT NULL COMMENT '父id',
  `cate_sort` int(11) NOT NULL COMMENT '栏目排序',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='栏目管理' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `blog_cate`
--

INSERT INTO `blog_cate` (`cate_id`, `cate_name`, `cate_pid`, `cate_sort`) VALUES
(1, 'PHP', 0, 1),
(2, '生活感悟', 0, 2),
(3, '程序员修养', 0, 3);

-- --------------------------------------------------------

--
-- 表的结构 `blog_link`
--

CREATE TABLE IF NOT EXISTS `blog_link` (
  `link_id` int(50) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(100) NOT NULL,
  `link_url` varchar(100) NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `blog_link`
--

INSERT INTO `blog_link` (`link_id`, `link_name`, `link_url`) VALUES
(5, '小游戏', 'www.6633.com'),
(3, '百度', 'www.baidu.com');

-- --------------------------------------------------------

--
-- 表的结构 `blog_tag`
--

CREATE TABLE IF NOT EXISTS `blog_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(30) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `blog_tag`
--

INSERT INTO `blog_tag` (`tag_id`, `tag_name`) VALUES
(1, '程序员人生'),
(2, 'php'),
(3, 'JavaScript'),
(4, 'php面试');

-- --------------------------------------------------------

--
-- 表的结构 `blog_web`
--

CREATE TABLE IF NOT EXISTS `blog_web` (
  `web_id` int(11) NOT NULL AUTO_INCREMENT,
  `web_name` varchar(30) NOT NULL,
  `web_melie` varchar(30) NOT NULL,
  `web_conypt` varchar(30) NOT NULL,
  PRIMARY KEY (`web_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `blog_web`
--

INSERT INTO `blog_web` (`web_id`, `web_name`, `web_melie`, `web_conypt`) VALUES
(1, '潇欢博客', '243484014@qq.com', '@北华大学');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
