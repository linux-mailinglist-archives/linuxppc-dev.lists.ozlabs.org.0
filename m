Return-Path: <linuxppc-dev+bounces-15177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46843CEFA35
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 03:20:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djkn562H9z2yFd;
	Sat, 03 Jan 2026 13:20:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767406841;
	cv=none; b=YKru/vWwAY6WKi74v6bzT2OsOC1HsPbzLLPFsdHz57PjNprR0JkKZdqa5cXUixYaInmoczbSV4pbYD3dRJF5K2nAEhwC7g+pCOreVt0pfD7T5eiZB00LIXURhlvH/rBfJKl3Ca0T0S8FqUDL3tauZJ+Wl2UMcdF4qN/Myopz8aFbu72HvLTed2kJK2A5YTq2R+Tn7JxxSl+E/bXoMYdhK5s4Nf0Wv9+L/MOFFwat/CkbsdZEzmXVIF6zr2h1gIu7rjUMPI0XBnsWBAZjCSjYmgVM0zClAzcWJ64apcPiBIPNGhMXUTI5ktG4DS9z6SJhiG2m+QhEwNJnH+Dh2cX6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767406841; c=relaxed/relaxed;
	bh=wSbwW0RnlgdvzoJ5Y3X5/CCt2YoP1gq3trPPBi9V/FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGXnIakUxNbUmSdzkHi7aIZIKVGY3UjIlKYMrGgyZnqKbQsQWKTbsiR7ExooTC03ah709A6M0FPGRnuf19o0/cGNV7XjLSPopJXHGkukyJCBIUyMjViShaUafEYIHEh6k0Ol+EK9XEjCbOC6IdSspROvxknWs1eM6fiLFFnGHA8N85jCxOKxviwWitixi+y/bALSuzPDleSc2bhCnzH4zlSxn4+8NsQumfwhbOmEQ/eqbnSnrNFr/+I7hk+nm0/afyUwElpUpbK62oMMdhwkUOGCqo+8hxzkeImDjjBrW/MltEAw/dcbaTp46PZptfH15OUfzewUeHdT9it+UmcQiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nbTCTJIU; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nbTCTJIU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djkn26nnwz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 13:20:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767406839; x=1798942839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GAz6lVW9pP3EQThoU4Z64Wm4ELMF1S0wejso0L8U92Y=;
  b=nbTCTJIUK5nC4de7NfMXxXIoY8bIxU2o2BJu7N2KCyyH9l8Y1AOBKw4p
   AZM9h3MlDTIsJqkftBmtBes/aA6yFvulzvNj4NZymo8UVwCrl/gT8hM5Z
   iSb8yYk+7JsW78QRssea3WBtYlu1V/6/rwrvoUpj3XSjFllnobeX1wsic
   jBFj0WThRHul21SnSuS2w0EzvQ5s8Bhnef7zWFtoQYIG6vUKZibbMY3on
   mmQgTnrA468ph41GB70ZY9C4cNCm/xknp7EBXhT2BVa0zjr5Cf3KPtuNl
   Ey4BfR8a/svUGtJ6M+zmeNRDcKaXCPlNwXJlAIk51bE6q3wwA9l1hh0WH
   w==;
X-CSE-ConnectionGUID: /De0YuqnTcWRIxl3W8Vqjg==
X-CSE-MsgGUID: TDv4d5WFT9WgVp3YSHuRHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68788111"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68788111"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 18:20:32 -0800
X-CSE-ConnectionGUID: cYzilF2MT8G/+TeZ4kaVtw==
X-CSE-MsgGUID: R9/AmzffTsaCv10Cn1bAHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="201556561"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jan 2026 18:20:17 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbrFX-000000002Xt-23O6;
	Sat, 03 Jan 2026 02:20:15 +0000
Date: Sat, 3 Jan 2026 10:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, balbirs@nvidia.com,
	matthew.brost@intel.com, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
	lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
	mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca, Felix.Kuehling@amd.com
Subject: Re: [PATCH v1 8/8] mm: Remove device private pages from the physical
 address space
