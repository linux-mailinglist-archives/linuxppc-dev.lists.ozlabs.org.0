Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2124330232B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 10:17:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPPQQ0hJczDqkL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 20:17:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPPMq4JBdzDqjM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 20:14:56 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DPPMX1YsFz9tytr;
 Mon, 25 Jan 2021 10:14:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kQAyO7I1Rv8X; Mon, 25 Jan 2021 10:14:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DPPMX0YBjz9tytp;
 Mon, 25 Jan 2021 10:14:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2DB448B780;
 Mon, 25 Jan 2021 10:14:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NLJtyCdWxlpx; Mon, 25 Jan 2021 10:14:53 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B6BB28B75F;
 Mon, 25 Jan 2021 10:14:52 +0100 (CET)
Subject: Re: [PATCH v10 11/12] mm/vmalloc: Hugepage vmalloc mappings
To: Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20210124082230.2118861-1-npiggin@gmail.com>
 <20210124082230.2118861-12-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <933352bd-dcf3-c483-4d7a-07afe1116cf1@csgroup.eu>
Date: Mon, 25 Jan 2021 10:14:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210124082230.2118861-12-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/01/2021 à 09:22, Nicholas Piggin a écrit :
> Support huge page vmalloc mappings. Config option HAVE_ARCH_HUGE_VMALLOC
> enables support on architectures that define HAVE_ARCH_HUGE_VMAP and
> supports PMD sized vmap mappings.
> 
> vmalloc will attempt to allocate PMD-sized pages if allocating PMD size
> or larger, and fall back to small pages if that was unsuccessful.
> 
> Architectures must ensure that any arch specific vmalloc allocations
> that require PAGE_SIZE mappings (e.g., module allocations vs strict
> module rwx) use the VM_NOHUGE flag to inhibit larger mappings.
> 
> When hugepage vmalloc mappings are enabled in the next patch, this
> reduces TLB misses by nearly 30x on a `git diff` workload on a 2-node
> POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%.
> 
> This can result in more internal fragmentation and memory overhead for a
> given allocation, an option nohugevmalloc is added to disable at boot.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/Kconfig            |  10 +++
>   include/linux/vmalloc.h |  18 ++++
>   mm/page_alloc.c         |   5 +-
>   mm/vmalloc.c            | 192 ++++++++++++++++++++++++++++++----------
>   4 files changed, 177 insertions(+), 48 deletions(-)
> 

> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 0377e1d059e5..eef61e0f5170 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c

> @@ -2691,15 +2746,18 @@ EXPORT_SYMBOL_GPL(vmap_pfn);
>   #endif /* CONFIG_VMAP_PFN */
>   
>   static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
> -				 pgprot_t prot, int node)
> +				 pgprot_t prot, unsigned int page_shift,
> +				 int node)
>   {
>   	const gfp_t nested_gfp = (gfp_mask & GFP_RECLAIM_MASK) | __GFP_ZERO;
> -	unsigned int nr_pages = get_vm_area_size(area) >> PAGE_SHIFT;
> -	unsigned long array_size;
> -	unsigned int i;
> +	unsigned int page_order = page_shift - PAGE_SHIFT;
> +	unsigned long addr = (unsigned long)area->addr;
> +	unsigned long size = get_vm_area_size(area);
> +	unsigned int nr_small_pages = size >> PAGE_SHIFT;
>   	struct page **pages;
> +	unsigned int i;
>   
> -	array_size = (unsigned long)nr_pages * sizeof(struct page *);
> +	array_size = (unsigned long)nr_small_pages * sizeof(struct page *);

array_size() is a function in include/linux/overflow.h

For some reason, it breaks the build with your series.


>   	gfp_mask |= __GFP_NOWARN;
>   	if (!(gfp_mask & (GFP_DMA | GFP_DMA32)))
>   		gfp_mask |= __GFP_HIGHMEM;
