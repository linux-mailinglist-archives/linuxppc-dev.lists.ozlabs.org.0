Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ED987EAD0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 15:23:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ApJCOne1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PJutLESd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tyxsc6mNYz3vZF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 01:23:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ApJCOne1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PJutLESd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyxrC4NGgz3d24
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:22:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710771719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJOj3+4C3poxnpNPxWTMxrcMSQ1iTdDLFjOZc5Aa/AQ=;
	b=ApJCOne1gXJVWgy9OYsAnEKqsm0Qg8tTkNFqNzi5MesMkWQONSNUjd00rzglsm6fSugY6M
	rnwyXd1+O56a81i2Ti0fgOZKtuHsU0ETmO1+JdJ1YgYaQG/15VkFZgqGr9AJRgNvC5h2fI
	3klN6BOteKa6LbUPMemA5qKc+BDjoVw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710771720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJOj3+4C3poxnpNPxWTMxrcMSQ1iTdDLFjOZc5Aa/AQ=;
	b=PJutLESdPPrylgMhIgzDWqjFJ+n9IVnuYsg+FxKq4KcACuwv7vOTuf53ZuPMVYdLyyc7wB
	M8c7aFqCnTbLfClsnQOQMb5rO0sWbGs0/t6i/yCdSVysoBJf0Fbdviqcu7+CQDsGaIDkoT
	6TXxMJEYNxjxUn1WbcqZ+2S0x4v9wGs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-534-jIm9PpjXNxK1eCnTJrVipA-1; Mon,
 18 Mar 2024 10:21:53 -0400
X-MC-Unique: jIm9PpjXNxK1eCnTJrVipA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B2A8380009C;
	Mon, 18 Mar 2024 14:21:52 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F74A492BD1;
	Mon, 18 Mar 2024 14:21:49 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Subject: [PATCH 1/6] mm/mm_init.c: remove the useless dma_reserve
Date: Mon, 18 Mar 2024 22:21:33 +0800
Message-ID: <20240318142138.783350-2-bhe@redhat.com>
In-Reply-To: <20240318142138.783350-1-bhe@redhat.com>
References: <20240318142138.783350-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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

Hence, remove dma_reserve and its handling in free_area_init_core()
because it's useless and causes confusion.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/x86/mm/init.c |  2 --
 include/linux/mm.h |  1 -
 mm/mm_init.c       | 23 -----------------------
 3 files changed, 26 deletions(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 679893ea5e68..5209549e8192 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -1032,8 +1032,6 @@ void __init memblock_find_dma_reserve(void)
 		if (start_pfn < end_pfn)
 			nr_free_pages += end_pfn - start_pfn;
 	}
-
-	set_dma_reserve(nr_pages - nr_free_pages);
 #endif
 }
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2c0910bc3e4a..1888b1935103 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3210,7 +3210,6 @@ static inline int early_pfn_to_nid(unsigned long pfn)
 extern int __meminit early_pfn_to_nid(unsigned long pfn);
 #endif
 
-extern void set_dma_reserve(unsigned long new_dma_reserve);
 extern void mem_init(void);
 extern void __init mmap_init(void);
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 549e76af8f82..153fb2dc666f 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -226,7 +226,6 @@ static unsigned long required_movablecore_percent __initdata;
 
 static unsigned long nr_kernel_pages __initdata;
 static unsigned long nr_all_pages __initdata;
-static unsigned long dma_reserve __initdata;
 
 static bool deferred_struct_pages __meminitdata;
 
@@ -1583,12 +1582,6 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
 					zone_names[j], memmap_pages, freesize);
 		}
 
-		/* Account for reserved pages */
-		if (j == 0 && freesize > dma_reserve) {
-			freesize -= dma_reserve;
-			pr_debug("  %s zone: %lu pages reserved\n", zone_names[0], dma_reserve);
-		}
-
 		if (!is_highmem_idx(j))
 			nr_kernel_pages += freesize;
 		/* Charge for highmem memmap if there are enough kernel pages */
@@ -2547,22 +2540,6 @@ void *__init alloc_large_system_hash(const char *tablename,
 	return table;
 }
 
-/**
- * set_dma_reserve - set the specified number of pages reserved in the first zone
- * @new_dma_reserve: The number of pages to mark reserved
- *
- * The per-cpu batchsize and zone watermarks are determined by managed_pages.
- * In the DMA zone, a significant percentage may be consumed by kernel image
- * and other unfreeable allocations which can skew the watermarks badly. This
- * function may optionally be used to account for unfreeable pages in the
- * first zone (e.g., ZONE_DMA). The effect will be lower watermarks and
- * smaller per-cpu batchsize.
- */
-void __init set_dma_reserve(unsigned long new_dma_reserve)
-{
-	dma_reserve = new_dma_reserve;
-}
-
 void __init memblock_free_pages(struct page *page, unsigned long pfn,
 							unsigned int order)
 {
-- 
2.41.0

