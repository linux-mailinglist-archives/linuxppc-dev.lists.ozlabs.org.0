Return-Path: <linuxppc-dev+bounces-3552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B299D89B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 16:52:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxqwQ2fdGz2yXf;
	Tue, 26 Nov 2024 02:52:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732549958;
	cv=none; b=h9qOfK9zWk5z3TTapB79A/9dJ168BgYPUMzgvSbsbnb6Y5S61yMcApI+Oa0x0WlcbyHy1UYBMJM5f5NR+BY9q+oYGL0LqZnyiHQ1ac976S/6CzHT5vk6d7gkiYRewrM3gRYOR2HhCQkVHtolsL+I/xryBE/5dlbjnquF8qJSvRlXdYPTKBpo3zyhEF8ZzwiUsA3X//5OBn4st/Oxx4eqAZ9tElGF/T9Ip4d7aLyH29yI1PGvl2PWk+qBatNIQRchuQGxXXgQjWhI5L7GeqdDiO3KegUfWR4SYAylmPOTXCgyG1O6rCkjvLkAYn9Hym8jpkUco3iVjXDnesQt/Ovn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732549958; c=relaxed/relaxed;
	bh=PzSZ+TUeB/1XJMf+6wBgy7zflG/XSVm85D9yS89bV2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDG46WXG30ZUZPQ4W5Ry7gUbJ0wFDUK5tfgySP2K/iRUlbJDxEIVuraHRkfqe+S9fRhc3xxi4Xxvzx/5ya7k3KFicjSsw6FLhvkuKmhvBKAOicKAKW15aOrKe09BWt9bN+WBkRmeI87MnvsU1tWyle00+mXJR7cNYfgJnLR6rLtXqRcOrlCFYSBEUtkP8s6DKhBFQJVY4BZCLObi4DWD80LEVXl38snYY+lhpnQHrsXXIbnl9OdeKr1An1A2hL8d2UuocqyAPyeUqk7/1jBLrSTPFIimTbF2m6L/SlBEUbE29UgF9cLL2IV7TEV1W6JDLH6sZCX4Se90j5m6hk+uKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aAu5BSoe; dkim-atps=neutral; spf=pass (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aAu5BSoe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XxqwL6MtMz2y82
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 02:52:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732549956; x=1764085956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=44XADmBY7482aBrna1Gf1jtuO1UMXA5lIwwU6HOjwtg=;
  b=aAu5BSoeKXdfKPTXW8ad7XXOKOR8hEnKGb0tnZNoB5jd5lXGVfUpL8r1
   jbqomPNP0JpoDpZ2wqlYN1MPJ9O+MZshzbTgkSK1wvix47q7v4COHZrHy
   sIOletUbnHGPQD2b+DSA8CpbuDE7vFRXU36p6nIiA/aahXlDYloMLeEg6
   NYBswmYOm89rQR0Vo5i5tz+/2xfkh1RW0pJsJem0SL5p/uWCiaJ2+2/r+
   4/V8Z6sk79MuA4NclivNNdgIbCHK3gO3vn1jV7l2uwZtHK0PGwO6jw5tA
   w7gZFJ3g85dlEeRiXmMFqDqxGwlzkWspjRxZgyJZsB4o8vEHxzhejlxP+
   Q==;
X-CSE-ConnectionGUID: EApSNwABRAasczUJsgPzCw==
X-CSE-MsgGUID: YF581KeHRHCeOCoEsQmIfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36446810"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="36446810"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 07:52:14 -0800
X-CSE-ConnectionGUID: 23u/Xv/eTCemOL/ogk5O2w==
X-CSE-MsgGUID: F2vfipoVSsmBDXbO0I+SIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="128823369"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2024 07:52:07 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFbNc-0006ZF-1m;
	Mon, 25 Nov 2024 15:52:04 +0000
Date: Mon, 25 Nov 2024 23:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, Alistair Popple <apopple@nvidia.com>,
	lina@asahilina.net, zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com,
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
	jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
	will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v3 11/25] mm: Allow compound zone device pages
Message-ID: <202411252342.LUEKRmrY-lkp@intel.com>
References: <f1a93b8a38e14e2ab279ece310175334e973b970.1732239628.git-series.apopple@nvidia.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1a93b8a38e14e2ab279ece310175334e973b970.1732239628.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Alistair,

kernel test robot noticed the following build errors:

[auto build test ERROR on 81983758430957d9a5cb3333fe324fd70cf63e7e]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/fuse-Fix-dax-truncate-punch_hole-fault-path/20241125-094004
base:   81983758430957d9a5cb3333fe324fd70cf63e7e
patch link:    https://lore.kernel.org/r/f1a93b8a38e14e2ab279ece310175334e973b970.1732239628.git-series.apopple%40nvidia.com
patch subject: [PATCH v3 11/25] mm: Allow compound zone device pages
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241125/202411252342.LUEKRmrY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411252342.LUEKRmrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411252342.LUEKRmrY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:32,
                    from arch/sh/kernel/asm-offsets.c:14:
   include/linux/memremap.h: In function 'is_device_private_page':
>> include/linux/memremap.h:164:17: error: implicit declaration of function 'page_pgmap' [-Wimplicit-function-declaration]
     164 |                 page_pgmap(page)->type == MEMORY_DEVICE_PRIVATE;
         |                 ^~~~~~~~~~
>> include/linux/memremap.h:164:33: error: invalid type argument of '->' (have 'int')
     164 |                 page_pgmap(page)->type == MEMORY_DEVICE_PRIVATE;
         |                                 ^~
   include/linux/memremap.h: In function 'is_pci_p2pdma_page':
   include/linux/memremap.h:176:33: error: invalid type argument of '->' (have 'int')
     176 |                 page_pgmap(page)->type == MEMORY_DEVICE_PCI_P2PDMA;
         |                                 ^~
   include/linux/memremap.h: In function 'is_device_coherent_page':
   include/linux/memremap.h:182:33: error: invalid type argument of '->' (have 'int')
     182 |                 page_pgmap(page)->type == MEMORY_DEVICE_COHERENT;
         |                                 ^~
   make[3]: *** [scripts/Makefile.build:102: arch/sh/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/page_pgmap +164 include/linux/memremap.h

   159	
   160	static inline bool is_device_private_page(const struct page *page)
   161	{
   162		return IS_ENABLED(CONFIG_DEVICE_PRIVATE) &&
   163			is_zone_device_page(page) &&
 > 164			page_pgmap(page)->type == MEMORY_DEVICE_PRIVATE;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

