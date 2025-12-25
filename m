Return-Path: <linuxppc-dev+bounces-15009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF729CDE079
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Dec 2025 19:31:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dccld07Wdz2xC3;
	Fri, 26 Dec 2025 05:31:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766687500;
	cv=none; b=Uq9ah7rDRhDyZg0uWcar7y4uztfZl0RpQ1oJJznMQapLfF/lBVPNzT/f37wjCB+JC6gzmJHpMQgpIbjIXzBRP5IRj0wV+qlX9fE4RJBz6wHUx9ivFObBAx6n1HoWP9w82y+HmeMUYByL3XHNmtjC6Lytzug17i7U2ugk+JYjs0RHk7NMte8XIImV+YCadTJs464cjSq17nx9AoB4nr0dF5/VOTUBRxPjWNeXx3PCXxxT2FKVoQW+S+dj/3Nha5CQhOREDVN9MKPQqFFlCiE5SRV9Q58YR/fBjsDatil9T68MywReEhYvRW+wh3PKWPskuTvcUs35A0j1mtgke7WE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766687500; c=relaxed/relaxed;
	bh=1xfbycelZ75qa+Dx6xRKK2JQ4OPBoymebBMBKQZ4tCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqHXd0/tbL8jXFu2nukiGxIcb7zw0Br0HXS9d4/iswJCsIQzxq9oMseEPZGzeLGaxPps+5ftu1s4ZnoRqXqwkMGrga3r7nRu7hSp+QYFd+ojaluBwE9ewbClwDStZdxbCnhIutuTgOsgG8NNBsBgmw/09StlPv9U2Cn2QLSF2y1rW1YWCPvJ+NF2t6XOOsVyVJAhMW9hakHBq9DY8bCqVTkZfJRPCNkdSuSadgkw369i/DmDZWxcXZSuW8ylsOGIMZqLhXls5agpNNdGAJXFOjYrH4m2beQaHEfja9pRpTf3JY4US+KURRxuJ5FThP4QjXpUxtBN8tVGURsI0zESqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=My8De8hD; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=My8De8hD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dcclZ1bbWz2x9W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Dec 2025 05:31:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766687498; x=1798223498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yqnePlyRgEquO4uP2YmSaSpuW1av6DY6o/KZmR59zYs=;
  b=My8De8hDhc7P+HsQTWoP8M4RkdKJFy+EVOLms16lC+ZDDl/8tJ6LxKZu
   8Hb55LUCz+0IJeBKYwpFhRQCRgdoeEEGdW2F462h6gfO53bXQJA4HOIHw
   16pdMmMMau0WLuDsAtRZyM4w+bave8dG83BG8PD+irtQ9lDlq1rv3iel2
   4J/6q/rubhm3L21Rda1dLTcDyY13Xe9oAwA0xwYzQ4CMyDG29U9c9FrrG
   Ar/ljDPOku1RVdDktkDHw+jonCchVO4EhpKGcWiF6SsMItv95wxP6UKaF
   ffBr+aGVwl6WmjbpUpt+5tIc2ugJPuIOmyds9gOkqbfN5gsf0TaUHevFe
   w==;
X-CSE-ConnectionGUID: VxEBhaegQK6GfSv4FtcxZQ==
X-CSE-MsgGUID: nXyaVZy5Sh+DpxlLEe7MSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="91131218"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="91131218"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 10:31:32 -0800
X-CSE-ConnectionGUID: OUwZDa35RUKTYtnAQpRyrg==
X-CSE-MsgGUID: qkIViPLzR9y7Zfey6SE2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="201171557"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Dec 2025 10:31:26 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYq7Q-000000004NB-2qAZ;
	Thu, 25 Dec 2025 18:31:24 +0000
Date: Fri, 26 Dec 2025 02:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 01/12] i2c: add i2c_adapter-specific printk helpers
Message-ID: <202512260206.C1TExj8d-lkp@intel.com>
References: <20251223-i2c-printk-helpers-v1-1-46a08306afdb@oss.qualcomm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-printk-helpers-v1-1-46a08306afdb@oss.qualcomm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/i2c-add-i2c_adapter-specific-printk-helpers/20251223-185417
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20251223-i2c-printk-helpers-v1-1-46a08306afdb%40oss.qualcomm.com
patch subject: [PATCH 01/12] i2c: add i2c_adapter-specific printk helpers
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20251226/202512260206.C1TExj8d-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260206.C1TExj8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260206.C1TExj8d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/saa7134/saa7134-i2c.c:31:9: warning: 'i2c_dbg' redefined
      31 | #define i2c_dbg(level, fmt, arg...) do { \
         |         ^~~~~~~
   In file included from drivers/media/pci/saa7134/saa7134.h:14,
                    from drivers/media/pci/saa7134/saa7134-i2c.c:10:
   include/linux/i2c.h:775:9: note: this is the location of the previous definition
     775 | #define i2c_dbg(adap, fmt, ...) dev_dbg(&(adap)->dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~


vim +/i2c_dbg +31 drivers/media/pci/saa7134/saa7134-i2c.c

^1da177e4c3f41 drivers/media/video/saa7134/saa7134-i2c.c Linus Torvalds        2005-04-16  30  
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13 @31  #define i2c_dbg(level, fmt, arg...) do { \
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  32  	if (i2c_debug == level) \
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  33  		printk(KERN_DEBUG pr_fmt("i2c: " fmt), ## arg); \
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  34  	} while (0)
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

