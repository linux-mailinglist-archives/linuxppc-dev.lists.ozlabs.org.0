Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A876488A5A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:01:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IuXen+Ps;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SCiZAM/a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3GNw2yR3z3wBR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 02:01:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IuXen+Ps;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SCiZAM/a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3GHp4bv7z3vgM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 01:57:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+c4yPtzG9SnjpO3Ux0abr18tbqf9XDz5JHpLVv3vCHY=;
	b=IuXen+Ps+82pqkmdcS51jd72Eel/JLa2CfMGp2BJw7gqX6Epv3H4u4dAZMhZXG2KehBF7I
	n1VyvI+7RVDuqZ7f7XolRyFpj3Z3TXT6IHaLSmdkY0j9sZUC+cfDXOY5xc3lI9+vctdcY2
	8py+gE9359dVLZukczhX8z6/uvAez2Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+c4yPtzG9SnjpO3Ux0abr18tbqf9XDz5JHpLVv3vCHY=;
	b=SCiZAM/aGd1qs3XlOArPgVPugnjpCcr58AcflAO/fAJhazA/zlB2mxZI+j9YC4DFgDcSrD
	Cgx1mcbpXrD5a6Ggr/3njij5zE3CE9SLE5fRv9g6gZBCZgHpAqmmUJpUodOb++LGixari9
	iDVI5YqwDpvmXeZL8L4O1XnfRDn+KSQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-_uq44HFeMq6xtpdXzT6_XA-1; Mon, 25 Mar 2024 10:57:20 -0400
X-MC-Unique: _uq44HFeMq6xtpdXzT6_XA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACF061869C65;
	Mon, 25 Mar 2024 14:57:19 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30A953C20;
	Mon, 25 Mar 2024 14:57:15 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Subject: [PATCH v2 1/6] x86: remove unneeded memblock_find_dma_reserve()
Date: Mon, 25 Mar 2024 22:56:41 +0800
Message-ID: <20240325145646.1044760-2-bhe@redhat.com>
In-Reply-To: <20240325145646.1044760-1-bhe@redhat.com>
References: <20240325145646.1044760-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: Baoquan He <bhe@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Variable dma_reserve and its usage was introduced in commit 0e0b864e069c
("[PATCH] Account for memmap and optionally the kernel image as holes").
Its original purpose was to accounting for the reserved pages in DMA
zone to make DMA zone's watermarks calculation more accurate on x86.

However, currently there's zone->managed_pages to account for all
available pages for buddy, zone->present_pages to account for all
present physical pages in zone. What is more important, on x86,
calculating and setting the zone->managed_pages is a temporary move,
all zone's managed_pages will be zeroed out and reset to the actual
value according to how many pages are added to buddy allocator in
mem_init(). Before mem_init(), no buddy alloction is requested. And
zone's pcp and watermark setting are all done after mem_init(). So,
no need to worry about the DMA zone's setting accuracy during
free_area_init().

Hence, remove memblock_find_dma_reserve() to stop calculating and
setting dma_reserve.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/x86/include/asm/pgtable.h |  1 -
 arch/x86/kernel/setup.c        |  2 --
 arch/x86/mm/init.c             | 47 ----------------------------------
 3 files changed, 50 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 315535ffb258..cefc7a84f7a4 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1200,7 +1200,6 @@ static inline int pgd_none(pgd_t pgd)
 extern int direct_gbpages;
 void init_mem_mapping(void);
 void early_alloc_pgt_buf(void);
-extern void memblock_find_dma_reserve(void);
 void __init poking_init(void);
 unsigned long init_memory_mapping(unsigned long start,
 				  unsigned long end, pgprot_t prot);
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index ef206500ed6f..74873bd04ad1 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1106,8 +1106,6 @@ void __init setup_arch(char **cmdline_p)
 	 */
 	arch_reserve_crashkernel();
 
-	memblock_find_dma_reserve();
-
 	if (!early_xdbc_setup_hardware())
 		early_xdbc_register_console();
 
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 679893ea5e68..615f0bf4bda6 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -990,53 +990,6 @@ void __init free_initrd_mem(unsigned long start, unsigned long end)
 }
 #endif
 
-/*
- * Calculate the precise size of the DMA zone (first 16 MB of RAM),
- * and pass it to the MM layer - to help it set zone watermarks more
- * accurately.
- *
- * Done on 64-bit systems only for the time being, although 32-bit systems
- * might benefit from this as well.
- */
-void __init memblock_find_dma_reserve(void)
-{
-#ifdef CONFIG_X86_64
-	u64 nr_pages = 0, nr_free_pages = 0;
-	unsigned long start_pfn, end_pfn;
-	phys_addr_t start_addr, end_addr;
-	int i;
-	u64 u;
-
-	/*
-	 * Iterate over all memory ranges (free and reserved ones alike),
-	 * to calculate the total number of pages in the first 16 MB of RAM:
-	 */
-	nr_pages = 0;
-	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, NULL) {
-		start_pfn = min(start_pfn, MAX_DMA_PFN);
-		end_pfn   = min(end_pfn,   MAX_DMA_PFN);
-
-		nr_pages += end_pfn - start_pfn;
-	}
-
-	/*
-	 * Iterate over free memory ranges to calculate the number of free
-	 * pages in the DMA zone, while not counting potential partial
-	 * pages at the beginning or the end of the range:
-	 */
-	nr_free_pages = 0;
-	for_each_free_mem_range(u, NUMA_NO_NODE, MEMBLOCK_NONE, &start_addr, &end_addr, NULL) {
-		start_pfn = min_t(unsigned long, PFN_UP(start_addr), MAX_DMA_PFN);
-		end_pfn   = min_t(unsigned long, PFN_DOWN(end_addr), MAX_DMA_PFN);
-
-		if (start_pfn < end_pfn)
-			nr_free_pages += end_pfn - start_pfn;
-	}
-
-	set_dma_reserve(nr_pages - nr_free_pages);
-#endif
-}
-
 void __init zone_sizes_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES];
-- 
2.41.0

