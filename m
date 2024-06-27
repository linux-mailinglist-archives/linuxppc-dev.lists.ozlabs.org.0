Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A6491B238
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 00:28:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=apmqnsoe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9CrL5PY8z3cZv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 08:28:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=apmqnsoe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9CqY4clHz3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 08:27:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719527243; x=1751063243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ZRjC23wobObDdFfd8zFQZZ9Z3PFbjqgjYHg7T/vNQU=;
  b=apmqnsoeqGMnF9FuUg3K+8uYs3LApdM2CpeMeBM5/dsTwCBArqDJDNX0
   +Ddk1XFHnmqjZdXTo2K1sC6uofAVvdPTw0fs1pOqFCwmtnbNCVufyeEkP
   V9ZKuDyleRJLvLttTaxxNNvsqg9DWbHDhnQnMDFoI9qUGsrddC1BqMRsk
   se/QjsiY70JII+cAzBDj/GIkrwhuK3xhHCNM+NT5S3JEukwZ1O+1ZGa+Y
   x5jBy4emT3LC2CsJIA/N5yo8dy/y0rnEw7RuchU8gr9RmHbHUfKeToZ1V
   86x5UaYWKowsDUsEJS9fNPsnN5ZSff8k6qXytl5sxXVy8sf1VbynREhS+
   w==;
X-CSE-ConnectionGUID: sFRnMvZSRUy0Ftjl3W4E/A==
X-CSE-MsgGUID: kuH213IdS0y6wJIMkG0KvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16369847"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="16369847"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 15:27:17 -0700
X-CSE-ConnectionGUID: zkBVUXQWQjyqQHVWEEfu0Q==
X-CSE-MsgGUID: fngSrsCqRteimFpQDSTiSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="44625380"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2024 15:27:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMxa7-000Gb0-24;
	Thu, 27 Jun 2024 22:27:07 +0000
Date: Fri, 28 Jun 2024 06:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca
Subject: Re: [PATCH 07/13] huge_memory: Allow mappings of PUD sized pages
Message-ID: <202406280637.147dyRrV-lkp@intel.com>
References: <bd332b0d3971b03152b3541f97470817c5147b51.1719386613.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd332b0d3971b03152b3541f97470817c5147b51.1719386613.git-series.apopple@nvidia.com>
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
Cc: linmiaohe@huawei.com, nvdimm@lists.linux.dev, david@redhat.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-cxl@vger.kernel.org, linux-mm@kvack.org, ira.weiny@intel.com, linux-doc@vger.kernel.org, willy@infradead.org, djwong@kernel.org, linux-ext4@vger.kernel.org, llvm@lists.linux.dev, will@kernel.org, jhubbard@nvidia.com, npiggin@gmail.com, peterx@redhat.com, oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alistair,

kernel test robot noticed the following build errors:

[auto build test ERROR on f2661062f16b2de5d7b6a5c42a9a5c96326b8454]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/mm-gup-c-Remove-redundant-check-for-PCI-P2PDMA-page/20240627-191709
base:   f2661062f16b2de5d7b6a5c42a9a5c96326b8454
patch link:    https://lore.kernel.org/r/bd332b0d3971b03152b3541f97470817c5147b51.1719386613.git-series.apopple%40nvidia.com
patch subject: [PATCH 07/13] huge_memory: Allow mappings of PUD sized pages
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240628/202406280637.147dyRrV-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280637.147dyRrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280637.147dyRrV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/rmap.c:1513:37: error: call to '__compiletime_assert_279' declared with 'error' attribute: BUILD_BUG failed
    1513 |         __folio_add_file_rmap(folio, page, HPAGE_PUD_NR, vma, RMAP_LEVEL_PUD);
         |                                            ^
   include/linux/huge_mm.h:111:26: note: expanded from macro 'HPAGE_PUD_NR'
     111 | #define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)
         |                          ^
   include/linux/huge_mm.h:110:26: note: expanded from macro 'HPAGE_PUD_ORDER'
     110 | #define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
         |                          ^
   include/linux/huge_mm.h:97:28: note: expanded from macro 'HPAGE_PUD_SHIFT'
      97 | #define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:72:1: note: expanded from here
      72 | __compiletime_assert_279
         | ^
   mm/rmap.c:1660:35: error: call to '__compiletime_assert_280' declared with 'error' attribute: BUILD_BUG failed
    1660 |         __folio_remove_rmap(folio, page, HPAGE_PUD_NR, vma, RMAP_LEVEL_PUD);
         |                                          ^
   include/linux/huge_mm.h:111:26: note: expanded from macro 'HPAGE_PUD_NR'
     111 | #define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)
         |                          ^
   include/linux/huge_mm.h:110:26: note: expanded from macro 'HPAGE_PUD_ORDER'
     110 | #define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
         |                          ^
   include/linux/huge_mm.h:97:28: note: expanded from macro 'HPAGE_PUD_SHIFT'
      97 | #define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:79:1: note: expanded from here
      79 | __compiletime_assert_280
         | ^
   2 errors generated.


vim +1513 mm/rmap.c

  1498	
  1499	/**
  1500	 * folio_add_file_rmap_pud - add a PUD mapping to a page range of a folio
  1501	 * @folio:	The folio to add the mapping to
  1502	 * @page:	The first page to add
  1503	 * @vma:	The vm area in which the mapping is added
  1504	 *
  1505	 * The page range of the folio is defined by [page, page + HPAGE_PUD_NR)
  1506	 *
  1507	 * The caller needs to hold the page table lock.
  1508	 */
  1509	void folio_add_file_rmap_pud(struct folio *folio, struct page *page,
  1510			struct vm_area_struct *vma)
  1511	{
  1512	#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> 1513		__folio_add_file_rmap(folio, page, HPAGE_PUD_NR, vma, RMAP_LEVEL_PUD);
  1514	#else
  1515		WARN_ON_ONCE(true);
  1516	#endif
  1517	}
  1518	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
