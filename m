Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC6593FF1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 22:22:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kF0EH3yk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXqX73L8zz3clw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 06:21:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kF0EH3yk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXqWR0ctwz30Vk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 06:21:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722284483; x=1753820483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9MnFmbMMl4welPbAXfEJprTWfaQmhfFar1+EgR/YeEY=;
  b=kF0EH3ykmNNi/AP2pnAsQCoG7sgDlPUbVJQhYeKz3KYYWcywHAcCDlvc
   G3qJ41hUH6Bs6jq8CUskfiMesR8tymak6WVxzi7TnMDuDzA8sHoZPJ0gf
   9VfL1cDKcohgKD5RCFmBPreMOLHEQGzHqCQrILgTrZzQXLg9ZYhicAQ1k
   RbPCiCjXLBOQke7962o8LoEHbQKRacWUhSnwoxkaXiDOGReCbtfptdCsR
   47G0SENMrnPX+31+rnCALDulxIRSZTMUwqQpVhqYu49wkVvDmdTB2TjIK
   XMVAF6Mh3gFt5PtKi44TWVUsTmi+ligJK4u8b+2QmOZEEO9PBFLfrNIRR
   A==;
X-CSE-ConnectionGUID: Fz8K976ATcKBUSHfGcdOeQ==
X-CSE-MsgGUID: YZAdCffATKC/97ZDXcbkgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20222987"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="20222987"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 13:21:04 -0700
X-CSE-ConnectionGUID: JMsHV9crROu7a5Rx0cgJEA==
X-CSE-MsgGUID: NRpEEVfCSs2EuHroYVXk+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="85050208"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jul 2024 13:21:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYWra-000s2F-2j;
	Mon, 29 Jul 2024 20:20:58 +0000
Date: Tue, 30 Jul 2024 04:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: Baruch Siach <baruch@tkos.co.il>, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 2/3] dma-mapping: replace zone_dma_bits by
 zone_dma_limit
Message-ID: <202407300338.oaUo6jtB-lkp@intel.com>
References: <053fa4806a2c63efcde80caca473a8b670a2701c.1722249878.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <053fa4806a2c63efcde80caca473a8b670a2701c.1722249878.git.baruch@tkos.co.il>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Baruch,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on powerpc/next powerpc/fixes s390/features linus/master v6.11-rc1 next-20240729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baruch-Siach/dma-mapping-improve-DMA-zone-selection/20240729-211018
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/053fa4806a2c63efcde80caca473a8b670a2701c.1722249878.git.baruch%40tkos.co.il
patch subject: [PATCH v3 2/3] dma-mapping: replace zone_dma_bits by zone_dma_limit
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240730/202407300338.oaUo6jtB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407300338.oaUo6jtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300338.oaUo6jtB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/dma/direct.c:7:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/dma/direct.c:23:46: warning: implicit conversion from 'unsigned long long' to 'phys_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
      23 | phys_addr_t zone_dma_limit __ro_after_init = DMA_BIT_MASK(24);
         |             ~~~~~~~~~~~~~~                   ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   2 warnings generated.


vim +23 kernel/dma/direct.c

   > 7	#include <linux/memblock.h>
     8	#include <linux/export.h>
     9	#include <linux/mm.h>
    10	#include <linux/dma-map-ops.h>
    11	#include <linux/scatterlist.h>
    12	#include <linux/pfn.h>
    13	#include <linux/vmalloc.h>
    14	#include <linux/set_memory.h>
    15	#include <linux/slab.h>
    16	#include "direct.h"
    17	
    18	/*
    19	 * Most architectures use ZONE_DMA for the first 16 Megabytes, but some use
    20	 * it for entirely different regions. In that case the arch code needs to
    21	 * override the variable below for dma-direct to work properly.
    22	 */
  > 23	phys_addr_t zone_dma_limit __ro_after_init = DMA_BIT_MASK(24);
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
