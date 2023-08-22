Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE767837D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 04:19:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=agx7MsyD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVCjN6nKCz3bxS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 12:19:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=agx7MsyD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVChR0kbmz2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 12:19:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692670743; x=1724206743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WVAMd5Vdd+9lMcwvVh+O+7Ue91ONnG9TZWrKngSXhkE=;
  b=agx7MsyDZXlC/i6gIr0c4zmWtL2bel6JKNVpz5fLxXcLfK1JbKmkyUBk
   eLB3C6iUzcFLataTUD2zNV/WwMe4JnnN+/pABuCP0r3vu6awjw7KLFyE/
   iEcVBaTkGRrFL9lVSoJthgP7k0KbsDWe0JhuqctqHntI1buRlt+KKvsXL
   DhXql7kLagqnRciTMpycIJYYHbhAeD7DuZcg016TITcYi8JNkrMiPFM4h
   lgrd9C5qOoXA11Oy7xoPqLcl4r7+9ECGoJKlLcf9HsmBnC+JDwt38b6uk
   iwZg5CapDiKSKKiZ8tja/xzzEk8xId8KVuqOnYtvfA1584XL6uSkOf58A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="372651371"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="372651371"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 19:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826160266"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="826160266"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2023 19:18:54 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYGyr-0001Dw-1i;
	Tue, 22 Aug 2023 02:18:53 +0000
Date: Tue, 22 Aug 2023 10:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [powerpc:next-test 9/109] arch/powerpc/include/asm/paca.h:291:36:
 warning: 'struct mm_struct' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202308221055.lw3UzJIL-lkp@intel.com>
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
config: powerpc64-randconfig-r031-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221055.lw3UzJIL-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221055.lw3UzJIL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221055.lw3UzJIL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/percpu.h:20,
                    from arch/powerpc/include/asm/mmu.h:148,
                    from arch/powerpc/include/asm/nohash/kup-booke.h:6,
                    from arch/powerpc/include/asm/kup.h:24,
                    from arch/powerpc/mm/nohash/kup.c:11:
   arch/powerpc/include/asm/paca.h:155:30: error: field 'tcd' has incomplete type
     155 |         struct tlb_core_data tcd;
         |                              ^~~
>> arch/powerpc/include/asm/paca.h:291:36: warning: 'struct mm_struct' declared inside parameter list will not be visible outside of this definition or declaration
     291 | extern void copy_mm_to_paca(struct mm_struct *mm);
         |                                    ^~~~~~~~~


vim +291 arch/powerpc/include/asm/paca.h

