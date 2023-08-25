Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DFE7880A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 09:10:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NFOUTRRo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXB1p1H35z3cF2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 17:10:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NFOUTRRo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXB0s4p3Bz300f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 17:10:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692947406; x=1724483406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HxtjP/eWI5irDDcXkwHLdeRMWrol5auXuwj5c4Fn374=;
  b=NFOUTRRob8DuANb6qI9ZMZvHpNhtr8i43fZbCIPYkooHJ2UvOfUvsDSw
   qHfDwDfTGLyRH6BNctHVyONCPg5PWcDr+CUoVAdjvHajOFzXyGHgM3ZuH
   rbdRQyTKagEDiOmaaUpzWl6tDWBfyrpvaMiVrafe/BCt08eHyY6x5CAfA
   r0sIZuRre4XnSkVuo+6DZW7vpXkyw3L+dF1Q9aFpUfyBeQr1rgMJumQbU
   4EESX5zw6Q10ibXshlp2cb487hscoFGoMZYIvc7j63GapKWl2w7L0zWQi
   5tJ5wZzW8jRsJVKyVlozy1m+5lQO7eGXJLkVTDUA2j9w+u+RauhrGKox/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354179023"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="354179023"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 00:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687203794"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="687203794"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Aug 2023 00:09:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZQx9-0003IK-1m;
	Fri, 25 Aug 2023 07:09:55 +0000
Date: Fri, 25 Aug 2023 15:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [powerpc:next 84/128] arch/powerpc/mm/init_64.c:477:38: error: use
 of undeclared identifier 'SECTION_SIZE_BITS'
Message-ID: <202308251532.k9PpWEAD-lkp@intel.com>
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
Cc: Reza Arbab <arbab@linux.ibm.com>, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
head:   b9bbbf4979073d5536b7650decd37fcb901e6556
commit: 4d15721177d539d743fcf31d7bb376fb3b81aeb6 [84/128] powerpc/mm: Cleanup memory block size probing
config: powerpc64-randconfig-r005-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251532.k9PpWEAD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251532.k9PpWEAD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251532.k9PpWEAD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/mm/init_64.c:477:38: error: use of undeclared identifier 'SECTION_SIZE_BITS'
     477 |         unsigned long section_size = 1UL << SECTION_SIZE_BITS;
         |                                             ^
   arch/powerpc/mm/init_64.c:510:18: error: use of undeclared identifier 'SECTION_SIZE_BITS'
     510 |                         *block_size = MIN_MEMORY_BLOCK_SIZE;
         |                                       ^
   include/linux/memory.h:23:43: note: expanded from macro 'MIN_MEMORY_BLOCK_SIZE'
      23 | #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
         |                                           ^
   2 errors generated.


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
