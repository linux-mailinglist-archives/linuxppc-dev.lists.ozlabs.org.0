Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF624B25CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 13:30:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwCcq2rssz3cCT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 23:30:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CKMkGElc;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CKMkGElc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=CKMkGElc; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=CKMkGElc; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwCc65rZyz3bTy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 23:29:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644582577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2APoZLAo8ewHTkfBMOkfhRRgJzJxi3dhuQDRkfO9Gg0=;
 b=CKMkGElc1we8+heXO1fL80fK5ILY/24SqdX5ai5WCzGjEmhqxr5pMbJl9ASHZNk/Yzq4pm
 LsPz1YLagx0x4Rk2czE3IvV98tzIrrjEVLDaS9mq5DC/M24I5At0mYK6ozYBXr99wGvFWW
 kEfqVuSkwP+cexN7uBVNM5G/R5b8p4Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644582577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2APoZLAo8ewHTkfBMOkfhRRgJzJxi3dhuQDRkfO9Gg0=;
 b=CKMkGElc1we8+heXO1fL80fK5ILY/24SqdX5ai5WCzGjEmhqxr5pMbJl9ASHZNk/Yzq4pm
 LsPz1YLagx0x4Rk2czE3IvV98tzIrrjEVLDaS9mq5DC/M24I5At0mYK6ozYBXr99wGvFWW
 kEfqVuSkwP+cexN7uBVNM5G/R5b8p4Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-F5G9oPAdN3aOo6WHhtigxw-1; Fri, 11 Feb 2022 07:29:33 -0500
X-MC-Unique: F5G9oPAdN3aOo6WHhtigxw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i204-20020a1c3bd5000000b0037bb9f6feeeso329817wma.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 04:29:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2APoZLAo8ewHTkfBMOkfhRRgJzJxi3dhuQDRkfO9Gg0=;
 b=6OBrEEOvz2L0npw3ayDV2oQxcTkw3HU2NqzQe1qv0oaRxdaB/ohAeU2ySUm+AyAl7/
 Ik5DsA33X2/YlNH8cSCYcLqPxSmNYAmsF+Ppgx2c6bP95O6pAT1O7igMj2aGqiOXDRq5
 iTlXD369fzGz7rnttFIfJbykzo1dvxH8a0LYVMML8YdhKOldhGZL9yDxKk/gD4hOGFZx
 nKntVAKijyEZkoE0z84wdurMYhgYjIRZq+WgvhsNxtZipxG0V0l6FcRn3hfxi6dQz7DT
 jlOd3gL71xKZoAOe+K1J3DNVIOdmChy95zngeuQ8augGDaATo2HvvTAk3SfXgdfYDH7e
 9WfA==
X-Gm-Message-State: AOAM532uYQYwBQP74CrtD5v0oOQcvIsTRDUzpRpeoiMgSNk3q2FSy72q
 6FPWSGSdKi7OuJJJ3CEXlv726/587DEml1g7hueT/3POqQanil9dCJt596cXz9DHW244fRM0iRL
 ISZoOaAeEaokP/7cgo0EGFCdt0A==
X-Received: by 2002:a7b:c778:: with SMTP id x24mr106637wmk.11.1644582572567;
 Fri, 11 Feb 2022 04:29:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz180nTuhHYdBwK+oLOvvZFOC1iC02Xbay+NeAC2E9KmOXRsOol8Aa3+1BSV1zjKalanfgfyg==
X-Received: by 2002:a7b:c778:: with SMTP id x24mr106612wmk.11.1644582572213;
 Fri, 11 Feb 2022 04:29:32 -0800 (PST)
Received: from ?IPV6:2003:cb:c70c:aa00:4cc6:d24a:90ae:8c1f?
 (p200300cbc70caa004cc6d24a90ae8c1f.dip0.t-ipconnect.de.
 [2003:cb:c70c:aa00:4cc6:d24a:90ae:8c1f])
 by smtp.gmail.com with ESMTPSA id v5sm1227260wrr.7.2022.02.11.04.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 04:29:31 -0800 (PST)
