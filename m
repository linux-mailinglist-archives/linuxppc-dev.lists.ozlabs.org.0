Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D61A23A8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 15:57:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y5SQ611bzDqZL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 23:57:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48y3jc2jdyzDqw8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 22:38:43 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87C1331B;
 Wed,  8 Apr 2020 05:38:41 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0ADA83F73D;
 Wed,  8 Apr 2020 05:38:37 -0700 (PDT)
Date: Wed, 8 Apr 2020 13:38:36 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/28] mm: enforce that vmap can't map pages executable
Message-ID: <20200408123835.GB36478@lakrids.cambridge.arm.com>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-19-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408115926.1467567-19-hch@lst.de>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Catalin marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 Will Deacon <will@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Daniel Vetter <daniel@ffwll.ch>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 iommu@lists.linux-foundation.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 08, 2020 at 01:59:16PM +0200, Christoph Hellwig wrote:
> To help enforcing the W^X protection don't allow remapping existing
> pages as executable.
> 
> Based on patch from Peter Zijlstra <peterz@infradead.org>.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/x86/include/asm/pgtable_types.h | 6 ++++++
>  include/asm-generic/pgtable.h        | 4 ++++
>  mm/vmalloc.c                         | 2 +-
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
> index 947867f112ea..2e7c442cc618 100644
> --- a/arch/x86/include/asm/pgtable_types.h
> +++ b/arch/x86/include/asm/pgtable_types.h
> @@ -282,6 +282,12 @@ typedef struct pgprot { pgprotval_t pgprot; } pgprot_t;
>  
>  typedef struct { pgdval_t pgd; } pgd_t;
>  
> +static inline pgprot_t pgprot_nx(pgprot_t prot)
> +{
> +	return __pgprot(pgprot_val(prot) | _PAGE_NX);
> +}
> +#define pgprot_nx pgprot_nx
> +
>  #ifdef CONFIG_X86_PAE

I reckon for arm64 we can do similar in our <asm/pgtable.h>:

#define pgprot_nx(pgprot_t prot) \
	__pgprot_modify(prot, 0, PTE_PXN)

... matching the style of our existing pgprot_*() modifier helpers.

Mark.

>  
>  /*
> diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
> index 329b8c8ca703..8c5f9c29698b 100644
> --- a/include/asm-generic/pgtable.h
> +++ b/include/asm-generic/pgtable.h
> @@ -491,6 +491,10 @@ static inline int arch_unmap_one(struct mm_struct *mm,
>  #define flush_tlb_fix_spurious_fault(vma, address) flush_tlb_page(vma, address)
>  #endif
>  
> +#ifndef pgprot_nx
> +#define pgprot_nx(prot)	(prot)
> +#endif
> +
>  #ifndef pgprot_noncached
>  #define pgprot_noncached(prot)	(prot)
>  #endif
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 7356b3f07bd8..334c75251ddb 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2390,7 +2390,7 @@ void *vmap(struct page **pages, unsigned int count,
>  	if (!area)
>  		return NULL;
>  
> -	if (map_kernel_range((unsigned long)area->addr, size, prot,
> +	if (map_kernel_range((unsigned long)area->addr, size, pgprot_nx(prot),
>  			pages) < 0) {
>  		vunmap(area->addr);
>  		return NULL;
> -- 
> 2.25.1
> 