91c60b5b820962 arch/powerpc/include/asm/paca.h Benjamin Herrenschmidt 2009-06-02  131  
e0d68273d70695 arch/powerpc/include/asm/paca.h Christophe Leroy       2022-09-19  132  #ifdef CONFIG_PPC_BOOK3E_64
016f8cf0d87bb2 arch/powerpc/include/asm/paca.h Kevin Hao              2015-03-10  133  	u64 exgen[8] __aligned(0x40);
f67f4ef5fcdfde arch/powerpc/include/asm/paca.h Scott Wood             2011-06-22  134  	/* Keep pgd in the same cacheline as the start of extlb */
016f8cf0d87bb2 arch/powerpc/include/asm/paca.h Kevin Hao              2015-03-10  135  	pgd_t *pgd __aligned(0x40); /* Current PGD */
f67f4ef5fcdfde arch/powerpc/include/asm/paca.h Scott Wood             2011-06-22  136  	pgd_t *kernel_pgd;		/* Kernel PGD */
28efc35fe68dac arch/powerpc/include/asm/paca.h Scott Wood             2013-10-11  137  
28efc35fe68dac arch/powerpc/include/asm/paca.h Scott Wood             2013-10-11  138  	/* Shared by all threads of a core -- points to tcd of first thread */
28efc35fe68dac arch/powerpc/include/asm/paca.h Scott Wood             2013-10-11  139  	struct tlb_core_data *tcd_ptr;
28efc35fe68dac arch/powerpc/include/asm/paca.h Scott Wood             2013-10-11  140  
609af38f8fc0f1 arch/powerpc/include/asm/paca.h Scott Wood             2014-03-10  141  	/*
609af38f8fc0f1 arch/powerpc/include/asm/paca.h Scott Wood             2014-03-10  142  	 * We can have up to 3 levels of reentrancy in the TLB miss handler,
609af38f8fc0f1 arch/powerpc/include/asm/paca.h Scott Wood             2014-03-10  143  	 * in each of four exception levels (normal, crit, mcheck, debug).
609af38f8fc0f1 arch/powerpc/include/asm/paca.h Scott Wood             2014-03-10  144  	 */
609af38f8fc0f1 arch/powerpc/include/asm/paca.h Scott Wood             2014-03-10  145  	u64 extlb[12][EX_TLB_SIZE / sizeof(u64)];
dce6670aaa7efe arch/powerpc/include/asm/paca.h Benjamin Herrenschmidt 2009-07-23  146  	u64 exmc[8];		/* used for machine checks */
dce6670aaa7efe arch/powerpc/include/asm/paca.h Benjamin Herrenschmidt 2009-07-23  147  	u64 excrit[8];		/* used for crit interrupts */
dce6670aaa7efe arch/powerpc/include/asm/paca.h Benjamin Herrenschmidt 2009-07-23  148  	u64 exdbg[8];		/* used for debug interrupts */
dce6670aaa7efe arch/powerpc/include/asm/paca.h Benjamin Herrenschmidt 2009-07-23  149  
dce6670aaa7efe arch/powerpc/include/asm/paca.h Benjamin Herrenschmidt 2009-07-23  150  	/* Kernel stack pointers for use by special exceptions */
dce6670aaa7efe arch/powerpc/include/asm/paca.h Benjamin Herrenschmidt 2009-07-23  151  	void *mc_kstack;
dce6670aaa7efe arch/powerpc/include/asm/paca.h Benjamin Herrenschmidt 2009-07-23  152  	void *crit_kstack;
dce6670aaa7efe arch/powerpc/include/asm/paca.h Benjamin Herrenschmidt 2009-07-23  153  	void *dbg_kstack;
28efc35fe68dac arch/powerpc/include/asm/paca.h Scott Wood             2013-10-11  154  
28efc35fe68dac arch/powerpc/include/asm/paca.h Scott Wood             2013-10-11 @155  	struct tlb_core_data tcd;
e0d68273d70695 arch/powerpc/include/asm/paca.h Christophe Leroy       2022-09-19  156  #endif /* CONFIG_PPC_BOOK3E_64 */
dce6670aaa7efe arch/powerpc/include/asm/paca.h Benjamin Herrenschmidt 2009-07-23  157  
387e220a2e5e63 arch/powerpc/include/asm/paca.h Nicholas Piggin        2021-12-02  158  #ifdef CONFIG_PPC_64S_HASH_MMU
54be0b9c7c9888 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-10-02  159  	unsigned char mm_ctx_low_slices_psize[BITS_PER_LONG / BITS_PER_BYTE];
54be0b9c7c9888 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-10-02  160  	unsigned char mm_ctx_high_slices_psize[SLICE_ARRAY_SIZE];
54be0b9c7c9888 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-10-02  161  #endif
54be0b9c7c9888 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-10-02  162  
^1da177e4c3f41 include/asm-ppc64/paca.h        Linus Torvalds         2005-04-16  163  	/*
^1da177e4c3f41 include/asm-ppc64/paca.h        Linus Torvalds         2005-04-16  164  	 * then miscellaneous read-write fields
^1da177e4c3f41 include/asm-ppc64/paca.h        Linus Torvalds         2005-04-16  165  	 */
^1da177e4c3f41 include/asm-ppc64/paca.h        Linus Torvalds         2005-04-16  166  	struct task_struct *__current;	/* Pointer to current */
^1da177e4c3f41 include/asm-ppc64/paca.h        Linus Torvalds         2005-04-16  167  	u64 kstack;			/* Saved Kernel stack addr */
7b08729cb272b4 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-05-02  168  	u64 saved_r1;			/* r1 save for RTAS calls or PM or EE=0 */
^1da177e4c3f41 include/asm-ppc64/paca.h        Linus Torvalds         2005-04-16  169  	u64 saved_msr;			/* MSR saved here by enter_rtas */
13799748b957bc arch/powerpc/include/asm/paca.h Nicholas Piggin        2021-06-18  170  #ifdef CONFIG_PPC64
13799748b957bc arch/powerpc/include/asm/paca.h Nicholas Piggin        2021-06-18  171  	u64 exit_save_r1;		/* Syscall/interrupt R1 save */
13799748b957bc arch/powerpc/include/asm/paca.h Nicholas Piggin        2021-06-18  172  #endif
e0d68273d70695 arch/powerpc/include/asm/paca.h Christophe Leroy       2022-09-19  173  #ifdef CONFIG_PPC_BOOK3E_64
687304014f7ca8 include/asm-powerpc/paca.h      Olof Johansson         2007-04-24  174  	u16 trap_save;			/* Used when bad stack is encountered */
59dc5bfca0cb6a arch/powerpc/include/asm/paca.h Nicholas Piggin        2021-06-18  175  #endif
59dc5bfca0cb6a arch/powerpc/include/asm/paca.h Nicholas Piggin        2021-06-18  176  #ifdef CONFIG_PPC_BOOK3S_64
59dc5bfca0cb6a arch/powerpc/include/asm/paca.h Nicholas Piggin        2021-06-18  177  	u8 hsrr_valid;			/* HSRRs set for HRFID */
59dc5bfca0cb6a arch/powerpc/include/asm/paca.h Nicholas Piggin        2021-06-18  178  	u8 srr_valid;			/* SRRs set for RFID */
0a882e28468f48 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-06-28  179  #endif
4e26bc4a4ed683 arch/powerpc/include/asm/paca.h Madhavan Srinivasan    2017-12-20  180  	u8 irq_soft_mask;		/* mask for irq soft masking */
7230c5644188cd arch/powerpc/include/asm/paca.h Benjamin Herrenschmidt 2012-03-06  181  	u8 irq_happened;		/* irq happened while soft-disabled */
e360adbe29241a arch/powerpc/include/asm/paca.h Peter Zijlstra         2010-10-14  182  	u8 irq_work_pending;		/* IRQ_WORK interrupt while soft-disable */
8e0b634b132752 arch/powerpc/include/asm/paca.h Nicholas Piggin        2018-02-14  183  #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
8e0b634b132752 arch/powerpc/include/asm/paca.h Nicholas Piggin        2018-02-14  184  	u8 pmcregs_in_use;		/* pseries puts this in lppaca */
8e0b634b132752 arch/powerpc/include/asm/paca.h Nicholas Piggin        2018-02-14  185  #endif
9d378dfac885f7 arch/powerpc/include/asm/paca.h Scott Wood             2014-03-10  186  	u64 sprg_vdso;			/* Saved user-visible sprg */
afc07701ced646 arch/powerpc/include/asm/paca.h Michael Neuling        2013-02-13  187  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
afc07701ced646 arch/powerpc/include/asm/paca.h Michael Neuling        2013-02-13  188  	u64 tm_scratch;                 /* TM scratch area for reclaim */
afc07701ced646 arch/powerpc/include/asm/paca.h Michael Neuling        2013-02-13  189  #endif
c6622f63db86fc include/asm-powerpc/paca.h      Paul Mackerras         2006-02-24  190  
7cba160ad789a3 arch/powerpc/include/asm/paca.h Shreyas B. Prabhu      2014-12-10  191  #ifdef CONFIG_PPC_POWERNV
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  192  	/* PowerNV idle fields */
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  193  	/* PNV_CORE_IDLE_* bits, all siblings work on thread 0 paca */
b0c5b4f1ee3687 arch/powerpc/include/asm/paca.h Rohan McLure           2023-05-10  194  	unsigned long idle_lock; /* A value of 1 means acquired */
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  195  	unsigned long idle_state;
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  196  	union {
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  197  		/* P7/P8 specific fields */
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  198  		struct {
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  199  			/* PNV_THREAD_RUNNING/NAP/SLEEP	*/
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  200  			u8 thread_idle_state;
77b54e9f213f76 arch/powerpc/include/asm/paca.h Shreyas B. Prabhu      2014-12-10  201  			/* Mask to denote subcore sibling threads */
77b54e9f213f76 arch/powerpc/include/asm/paca.h Shreyas B. Prabhu      2014-12-10  202  			u8 subcore_sibling_mask;
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  203  		};
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  204  
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  205  		/* P9 specific fields */
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  206  		struct {
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  207  #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
22c6663dc69a04 arch/powerpc/include/asm/paca.h Gautham R. Shenoy      2017-05-16  208  			/* The PSSCR value that the kernel requested before going to stop */
22c6663dc69a04 arch/powerpc/include/asm/paca.h Gautham R. Shenoy      2017-05-16  209  			u64 requested_psscr;
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  210  			/* Flag to request this thread not to stop */
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  211  			atomic_t dont_stop;
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  212  #endif
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  213  		};
10d91611f426d4 arch/powerpc/include/asm/paca.h Nicholas Piggin        2019-04-13  214  	};
7cba160ad789a3 arch/powerpc/include/asm/paca.h Shreyas B. Prabhu      2014-12-10  215  #endif
7cba160ad789a3 arch/powerpc/include/asm/paca.h Shreyas B. Prabhu      2014-12-10  216  
4e003747043d57 arch/powerpc/include/asm/paca.h Michael Ellerman       2017-10-19  217  #ifdef CONFIG_PPC_BOOK3S_64
a3d96f70c14773 arch/powerpc/include/asm/paca.h Nicholas Piggin        2016-12-20  218  	/* Non-maskable exceptions that are not performance critical */
8c388514153796 arch/powerpc/include/asm/paca.h Nicholas Piggin        2017-05-21  219  	u64 exnmi[EX_SIZE];	/* used for system reset (nmi) */
8c388514153796 arch/powerpc/include/asm/paca.h Nicholas Piggin        2017-05-21  220  	u64 exmc[EX_SIZE];	/* used for machine checks */
a3d96f70c14773 arch/powerpc/include/asm/paca.h Nicholas Piggin        2016-12-20  221  #endif
729b0f715371ce arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2013-10-30  222  #ifdef CONFIG_PPC_BOOK3S_64
b1ee8a3de57907 arch/powerpc/include/asm/paca.h Nicholas Piggin        2016-12-20  223  	/* Exclusive stacks for system reset and machine check exception. */
b1ee8a3de57907 arch/powerpc/include/asm/paca.h Nicholas Piggin        2016-12-20  224  	void *nmi_emergency_sp;
729b0f715371ce arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2013-10-30  225  	void *mc_emergency_sp;
c4f3b52ce7b168 arch/powerpc/include/asm/paca.h Nicholas Piggin        2016-12-20  226  
c4f3b52ce7b168 arch/powerpc/include/asm/paca.h Nicholas Piggin        2016-12-20  227  	u16 in_nmi;			/* In nmi handler */
c4f3b52ce7b168 arch/powerpc/include/asm/paca.h Nicholas Piggin        2016-12-20  228  
729b0f715371ce arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2013-10-30  229  	/*
729b0f715371ce arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2013-10-30  230  	 * Flag to check whether we are in machine check early handler
729b0f715371ce arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2013-10-30  231  	 * and already using emergency stack.
729b0f715371ce arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2013-10-30  232  	 */
729b0f715371ce arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2013-10-30  233  	u16 in_mce;
0ef95b411e73d8 arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2014-07-29  234  	u8 hmi_event_available;		/* HMI event is available */
5080332c2c8931 arch/powerpc/include/asm/paca.h Michael Neuling        2017-09-15  235  	u8 hmi_p9_special_emu;		/* HMI P9 special emulation */
ada68a66b72687 arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2020-06-23  236  	u32 hmi_irqs;			/* HMI irq stat */
729b0f715371ce arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2013-10-30  237  #endif
ea678ac627e01d arch/powerpc/include/asm/paca.h Naveen N. Rao          2018-04-19  238  	u8 ftrace_enabled;		/* Hard disable ftrace */
ed79ba9e15f84c arch/powerpc/include/asm/paca.h Benjamin Herrenschmidt 2011-09-19  239  
c6622f63db86fc include/asm-powerpc/paca.h      Paul Mackerras         2006-02-24  240  	/* Stuff for accurate time accounting */
c223c90386bc23 arch/powerpc/include/asm/paca.h Christophe Leroy       2016-05-17  241  	struct cpu_accounting_data accounting;
cf9efce0ce3136 arch/powerpc/include/asm/paca.h Paul Mackerras         2010-08-26  242  	u64 dtl_ridx;			/* read index in dispatch log */
cf9efce0ce3136 arch/powerpc/include/asm/paca.h Paul Mackerras         2010-08-26  243  	struct dtl_entry *dtl_curr;	/* pointer corresponding to dtl_ridx */
4b7ae55df3621d arch/powerpc/include/asm/paca.h Alexander Graf         2009-10-30  244  
c14dea04a248a5 arch/powerpc/include/asm/paca.h Alexander Graf         2010-04-16  245  #ifdef CONFIG_KVM_BOOK3S_HANDLER
7aa79938f7d76f arch/powerpc/include/asm/paca.h Aneesh Kumar K.V       2013-10-07  246  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
7e57cba06074da arch/powerpc/include/asm/paca.h Alexander Graf         2010-01-08  247  	/* We use this to store guest state in */
7e57cba06074da arch/powerpc/include/asm/paca.h Alexander Graf         2010-01-08  248  	struct kvmppc_book3s_shadow_vcpu shadow_vcpu;
de56a948b9182f arch/powerpc/include/asm/paca.h Paul Mackerras         2011-06-29  249  #endif
3c42bf8a717cb6 arch/powerpc/include/asm/paca.h Paul Mackerras         2011-06-29  250  	struct kvmppc_host_state kvm_hstate;
7c379526d7e71d arch/powerpc/include/asm/paca.h Paolo Bonzini          2016-08-11  251  #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
7c379526d7e71d arch/powerpc/include/asm/paca.h Paolo Bonzini          2016-08-11  252  	/*
7c379526d7e71d arch/powerpc/include/asm/paca.h Paolo Bonzini          2016-08-11  253  	 * Bitmap for sibling subcore status. See kvm/book3s_hv_ras.c for
7c379526d7e71d arch/powerpc/include/asm/paca.h Paolo Bonzini          2016-08-11  254  	 * more details
7c379526d7e71d arch/powerpc/include/asm/paca.h Paolo Bonzini          2016-08-11  255  	 */
7c379526d7e71d arch/powerpc/include/asm/paca.h Paolo Bonzini          2016-08-11  256  	struct sibling_subcore_state *sibling_subcore_state;
7c379526d7e71d arch/powerpc/include/asm/paca.h Paolo Bonzini          2016-08-11  257  #endif
4b7ae55df3621d arch/powerpc/include/asm/paca.h Alexander Graf         2009-10-30  258  #endif
aa8a5e0062ac94 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-01-10  259  #ifdef CONFIG_PPC_BOOK3S_64
aa8a5e0062ac94 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-01-10  260  	/*
aa8a5e0062ac94 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-01-10  261  	 * rfi fallback flush must be in its own cacheline to prevent
aa8a5e0062ac94 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-01-10  262  	 * other paca data leaking into the L1d
aa8a5e0062ac94 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-01-10  263  	 */
aa8a5e0062ac94 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-01-10  264  	u64 exrfi[EX_SIZE] __aligned(0x80);
aa8a5e0062ac94 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-01-10  265  	void *rfi_flush_fallback_area;
bdcb1aefc5b3f7 arch/powerpc/include/asm/paca.h Nicholas Piggin        2018-01-17  266  	u64 l1d_flush_size;
aa8a5e0062ac94 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-01-10  267  #endif
94675cceacaec2 arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2018-07-04  268  #ifdef CONFIG_PPC_PSERIES
94675cceacaec2 arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2018-07-04  269  	u8 *mce_data_buf;		/* buffer to hold per cpu rtas errlog */
94675cceacaec2 arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2018-07-04  270  #endif /* CONFIG_PPC_PSERIES */
c6d15258cdf1c1 arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2018-09-11  271  
c6d15258cdf1c1 arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2018-09-11  272  #ifdef CONFIG_PPC_BOOK3S_64
387e220a2e5e63 arch/powerpc/include/asm/paca.h Nicholas Piggin        2021-12-02  273  #ifdef CONFIG_PPC_64S_HASH_MMU
c6d15258cdf1c1 arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2018-09-11  274  	/* Capture SLB related old contents in MCE handler. */
c6d15258cdf1c1 arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2018-09-11  275  	struct slb_entry *mce_faulty_slbs;
c6d15258cdf1c1 arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2018-09-11  276  	u16 slb_save_cache_ptr;
387e220a2e5e63 arch/powerpc/include/asm/paca.h Nicholas Piggin        2021-12-02  277  #endif
c6d15258cdf1c1 arch/powerpc/include/asm/paca.h Mahesh Salgaonkar      2018-09-11  278  #endif /* CONFIG_PPC_BOOK3S_64 */
06ec27aea9fc84 arch/powerpc/include/asm/paca.h Christophe Leroy       2018-09-27  279  #ifdef CONFIG_STACKPROTECTOR
06ec27aea9fc84 arch/powerpc/include/asm/paca.h Christophe Leroy       2018-09-27  280  	unsigned long canary;
06ec27aea9fc84 arch/powerpc/include/asm/paca.h Christophe Leroy       2018-09-27  281  #endif
420af1554790a9 arch/powerpc/include/asm/paca.h Will Deacon            2019-02-22  282  #ifdef CONFIG_MMIOWB
420af1554790a9 arch/powerpc/include/asm/paca.h Will Deacon            2019-02-22  283  	struct mmiowb_state mmiowb_state;
420af1554790a9 arch/powerpc/include/asm/paca.h Will Deacon            2019-02-22  284  #endif
923b3cf00b3ffc arch/powerpc/include/asm/paca.h Ganesh Goudar          2021-01-28  285  #ifdef CONFIG_PPC_BOOK3S_64
923b3cf00b3ffc arch/powerpc/include/asm/paca.h Ganesh Goudar          2021-01-28  286  	struct mce_info *mce_info;
cc15ff3275694f arch/powerpc/include/asm/paca.h Ganesh Goudar          2022-01-20  287  	u8 mce_pending_irq_work;
923b3cf00b3ffc arch/powerpc/include/asm/paca.h Ganesh Goudar          2021-01-28  288  #endif /* CONFIG_PPC_BOOK3S_64 */
d2e60075a3d442 arch/powerpc/include/asm/paca.h Nicholas Piggin        2018-02-14  289  } ____cacheline_aligned;
^1da177e4c3f41 include/asm-ppc64/paca.h        Linus Torvalds         2005-04-16  290  
54be0b9c7c9888 arch/powerpc/include/asm/paca.h Michael Ellerman       2018-10-02 @291  extern void copy_mm_to_paca(struct mm_struct *mm);
d2e60075a3d442 arch/powerpc/include/asm/paca.h Nicholas Piggin        2018-02-14  292  extern struct paca_struct **paca_ptrs;
1426d5a3bd0758 arch/powerpc/include/asm/paca.h Michael Ellerman       2010-01-28  293  extern void initialise_paca(struct paca_struct *new_paca, int cpu);
fc53b4202e61c7 arch/powerpc/include/asm/paca.h Matt Evans             2010-07-07  294  extern void setup_paca(struct paca_struct *new_paca);
59f577743d71bf arch/powerpc/include/asm/paca.h Nicholas Piggin        2018-02-14  295  extern void allocate_paca_ptrs(void);
59f577743d71bf arch/powerpc/include/asm/paca.h Nicholas Piggin        2018-02-14  296  extern void allocate_paca(int cpu);
1426d5a3bd0758 arch/powerpc/include/asm/paca.h Michael Ellerman       2010-01-28  297  extern void free_unused_pacas(void);
1426d5a3bd0758 arch/powerpc/include/asm/paca.h Michael Ellerman       2010-01-28  298  

:::::: The code at line 291 was first introduced by commit
:::::: 54be0b9c7c9888ebe63b89a31a17ee3df6a68d61 Revert "convert SLB miss handlers to C" and subsequent commits

:::::: TO: Michael Ellerman <mpe@ellerman.id.au>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