Message-ID: <04de35b6-2ae3-91e0-344f-3a5b656333e0@redhat.com>
Date: Fri, 11 Feb 2022 13:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] powerpc/mm: Update default hugetlb size early
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20220211065215.101767-1-aneesh.kumar@linux.ibm.com>
 <831ee5f6-8605-02d2-b7e5-543aec4857c3@redhat.com>
 <05d6615a-50c7-1b23-1bab-0e0b64dd4e81@linux.ibm.com>
 <b77816ef-80fd-40b7-cf6e-6de2a3125eb1@redhat.com>
 <87tud5a8x5.fsf@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87tud5a8x5.fsf@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11.02.22 13:23, Aneesh Kumar K.V wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 11.02.22 10:16, Aneesh Kumar K V wrote:
>>> On 2/11/22 14:00, David Hildenbrand wrote:
>>>> On 11.02.22 07:52, Aneesh Kumar K.V wrote:
>>>>> commit: d9c234005227 ("Do not depend on MAX_ORDER when grouping pages by mobility")
>>>>> introduced pageblock_order which will be used to group pages better.
>>>>> The kernel now groups pages based on the value of HPAGE_SHIFT. Hence HPAGE_SHIFT
>>>>> should be set before we call set_pageblock_order.
>>>>>
>>>>> set_pageblock_order happens early in the boot and default hugetlb page size
>>>>> should be initialized before that to compute the right pageblock_order value.
>>>>>
>>>>> Currently, default hugetlbe page size is set via arch_initcalls which happens
>>>>> late in the boot as shown via the below callstack:
>>>>>
>>>>> [c000000007383b10] [c000000001289328] hugetlbpage_init+0x2b8/0x2f8
>>>>> [c000000007383bc0] [c0000000012749e4] do_one_initcall+0x14c/0x320
>>>>> [c000000007383c90] [c00000000127505c] kernel_init_freeable+0x410/0x4e8
>>>>> [c000000007383da0] [c000000000012664] kernel_init+0x30/0x15c
>>>>> [c000000007383e10] [c00000000000cf14] ret_from_kernel_thread+0x5c/0x64
>>>>>
>>>>> and the pageblock_order initialization is done early during the boot.
>>>>>
>>>>> [c0000000018bfc80] [c0000000012ae120] set_pageblock_order+0x50/0x64
>>>>> [c0000000018bfca0] [c0000000012b3d94] sparse_init+0x188/0x268
>>>>> [c0000000018bfd60] [c000000001288bfc] initmem_init+0x28c/0x328
>>>>> [c0000000018bfe50] [c00000000127b370] setup_arch+0x410/0x480
>>>>> [c0000000018bfed0] [c00000000127401c] start_kernel+0xb8/0x934
>>>>> [c0000000018bff90] [c00000000000d984] start_here_common+0x1c/0x98
>>>>>
>>>>> delaying default hugetlb page size initialization implies the kernel will
>>>>> initialize pageblock_order to (MAX_ORDER - 1) which is not an optimal
>>>>> value for mobility grouping. IIUC we always had this issue. But it was not
>>>>> a problem for hash translation mode because (MAX_ORDER - 1) is the same as
>>>>> HUGETLB_PAGE_ORDER (8) in the case of hash (16MB). With radix,
>>>>> HUGETLB_PAGE_ORDER will be 5 (2M size) and hence pageblock_order should be
>>>>> 5 instead of 8.
>>>>
>>>>
>>>> A related question: Can we on ppc still have pageblock_order > MAX_ORDER
>>>> - 1? We have some code for that and I am not so sure if we really need that.
>>>>
>>>
>>> I also have been wondering about the same. On book3s64 I don't think we 
>>> need that support for both 64K and 4K page size because with hash 
>>> hugetlb size is MAX_ORDER -1. (16MB hugepage size)
>>>
>>> I am not sure about the 256K page support. Christophe may be able to 
>>> answer that.
>>>
>>> For the gigantic hugepage support we depend on cma based allocation or
>>> firmware reservation. So I am not sure why we ever considered pageblock 
>>>  > MAX_ORDER -1 scenario. If you have pointers w.r.t why that was ever 
>>> needed, I could double-check whether ppc64 is still dependent on that.
>>
>> commit dc78327c0ea7da5186d8cbc1647bd6088c5c9fa5
>> Author: Michal Nazarewicz <mina86@mina86.com>
>> Date:   Wed Jul 2 15:22:35 2014 -0700
>>
>>     mm: page_alloc: fix CMA area initialisation when pageblock > MAX_ORDER
>>
>> indicates that at least arm64 used to have cases for that as well.
>>
>> However, nowadays with ARM64_64K_PAGES we have FORCE_MAX_ZONEORDER=14 as
>> default, corresponding to 512MiB.
>>
>> So I'm not sure if this is something worth supporting. If you want
>> somewhat reliable gigantic pages, use CMA or preallocate them during boot.
>>
>> -- 
>> Thanks,
>>
>> David / dhildenb
> 
> I could build a kernel with FORCE_MAX_ZONEORDER=8 and pageblock_order =
> 8. We need to disable THP for such a kernel to boot, because THP do
> check for PMD_ORDER < MAX_ORDER. I was able to boot that kernel on a
> virtualized platform, but then gigantic_page_runtime_supported is not
> supported on such config with hash translation.
> 

