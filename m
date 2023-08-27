Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C17C789FD8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Aug 2023 17:06:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HWFwUq2I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RYcTs1DSmz3bWH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 01:06:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HWFwUq2I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RYcSq0ZdSz2yV5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 01:05:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693148747; x=1724684747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcNWVeMQiljODgI1Ij5VD0PoBYsmmv3eqUG5+gXeR6Q=;
  b=HWFwUq2IDxoMuY7mGmkhhttGKGPDPJwfc3M4xwafh8nblmSvNcjuG8QC
   WMKWCudhsHEkTZAKQuRJyYrUEKSMqgVqUjRp+PMPY+QTFuUFURB0ooDK5
   udJvesaTHBSNegkpsdXtowF5sAaUwrMoK4XoU4Fdlf0fzfsRUtO8qFMrp
   HP/aGRk1+12mRkgAJsFqrNgcjspwFs38W3vUoBJ4zcOZnTXQ9dDtZJ2Vl
   Ud4Cf358OiZX4qGVQpbyfZWHpOi4YiFfg3WGwuaqcWhHLVQqR4uGYkwiG
   DSFKsTdTAO+WyVxi6v2J5F6sE0mGDBX/4xKXWUmOYwKwQfkW4COzb71Kt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="365154111"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="365154111"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 08:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="714862075"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="714862075"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Aug 2023 08:05:36 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaHKa-0005uj-0J;
	Sun, 27 Aug 2023 15:05:36 +0000
Date: Sun, 27 Aug 2023 23:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [powerpc:next-test 84/129] arch/powerpc/mm/init_64.c:477:45: error:
 'SECTION_SIZE_BITS' undeclared
Message-ID: <202308272310.O7VMTwkZ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Reza Arbab <arbab@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   c37b6908f7b2bd24dcaaf14a180e28c9132b9c58
commit: 4d15721177d539d743fcf31d7bb376fb3b81aeb6 [84/129] powerpc/mm: Cleanup memory block size probing
config: powerpc64-randconfig-r021-20230827 (https://download.01.org/0day-ci/archive/20230827/202308272310.O7VMTwkZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308272310.O7VMTwkZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308272310.O7VMTwkZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/mm/init_64.c: In function 'update_memory_block_size':
>> arch/powerpc/mm/init_64.c:477:45: error: 'SECTION_SIZE_BITS' undeclared (first use in this function)
     477 |         unsigned long section_size = 1UL << SECTION_SIZE_BITS;
         |                                             ^~~~~~~~~~~~~~~~~
   arch/powerpc/mm/init_64.c:477:45: note: each undeclared identifier is reported only once for each function it appears in
   In file included from arch/powerpc/mm/init_64.c:43:
   arch/powerpc/mm/init_64.c: In function 'probe_memory_block_size':
>> include/linux/memory.h:23:43: error: 'SECTION_SIZE_BITS' undeclared (first use in this function)
      23 | #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
         |                                           ^~~~~~~~~~~~~~~~~
   arch/powerpc/mm/init_64.c:510:39: note: in expansion of macro 'MIN_MEMORY_BLOCK_SIZE'
     510 |                         *block_size = MIN_MEMORY_BLOCK_SIZE;
         |                                       ^~~~~~~~~~~~~~~~~~~~~


vim +/SECTION_SIZE_BITS +477 arch/powerpc/mm/init_64.c

   474	
   475	static void update_memory_block_size(unsigned long *block_size, unsigned long mem_size)
   476	{
 > 477		unsigned long section_size = 1UL << SECTION_SIZE_BITS;
   478	
   479		for (; *block_size > section_size; *block_size >>= 2) {
   480	
   481			if ((mem_size & *block_size) == 0)
   482				break;
   483		}
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
