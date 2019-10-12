# Dump of table article
# ------------------------------------------------------------

CREATE TABLE `article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` int(11) DEFAULT NULL COMMENT '子版本的文章id',
  `slug` varchar(128) DEFAULT NULL COMMENT 'slug',
  `title` varchar(256) DEFAULT '' COMMENT '标题',
  `content` longtext COMMENT '内容',
  `edit_mode` varchar(32) DEFAULT 'html' COMMENT '编辑模式，默认为html，其他可选项包括html，markdown ..',
  `summary` text COMMENT '摘要',
  `link_to` varchar(512) DEFAULT NULL COMMENT '连接到(常用于谋文章只是一个连接)',
  `thumbnail` varchar(512) DEFAULT NULL COMMENT '缩略图',
  `style` varchar(32) DEFAULT NULL COMMENT '样式',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `order_number` int(11) DEFAULT '0' COMMENT '排序编号',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `comment_status` tinyint(1) DEFAULT '1' COMMENT '评论状态，默认允许评论',
  `comment_count` int(11) unsigned DEFAULT '0' COMMENT '评论总数',
  `comment_time` datetime DEFAULT NULL COMMENT '最后评论时间',
  `view_count` int(11) unsigned DEFAULT '0' COMMENT '访问量',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `modified` datetime DEFAULT NULL COMMENT '最后更新日期',
  `flag` varchar(256) DEFAULT NULL COMMENT '标识，通常用于对某几篇文章进行标识，从而实现单独查询',
  `meta_keywords` varchar(512) DEFAULT NULL COMMENT 'SEO关键字',
  `meta_description` varchar(512) DEFAULT NULL COMMENT 'SEO描述信息',
  `remarks` text COMMENT '备注信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `user_id` (`user_id`),
  KEY `created` (`created`),
  KEY `view_count` (`view_count`),
  KEY `order_number` (`order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章表';



# Dump of table article_category
# ------------------------------------------------------------

CREATE TABLE `article_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级分类的ID',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '分类创建的用户ID',
  `slug` varchar(128) DEFAULT NULL COMMENT 'slug',
  `title` varchar(512) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容描述',
  `summary` text COMMENT '摘要',
  `style` varchar(32) DEFAULT NULL COMMENT '模板样式',
  `type` varchar(32) DEFAULT NULL COMMENT '类型，比如：分类、tag、专题',
  `icon` varchar(128) DEFAULT NULL COMMENT '图标',
  `count` int(11) unsigned DEFAULT '0' COMMENT '该分类的内容数量',
  `order_number` int(11) DEFAULT '0' COMMENT '排序编码',
  `flag` varchar(256) DEFAULT NULL COMMENT '标识',
  `meta_keywords` varchar(256) DEFAULT NULL COMMENT 'SEO关键字',
  `meta_description` varchar(256) DEFAULT NULL COMMENT 'SEO描述内容',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `modified` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`),
  KEY `typeslug` (`type`,`slug`),
  KEY `order_number` (`order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章分类表。标签、专题、类别等都属于category。';



# Dump of table article_category_mapping
# ------------------------------------------------------------

CREATE TABLE `article_category_mapping` (
  `article_id` int(11) unsigned NOT NULL COMMENT '文章ID',
  `category_id` int(11) unsigned NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`article_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章和分类的多对多关系表';



# Dump of table article_comment
# ------------------------------------------------------------

CREATE TABLE `article_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` int(11) unsigned DEFAULT NULL COMMENT '回复的评论ID',
  `article_id` int(11) unsigned DEFAULT NULL COMMENT '评论的内容ID',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '评论的用户ID',
  `author` varchar(128) DEFAULT NULL COMMENT '评论的作者',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `wechat` varchar(64) DEFAULT NULL COMMENT '微信号',
  `qq` varchar(32) DEFAULT NULL COMMENT 'qq号',
  `content` text COMMENT '评论的内容',
  `reply_count` int(11) unsigned DEFAULT '0' COMMENT '评论的回复数量',
  `order_number` int(11) DEFAULT '0' COMMENT '排序编号，常用语置顶等',
  `vote_up` int(11) unsigned DEFAULT '0' COMMENT '“顶”的数量',
  `vote_down` int(11) unsigned DEFAULT '0' COMMENT '“踩”的数量',
  `status` varchar(32) DEFAULT NULL COMMENT '评论的状态',
  `created` datetime DEFAULT NULL COMMENT '评论的时间',
  PRIMARY KEY (`id`),
  KEY `content_id` (`article_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章评论表';



# Dump of table attachment
# ------------------------------------------------------------

CREATE TABLE `attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '上传附件的用户ID',
  `title` text COMMENT '标题',
  `description` text COMMENT '附件描述',
  `path` varchar(512) DEFAULT NULL COMMENT '路径',
  `mime_type` varchar(128) DEFAULT NULL COMMENT 'mime',
  `suffix` varchar(32) DEFAULT NULL COMMENT '附件的后缀',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `flag` varchar(256) DEFAULT NULL COMMENT '标示',
  `order_number` int(11) DEFAULT '0' COMMENT '排序字段',
  `accessible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可以被访问',
  `created` datetime DEFAULT NULL COMMENT '上传时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `created` (`created`),
  KEY `suffix` (`suffix`),
  KEY `mime_type` (`mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='附件表，用于保存用户上传的附件内容。';



# Dump of table coupon
# ------------------------------------------------------------

CREATE TABLE `coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '例如：无门槛50元优惠券 | 单品最高减2000元''',
  `icon` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL COMMENT '1满减券  2叠加满减券  3无门槛券  ',
  `with_amount` decimal(10,2) DEFAULT NULL COMMENT '满多少金额',
  `with_member` tinyint(1) DEFAULT NULL COMMENT '会员可用',
  `with_award` tinyint(1) DEFAULT NULL COMMENT '是否是推广奖励券',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `award_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '奖励金额，只用在大咖券上，大咖可以使用自己的优惠码推广用户，用户获得优惠，大咖获得奖励金额',
  `quota` int(11) unsigned NOT NULL COMMENT '配额：发券数量',
  `take_count` int(11) unsigned DEFAULT '0' COMMENT '已领取的优惠券数量',
  `used_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已使用的优惠券数量',
  `start_time` datetime DEFAULT NULL COMMENT '发放开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '发放结束时间',
  `valid_type` tinyint(2) DEFAULT NULL COMMENT '时效:1绝对时效（领取后XXX-XXX时间段有效）  2相对时效（领取后N天有效）',
  `valid_start_time` datetime DEFAULT NULL COMMENT '使用开始时间',
  `valid_end_time` datetime DEFAULT NULL COMMENT '使用结束时间',
  `valid_days` int(11) DEFAULT NULL COMMENT '自领取之日起有效天数',
  `status` tinyint(2) DEFAULT NULL COMMENT '1生效 2失效 3已结束',
  `create_user_id` int(11) unsigned DEFAULT NULL COMMENT '创建用户',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='优惠券';



# Dump of table coupon_code
# ------------------------------------------------------------

CREATE TABLE `coupon_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) unsigned DEFAULT NULL COMMENT '类型ID',
  `title` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优惠券标题',
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优惠码',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `valid_time` datetime DEFAULT NULL COMMENT '领取时间',
  `status` int(11) DEFAULT NULL COMMENT '状态 0未领取 1未使用、2使用中、3已经使用',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='优惠券领取记录';



# Dump of table coupon_product
# ------------------------------------------------------------

CREATE TABLE `coupon_product` (
  `product_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品的类型，默认是 product',
  `product_id` int(11) unsigned NOT NULL COMMENT '商品的id',
  `coupon_id` int(11) unsigned NOT NULL COMMENT '优惠券ID',
  PRIMARY KEY (`product_type`,`product_id`,`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='优惠券关联商品信息表';



# Dump of table coupon_used_record
# ------------------------------------------------------------

CREATE TABLE `coupon_used_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `used_user_id` int(11) unsigned NOT NULL COMMENT '使用优惠码的用户',
  `used_user_nickname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '使用优惠码的用户ID',
  `used_order_id` int(11) unsigned DEFAULT NULL COMMENT '订单ID',
  `user_payment_id` int(10) unsigned DEFAULT NULL COMMENT '支付的ID',
  `code_id` int(11) unsigned NOT NULL COMMENT '优惠码ID',
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优惠码名称',
  `code_user_id` int(11) unsigned NOT NULL COMMENT '优惠券归属的用户ID',
  `code_user_nickname` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '优惠券归属的用户昵称',
  `created` datetime DEFAULT NULL COMMENT '使用时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='优惠券使用记录';



# Dump of table member
# ------------------------------------------------------------

CREATE TABLE `member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned DEFAULT NULL COMMENT '会员组id',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户id',
  `duetime` datetime DEFAULT NULL COMMENT '到期时间',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `source` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员信息';



# Dump of table member_dist_amount
# ------------------------------------------------------------

CREATE TABLE `member_dist_amount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL COMMENT '会员组',
  `product_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品类型',
  `product_id` int(11) unsigned NOT NULL COMMENT '产品的ID',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '分销的收益',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员分销收益表';



# Dump of table member_group
# ------------------------------------------------------------

CREATE TABLE `member_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会员名称',
  `title` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `icon` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会员ICON',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '会员内容、简介',
  `summary` text COLLATE utf8mb4_unicode_ci COMMENT '摘要',
  `thumbnail` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缩略图',
  `video` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频',
  `order_number` int(11) DEFAULT '0' COMMENT '排序编号',
  `price` decimal(10,2) DEFAULT NULL COMMENT '加入的会员价格',
  `limited_price` decimal(10,2) DEFAULT NULL COMMENT '限时价格',
  `limited_time` datetime DEFAULT NULL COMMENT '限时价格到期时间',
  `dist_enable` tinyint(1) DEFAULT NULL COMMENT '是否启用分销功能',
  `dist_amount` decimal(10,2) DEFAULT NULL COMMENT '分销收益金额',
  `term_of_validity` int(11) DEFAULT NULL COMMENT '有效期（单位天）',
  `flag` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标识',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `options` text COLLATE utf8mb4_unicode_ci,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员组信息';



# Dump of table member_price
# ------------------------------------------------------------

CREATE TABLE `member_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL,
  `product_type` int(11) DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `price` decimal(10,2) DEFAULT NULL COMMENT '会员价',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员价格表';



# Dump of table menu
# ------------------------------------------------------------

CREATE TABLE `menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` int(11) unsigned DEFAULT NULL COMMENT '父级ID',
  `text` varchar(128) DEFAULT NULL COMMENT '文本内容',
  `url` varchar(512) DEFAULT NULL COMMENT '链接的url',
  `target` varchar(32) DEFAULT NULL COMMENT '打开的方式',
  `icon` varchar(64) DEFAULT NULL COMMENT '菜单的icon',
  `flag` varchar(32) DEFAULT NULL COMMENT '菜单标识',
  `type` varchar(32) DEFAULT '' COMMENT '菜单类型：主菜单、顶部菜单、底部菜单',
  `order_number` int(11) DEFAULT '0' COMMENT '排序字段',
  `relative_table` varchar(32) DEFAULT NULL COMMENT '该菜单是否和其他表关联',
  `relative_id` int(11) unsigned DEFAULT NULL COMMENT '关联的具体数据id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `order_number` (`order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';



# Dump of table option
# ------------------------------------------------------------

CREATE TABLE `option` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `key` varchar(128) DEFAULT NULL COMMENT '配置KEY',
  `value` text COMMENT '配置内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='配置信息表，用来保存网站的所有配置信息。';



# Dump of table payment_record
# ------------------------------------------------------------

CREATE TABLE `payment_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_type` varchar(32) DEFAULT NULL,
  `product_id` int(11) unsigned DEFAULT NULL,
  `product_name` varchar(256) DEFAULT '' COMMENT '商品名称',
  `product_desc` varchar(256) DEFAULT NULL COMMENT '产品描述，产品摘要',
  `trx_no` varchar(50) NOT NULL COMMENT '支付流水号',
  `trx_type` varchar(30) DEFAULT NULL COMMENT '交易业务类型  ：消费、充值等',
  `trx_nonce_str` varchar(64) DEFAULT NULL,
  `payer_user_id` int(11) unsigned DEFAULT NULL COMMENT '付款人编号',
  `payer_name` varchar(256) DEFAULT NULL COMMENT '付款人名称',
  `payer_fee` decimal(20,6) DEFAULT '0.000000' COMMENT '付款方手续费',
  `order_ip` varchar(30) DEFAULT NULL COMMENT '下单ip(客户端ip,从网关中获取)',
  `order_referer_url` varchar(1024) DEFAULT NULL COMMENT '从哪个页面链接过来的(可用于防诈骗)',
  `order_from` varchar(30) DEFAULT NULL COMMENT '订单来源',
  `pay_status` tinyint(2) DEFAULT NULL COMMENT '支付状态',
  `pay_type` varchar(50) DEFAULT NULL COMMENT '支付类型编号',
  `pay_bank_type` varchar(128) DEFAULT NULL COMMENT '支付银行类型',
  `pay_amount` decimal(20,6) DEFAULT '0.000000' COMMENT '订单金额',
  `pay_success_amount` decimal(20,6) DEFAULT NULL COMMENT '成功支付金额',
  `pay_success_time` datetime DEFAULT NULL COMMENT '支付成功时间',
  `pay_complete_time` datetime DEFAULT NULL COMMENT '完成时间',
  `refund_no` varchar(64) DEFAULT NULL COMMENT '退款流水号',
  `refund_amount` int(11) DEFAULT NULL COMMENT '退款金额',
  `refund_desc` varchar(256) DEFAULT NULL COMMENT '退款描述',
  `refund_time` datetime DEFAULT NULL COMMENT '退款时间',
  `thirdparty_appid` varchar(32) DEFAULT NULL COMMENT '微信appid 或者 支付宝的appid，thirdparty 指的是支付的第三方比如微信、支付宝、PayPal等',
  `thirdparty_mch_id` varchar(32) DEFAULT NULL COMMENT '商户号',
  `thirdparty_trade_type` varchar(16) DEFAULT NULL COMMENT '交易类型',
  `thirdparty_transaction_id` varchar(32) DEFAULT NULL,
  `thirdparty_user_openid` varchar(64) DEFAULT NULL,
  `remark` text COMMENT '备注',
  `status` varchar(32) DEFAULT NULL COMMENT '状态(支付中、支持成功、支付失败、退款中、退款成功)',
  `options` text,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trx_no` (`trx_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付记录表';



# Dump of table permission
# ------------------------------------------------------------

CREATE TABLE `permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `action_key` varchar(512) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `node` varchar(512) NOT NULL DEFAULT '' COMMENT '属于大的分类，可能是Controller、大的DIV、或菜单组',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '权限的类型：url、页面元素、菜单',
  `text` varchar(1024) DEFAULT NULL COMMENT '菜单描述',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `node_actionKey` (`node`(191),`action_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限表';



# Dump of table product
# ------------------------------------------------------------

CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `slug` varchar(128) DEFAULT NULL COMMENT 'slug',
  `title` varchar(256) DEFAULT '' COMMENT '标题',
  `content` longtext COMMENT '内容',
  `summary` text COMMENT '摘要',
  `thumbnail` varchar(512) DEFAULT NULL COMMENT '缩略图',
  `video` varchar(512) DEFAULT NULL COMMENT '视频',
  `video_cover` varchar(512) DEFAULT NULL,
  `style` varchar(32) DEFAULT NULL COMMENT '样式',
  `order_number` int(11) DEFAULT '0' COMMENT '排序编号',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '商品的用户ID',
  `user_divide_type` int(11) DEFAULT NULL COMMENT '商品的销售分成类型：0平台所有，1用户所有，2按比例分成',
  `user_divide_ratio` int(11) DEFAULT NULL COMMENT '用户分成比例',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `origin_price` decimal(10,2) DEFAULT NULL COMMENT '原始价格',
  `limited_price` decimal(10,2) DEFAULT NULL COMMENT '限时优惠价（早鸟价）',
  `limited_time` datetime DEFAULT NULL COMMENT '限时优惠截止时间',
  `dist_enable` tinyint(1) DEFAULT NULL COMMENT '是否启用分销',
  `dist_amount` decimal(10,2) DEFAULT NULL COMMENT '分销收益的金额',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `comment_status` tinyint(1) DEFAULT '1' COMMENT '评论状态，默认允许评论',
  `comment_count` int(11) unsigned DEFAULT '0' COMMENT '评论总数',
  `comment_time` datetime DEFAULT NULL COMMENT '最后评论时间',
  `view_count` int(11) unsigned DEFAULT '0' COMMENT '访问量',
  `real_view_count` int(11) unsigned DEFAULT '0' COMMENT '真实访问量',
  `sales_count` int(11) unsigned DEFAULT '0' COMMENT '销售量，用于放在前台显示',
  `real_sales_count` int(11) unsigned DEFAULT '0' COMMENT '真实的访问量',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `modified` datetime DEFAULT NULL COMMENT '最后更新日期',
  `flag` varchar(256) DEFAULT NULL COMMENT '标识，通常用于对某几篇文章进行标识，从而实现单独查询',
  `meta_keywords` varchar(512) DEFAULT NULL COMMENT 'SEO关键字',
  `meta_description` varchar(512) DEFAULT NULL COMMENT 'SEO描述信息',
  `remarks` text COMMENT '备注信息',
  `options` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `user_id` (`user_id`),
  KEY `created` (`created`),
  KEY `view_count` (`view_count`),
  KEY `order_number` (`order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';



# Dump of table product_category
# ------------------------------------------------------------

CREATE TABLE `product_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级分类的ID',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '分类创建的用户ID',
  `slug` varchar(128) DEFAULT NULL COMMENT 'slug',
  `title` varchar(512) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容描述',
  `summary` text COMMENT '摘要',
  `style` varchar(32) DEFAULT NULL COMMENT '模板样式',
  `type` varchar(32) DEFAULT NULL COMMENT '类型，比如：分类、tag、专题',
  `icon` varchar(128) DEFAULT NULL COMMENT '图标',
  `count` int(11) unsigned DEFAULT '0' COMMENT '该分类的内容数量',
  `order_number` int(11) DEFAULT '0' COMMENT '排序编码',
  `flag` varchar(256) DEFAULT NULL COMMENT '标识',
  `meta_keywords` varchar(256) DEFAULT NULL COMMENT 'SEO关键字',
  `meta_description` varchar(256) DEFAULT NULL COMMENT 'SEO描述内容',
  `options` text,
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `modified` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`),
  KEY `typeslug` (`type`,`slug`),
  KEY `order_number` (`order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品分类表。标签、专题、类别等都属于category。';



# Dump of table product_category_mapping
# ------------------------------------------------------------

CREATE TABLE `product_category_mapping` (
  `product_id` int(11) unsigned NOT NULL COMMENT '文章ID',
  `category_id` int(11) unsigned NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品和分类的多对多关系表';



# Dump of table product_comment
# ------------------------------------------------------------

CREATE TABLE `product_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` int(11) unsigned DEFAULT NULL COMMENT '回复的评论ID',
  `product_id` int(11) unsigned DEFAULT NULL COMMENT '评论的产品ID',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '评论的用户ID',
  `author` varchar(128) DEFAULT NULL COMMENT '评论的作者',
  `content` text COMMENT '评论的内容',
  `reply_count` int(11) unsigned DEFAULT '0' COMMENT '评论的回复数量',
  `order_number` int(11) DEFAULT '0' COMMENT '排序编号，常用语置顶等',
  `vote_up` int(11) unsigned DEFAULT '0' COMMENT '“顶”的数量',
  `vote_down` int(11) unsigned DEFAULT '0' COMMENT '“踩”的数量',
  `status` varchar(32) DEFAULT NULL COMMENT '评论的状态',
  `created` datetime DEFAULT NULL COMMENT '评论的时间',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品评论表';



# Dump of table product_image
# ------------------------------------------------------------

CREATE TABLE `product_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned NOT NULL,
  `src` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_number` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品图片表';



# Dump of table role
# ------------------------------------------------------------

CREATE TABLE `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` text COMMENT '角色的描述',
  `flag` varchar(64) DEFAULT '' COMMENT '角色标识，全局唯一，jpsa 为超级管理员',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';



# Dump of table role_permission_mapping
# ------------------------------------------------------------

CREATE TABLE `role_permission_mapping` (
  `role_id` int(11) unsigned NOT NULL COMMENT '角色ID',
  `permission_id` int(11) unsigned NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和权限的多对多映射表';



# Dump of table single_page
# ------------------------------------------------------------

CREATE TABLE `single_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `slug` varchar(128) DEFAULT NULL COMMENT 'slug',
  `title` text COMMENT '标题',
  `content` longtext COMMENT '内容',
  `edit_mode` varchar(32) DEFAULT 'html' COMMENT '编辑模式：html可视化，markdown ..',
  `link_to` varchar(512) DEFAULT NULL COMMENT '链接',
  `summary` text COMMENT '摘要',
  `thumbnail` varchar(128) DEFAULT NULL COMMENT '缩略图',
  `style` varchar(32) DEFAULT NULL COMMENT '样式',
  `flag` varchar(32) DEFAULT NULL COMMENT '标识',
  `status` varchar(32) NOT NULL DEFAULT '0' COMMENT '状态',
  `view_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '访问量',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `modified` datetime DEFAULT NULL COMMENT '最后更新日期',
  `meta_keywords` varchar(256) DEFAULT NULL COMMENT 'SEO关键字',
  `meta_description` varchar(256) DEFAULT NULL COMMENT 'SEO描述信息',
  `remarks` text COMMENT '备注信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='单页表';



# Dump of table user
# ------------------------------------------------------------

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(128) DEFAULT NULL COMMENT '登录名',
  `nickname` varchar(128) DEFAULT NULL COMMENT '昵称',
  `realname` varchar(128) DEFAULT NULL COMMENT '实名',
  `identity` varchar(128) DEFAULT NULL COMMENT '身份',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐',
  `anonym` varchar(32) DEFAULT NULL COMMENT '匿名ID',
  `email` varchar(64) DEFAULT NULL COMMENT '邮件',
  `email_status` varchar(32) DEFAULT NULL COMMENT '邮箱状态（是否认证等）',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机电话',
  `mobile_status` varchar(32) DEFAULT NULL COMMENT '手机状态（是否认证等）',
  `gender` varchar(16) DEFAULT NULL COMMENT '性别',
  `signature` varchar(2048) DEFAULT NULL COMMENT '签名',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `company` varchar(256) DEFAULT NULL COMMENT '公司',
  `occupation` varchar(256) DEFAULT NULL COMMENT '职位、职业',
  `address` varchar(256) DEFAULT NULL COMMENT '地址',
  `zipcode` varchar(128) DEFAULT NULL COMMENT '邮政编码',
  `site` varchar(256) DEFAULT NULL COMMENT '个人网址',
  `graduateschool` varchar(256) DEFAULT NULL COMMENT '毕业学校',
  `education` varchar(256) DEFAULT NULL COMMENT '学历',
  `avatar` varchar(256) DEFAULT NULL COMMENT '头像',
  `idcardtype` varchar(128) DEFAULT NULL COMMENT '证件类型：身份证 护照 军官证等',
  `idcard` varchar(128) DEFAULT NULL COMMENT '证件号码',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `create_source` varchar(128) DEFAULT NULL COMMENT '用户来源（可能来之oauth第三方）',
  `logged` datetime DEFAULT NULL COMMENT '最后的登录时间',
  `activated` datetime DEFAULT NULL COMMENT '激活时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表，保存用户信息。';



# Dump of table user_address
# ------------------------------------------------------------

CREATE TABLE `user_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系地址',
  `province` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省',
  `city` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '市',
  `county` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '县',
  `district` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认,1是，0否',
  `options` text COLLATE utf8mb4_unicode_ci,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收货地址';



# Dump of table user_amount
# ------------------------------------------------------------

CREATE TABLE `user_amount` (
  `user_id` int(11) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `modified` datetime NOT NULL,
  `created` datetime DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户余额';



# Dump of table user_amount_statement
# ------------------------------------------------------------

CREATE TABLE `user_amount_statement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户',
  `action` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '金额变动原因',
  `action_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '金额变动名称',
  `action_desc` text COLLATE utf8mb4_unicode_ci COMMENT '金额变动描述',
  `action_relation_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '相关的表名',
  `action_relation_id` int(11) unsigned DEFAULT NULL COMMENT '相关的id',
  `action_order_id` int(11) unsigned DEFAULT NULL COMMENT '相关的订单ID',
  `action_payment_id` int(11) unsigned DEFAULT NULL COMMENT '相关的支付ID',
  `old_amount` decimal(10,2) NOT NULL COMMENT '用户之前的余额',
  `change_amount` decimal(10,2) NOT NULL COMMENT '变动金额',
  `new_amount` decimal(10,2) NOT NULL COMMENT '变动之后的余额',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户余额流水情况';



# Dump of table user_cart
# ------------------------------------------------------------

CREATE TABLE `user_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '购买的用户',
  `seller_id` int(11) unsigned DEFAULT NULL COMMENT '商品的所属用户',
  `dist_user_id` int(11) unsigned DEFAULT NULL COMMENT '分销用户',
  `product_id` int(11) unsigned DEFAULT NULL,
  `product_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的类别，默认是 product ，但是未来可能是 模板、文件、视频等等...',
  `product_type_text` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品标题',
  `product_thumbnail` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品缩略图',
  `product_price` decimal(10,2) NOT NULL COMMENT '商品加入购物车时的价格',
  `product_new_price` decimal(10,2) NOT NULL COMMENT '商品的最新价格',
  `product_count` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `view_path` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '查看的网址路径，访问时时，会添加orderid',
  `view_text` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '查看的文章内容，比如：查看、下载',
  `selected` tinyint(1) DEFAULT NULL COMMENT '选中状态',
  `options` text COLLATE utf8mb4_unicode_ci,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='购物车';



# Dump of table user_openid
# ------------------------------------------------------------

CREATE TABLE `user_openid` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方类型：wechat，dingding，qq...',
  `value` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方的openId的值',
  `access_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '可能用不到',
  `expired_time` datetime DEFAULT NULL COMMENT 'access_token的过期时间',
  `nickname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='账号绑定信息表';



# Dump of table user_order
# ------------------------------------------------------------

CREATE TABLE `user_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ns` int(11) NOT NULL COMMENT '订单号',
  `title` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '一般情况下商品的名称',
  `buyer_id` int(10) unsigned DEFAULT NULL COMMENT '购买人',
  `buyer_nickname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '购买人昵称',
  `buyer_msg` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户留言',
  `dist_user_id` int(11) unsigned DEFAULT NULL COMMENT '分销员',
  `dist_amount` decimal(10,2) DEFAULT NULL COMMENT '分销金额',
  `order_amount` decimal(10,2) DEFAULT NULL COMMENT '订单金额',
  `real_amount` int(11) DEFAULT NULL COMMENT '真实金额，销售人员可以修改订单金额，一般情况下，真实金额等于订单金额',
  `coupon_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优惠码',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠金额',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `payment_id` int(11) unsigned DEFAULT NULL COMMENT '支付记录',
  `payment_outer_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方订单号',
  `delivery_type` int(11) DEFAULT NULL COMMENT '配送方式 1快递    2自己送     3无需配送（虚拟商品）',
  `delivery_company` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '快递公司',
  `delivery_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '快递单号',
  `delivery_start_time` datetime DEFAULT NULL COMMENT '快递发货时间',
  `delivery_finish_time` datetime DEFAULT NULL COMMENT '快递送达时间',
  `invoice_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发票类型',
  `invoice_title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发票抬头',
  `invoice_content` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发票内容',
  `invoice_identity` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纳税人识别号',
  `invoice_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单位名称',
  `invoice_mobile` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发票收取人手机号',
  `invoice_email` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发票收取人邮箱',
  `invoice_status` tinyint(2) DEFAULT NULL COMMENT '发票开具状态',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `trade_status` tinyint(2) DEFAULT NULL COMMENT '交易状态： 0进行中、1完成  、2取消交易 、3退款中  、4退款完成',
  `pay_status` tinyint(2) DEFAULT NULL COMMENT '支付状态：0未付款、1已经付款（线上支付）、2线下付款、3线下付款已经收款 、4通信工具打款，5通信工具打款已收款',
  `del_status` tinyint(2) DEFAULT NULL COMMENT '删除状态：1 正常 ，2 回收站 3 已经删除',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';



# Dump of table user_order_item
# ------------------------------------------------------------

CREATE TABLE `user_order_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `order_ns` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `buyer_id` int(11) unsigned NOT NULL COMMENT '购买人',
  `buyer_nickname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '购买人昵称',
  `buyer_msg` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户留言（备注）',
  `seller_id` int(11) unsigned DEFAULT NULL COMMENT '卖家id',
  `dist_user_id` int(10) unsigned DEFAULT NULL COMMENT '分销员',
  `dist_amount` decimal(10,2) DEFAULT NULL COMMENT '分销金额',
  `product_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的类别，默认是 product ，但是未来可能是 模板、文件、视频等等...',
  `product_id` int(11) unsigned DEFAULT NULL COMMENT '产品id',
  `product_title` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品标题',
  `product_thumbnail` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品缩略图',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '产品价格',
  `product_count` int(11) DEFAULT NULL COMMENT '产品数量',
  `deivery_cost` decimal(10,2) DEFAULT NULL,
  `other_cost` decimal(10,2) DEFAULT NULL,
  `other_cost_remark` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '具体价格 = 产品价格+运费+其他价格 - 分销金额',
  `view_path` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '查看的网址路径，访问时时，会添加orderid',
  `view_text` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '查看的文章内容，比如：查看、下载',
  `view_duetime` datetime DEFAULT NULL COMMENT '到期后无法继续查看内容',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `refund_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款订单号',
  `refund_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `refund_desc` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款描述',
  `refund_time` datetime DEFAULT NULL COMMENT '退款时间',
  `options` text COLLATE utf8mb4_unicode_ci,
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';



# Dump of table user_role_mapping
# ------------------------------------------------------------

CREATE TABLE `user_role_mapping` (
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `role_id` int(11) unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色的多对多映射表';



# Dump of table utm
# ------------------------------------------------------------

CREATE TABLE `utm` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `anonym` varchar(32) DEFAULT NULL COMMENT '匿名标识',
  `action_key` varchar(512) DEFAULT NULL COMMENT '访问路径',
  `action_query` varchar(512) DEFAULT NULL COMMENT '访问参数',
  `action_name` varchar(128) DEFAULT NULL COMMENT '访问路径名称',
  `source` varchar(32) DEFAULT NULL COMMENT '渠道',
  `medium` varchar(32) DEFAULT NULL COMMENT ' 媒介',
  `campaign` varchar(128) DEFAULT NULL,
  `content` varchar(128) DEFAULT NULL COMMENT '来源内容',
  `term` varchar(256) DEFAULT NULL COMMENT '关键词',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP',
  `agent` varchar(1024) DEFAULT NULL COMMENT '浏览器',
  `referer` varchar(1024) DEFAULT NULL COMMENT '来源的url',
  `se` varchar(32) DEFAULT NULL COMMENT 'Search Engine 搜索引擎',
  `sek` varchar(512) DEFAULT NULL COMMENT 'Search Engine Keyword 搜索引擎关键字',
  `device_id` varchar(128) DEFAULT NULL COMMENT '设备ID',
  `platform` varchar(128) DEFAULT NULL COMMENT '平台',
  `system` varchar(128) DEFAULT NULL COMMENT '系统',
  `brand` varchar(128) DEFAULT NULL COMMENT '硬件平台',
  `model` varchar(128) DEFAULT NULL COMMENT '硬件型号',
  `network` varchar(128) DEFAULT NULL COMMENT '网络情况',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户行为记录表';



# Dump of table wechat_menu
# ------------------------------------------------------------

CREATE TABLE `wechat_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT NULL COMMENT '父级ID',
  `text` varchar(512) DEFAULT NULL COMMENT '文本内容',
  `keyword` varchar(128) DEFAULT NULL COMMENT '关键字',
  `type` varchar(32) DEFAULT '' COMMENT '菜单类型',
  `order_number` int(11) DEFAULT '0' COMMENT '排序字段',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信公众号菜单表';



# Dump of table wechat_reply
# ------------------------------------------------------------

CREATE TABLE `wechat_reply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(128) DEFAULT NULL COMMENT '关键字',
  `content` text COMMENT '回复内容',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户自定义关键字回复表';


INSERT INTO `article` (`id`, `pid`, `slug`, `title`, `content`, `edit_mode`, `summary`, `link_to`, `thumbnail`, `style`, `user_id`, `order_number`, `status`, `comment_status`, `comment_count`, `comment_time`, `view_count`, `created`, `modified`, `flag`, `meta_keywords`, `meta_description`, `remarks`)
VALUES (1,NULL,NULL,'欢迎使用JPress','<p>欢迎使用 JPress，这是一篇 JPress 自动为您创建的测试文章，您可以进入 JPress 的后台，在文章管理里进行修改或者删除。</p>','html',NULL,NULL,NULL,NULL,1,0,'normal',1,0,NULL,4,'2019-09-02 11:42:02','2019-09-02 11:44:26',NULL,NULL,NULL,NULL);


INSERT INTO `role` (`id`, `name`, `description`, `flag`, `created`, `modified`)
VALUES (1,'默认角色','这个是系统自动创建的默认角色','jpsa','2019-09-02 11:39:29','2019-09-02 11:39:29');



INSERT INTO `user` (`id`, `username`, `nickname`, `realname`, `identity`, `password`, `salt`, `anonym`, `email`, `email_status`, `mobile`, `mobile_status`, `gender`, `signature`, `birthday`, `company`, `occupation`, `address`, `zipcode`, `site`, `graduateschool`, `education`, `avatar`, `idcardtype`, `idcard`, `remark`, `status`, `created`, `create_source`, `logged`, `activated`)
VALUES (1,'admin','10','admin',NULL,'b7bdb416eb2228f7483dfddb96d2c95efdad1ceaa47d06108b5b4782c5d8a087','iZuC5x5WUt9G52WEsbKkfjlbjH_TGQM5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ok','2019-09-02 11:39:29','web_register','2019-10-10 16:18:34','2019-09-02 11:39:29');


INSERT INTO `user_role_mapping` (`user_id`, `role_id`)
VALUES (1,1);
