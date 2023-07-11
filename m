Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0245F74E744
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 08:26:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FbjrsA9V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0W9J6Kkvz3c39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 16:26:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FbjrsA9V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=ying.huang@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Tue, 11 Jul 2023 16:24:49 AEST
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0W7P60ZHz3bpq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 16:24:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689056690; x=1720592690;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=Utj6JC6vB3EVuXXeMiB2T5hPvq6339s1Q0PNQHyzVJM=;
  b=FbjrsA9VMtWHlwvispkRoyAgZernxmZAch6vTBpUXVeCqac+of+pNvSD
   53vsVbuwOTV12QPX4VS7gKLsae4yH2adNQm4URuhEX+MzZBuavaAjQU28
   k0UfpP4vsB6qn6ZkZl7eB5x/fucWTtdMTmpYcTXheeSjZyGxK8nwW6syn
   taHFPtNkxIw8MInXayMvsiIlsBtAcA0175+qDVDoleuISivB6KMm/iNG9
   WnjyfNvYr4h7BdAk6FPuC06ITj2LzApYYQ3U6RnvkhEUO/WEwY4glALYr
   CMlpns+iT+KjKuSMlgxgM6UbUH/ahhvEkq5sBN9WnsOneTFU8fK+k4+Vb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="363404257"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="363404257"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 23:23:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="750617071"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="750617071"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 23:23:38 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3 4/7] mm/hotplug: Allow pageblock alignment via altmap
 reservation
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
	<20230711044834.72809-5-aneesh.kumar@linux.ibm.com>
Date: Tue, 11 Jul 2023 14:21:49 +0800
In-Reply-To: <20230711044834.72809-5-aneesh.kumar@linux.ibm.com> (Aneesh Kumar
	K. V.'s message of "Tue, 11 Jul 2023 10:18:30 +0530")
Message-ID: <87ilardl36.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, npiggin@gmail.com, Vishal Verma <vishal.l.verma@intel.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> Add a new kconfig option that can be selected if we want to allow
> pageblock alignment by reserving pages in the vmemmap altmap area.
> This implies we will be reserving some pages for every memoryblock
> This also allows the memmap on memory feature to be widely useful
> with different memory block size values.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/Kconfig          |  9 +++++++
>  mm/memory_hotplug.c | 59 +++++++++++++++++++++++++++++++++++++--------
>  2 files changed, 58 insertions(+), 10 deletions(-)
>
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 932349271e28..88a1472b2086 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -570,6 +570,15 @@ config MHP_MEMMAP_ON_MEMORY
>  	depends on MEMORY_HOTPLUG && SPARSEMEM_VMEMMAP
>  	depends on ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>  
> +config MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY
> +       bool "Allow Reserving pages for page block aligment"
> +       depends on MHP_MEMMAP_ON_MEMORY
> +       help
> +	This option allows memmap on memory feature to be more useful
> +	with different memory block sizes. This is achieved by marking some pages
> +	in each memory block as reserved so that we can get page-block alignment
> +	for the remaining pages.
> +
>  endif # MEMORY_HOTPLUG
>  
>  config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 07c99b0cc371..f36aec1f7626 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1252,15 +1252,17 @@ static inline bool arch_supports_memmap_on_memory(unsigned long size)
>  {
>  	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
>  	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
> -	unsigned long remaining_size = size - vmemmap_size;
>  
> -	return IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
> -		IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
> +	return IS_ALIGNED(vmemmap_size, PMD_SIZE);
>  }
>  #endif
>  
>  static bool mhp_supports_memmap_on_memory(unsigned long size)
>  {
> +	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
> +	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
> +	unsigned long remaining_size = size - vmemmap_size;
> +
>  	/*
>  	 * Besides having arch support and the feature enabled at runtime, we
>  	 * need a few more assumptions to hold true:
> @@ -1287,9 +1289,30 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
>  	 *       altmap as an alternative source of memory, and we do not exactly
>  	 *       populate a single PMD.
>  	 */
> -	return mhp_memmap_on_memory() &&
> -		size == memory_block_size_bytes() &&
> -		arch_supports_memmap_on_memory(size);
> +	if (!mhp_memmap_on_memory() || size != memory_block_size_bytes())
> +		return false;
> +	 /*
> +	  * Without page reservation remaining pages should be pageblock aligned.
> +	  */
> +	if (!IS_ENABLED(CONFIG_MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY) &&
> +	    !IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)))
> +		return false;
> +
> +	return arch_supports_memmap_on_memory(size);
> +}
> +
> +static inline unsigned long memory_block_align_base(unsigned long size)
> +{
> +	if (IS_ENABLED(CONFIG_MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY)) {
> +		unsigned long align;
> +		unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
> +		unsigned long vmemmap_size;
> +
> +		vmemmap_size = (nr_vmemmap_pages * sizeof(struct page)) >> PAGE_SHIFT;

DIV_ROUND_UP()?

> +		align = pageblock_align(vmemmap_size) - vmemmap_size;
> +		return align;
> +	} else
> +		return 0;
>  }
>  
>  /*
> @@ -1302,7 +1325,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>  {
>  	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
>  	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
> -	struct vmem_altmap mhp_altmap = {};
> +	struct vmem_altmap mhp_altmap = {
> +		.base_pfn =  PHYS_PFN(res->start),
> +		.end_pfn  =  PHYS_PFN(res->end),
> +		.reserve  = memory_block_align_base(resource_size(res)),
> +	};
>  	struct memory_group *group = NULL;
>  	u64 start, size;
>  	bool new_node = false;
> @@ -1347,8 +1374,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>  	 */
>  	if (mhp_flags & MHP_MEMMAP_ON_MEMORY) {
>  		if (mhp_supports_memmap_on_memory(size)) {
> -			mhp_altmap.free = PHYS_PFN(size);
> -			mhp_altmap.base_pfn = PHYS_PFN(start);
> +			mhp_altmap.free = PHYS_PFN(size) - mhp_altmap.reserve;
>  			params.altmap = &mhp_altmap;
>  		}
>  		/* fallback to not using altmap  */
> @@ -1360,7 +1386,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>  		goto error;
>  
>  	/* create memory block devices after memory was added */
> -	ret = create_memory_block_devices(start, size, mhp_altmap.alloc,
> +	ret = create_memory_block_devices(start, size, mhp_altmap.alloc + mhp_altmap.reserve,
>  					  group);
>  	if (ret) {
>  		arch_remove_memory(start, size, NULL);
> @@ -2260,3 +2286,16 @@ int offline_and_remove_memory(u64 start, u64 size)
>  }
>  EXPORT_SYMBOL_GPL(offline_and_remove_memory);
>  #endif /* CONFIG_MEMORY_HOTREMOVE */
> +
> +static int __init memory_hotplug_init(void)
> +{
> +
> +	if (IS_ENABLED(CONFIG_MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY) &&
> +	    mhp_memmap_on_memory()) {
> +		pr_info("Memory hotplug will reserve %ld pages in each memory block\n",
> +			memory_block_align_base(memory_block_size_bytes()));
> +
> +	}
> +	return 0;
> +}
> +module_init(memory_hotplug_init);
