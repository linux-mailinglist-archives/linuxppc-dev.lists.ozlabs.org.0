Return-Path: <linuxppc-dev+bounces-161-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54083955D3D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Aug 2024 17:40:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wn0Ky5x4Lz2xPW;
	Mon, 19 Aug 2024 01:40:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fdbnt6JK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wn0Kx0KKlz2xJT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 01:40:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723995622; x=1755531622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0A6/MoT54hALZa+uD7XcyT5G4xJ6QbohQoqw15Fk0v8=;
  b=fdbnt6JKK+2pdMFmUMyD4GB2TnsN1EmTsLq+mcWeTIo8iEpkYP2uO5sz
   qwo61kg9O0HeIGIL3ggzQuWmnuqKe+ih6GUaCKPM6PwizwX33g5XI8TL+
   Gqt0xr1X216+nx9vT4xozoVLVVo0lLHX3/QGHPh834U8FnkO5vnEjv/NN
   hLP+ksZKaHwJnrJHUOqXE0Dy2AF3HQ6lk4WwMk0B8EYC7SV6qP5Z1j+GI
   Hhg2cnWlIHQ2DwsYRo92RBRhQUTZ+bI8VXVytiBNP2kR8JglfQAysB53g
   D/flPFLcY2bL0iQsK5VTwSlWkfDhLJf6LLyE5mRECqABnK3uwgjPtyLVG
   A==;
X-CSE-ConnectionGUID: BZzuW4kkSgK9L31YSNVyuQ==
X-CSE-MsgGUID: g5vn7doUSralqGCuLHWGAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="25991338"
X-IronPort-AV: E=Sophos;i="6.10,157,1719903600"; 
   d="scan'208";a="25991338"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 08:40:13 -0700
X-CSE-ConnectionGUID: ePUVWcffTdqUF+2b+owtAA==
X-CSE-MsgGUID: 4UX1xVSZTsq5Givi8FO7EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,157,1719903600"; 
   d="scan'208";a="90881145"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Aug 2024 08:40:10 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfi0m-0008IY-0D;
	Sun, 18 Aug 2024 15:40:08 +0000
Date: Sun, 18 Aug 2024 23:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, mpe@ellerman.id.au, npiggin@gmail.com,
	tyreld@linux.ibm.com, brking@linux.ibm.com, hbabu@us.ibm.com,
	haren@linux.ibm.com
Subject: Re: [PATCH v2 2/2] powerpc/pseries/dlpar: Add device tree nodes for
 DLPAR IO add
Message-ID: <202408182302.o7QRO45S-lkp@intel.com>
References: <20240817035401.125833-2-haren@linux.ibm.com>
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
In-Reply-To: <20240817035401.125833-2-haren@linux.ibm.com>

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-dlpar-Add-device-tree-nodes-for-DLPAR-IO-add/20240817-115833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240817035401.125833-2-haren%40linux.ibm.com
patch subject: [PATCH v2 2/2] powerpc/pseries/dlpar: Add device tree nodes for DLPAR IO add
config: powerpc64-randconfig-r121-20240818 (https://download.01.org/0day-ci/archive/20240818/202408182302.o7QRO45S-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce: (https://download.01.org/0day-ci/archive/20240818/202408182302.o7QRO45S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408182302.o7QRO45S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/dlpar.c:525:50: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] index @@     got restricted __be32 [usertype] drc_index @@
   arch/powerpc/platforms/pseries/dlpar.c:525:50: sparse:     expected unsigned int [usertype] index
   arch/powerpc/platforms/pseries/dlpar.c:525:50: sparse:     got restricted __be32 [usertype] drc_index
   arch/powerpc/platforms/pseries/dlpar.c:528:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] drc_index @@     got restricted __be32 [usertype] drc_index @@
   arch/powerpc/platforms/pseries/dlpar.c:528:53: sparse:     expected unsigned int [usertype] drc_index
   arch/powerpc/platforms/pseries/dlpar.c:528:53: sparse:     got restricted __be32 [usertype] drc_index
   arch/powerpc/platforms/pseries/dlpar.c:548:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] drc_count @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/dlpar.c:548:43: sparse:     expected restricted __be32 [usertype] drc_count
   arch/powerpc/platforms/pseries/dlpar.c:548:43: sparse:     got unsigned int [usertype]
   arch/powerpc/platforms/pseries/dlpar.c:552:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] drc_index @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/dlpar.c:552:43: sparse:     expected restricted __be32 [usertype] drc_index
   arch/powerpc/platforms/pseries/dlpar.c:552:43: sparse:     got unsigned int [usertype]
   arch/powerpc/platforms/pseries/dlpar.c:556:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] count @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/dlpar.c:556:42: sparse:     expected restricted __be32 [usertype] count
   arch/powerpc/platforms/pseries/dlpar.c:556:42: sparse:     got unsigned int [usertype]
   arch/powerpc/platforms/pseries/dlpar.c:558:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] index @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/dlpar.c:558:42: sparse:     expected restricted __be32 [usertype] index
   arch/powerpc/platforms/pseries/dlpar.c:558:42: sparse:     got unsigned int [usertype]

vim +525 arch/powerpc/platforms/pseries/dlpar.c

   513	
   514	static int dlpar_hp_dt(struct pseries_hp_errorlog *phpe)
   515	{
   516		int rc;
   517	
   518		if (phpe->id_type != PSERIES_HP_ELOG_ID_DRC_INDEX)
   519			return -EINVAL;
   520	
   521		lock_device_hotplug();
   522	
   523		switch (phpe->action) {
   524		case PSERIES_HP_ELOG_ACTION_ADD:
 > 525			rc = dlpar_hp_dt_add(phpe->_drc_u.drc_index);
   526			break;
   527		case PSERIES_HP_ELOG_ACTION_REMOVE:
   528			rc = dlpar_hp_dt_remove(phpe->_drc_u.drc_index);
   529			break;
   530		default:
   531			pr_err("Invalid action (%d) specified\n", phpe->action);
   532			rc = -EINVAL;
   533			break;
   534		}
   535	
   536		unlock_device_hotplug();
   537	
   538		return rc;
   539	}
   540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

