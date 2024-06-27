Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 712FB91B2A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 01:22:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RsBowuLb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9F3F5wCtz30Vf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 09:22:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RsBowuLb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9Dgd6C0Hz3cmK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 09:05:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719529535; x=1751065535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+naB5/Q042PFFIXI5mElAZ8RiZyXqp0O9pcDtXADfas=;
  b=RsBowuLbcYIbOy3lFfoiOLwE+wf+1otW3PyftM2CcugMB/qqqkis6J3+
   gsay7mp6xmlG3uFK1KR0AoPQqC+n6FFWSvjaO/L3djX1eaRT+XONTiATE
   tvC+fw6/SndF5Gcqu0U5jpUmRWBO/ZaTZC4KjAmFqUdOlEfpX5s+rsQEV
   mo+eHBoUu6xtF0q7VpnC9yRQ5v1GH3GvNd5HpzcMFysUINWTkJ69USWDK
   jVaIEdcvOX2W8I8VYAEwpqFvAT0RBWB4S77smRy/Q725yLiKy1wJWD0lH
   7mXQptLxHSniDNmwhwEsGWw0+WCAmF4BKbq/EWguMKSYI7PzWo8V8f+d/
   w==;
X-CSE-ConnectionGUID: DQcso68JSDWls8RKMJXTsQ==
X-CSE-MsgGUID: lREpBjfpSSq+XPeRiBAv/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="20456949"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="20456949"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 16:05:27 -0700
X-CSE-ConnectionGUID: TA8xWjJQSumhP3m4MOnxKA==
X-CSE-MsgGUID: DnUjlU0JRaaOI2HUnzZ+pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="44384637"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jun 2024 16:05:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMyB4-000Gbt-16;
	Thu, 27 Jun 2024 23:05:18 +0000
Date: Fri, 28 Jun 2024 07:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca
Subject: Re: [PATCH 13/13] mm: Remove devmap related functions and page table
 bits
Message-ID: <202406280658.1pp5cW2f-lkp@intel.com>
References: <47c26640cd85f3db2e0a2796047199bb984d1b3f.1719386613.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47c26640cd85f3db2e0a2796047199bb984d1b3f.1719386613.git-series.apopple@nvidia.com>
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
Cc: linmiaohe@huawei.com, nvdimm@lists.linux.dev, david@redhat.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-cxl@vger.kernel.org, linux-mm@kvack.org, ira.weiny@intel.com, linux-doc@vger.kernel.org, willy@infradead.org, djwong@kernel.org, linux-ext4@vger.kernel.org, will@kernel.org, jhubbard@nvidia.com, npiggin@gmail.com, peterx@redhat.com, oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alistair,

kernel test robot noticed the following build errors:

[auto build test ERROR on f2661062f16b2de5d7b6a5c42a9a5c96326b8454]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/mm-gup-c-Remove-redundant-check-for-PCI-P2PDMA-page/20240627-191709
base:   f2661062f16b2de5d7b6a5c42a9a5c96326b8454
patch link:    https://lore.kernel.org/r/47c26640cd85f3db2e0a2796047199bb984d1b3f.1719386613.git-series.apopple%40nvidia.com
patch subject: [PATCH 13/13] mm: Remove devmap related functions and page table bits
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240628/202406280658.1pp5cW2f-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280658.1pp5cW2f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280658.1pp5cW2f-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                    from arch/powerpc/include/asm/book3s/64/mmu.h:32,
                    from arch/powerpc/include/asm/mmu.h:385,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:23,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/rhashtable-types.h:12,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:12:
>> arch/powerpc/include/asm/book3s/64/pgtable.h:1371:1: error: expected identifier or '(' before '}' token
    1371 | }
         | ^
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1371 arch/powerpc/include/asm/book3s/64/pgtable.h

953c66c2b22a30 Aneesh Kumar K.V  2016-12-12  1370  
ebd31197931d75 Oliver O'Halloran 2017-06-28 @1371  }
6a1ea36260f69f Aneesh Kumar K.V  2016-04-29  1372  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
ebd31197931d75 Oliver O'Halloran 2017-06-28  1373  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
