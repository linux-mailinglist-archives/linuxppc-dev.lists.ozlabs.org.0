Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 353EF87EAD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 15:24:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R1eHqNDG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R1eHqNDG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TyxtP6ysPz3vcG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 01:23:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R1eHqNDG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R1eHqNDG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyxrD2bwcz3d3Z
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:22:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710771721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwNlozyVa9wCKfV2gAvZZNhZ5jeQ/QZALXvKTp7xRLg=;
	b=R1eHqNDGN4X5NJ9ItxBId6Pteo9N+sqd7rlnmDgqOtMVlmycWkDhN4vTBCPy5EzoeMppgp
	7UWqzZQLqLkubtWSF/xzWC0Y8jOM6HOTot4z3M0BBiUX6X+O3UkfsFufQoZBPbFX9q3yto
	uRDV3wvPSRWnXgezvmCnhnfz3dUZ0Ug=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710771721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwNlozyVa9wCKfV2gAvZZNhZ5jeQ/QZALXvKTp7xRLg=;
	b=R1eHqNDGN4X5NJ9ItxBId6Pteo9N+sqd7rlnmDgqOtMVlmycWkDhN4vTBCPy5EzoeMppgp
	7UWqzZQLqLkubtWSF/xzWC0Y8jOM6HOTot4z3M0BBiUX6X+O3UkfsFufQoZBPbFX9q3yto
	uRDV3wvPSRWnXgezvmCnhnfz3dUZ0Ug=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-PMNkGQMOMYiyTf9cUHnhqQ-1; Mon, 18 Mar 2024 10:21:57 -0400
X-MC-Unique: PMNkGQMOMYiyTf9cUHnhqQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEEC185A58C;
	Mon, 18 Mar 2024 14:21:56 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 329C1492BC4;
	Mon, 18 Mar 2024 14:21:52 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Subject: [PATCH 2/6] x86: remove memblock_find_dma_reserve()
Date: Mon, 18 Mar 2024 22:21:34 +0800
Message-ID: <20240318142138.783350-3-bhe@redhat.com>
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

This is not needed any more.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/x86/include/asm/pgtable.h |  1 -
 arch/x86/kernel/setup.c        |  2 --
 arch/x86/mm/init.c             | 45 ----------------------------------
 3 files changed, 48 deletions(-)

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
index 3e1e96efadfe..5aa00938051f 100644
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
index 5209549e8192..615f0bf4bda6 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -990,51 +990,6 @@ void __init free_initrd_mem(unsigned long start, unsigned long end)
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
-#endif
-}
-
 void __init zone_sizes_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES];
-- 
2.41.0

