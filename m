Return-Path: <linuxppc-dev+bounces-3543-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ADB9D7AD9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 06:06:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxYZd3Bjlz2yVD;
	Mon, 25 Nov 2024 16:06:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732511177;
	cv=none; b=j2ojsFJGk8jmagWs3XkOLqRbRidvcP+sN5O1XxGI6qkXoSqIMB/kFBNiOeWq3/uNWZxHznEid0D7k3DTH9TKouhI+4pPB/olTfoQ3G52iNHq8iQb2ll2DXEHR70CUV19cY8SgLBYaL9QAkFQ4ceYAB8gLSN9sE4+ysQl4JpTjBnddEof8/UNKN+KGAJTd4TuRuw6HJgqvOGKmDT4Nk9Wtt/jINuB6mBQeTddd4rVTs5iwhduOWnKn1dAX5/ut+L57PW3Rvn0Oz3JaFJG6C2KFMuAFvY+3VJSgfRuP46jZUl/F4fyWdRtOSbFMtfCnza+TBIjExuyLaLQ1E/I8YkV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732511177; c=relaxed/relaxed;
	bh=WXjj/rqkU4B/m0L+T3pcpEmQf9RvuZjLAT8hl7QuXw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xj3SDy6Mw+d/UC2mThxU1KiK2Sl4M8a22j9pOizQzxSWhP55tTmea4lP8AKPd1QwHSzvZqUAhcZ1UjCykCzA1+SjfCYdV4wUhu1LKiXPZR3LlMcFQ/nMjOk1BqZk/b6Jfrv/TP2/53oTB+8Y0nQsv3aLln30+i2jBbd2NCgpqQvY4/h72JF8TG2pHkjyif32uXCmPeOSM00IUuiorqOaKzLDP8zHLDUO187unLz7kMAGdUdjhfh7LFUG5NQ1o2q0OOl5PUawQXczw6VqEl97iJ3uFvDoy3g8tcSMJGhsvmHGkkzg8HkwTXKneacjVq0tvqyvLXEeXeh/2VvMBd79yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TzikJemg; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TzikJemg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XxYZZ05Vnz2xdr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 16:06:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732511174; x=1764047174;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NREGBayAwFFBU4tE1Ma2gDyzoVU71MdcWhe9JFquPAI=;
  b=TzikJemgcv8hO1C4bYf59rjviJUA5EHZgAShasqRUYV76Y29ixeCWAj1
   4P4eBwwRUrLhTKCbvod1/ZqLhR0TlZDoNbnVF/RDsGwLkHqccq0YDLUqS
   y5j4BlLzANLE2MJATQ8FAJkW/XvO3aZRpSOLEwXhWI4HjEQjwac5SMm8H
   hO12IHefX3kAZVGS2vcv/bHSvCsORws6bmYXma3loWrn0E1HERQO7Tv5u
   ANdhO8bxOG9zyhHCl/iGdhGA4+/1W625mtAfYHyCdCON5wrG8GaqlrHjB
   8ktNcv9L8wGJLXzT4b3Q2NIfnq82A+7tFrc5kR1nVUWHycFqf4+8NlZkw
   w==;
X-CSE-ConnectionGUID: KjotEC+xQHSCrPLAv3DEoA==
X-CSE-MsgGUID: DxN9iEi/TCiYFSvtsw+Pwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="36515029"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="36515029"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 21:06:07 -0800
X-CSE-ConnectionGUID: d/cc0nO9SLOOH97XqPNIkw==
X-CSE-MsgGUID: suWKtIxOTi+PfZR2YkgwOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96212099"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Nov 2024 21:06:00 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFRIL-0005uL-2Z;
	Mon, 25 Nov 2024 05:05:57 +0000
Date: Mon, 25 Nov 2024 13:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alistair Popple <apopple@nvidia.com>, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v3 11/25] mm: Allow compound zone device pages
Message-ID: <202411251251.Tjig4oaV-lkp@intel.com>
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
config: powerpc-ebony_defconfig (https://download.01.org/0day-ci/archive/20241125/202411251251.Tjig4oaV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251251.Tjig4oaV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251251.Tjig4oaV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:32:
>> include/linux/memremap.h:164:3: error: call to undeclared function 'page_pgmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     164 |                 page_pgmap(page)->type == MEMORY_DEVICE_PRIVATE;
         |                 ^
>> include/linux/memremap.h:164:21: error: member reference type 'int' is not a pointer
     164 |                 page_pgmap(page)->type == MEMORY_DEVICE_PRIVATE;
         |                 ~~~~~~~~~~~~~~~~  ^
   include/linux/memremap.h:176:3: error: call to undeclared function 'page_pgmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     176 |                 page_pgmap(page)->type == MEMORY_DEVICE_PCI_P2PDMA;
         |                 ^
   include/linux/memremap.h:176:21: error: member reference type 'int' is not a pointer
     176 |                 page_pgmap(page)->type == MEMORY_DEVICE_PCI_P2PDMA;
         |                 ~~~~~~~~~~~~~~~~  ^
   include/linux/memremap.h:182:3: error: call to undeclared function 'page_pgmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     182 |                 page_pgmap(page)->type == MEMORY_DEVICE_COHERENT;
         |                 ^
   include/linux/memremap.h:182:21: error: member reference type 'int' is not a pointer
     182 |                 page_pgmap(page)->type == MEMORY_DEVICE_COHERENT;
         |                 ~~~~~~~~~~~~~~~~  ^
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
     157 |                _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   4 warnings and 6 errors generated.
   make[3]: *** [scripts/Makefile.build:102: arch/powerpc/kernel/asm-offsets.s] Error 1
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

