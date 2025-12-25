Return-Path: <linuxppc-dev+bounces-15010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9048CDE118
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Dec 2025 20:35:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dcf8s5ktcz2xC3;
	Fri, 26 Dec 2025 06:35:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766691309;
	cv=none; b=XKI9jr+oxbLSvNi8ROXWY/8N5JCV6rDYOBkiB8zeTVbstOdDCsrflSmRBqHJ8sbdBmMriomStaI2YAZSVLR8e8/I5RsvenoFttSlMtB4k/lO9Yo0yjHDLUKLj7fxAlZM6arEcaQQtev12/K9WmSXCtLWyyh20fSlf5lOoXjQG61WfQzEjbLmPp7S7CdfbKWWZcL63z2PuoG8yHgMuMhPjx64+GG3yp/NuBFq6wF9ERHDhevjfA+TXFgEtLGxIukuMzLW9zIYwtRAH/rKgVwQlV7LnH304Zxuhbdk40ENhTOcBpYLuNjc/sJJz5c+Hq+KFO6nrj7YoClgP+MFPAtT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766691309; c=relaxed/relaxed;
	bh=VA94RCjiCWOhe4Ngi8gAvTZuUkcu1qengPVZYjV0WZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bl9Knle1ltbHm0eN2XiALtZ0L4VGYrtcoCNu5xY+vlJzPZ8RY6UKcpGZ34JTPPJG8pOlDKQYPclNPkvRy4PRAI2jfYyQXksTz4mr5DDZ3bTmwVxaNlgLbanLAWcpcBVjKcOEVPrLppXNWPl9ZiR0FIT7jWVQYyApqSqzb5LLVEkIDVQPH24TbW1DRHaaxPGuG7pHhm73clA/Gkntrp+CsvkNEjLJUkbBsTCHyR8Ckkv4UGYKfBEvwBo8ycLu79z8K+Csilyi/RrJIsWRAA0sptJiUzyeFalfaUURgU+SvIQo49TonSG9pfNx3J7J66hVkZU/x9VkNXWYYsgNqh6yvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fuc3dsnU; dkim-atps=neutral; spf=temperror (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fuc3dsnU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dcf8q1Fvmz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Dec 2025 06:34:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766691307; x=1798227307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ofgh9KwqcvyPHGJk9JcqQvbMV1hNNHkzTXzpIoXFyf4=;
  b=fuc3dsnUdBR8G1H9vZrc1swqRMswWsukO5RYn9sC23i88oIMi+t6Q9Jh
   1oU5bAkD3S2kXIhUO9DvHmEJ7ieNXSkLL+c3v7WlaeJ/rR4mR2vikU9Zs
   j197ObFjATP0PLPaF+CUEUmAl9tKt43kMHDtP9MqdJg19J65Ytm/BjbhF
   5NSmYBHpm2DKvVmVSNCIJwoWoll2knLdTlgaw8sWwhUMCJxF5g1uu94FF
   m7sIB//vMhYrH4sJgaF1vP2jQ/eWTRlFFqYsqyLS3THJ/XI02khj/eOMs
   dKN99W+joPhB0TvD1VaCTeTi89QSbrkApwPmqnEO70p/iXSPqtrT3M78G
   Q==;
X-CSE-ConnectionGUID: 2S2AMeCFSJqk1EO2zsk/dA==
X-CSE-MsgGUID: MpWUGV/TQEyOcapAcHqlVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79202576"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="79202576"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 11:34:42 -0800
X-CSE-ConnectionGUID: LGfeeNPqSG2YVJuVAIHuUg==
X-CSE-MsgGUID: 9T8ro8cvQtWOoKl7kiFAwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200280863"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Dec 2025 11:34:36 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYr6Q-000000004Ph-2y69;
	Thu, 25 Dec 2025 19:34:29 +0000
Date: Fri, 26 Dec 2025 03:33:36 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 01/12] i2c: add i2c_adapter-specific printk helpers
Message-ID: <202512260303.nUGs1vi7-lkp@intel.com>
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
config: x86_64-randconfig-013-20251225 (https://download.01.org/0day-ci/archive/20251226/202512260303.nUGs1vi7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260303.nUGs1vi7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260303.nUGs1vi7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/saa7134/saa7134-i2c.c:31:9: warning: 'i2c_dbg' macro redefined [-Wmacro-redefined]
      31 | #define i2c_dbg(level, fmt, arg...) do { \
         |         ^
   include/linux/i2c.h:775:9: note: previous definition is here
     775 | #define i2c_dbg(adap, fmt, ...) dev_dbg(&(adap)->dev, fmt, ##__VA_ARGS__)
         |         ^
   1 warning generated.


vim +/i2c_dbg +31 drivers/media/pci/saa7134/saa7134-i2c.c

^1da177e4c3f415 drivers/media/video/saa7134/saa7134-i2c.c Linus Torvalds        2005-04-16  30  
45f38cb3b80311a drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13 @31  #define i2c_dbg(level, fmt, arg...) do { \
45f38cb3b80311a drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  32  	if (i2c_debug == level) \
45f38cb3b80311a drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  33  		printk(KERN_DEBUG pr_fmt("i2c: " fmt), ## arg); \
45f38cb3b80311a drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  34  	} while (0)
45f38cb3b80311a drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

