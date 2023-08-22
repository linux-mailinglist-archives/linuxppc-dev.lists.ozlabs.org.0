Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1712F7839A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 07:59:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N6cSs0cK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVJZf6ygrz3bxS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 15:59:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N6cSs0cK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVJYl3gW1z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 15:58:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692683915; x=1724219915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dh6VKg/k7t96RPnIKLfzpJLVxZOwEG25irD700GdLGQ=;
  b=N6cSs0cKOxvRY5mAPe6Mre1pDD4oi4dh9rJwhYK8IYu/3yrdQdhf2Nn+
   OkJ+YSNhdlpBlnxI99oS6LaZ16bkSWbUpdeEiDsFn4mS6DVkv3Z3ZllUn
   3zJfCEcHIbzqxE8D6FI0uTHBxOSdnLzOd5hIXl6CfeVi+CGsTd2qEB0Qe
   hacmKWoGVHrzXfgYjIy+IiZLSVtC+45i6+CLJk4RB0Myh8Gocz1mIEf4g
   Cg5nh7puJIhuVdTbjYeag1BhDjiUuB1o7CTYzXdPPnhTRXAhyPUzigCwY
   GjyJ8Chh+BwDLae++IzE4Bsa6l6xY2SkNUbEhsmVQ/MZ+bII8wlMtBRbv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460152786"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="460152786"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 22:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="1066911724"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="1066911724"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Aug 2023 22:58:26 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYKPJ-0001Pk-2L;
	Tue, 22 Aug 2023 05:58:25 +0000
Date: Tue, 22 Aug 2023 13:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [powerpc:next-test 9/109] arch/powerpc/include/asm/paca.h:155:23:
 error: field has incomplete type 'struct tlb_core_data'
Message-ID: <202308221352.nocgtdJP-lkp@intel.com>
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
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   0f71dcfb4aef6043da6cc509e7a7f6a3ae87c12d
commit: 3a24ea0df83e32355d897a18bbd82e05986dcdc3 [9/109] powerpc/kuap: Use ASM feature fixups instead of static branches
config: powerpc64-randconfig-r012-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221352.nocgtdJP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221352.nocgtdJP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221352.nocgtdJP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/mm/nohash/kup.c:11:
   In file included from arch/powerpc/include/asm/kup.h:24:
   In file included from arch/powerpc/include/asm/nohash/kup-booke.h:6:
   In file included from arch/powerpc/include/asm/mmu.h:148:
   In file included from arch/powerpc/include/asm/percpu.h:20:
>> arch/powerpc/include/asm/paca.h:155:23: error: field has incomplete type 'struct tlb_core_data'
     155 |         struct tlb_core_data tcd;
         |                              ^
   arch/powerpc/include/asm/paca.h:139:9: note: forward declaration of 'struct tlb_core_data'
     139 |         struct tlb_core_data *tcd_ptr;
         |                ^
   arch/powerpc/include/asm/paca.h:291:36: warning: declaration of 'struct mm_struct' will not be visible outside of this function [-Wvisibility]
     291 | extern void copy_mm_to_paca(struct mm_struct *mm);
         |                                    ^
   1 warning and 1 error generated.


vim +155 arch/powerpc/include/asm/paca.h

91c60b5b8209627 Benjamin Herrenschmidt 2009-06-02  131  
e0d68273d706953 Christophe Leroy       2022-09-19  132  #ifdef CONFIG_PPC_BOOK3E_64
016f8cf0d87bb2b Kevin Hao              2015-03-10  133  	u64 exgen[8] __aligned(0x40);
f67f4ef5fcdfdee Scott Wood             2011-06-22  134  	/* Keep pgd in the same cacheline as the start of extlb */
016f8cf0d87bb2b Kevin Hao              2015-03-10  135  	pgd_t *pgd __aligned(0x40); /* Current PGD */
f67f4ef5fcdfdee Scott Wood             2011-06-22  136  	pgd_t *kernel_pgd;		/* Kernel PGD */
28efc35fe68dacb Scott Wood             2013-10-11  137  
28efc35fe68dacb Scott Wood             2013-10-11  138  	/* Shared by all threads of a core -- points to tcd of first thread */
28efc35fe68dacb Scott Wood             2013-10-11  139  	struct tlb_core_data *tcd_ptr;
28efc35fe68dacb Scott Wood             2013-10-11  140  
609af38f8fc0f1d Scott Wood             2014-03-10  141  	/*
609af38f8fc0f1d Scott Wood             2014-03-10  142  	 * We can have up to 3 levels of reentrancy in the TLB miss handler,
609af38f8fc0f1d Scott Wood             2014-03-10  143  	 * in each of four exception levels (normal, crit, mcheck, debug).
609af38f8fc0f1d Scott Wood             2014-03-10  144  	 */
609af38f8fc0f1d Scott Wood             2014-03-10  145  	u64 extlb[12][EX_TLB_SIZE / sizeof(u64)];
dce6670aaa7efec Benjamin Herrenschmidt 2009-07-23  146  	u64 exmc[8];		/* used for machine checks */
dce6670aaa7efec Benjamin Herrenschmidt 2009-07-23  147  	u64 excrit[8];		/* used for crit interrupts */
dce6670aaa7efec Benjamin Herrenschmidt 2009-07-23  148  	u64 exdbg[8];		/* used for debug interrupts */
dce6670aaa7efec Benjamin Herrenschmidt 2009-07-23  149  
dce6670aaa7efec Benjamin Herrenschmidt 2009-07-23  150  	/* Kernel stack pointers for use by special exceptions */
dce6670aaa7efec Benjamin Herrenschmidt 2009-07-23  151  	void *mc_kstack;
dce6670aaa7efec Benjamin Herrenschmidt 2009-07-23  152  	void *crit_kstack;
dce6670aaa7efec Benjamin Herrenschmidt 2009-07-23  153  	void *dbg_kstack;
28efc35fe68dacb Scott Wood             2013-10-11  154  
28efc35fe68dacb Scott Wood             2013-10-11 @155  	struct tlb_core_data tcd;
e0d68273d706953 Christophe Leroy       2022-09-19  156  #endif /* CONFIG_PPC_BOOK3E_64 */
dce6670aaa7efec Benjamin Herrenschmidt 2009-07-23  157  

:::::: The code at line 155 was first introduced by commit
:::::: 28efc35fe68dacbddc4b12c2fa8f2df1593a4ad3 powerpc/e6500: TLB miss handler with hardware tablewalk support

:::::: TO: Scott Wood <scottwood@freescale.com>
:::::: CC: Scott Wood <scottwood@freescale.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