I'm currently playing with the idea of the following (uncompiled,untested):

From 68e0a158a5060bc1a175d12b20e21794763a33df Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Fri, 11 Feb 2022 11:40:27 +0100
Subject: [PATCH] mm: enforce pageblock_order < MAX_ORDER

Some places in the kernel don't really expect pageblock_order >=
MAX_ORDER, and it looks like this is only possible in corner cases:

1) CONFIG_DEFERRED_STRUCT_PAGE_INIT we'll end up freeing pageblock_order
   pages via __free_pages_core(), which cannot possibly work.

2) mm/page_reporting.c won't be reporting any pages with default
   page_reporting_order == pageblock_order, as we'll be skipping the
   reporting loop inside page_reporting_process_zone().

3) __rmqueue_fallback() will never be able to steal with
   ALLOC_NOFRAGMENT.

4) find_zone_movable_pfns_for_nodes() will roundup the ZONE_MOVABLE
   start PFN to MAX_ORDER_NR_PAGES. Consequently with a bigger
   pageblock_order, we could have pageblocks partially managed by two
   zones.

pageblock_order >= MAX_ORDER is weird either way: it's a pure
optimization for making alloc_contig_range(), as used for allcoation of
gigantic pages, a little more reliable to succeed. However, if there is
demand for somewhat reliable allocation of gigantic pages, affected setups
should be using CMA or boottime allocations instead.

So let's make sure that pageblock_order < MAX_ORDER and simplify.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/include/asm/fadump-internal.h |  4 +--
 drivers/of/of_reserved_mem.c               |  8 ++---
 include/linux/pageblock-flags.h            |  7 +++--
 kernel/dma/contiguous.c                    |  2 +-
 mm/Kconfig                                 |  3 ++
 mm/cma.c                                   |  6 ++--
 mm/page_alloc.c                            | 34 ++++++----------------
 mm/page_isolation.c                        |  6 ++--
 8 files changed, 26 insertions(+), 44 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 52189928ec08..959c7df15baa 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -20,9 +20,7 @@
 #define memblock_num_regions(memblock_type)	(memblock.memblock_type.cnt)
 
 /* Alignment per CMA requirement. */
