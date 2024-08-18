Return-Path: <linuxppc-dev+bounces-160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E6955CE1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Aug 2024 16:08:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WmyHm4KMsz2xKh;
	Mon, 19 Aug 2024 00:08:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jLLolSgZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WmyHl0PJdz2xHg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 00:08:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723990099; x=1755526099;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XQgKvYsQDQwsQThUWqv3MmYRC08pwP07DKTfyg89Dlw=;
  b=jLLolSgZJC3JWksRr6UTCtCigjm1Nksvra685U98gaHzncjNtReZkPg2
   +ix/25q20ce2m4qn46qFHYw+wFA/kABYg0exNNBObIuvMbOx15Kh6L4JF
   iFjTnRMZ0vsK5Vp2XlEzOb8sdAqyXaqvHU7vsoUvoZU06J+dxcv1p5tC1
   YholcPcuz+ab8KNu1sAQcqWpLSmvIGqEr72jlI0HW28TASQzce0gB4GdT
   L1HJhe6mJPngNlbg21Gqcn2svfgHQwLDGEPjMTHldNevTmPgs0pXQkNao
   ISxFcN9Xw7ZexZUHXaovMV5Yr7cwT4x0hK11wg5Grp1LIi6heUg1pqjeA
   w==;
X-CSE-ConnectionGUID: uETB8VDRSem3GyxulK1BcQ==
X-CSE-MsgGUID: 64WIZz1nT3eIQ585R3ijJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="13077666"
X-IronPort-AV: E=Sophos;i="6.10,157,1719903600"; 
   d="scan'208";a="13077666"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 07:08:12 -0700
X-CSE-ConnectionGUID: /y6BS3weS/aV3YHLwFiaBw==
X-CSE-MsgGUID: RFEarJ0QTPmZuaWbmg+2XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,157,1719903600"; 
   d="scan'208";a="83345426"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Aug 2024 07:08:09 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfgZi-0008Ga-3C;
	Sun, 18 Aug 2024 14:08:06 +0000
Date: Sun, 18 Aug 2024 22:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, mpe@ellerman.id.au, npiggin@gmail.com,
	tyreld@linux.ibm.com, brking@linux.ibm.com, hbabu@us.ibm.com,
	haren@linux.ibm.com
Subject: Re: [PATCH v2 1/2] powerpc/pseries/dlpar: Remove device tree node
 for DLPAR IO remove
Message-ID: <202408182142.wuIKqYae-lkp@intel.com>
References: <20240817035401.125833-1-haren@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817035401.125833-1-haren@linux.ibm.com>

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-dlpar-Add-device-tree-nodes-for-DLPAR-IO-add/20240817-115833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240817035401.125833-1-haren%40linux.ibm.com
patch subject: [PATCH v2 1/2] powerpc/pseries/dlpar: Remove device tree node for DLPAR IO remove
config: powerpc64-randconfig-r121-20240818 (https://download.01.org/0day-ci/archive/20240818/202408182142.wuIKqYae-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce: (https://download.01.org/0day-ci/archive/20240818/202408182142.wuIKqYae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408182142.wuIKqYae-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/dlpar.c:398:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] drc_index @@     got restricted __be32 [usertype] drc_index @@
   arch/powerpc/platforms/pseries/dlpar.c:398:53: sparse:     expected unsigned int [usertype] drc_index
   arch/powerpc/platforms/pseries/dlpar.c:398:53: sparse:     got restricted __be32 [usertype] drc_index
   arch/powerpc/platforms/pseries/dlpar.c:418:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] drc_count @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/dlpar.c:418:43: sparse:     expected restricted __be32 [usertype] drc_count
   arch/powerpc/platforms/pseries/dlpar.c:418:43: sparse:     got unsigned int [usertype]
   arch/powerpc/platforms/pseries/dlpar.c:422:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] drc_index @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/dlpar.c:422:43: sparse:     expected restricted __be32 [usertype] drc_index
   arch/powerpc/platforms/pseries/dlpar.c:422:43: sparse:     got unsigned int [usertype]
   arch/powerpc/platforms/pseries/dlpar.c:426:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] count @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/dlpar.c:426:42: sparse:     expected restricted __be32 [usertype] count
   arch/powerpc/platforms/pseries/dlpar.c:426:42: sparse:     got unsigned int [usertype]
   arch/powerpc/platforms/pseries/dlpar.c:428:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] index @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/dlpar.c:428:42: sparse:     expected restricted __be32 [usertype] index
   arch/powerpc/platforms/pseries/dlpar.c:428:42: sparse:     got unsigned int [usertype]

vim +398 arch/powerpc/platforms/pseries/dlpar.c

   386	
   387	static int dlpar_hp_dt(struct pseries_hp_errorlog *phpe)
   388	{
   389		int rc;
   390	
   391		if (phpe->id_type != PSERIES_HP_ELOG_ID_DRC_INDEX)
   392			return -EINVAL;
   393	
   394		lock_device_hotplug();
   395	
   396		switch (phpe->action) {
   397		case PSERIES_HP_ELOG_ACTION_REMOVE:
 > 398			rc = dlpar_hp_dt_remove(phpe->_drc_u.drc_index);
   399			break;
   400		default:
   401			pr_err("Invalid action (%d) specified\n", phpe->action);
   402			rc = -EINVAL;
   403			break;
   404		}
   405	
   406		unlock_device_hotplug();
   407	
   408		return rc;
   409	}
   410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

