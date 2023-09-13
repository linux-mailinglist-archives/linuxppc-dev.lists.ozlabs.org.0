Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F251579E654
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 13:15:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eIVaJcrh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlyYF5z86z3cNN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 21:15:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eIVaJcrh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlyXL2JsHz2yVg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 21:14:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694603682; x=1726139682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CO7FuKGxFldgK75QHPqN9lKBJ3RZKKyTcKvNBywVB6U=;
  b=eIVaJcrhRj0GAJ3n0q6cNtKRRByUfz4D6ApaMd2aKP2W+pbqEXp+nun2
   lCZ/YEKa34Es+rLl42ICMhuViVS5KhH1kedr3+7hPr45qWW4gcNnZ+H9B
   pltiFaGMn2tSEP7kMZkgb6sQMwcR/p4MPN0evWpCReIbMn55sLKmrNyiN
   /4747PtJHlyRa5SCLG47K+s1fKGYcqhNyAEDX09onr+cW2GqqCfb/URdO
   u+Ut7t6ugzP3CUhDRzVMIJUSthW468RRpU7+mi+CsrukvzyJ0ySKQrA8k
   JYrlT/VGkvkXT2lxavq21LDlD0Tep5CQAx/cbYW4HKLgZkeVDjCC/rpQ3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="363660579"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="363660579"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 04:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="917791463"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="917791463"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Sep 2023 04:14:31 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgNpD-0000R1-29;
	Wed, 13 Sep 2023 11:14:28 +0000
Date: Wed, 13 Sep 2023 19:14:22 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 07/19] powerpc: Untangle fixmap.h and pgtable.h and
 mmu.h
Message-ID: <202309131942.k7EzJho8-lkp@intel.com>
References: <c94717708db817a0a0a6349431a2701252686899.1694443576.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c94717708db817a0a0a6349431a2701252686899.1694443576.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc1 next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-8xx-Fix-pte_access_permitted-for-PAGE_NONE/20230912-031616
base:   linus/master
patch link:    https://lore.kernel.org/r/c94717708db817a0a0a6349431a2701252686899.1694443576.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH v1 07/19] powerpc: Untangle fixmap.h and pgtable.h and mmu.h
config: powerpc-randconfig-r013-20230912 (https://download.01.org/0day-ci/archive/20230913/202309131942.k7EzJho8-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131942.k7EzJho8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131942.k7EzJho8-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/83xx/misc.c: In function 'mpc83xx_setup_arch':
>> arch/powerpc/platforms/83xx/misc.c:126:28: error: implicit declaration of function 'fix_to_virt'; did you mean 'bus_to_virt'? [-Werror=implicit-function-declaration]
     126 |         unsigned long va = fix_to_virt(FIX_IMMR_BASE);
         |                            ^~~~~~~~~~~
         |                            bus_to_virt
>> arch/powerpc/platforms/83xx/misc.c:126:40: error: 'FIX_IMMR_BASE' undeclared (first use in this function)
     126 |         unsigned long va = fix_to_virt(FIX_IMMR_BASE);
         |                                        ^~~~~~~~~~~~~
   arch/powerpc/platforms/83xx/misc.c:126:40: note: each undeclared identifier is reported only once for each function it appears in
   cc1: all warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +/FIX_IMMR_BASE +126 arch/powerpc/platforms/83xx/misc.c

fff69fd03d1290 Kevin Hao        2016-08-23  121  
fff69fd03d1290 Kevin Hao        2016-08-23  122  void __init mpc83xx_setup_arch(void)
fff69fd03d1290 Kevin Hao        2016-08-23  123  {
6b7c095a51e1ba Christophe Leroy 2019-09-16  124  	phys_addr_t immrbase = get_immrbase();
6b7c095a51e1ba Christophe Leroy 2019-09-16  125  	int immrsize = IS_ALIGNED(immrbase, SZ_2M) ? SZ_2M : SZ_1M;
6b7c095a51e1ba Christophe Leroy 2019-09-16 @126  	unsigned long va = fix_to_virt(FIX_IMMR_BASE);
6b7c095a51e1ba Christophe Leroy 2019-09-16  127  
1ce844973bb516 Christophe Leroy 2022-06-14  128  	if (ppc_md.progress)
1ce844973bb516 Christophe Leroy 2022-06-14  129  		ppc_md.progress("mpc83xx_setup_arch()", 0);
1ce844973bb516 Christophe Leroy 2022-06-14  130  
6b7c095a51e1ba Christophe Leroy 2019-09-16  131  	setbat(-1, va, immrbase, immrsize, PAGE_KERNEL_NCG);
6b7c095a51e1ba Christophe Leroy 2019-09-16  132  	update_bats();
6b7c095a51e1ba Christophe Leroy 2019-09-16  133  }
0deae39cec6dab Christophe Leroy 2018-12-10  134  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