-#define FADUMP_CMA_ALIGNMENT	(PAGE_SIZE <<				\
-				 max_t(unsigned long, MAX_ORDER - 1,	\
-				 pageblock_order))
+#define FADUMP_CMA_ALIGNMENT	(PAGE_SIZE * MAX_ORDER_NR_PAGES)
 
 /* FAD commands */
 #define FADUMP_REGISTER			1
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 9c0fb962c22b..dcbbffca0c57 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -116,12 +116,8 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 	if (IS_ENABLED(CONFIG_CMA)
 	    && of_flat_dt_is_compatible(node, "shared-dma-pool")
 	    && of_get_flat_dt_prop(node, "reusable", NULL)
-	    && !nomap) {
-		unsigned long order =
-			max_t(unsigned long, MAX_ORDER - 1, pageblock_order);
-
-		align = max(align, (phys_addr_t)PAGE_SIZE << order);
-	}
+	    && !nomap)
+		align = max_t(phys_addr_t, align, PAGE_SIZE * MAX_ORDER_NR_PAGES);
 
 	prop = of_get_flat_dt_prop(node, "alloc-ranges", &len);
 	if (prop) {
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index 973fd731a520..83c7248053a1 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -37,8 +37,11 @@ extern unsigned int pageblock_order;
 
 #else /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
 
-/* Huge pages are a constant size */
-#define pageblock_order		HUGETLB_PAGE_ORDER
+/*
+ * Huge pages are a constant size, but don't exceed the maximum allocation
+ * granularity.
+ */
+#define pageblock_order		min_t(unsigned int, HUGETLB_PAGE_ORDER, MAX_ORDER - 1)
 
 #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
 
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 3d63d91cba5c..4333c05c14fc 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -399,7 +399,7 @@ static const struct reserved_mem_ops rmem_cma_ops = {
 
 static int __init rmem_cma_setup(struct reserved_mem *rmem)
 {
-	phys_addr_t align = PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order);
+	phys_addr_t align = PAGE_SIZE * MAX_ORDER_NR_PAGES;
 	phys_addr_t mask = align - 1;
 	unsigned long node = rmem->fdt_node;
 	bool default_cma = of_get_flat_dt_prop(node, "linux,cma-default", NULL);
diff --git a/mm/Kconfig b/mm/Kconfig
index 3326ee3903f3..4c91b92e7537 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -262,6 +262,9 @@ config HUGETLB_PAGE_SIZE_VARIABLE
 	  HUGETLB_PAGE_ORDER when there are multiple HugeTLB page sizes available
 	  on a platform.
 
+	  Note that the pageblock_order cannot exceed MAX_ORDER - 1 and will be
+	  clamped down to MAX_ORDER - 1.
+
 config CONTIG_ALLOC
 	def_bool (MEMORY_ISOLATION && COMPACTION) || CMA
 
diff --git a/mm/cma.c b/mm/cma.c
index bc9ca8f3c487..418e214685da 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -180,8 +180,7 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 		return -EINVAL;
 
 	/* ensure minimal alignment required by mm core */
-	alignment = PAGE_SIZE <<
-			max_t(unsigned long, MAX_ORDER - 1, pageblock_order);
+	alignment = PAGE_SIZE * MAX_ORDER_NR_PAGES;
 
 	/* alignment should be aligned with order_per_bit */
 	if (!IS_ALIGNED(alignment >> PAGE_SHIFT, 1 << order_per_bit))
@@ -268,8 +267,7 @@ int __init cma_declare_contiguous_nid(phys_addr_t base,
 	 * migratetype page by page allocator's buddy algorithm. In the case,
 	 * you couldn't get a contiguous memory, which is not what we want.
 	 */
-	alignment = max(alignment,  (phys_addr_t)PAGE_SIZE <<
-			  max_t(unsigned long, MAX_ORDER - 1, pageblock_order));
+	alignment = max_t(phys_addr_t, alignment, PAGE_SIZE * MAX_ORDER_NR_PAGES);
 	if (fixed && base & (alignment - 1)) {
 		ret = -EINVAL;
 		pr_err("Region at %pa must be aligned to %pa bytes\n",
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 3589febc6d31..36d9fc308a26 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1072,14 +1072,12 @@ static inline void __free_one_page(struct page *page,
 		int migratetype, fpi_t fpi_flags)
 {
 	struct capture_control *capc = task_capc(zone);
+	unsigned int max_order = pageblock_order;
 	unsigned long buddy_pfn;
 	unsigned long combined_pfn;
-	unsigned int max_order;
 	struct page *buddy;
 	bool to_tail;
 
-	max_order = min_t(unsigned int, MAX_ORDER - 1, pageblock_order);
-
 	VM_BUG_ON(!zone_is_initialized(zone));
 	VM_BUG_ON_PAGE(page->flags & PAGE_FLAGS_CHECK_AT_PREP, page);
 
@@ -2260,19 +2258,8 @@ void __init init_cma_reserved_pageblock(struct page *page)
 	} while (++p, --i);
 
 	set_pageblock_migratetype(page, MIGRATE_CMA);
-
-	if (pageblock_order >= MAX_ORDER) {
-		i = pageblock_nr_pages;
-		p = page;
-		do {
-			set_page_refcounted(p);
-			__free_pages(p, MAX_ORDER - 1);
-			p += MAX_ORDER_NR_PAGES;
-		} while (i -= MAX_ORDER_NR_PAGES);
-	} else {
-		set_page_refcounted(page);
-		__free_pages(page, pageblock_order);
-	}
+	set_page_refcounted(page);
+	__free_pages(page, pageblock_order);
 
 	adjust_managed_page_count(page, pageblock_nr_pages);
 	page_zone(page)->cma_pages += pageblock_nr_pages;
@@ -7389,16 +7376,15 @@ static inline void setup_usemap(struct zone *zone) {}
 /* Initialise the number of pages represented by NR_PAGEBLOCK_BITS */
 void __init set_pageblock_order(void)
 {
-	unsigned int order;
+	unsigned int order = MAX_ORDER - 1;
 
 	/* Check that pageblock_nr_pages has not already been setup */
 	if (pageblock_order)
 		return;
 
-	if (HPAGE_SHIFT > PAGE_SHIFT)
+	/* Don't let pageblocks exceed the maximum allocation granularity. */
+	if (HPAGE_SHIFT > PAGE_SHIFT && HUGETLB_PAGE_ORDER < order)
 		order = HUGETLB_PAGE_ORDER;
-	else
-		order = MAX_ORDER - 1;
 
 	/*
 	 * Assume the largest contiguous order of interest is a huge page.
@@ -7593,7 +7579,7 @@ static void __init alloc_node_mem_map(struct pglist_data *pgdat)
 	if (!pgdat->node_spanned_pages)
 		return;
 
-	start = pgdat->node_start_pfn & ~(MAX_ORDER_NR_PAGES - 1);
+	start = ALIGN_DOWN(pgdat->node_start_pfn, MAX_ORDER_NR_PAGES);
 	offset = pgdat->node_start_pfn - start;
 	/* ia64 gets its own node_mem_map, before this, without bootmem */
 	if (!pgdat->node_mem_map) {
@@ -8986,14 +8972,12 @@ struct page *has_unmovable_pages(struct zone *zone, struct page *page,
 #ifdef CONFIG_CONTIG_ALLOC
 static unsigned long pfn_max_align_down(unsigned long pfn)
 {
-	return pfn & ~(max_t(unsigned long, MAX_ORDER_NR_PAGES,
-			     pageblock_nr_pages) - 1);
+	return ALIGN_DOWN(pfn, MAX_ORDER_NR_PAGES);
 }
 
 static unsigned long pfn_max_align_up(unsigned long pfn)
 {
-	return ALIGN(pfn, max_t(unsigned long, MAX_ORDER_NR_PAGES,
-				pageblock_nr_pages));
+	return ALIGN(pfn, MAX_ORDER_NR_PAGES);
 }
 
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index f67c4c70f17f..e679af6121e3 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -276,9 +276,9 @@ int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
 	int ret;
 
 	/*
-	 * Note: pageblock_nr_pages != MAX_ORDER. Then, chunks of free pages
-	 * are not aligned to pageblock_nr_pages.
-	 * Then we just check migratetype first.
+	 * Note: if pageblock_nr_pages < MAX_ORDER_NR_PAGES, then chunks of free
+	 * pages are not necessarily aligned to pageblock_nr_pages. Check the
+	 * migratetype first.
 	 */
 	for (pfn = start_pfn; pfn < end_pfn; pfn += pageblock_nr_pages) {
 		page = __first_valid_page(pfn, pageblock_nr_pages);
-- 
2.34.1



-- 
Thanks,

David / dhildenb

