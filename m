Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 106FE45E101
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:30:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0SdX6m18z307L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 06:30:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Sd4747gz304j
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 06:29:54 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="321793438"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="321793438"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 11:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="539053377"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 25 Nov 2021 11:28:48 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mqKQK-0006pj-5V; Thu, 25 Nov 2021 19:28:48 +0000
Date: Fri, 26 Nov 2021 03:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 16/17] powerpc/64s: Move hash MMU support code under
 CONFIG_PPC_64S_HASH_MMU
Message-ID: <202111260315.Gs4d14lT-lkp@intel.com>
References: <20211125125025.1472060-17-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125125025.1472060-17-npiggin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on char-misc/char-misc-testing v5.16-rc2 next-20211125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-Make-hash-MMU-code-build-configurable/20211125-210259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20211126/202111260315.Gs4d14lT-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/34f5477219850333c3c610b708932d555b7e9c96
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nicholas-Piggin/powerpc-Make-hash-MMU-code-build-configurable/20211125-210259
        git checkout 34f5477219850333c3c610b708932d555b7e9c96
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/mm/book3s32/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/mm/book3s32/mmu.c:321:6: error: redefinition of 'update_mmu_cache'
     321 | void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
         |      ^~~~~~~~~~~~~~~~
   In file included from arch/powerpc/include/asm/pgtable.h:18,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:33,
                    from arch/powerpc/mm/book3s32/mmu.c:21:
   arch/powerpc/include/asm/book3s/pgtable.h:40:20: note: previous definition of 'update_mmu_cache' with type 'void(struct vm_area_struct *, long unsigned int,  pte_t *)' {aka 'void(struct vm_area_struct *, long unsigned int,  long unsigned int *)'}
      40 | static inline void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep) {}
         |                    ^~~~~~~~~~~~~~~~


vim +/update_mmu_cache +321 arch/powerpc/mm/book3s32/mmu.c

3c726f8dee6f55e arch/powerpc/mm/ppc_mmu_32.c   Benjamin Herrenschmidt 2005-11-07  312  
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  313  /*
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  314   * This is called at the end of handling a user page fault, when the
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  315   * fault has been handled by updating a PTE in the linux page tables.
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  316   * We use it to preload an HPTE into the hash table corresponding to
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  317   * the updated linux PTE.
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  318   *
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  319   * This must always be called with the pte lock held.
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  320   */
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16 @321  void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  322  		      pte_t *ptep)
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  323  {
f204338f8e29777 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  324  	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
f204338f8e29777 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  325  		return;
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  326  	/*
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  327  	 * We don't need to worry about _PAGE_PRESENT here because we are
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  328  	 * called with either mm->page_table_lock held or ptl lock held
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  329  	 */
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  330  
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  331  	/* We only want HPTEs for linux PTEs that have _PAGE_ACCESSED set */
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  332  	if (!pte_young(*ptep) || address >= TASK_SIZE)
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  333  		return;
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  334  
f49f4e2b68b6834 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  335  	/* We have to test for regs NULL since init will get here first thing at boot */
f49f4e2b68b6834 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  336  	if (!current->thread.regs)
f49f4e2b68b6834 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  337  		return;
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  338  
f49f4e2b68b6834 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  339  	/* We also avoid filling the hash if not coming from a fault */
f49f4e2b68b6834 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  340  	if (TRAP(current->thread.regs) != 0x300 && TRAP(current->thread.regs) != 0x400)
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  341  		return;
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  342  
f49f4e2b68b6834 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  343  	hash_preload(vma->vm_mm, address);
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  344  }
e5a1edb9fe4cfa0 arch/powerpc/mm/book3s32/mmu.c Christophe Leroy       2019-08-16  345  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
