Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB00B783643
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 01:30:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OOacZ67H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV7y248yLz3c2J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 09:30:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OOacZ67H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV7x70wR9z2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 09:29:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692660587; x=1724196587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U2iIqr0YL6L2uPTkQS2SW+/1NPESJCje4MuYIhOORRw=;
  b=OOacZ67HUyLUMR7Ti77ibzHNAX2PraC0MB/G/K/Ck+DcIi52fyT+gf+b
   YL20E5MB5bWBWG+O8qgITcrJtV8Sm5WAiu5mzudNXQ0qI87VyYs9d6WdR
   MOIJX5tTTbQt9VcDSFLIMloycyr6W7P5G+NaMgM3xv1Mgt24faLnQeO7x
   /3NXdmUA6Jfl72yHcJ5TYsfUIEy2sdZGLrydniRpiXzdKKAwgn84T6Y2L
   JRCrTzYRX59BAbWlmPw1bsprCGpg6f8OxR0QkAL4gIGdNWbm7wR8dCxF1
   KoSDaVK53gIwWctC5VLNYT6WON3pR+2Hvtcg/Y7PM8RMjPzhNJeT80xbN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404727906"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="404727906"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 16:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765547691"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="765547691"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Aug 2023 16:29:36 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYEL1-00013W-2e;
	Mon, 21 Aug 2023 23:29:35 +0000
Date: Tue, 22 Aug 2023 07:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [powerpc:next-test 9/109] arch/powerpc/include/asm/paca.h:155:30:
 error: field 'tcd' has incomplete type
Message-ID: <202308220708.nRf5AUAe-lkp@intel.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   0f71dcfb4aef6043da6cc509e7a7f6a3ae87c12d
commit: 3a24ea0df83e32355d897a18bbd82e05986dcdc3 [9/109] powerpc/kuap: Use ASM feature fixups instead of static branches
config: powerpc64-randconfig-r036-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220708.nRf5AUAe-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220708.nRf5AUAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220708.nRf5AUAe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/percpu.h:20,
                    from arch/powerpc/include/asm/mmu.h:148,
                    from arch/powerpc/include/asm/nohash/kup-booke.h:6,
                    from arch/powerpc/include/asm/kup.h:24,
                    from arch/powerpc/mm/nohash/kup.c:11:
>> arch/powerpc/include/asm/paca.h:155:30: error: field 'tcd' has incomplete type
     155 |         struct tlb_core_data tcd;
         |                              ^~~
   arch/powerpc/include/asm/paca.h:291:36: error: 'struct mm_struct' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
     291 | extern void copy_mm_to_paca(struct mm_struct *mm);
         |                                    ^~~~~~~~~
   cc1: all warnings being treated as errors


vim +/tcd +155 arch/powerpc/include/asm/paca.h

91c60b5b820962 Benjamin Herrenschmidt 2009-06-02  131  
e0d68273d70695 Christophe Leroy       2022-09-19  132  #ifdef CONFIG_PPC_BOOK3E_64
016f8cf0d87bb2 Kevin Hao              2015-03-10  133  	u64 exgen[8] __aligned(0x40);
f67f4ef5fcdfde Scott Wood             2011-06-22  134  	/* Keep pgd in the same cacheline as the start of extlb */
016f8cf0d87bb2 Kevin Hao              2015-03-10  135  	pgd_t *pgd __aligned(0x40); /* Current PGD */
f67f4ef5fcdfde Scott Wood             2011-06-22  136  	pgd_t *kernel_pgd;		/* Kernel PGD */
28efc35fe68dac Scott Wood             2013-10-11  137  
28efc35fe68dac Scott Wood             2013-10-11  138  	/* Shared by all threads of a core -- points to tcd of first thread */
28efc35fe68dac Scott Wood             2013-10-11  139  	struct tlb_core_data *tcd_ptr;
28efc35fe68dac Scott Wood             2013-10-11  140  
609af38f8fc0f1 Scott Wood             2014-03-10  141  	/*
609af38f8fc0f1 Scott Wood             2014-03-10  142  	 * We can have up to 3 levels of reentrancy in the TLB miss handler,
609af38f8fc0f1 Scott Wood             2014-03-10  143  	 * in each of four exception levels (normal, crit, mcheck, debug).
609af38f8fc0f1 Scott Wood             2014-03-10  144  	 */
609af38f8fc0f1 Scott Wood             2014-03-10  145  	u64 extlb[12][EX_TLB_SIZE / sizeof(u64)];
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  146  	u64 exmc[8];		/* used for machine checks */
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  147  	u64 excrit[8];		/* used for crit interrupts */
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  148  	u64 exdbg[8];		/* used for debug interrupts */
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  149  
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  150  	/* Kernel stack pointers for use by special exceptions */
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  151  	void *mc_kstack;
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  152  	void *crit_kstack;
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  153  	void *dbg_kstack;
28efc35fe68dac Scott Wood             2013-10-11  154  
28efc35fe68dac Scott Wood             2013-10-11 @155  	struct tlb_core_data tcd;
e0d68273d70695 Christophe Leroy       2022-09-19  156  #endif /* CONFIG_PPC_BOOK3E_64 */
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  157  

:::::: The code at line 155 was first introduced by commit
:::::: 28efc35fe68dacbddc4b12c2fa8f2df1593a4ad3 powerpc/e6500: TLB miss handler with hardware tablewalk support

:::::: TO: Scott Wood <scottwood@freescale.com>
:::::: CC: Scott Wood <scottwood@freescale.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