Message-ID: <202601030906.9lgtN5Gq-lkp@intel.com>
References: <20251231043154.42931-9-jniethe@nvidia.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251231043154.42931-9-jniethe@nvidia.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jordan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Niethe/mm-migrate_device-Add-migrate-PFN-flag-to-track-device-private-pages/20251231-123453
base:   f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
patch link:    https://lore.kernel.org/r/20251231043154.42931-9-jniethe%40nvidia.com
patch subject: [PATCH v1 8/8] mm: Remove device private pages from the physical address space
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260103/202601030906.9lgtN5Gq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601030906.9lgtN5Gq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601030906.9lgtN5Gq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/purgatory/purgatory.c:10:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:33:
>> include/linux/memremap.h:148:2: warning: field '' with variable sized type 'union dev_pagemap::(anonymous at include/linux/memremap.h:148:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
     148 |         union {
         |         ^
   1 warning generated.


vim +148 include/linux/memremap.h

514caf23a70fd6 Christoph Hellwig   2019-06-26  113  
9476df7d80dfc4 Dan Williams        2016-01-15  114  /**
9476df7d80dfc4 Dan Williams        2016-01-15  115   * struct dev_pagemap - metadata for ZONE_DEVICE mappings
4b94ffdc4163ba Dan Williams        2016-01-15  116   * @altmap: pre-allocated/reserved memory for vmemmap allocations
5c2c2587b13235 Dan Williams        2016-01-15  117   * @ref: reference count that pins the devm_memremap_pages() mapping
b80892ca022e9e Christoph Hellwig   2021-10-28  118   * @done: completion for @ref
0c32c9f7a58e77 John Groves         2024-02-05  119   * @type: memory type: see MEMORY_* above in memremap.h
514caf23a70fd6 Christoph Hellwig   2019-06-26  120   * @flags: PGMAP_* flags to specify defailed behavior
c4386bd8ee3a92 Joao Martins        2022-01-14  121   * @vmemmap_shift: structural definition of how the vmemmap page metadata
c4386bd8ee3a92 Joao Martins        2022-01-14  122   *      is populated, specifically the metadata page order.
c4386bd8ee3a92 Joao Martins        2022-01-14  123   *	A zero value (default) uses base pages as the vmemmap metadata
c4386bd8ee3a92 Joao Martins        2022-01-14  124   *	representation. A bigger value will set up compound struct pages
c4386bd8ee3a92 Joao Martins        2022-01-14  125   *	of the requested order value.
1e240e8d4a7d92 Christoph Hellwig   2019-06-26  126   * @ops: method table
f894ddd5ff01d3 Christoph Hellwig   2020-03-16  127   * @owner: an opaque pointer identifying the entity that manages this
f894ddd5ff01d3 Christoph Hellwig   2020-03-16  128   *	instance.  Used by various helpers to make sure that no
f894ddd5ff01d3 Christoph Hellwig   2020-03-16  129   *	foreign ZONE_DEVICE memory is accessed.
0386df765967ce Jordan Niethe       2025-12-31  130   * @nr_range: number of ranges to be mapped. Always == 1 for
0386df765967ce Jordan Niethe       2025-12-31  131   *	MEMORY_DEVICE_PRIVATE.
0386df765967ce Jordan Niethe       2025-12-31  132   * @range: range to be mapped when nr_range == 1. Used as an output param for
0386df765967ce Jordan Niethe       2025-12-31  133   *	MEMORY_DEVICE_PRIVATE.
b7b3c01b191596 Dan Williams        2020-10-13  134   * @ranges: array of ranges to be mapped when nr_range > 1
0386df765967ce Jordan Niethe       2025-12-31  135   * @nr_pages: number of pages requested to be mapped for MEMORY_DEVICE_PRIVATE.
0386df765967ce Jordan Niethe       2025-12-31  136   * @pages: array of nr_pages initialized for MEMORY_DEVICE_PRIVATE.
9476df7d80dfc4 Dan Williams        2016-01-15  137   */
9476df7d80dfc4 Dan Williams        2016-01-15  138  struct dev_pagemap {
e7744aa25cffe2 Logan Gunthorpe     2017-12-29  139  	struct vmem_altmap altmap;
b80892ca022e9e Christoph Hellwig   2021-10-28  140  	struct percpu_ref ref;
24917f6b1041a7 Christoph Hellwig   2019-06-26  141  	struct completion done;
5042db43cc26f5 Jérôme Glisse       2017-09-08  142  	enum memory_type type;
514caf23a70fd6 Christoph Hellwig   2019-06-26  143  	unsigned int flags;
c4386bd8ee3a92 Joao Martins        2022-01-14  144  	unsigned long vmemmap_shift;
1e240e8d4a7d92 Christoph Hellwig   2019-06-26  145  	const struct dev_pagemap_ops *ops;
f894ddd5ff01d3 Christoph Hellwig   2020-03-16  146  	void *owner;
b7b3c01b191596 Dan Williams        2020-10-13  147  	int nr_range;
b7b3c01b191596 Dan Williams        2020-10-13 @148  	union {
b7b3c01b191596 Dan Williams        2020-10-13  149  		struct range range;
06919d226d0113 Gustavo A. R. Silva 2022-09-03  150  		DECLARE_FLEX_ARRAY(struct range, ranges);
b7b3c01b191596 Dan Williams        2020-10-13  151  	};
0386df765967ce Jordan Niethe       2025-12-31  152  	unsigned long nr_pages;
0386df765967ce Jordan Niethe       2025-12-31  153  	struct page *pages;
9476df7d80dfc4 Dan Williams        2016-01-15  154  };
9476df7d80dfc4 Dan Williams        2016-01-15  155  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

