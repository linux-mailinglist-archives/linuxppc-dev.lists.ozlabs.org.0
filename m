Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A60E5BC27
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 14:54:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cnPR6PqMzDqWY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 22:54:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=mhocko@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cnGj4kmszDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 22:48:13 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 80FCEAF2C;
 Mon,  1 Jul 2019 12:48:10 +0000 (UTC)
Date: Mon, 1 Jul 2019 14:48:09 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 04/11] arm64/mm: Add temporary arch_remove_memory()
 implementation
Message-ID: <20190701124809.GV6376@dhcp22.suse.cz>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-5-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-5-david@redhat.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, Yu Zhao <yuzhao@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 Jun Yao <yaojun8558363@gmail.com>, linux-mm@kvack.org,
 Chintan Pandya <cpandya@codeaurora.org>, Igor Mammedov <imammedo@redhat.com>,
 akpm@linux-foundation.org, Mike Rapoport <rppt@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 27-05-19 13:11:45, David Hildenbrand wrote:
> A proper arch_remove_memory() implementation is on its way, which also
> cleanly removes page tables in arch_add_memory() in case something goes
> wrong.
> 
> As we want to use arch_remove_memory() in case something goes wrong
> during memory hotplug after arch_add_memory() finished, let's add
> a temporary hack that is sufficient enough until we get a proper
> implementation that cleans up page table entries.
> 
> We will remove CONFIG_MEMORY_HOTREMOVE around this code in follow up
> patches.

I would drop this one as well (like s390 counterpart).
 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Cc: Chintan Pandya <cpandya@codeaurora.org>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Jun Yao <yaojun8558363@gmail.com>
> Cc: Yu Zhao <yuzhao@google.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/arm64/mm/mmu.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index a1bfc4413982..e569a543c384 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1084,4 +1084,23 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  	return __add_pages(nid, start >> PAGE_SHIFT, size >> PAGE_SHIFT,
>  			   restrictions);
>  }
> +#ifdef CONFIG_MEMORY_HOTREMOVE
> +void arch_remove_memory(int nid, u64 start, u64 size,
> +			struct vmem_altmap *altmap)
> +{
> +	unsigned long start_pfn = start >> PAGE_SHIFT;
> +	unsigned long nr_pages = size >> PAGE_SHIFT;
> +	struct zone *zone;
> +
> +	/*
> +	 * FIXME: Cleanup page tables (also in arch_add_memory() in case
> +	 * adding fails). Until then, this function should only be used
> +	 * during memory hotplug (adding memory), not for memory
> +	 * unplug. ARCH_ENABLE_MEMORY_HOTREMOVE must not be
> +	 * unlocked yet.
> +	 */
> +	zone = page_zone(pfn_to_page(start_pfn));
> +	__remove_pages(zone, start_pfn, nr_pages, altmap);
> +}
> +#endif
>  #endif
> -- 
> 2.20.1

-- 
Michal Hocko
SUSE Labs
