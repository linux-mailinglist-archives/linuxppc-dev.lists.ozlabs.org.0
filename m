Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D27FF86C023
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 06:22:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iOP6Mvzc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlfjh3BxGz3dXc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 16:22:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iOP6Mvzc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlfhx1Lc0z30dn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 16:21:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709184098; x=1740720098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+OKbZBg8INtp2Ye+Yftr/WMz8Wbb90mWnLDPuYct/UY=;
  b=iOP6MvzcIoUKLLy+mjgawZKzguG6xQ7Dd2FYs1rNKDaCcdsVwooyBsFb
   knPGRJ1eakmptQtjDV06/GbkznNU/kaL/uNel19D9AuyfkGW4d++wwiBP
   sn6+1PITFZX9b+1ZHfrYf5rvKcq04+1mrsmurZBOUAPITdW5q3I2DikZO
   K7s5D0c3xlps5FHKNWQej8gJ2kKMh/nXXNVgWxvgk6haLWR+X6HCDLkt5
   Duel0+Fm4oZLC//aBaZY9qb13B/V4n3BUs81LhqXvaq5joGDnScUL0aJs
   ji0bwJi9eUALzc3UfGVFDu56edVHSFVm85XDdKjzJDBQX6bny2CvoGZQG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="26097764"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="26097764"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 21:21:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="7735235"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Feb 2024 21:21:26 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfYrD-000CfY-1k;
	Thu, 29 Feb 2024 05:21:23 +0000
Date: Thu, 29 Feb 2024 13:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: peterx@redhat.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 5/5] mm/treewide: Drop pXd_large()
Message-ID: <202402291233.CVhChP2c-lkp@intel.com>
References: <20240228085350.520953-6-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240228085350.520953-6-peterx@redhat.com>
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
Cc: llvm@lists.linux.dev, Yang Shi <shy828301@gmail.com>, Muchun Song <muchun.song@linux.dev>, x86@kernel.org, peterx@redhat.com, Linux Memory Management List <linux-mm@kvack.org>, Jason Gunthorpe <jgg@nvidia.com>, oe-kbuild-all@lists.linux.dev, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/peterx-redhat-com/mm-ppc-Define-pXd_large-with-pXd_leaf/20240228-170049
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240228085350.520953-6-peterx%40redhat.com
patch subject: [PATCH 5/5] mm/treewide: Drop pXd_large()
config: i386-buildonly-randconfig-001-20240228 (https://download.01.org/0day-ci/archive/20240229/202402291233.CVhChP2c-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402291233.CVhChP2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402291233.CVhChP2c-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:16:
>> arch/x86/include/asm/pgtable.h:1099:19: error: redefinition of 'pud_leaf'
    1099 | static inline int pud_leaf(pud_t pud)
         |                   ^
   include/asm-generic/pgtable-nopmd.h:34:19: note: previous definition is here
      34 | static inline int pud_leaf(pud_t pud)           { return 0; }
         |                   ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=298844285
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2 shuffle=298844285
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=298844285
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=298844285
   make: Target 'prepare' not remade because of errors.


vim +/pud_leaf +1099 arch/x86/include/asm/pgtable.h

  1093	
  1094	static inline int pud_bad(pud_t pud)
  1095	{
  1096		return (pud_flags(pud) & ~(_KERNPG_TABLE | _PAGE_USER)) != 0;
  1097	}
  1098	#else
> 1099	static inline int pud_leaf(pud_t pud)
  1100	{
  1101		return 0;
  1102	}
  1103	#endif	/* CONFIG_PGTABLE_LEVELS > 2 */
  1104	#define pud_leaf pud_leaf
  1105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
