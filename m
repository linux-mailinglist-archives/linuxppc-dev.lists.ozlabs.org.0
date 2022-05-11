Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E55228E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 03:21:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KycYv6jBHz3bxh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 11:21:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nJHNV91s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nJHNV91s; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KycYB1KqHz3bZy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 11:20:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652232046; x=1683768046;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RKw1P4LQKpo9S+a520vRt3NyUO5j0yCT3+wjho1lZeA=;
 b=nJHNV91sFXG0jjxyYox8YrXKEQ985alKf4GUpvHcyzUdDdATKp/DvNvN
 CaPgQDojnPXxhadwJO8PgZzDwn/ZavbPqPmOdV6pMBB3fOLfjdAgCNsLx
 aN0p/NeN8KQytJ8EEcw5VxzGTB4Fz4JDsdLNvb1RByz8hWOHHMeni0LRp
 h10KYmSVBm759EHDV9b/IWGFW5GvlNAuH+2QTZBl3nxCAj9YqxqSPiWU6
 WWOfRFDtH39294BZu3Y8gRytuylA7x8yYLTO9rzA1jm6qnPtbM+cO4xKM
 0q0oZ1P1md1dAWkc40tAq0zefcUZ5UbS4ki10rU1IBimOyAPl20n9YJaH g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="294786011"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="294786011"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 18:19:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="657912024"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 10 May 2022 18:19:29 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nob0i-000IYZ-Vs;
 Wed, 11 May 2022 01:19:28 +0000
Date: Wed, 11 May 2022 09:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 mike.kravetz@oracle.com, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH v3 2/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue
 when migration
Message-ID: <202205110919.CWIcIqYE-lkp@intel.com>
References: <ea5abf529f0997b5430961012bfda6166c1efc8c.1652147571.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea5abf529f0997b5430961012bfda6166c1efc8c.1652147571.git.baolin.wang@linux.alibaba.com>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com,
 paulus@samba.org, sparclinux@vger.kernel.org, agordeev@linux.ibm.com,
 linux-s390@vger.kernel.org, arnd@arndb.de, ysato@users.sourceforge.jp,
 deller@gmx.de, borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 baolin.wang@linux.alibaba.com, songmuchun@bytedance.com,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 kbuild-all@lists.01.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, svens@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Baolin,

I love your patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]
[cannot apply to hnaz-mm/master arm64/for-next/core linus/master v5.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Wang/Fix-CONT-PTE-PMD-size-hugetlb-issue-when-unmapping-or-migrating/20220510-114753
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: h8300-buildonly-randconfig-r001-20220509 (https://download.01.org/0day-ci/archive/20220511/202205110919.CWIcIqYE-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b666792b4c5f9774c350977ff88837bafc36365a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Baolin-Wang/Fix-CONT-PTE-PMD-size-hugetlb-issue-when-unmapping-or-migrating/20220510-114753
        git checkout b666792b4c5f9774c350977ff88837bafc36365a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=h8300 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:51:
   include/linux/hugetlb.h: In function 'huge_ptep_clear_flush':
>> include/linux/hugetlb.h:1100:16: error: implicit declaration of function 'ptep_get' [-Werror=implicit-function-declaration]
    1100 |         return ptep_get(ptep);
         |                ^~~~~~~~
>> include/linux/hugetlb.h:1100:16: error: incompatible types when returning type 'int' but 'pte_t' was expected
    1100 |         return ptep_get(ptep);
         |                ^~~~~~~~~~~~~~
   kernel/fork.c: At top level:
   kernel/fork.c:162:13: warning: no previous prototype for 'arch_release_task_struct' [-Wmissing-prototypes]
     162 | void __weak arch_release_task_struct(struct task_struct *tsk)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:847:20: warning: no previous prototype for 'arch_task_cache_init' [-Wmissing-prototypes]
     847 | void __init __weak arch_task_cache_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:942:12: warning: no previous prototype for 'arch_dup_task_struct' [-Wmissing-prototypes]
     942 | int __weak arch_dup_task_struct(struct task_struct *dst,
         |            ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from kernel/sysctl.c:46:
   include/linux/hugetlb.h: In function 'huge_ptep_clear_flush':
>> include/linux/hugetlb.h:1100:16: error: implicit declaration of function 'ptep_get' [-Werror=implicit-function-declaration]
    1100 |         return ptep_get(ptep);
         |                ^~~~~~~~
>> include/linux/hugetlb.h:1100:16: error: incompatible types when returning type 'int' but 'pte_t' was expected
    1100 |         return ptep_get(ptep);
         |                ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/migrate.h:8,
                    from mm/page_alloc.c:62:
   include/linux/hugetlb.h: In function 'huge_ptep_clear_flush':
>> include/linux/hugetlb.h:1100:16: error: implicit declaration of function 'ptep_get' [-Werror=implicit-function-declaration]
    1100 |         return ptep_get(ptep);
         |                ^~~~~~~~
>> include/linux/hugetlb.h:1100:16: error: incompatible types when returning type 'int' but 'pte_t' was expected
    1100 |         return ptep_get(ptep);
         |                ^~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:5,
                    from arch/h8300/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/page_alloc.c:19:
   mm/page_alloc.c: In function 'free_pages':
   include/asm-generic/page.h:89:51: warning: ordered comparison of pointer with null pointer [-Wextra]
      89 | #define virt_addr_valid(kaddr)  (((void *)(kaddr) >= (void *)PAGE_OFFSET) && \
         |                                                   ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/mmdebug.h:17:25: note: in expansion of macro 'BUG_ON'
      17 | #define VM_BUG_ON(cond) BUG_ON(cond)
         |                         ^~~~~~
   mm/page_alloc.c:5489:17: note: in expansion of macro 'VM_BUG_ON'
    5489 |                 VM_BUG_ON(!virt_addr_valid((void *)addr));
         |                 ^~~~~~~~~
   mm/page_alloc.c:5489:28: note: in expansion of macro 'virt_addr_valid'
    5489 |                 VM_BUG_ON(!virt_addr_valid((void *)addr));
         |                            ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from fs/io_uring.c:71:
   include/linux/hugetlb.h: In function 'huge_ptep_clear_flush':
>> include/linux/hugetlb.h:1100:16: error: implicit declaration of function 'ptep_get' [-Werror=implicit-function-declaration]
    1100 |         return ptep_get(ptep);
         |                ^~~~~~~~
>> include/linux/hugetlb.h:1100:16: error: incompatible types when returning type 'int' but 'pte_t' was expected
    1100 |         return ptep_get(ptep);
         |                ^~~~~~~~~~~~~~
   fs/io_uring.c: In function '__io_submit_flush_completions':
   fs/io_uring.c:2660:40: warning: variable 'prev' set but not used [-Wunused-but-set-variable]
    2660 |         struct io_wq_work_node *node, *prev;
         |                                        ^~~~
   cc1: some warnings being treated as errors


vim +/ptep_get +1100 include/linux/hugetlb.h

  1096	
  1097	static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
  1098						  unsigned long addr, pte_t *ptep)
  1099	{
> 1100		return ptep_get(ptep);
  1101	}
  1102	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
