Return-Path: <linuxppc-dev+bounces-6771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C9EA55573
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 19:52:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7z745GMZz3c8n;
	Fri,  7 Mar 2025 05:52:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741287136;
	cv=none; b=hD+JqcDKC1JgAKPFDwCQG4zZYHwsobz7/cRPe87uK/8kqWC5Z51mf6yOK/gJ/RPBf9rAuSuUvWPg+WkyQ5YOpRpKHMSY4B2JDs8nMoGSJQVMnsFboK5elInNm/gJm5mrzUmm8gwlXVHDOF+i0RtTa101wSG3dBqY62JPcZwn82kASP+XvyKf9RYJOhpfdrofVzAPSMCicBwBfwonE2CerJhOIYxA7MMmnFyvJD5hzm17y5C91J8/rIaM/KOjcuXq42ZbesfjScp7BvDf+JO5MINcraIwV7/PW6SBH7kpvBNqWQ2MxeBCoB0ByclQjfxa5/azuSDwrxi5feAr4gxpeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741287136; c=relaxed/relaxed;
	bh=+ade8eAKcDIFtXQJgshQWuspJvzYLQoG9wyU5NjeFQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KP8tmOEj1qLlYWHzMW+ABu6Ery71QxhmaIZcsLFH9kZ1e3+9UaOrNgkThbHOzaJu4cCHQM/DtCNr51yXhHnVsWUPLNsJi6p2+o/468SB3mzH1xyp+OwJ+Qy+H1OfbhBI/TmriL382U/5DwbCGapDOApQL2A3/RDb9ssHsFkw/sgaVB5+YCgiPwhVZdVmZy+tKJIopaCbwHa0WhCyZ+GyG05iVGK1mgJbQ3ewHFSW96SDuRQI12vsIiwqTorp+fzoPl7EG/YkFoJzwey7WcqPcMoFmCRx6vmCv5PENCojV2hyYQmeehBqhUqJ1+RizrvUKhPJa0ETcSYayaisUZscrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jV0L4MxA; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jV0L4MxA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7z731Q32z3c8b
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 05:52:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECBF95C58B7;
	Thu,  6 Mar 2025 18:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5485C4CEEC;
	Thu,  6 Mar 2025 18:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741287131;
	bh=8AVATLG9lzmcQcx5E69jKjTsUN+LZvQn92lo4/jx/sQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jV0L4MxA7ZLOPXJ7CzvIBhifnvQ3cLfWLbGX9Kpq+TJV+I4pYEortTLjsgEQ+JgOz
	 MJeD/6kqeK3kbbbLebIrILdKUS+MINmZ+/B/sNOxLIGg7XbVwZV42EgAZnZAp6YA9n
	 29WDsIsPmNqboWrzBZPQWiBq4xZoUqUHc5X/w6ZGtfzGGa8bFcwxmZypQhUi8SVeUt
	 4+S4ZR8z1jIcZBlvxst+95F7MqZZIvNp+reY2KbX5iWIXdOVrbfew191sYutRBEayR
	 2jUlJelZWwvqGeLBlQ86aq/GxBuU3JetL31MovldgywY/67riRZKdTJu068ZWyNYvD
	 NqjbY0mINjozA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH 02/13] csky: move setup_initrd() to setup.c
Date: Thu,  6 Mar 2025 20:51:12 +0200
Message-ID: <20250306185124.3147510-3-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250306185124.3147510-1-rppt@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Memory used by initrd should be reserved as soon as possible before
there any memblock allocations that might overwrite that memory.

This will also help with pulling out memblock_free_all() to the generic
code and reducing code duplication in arch::mem_init().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/csky/kernel/setup.c | 43 ++++++++++++++++++++++++++++++++++++++++
 arch/csky/mm/init.c      | 43 ----------------------------------------
 2 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
index fe715b707fd0..e0d6ca86ea8c 100644
--- a/arch/csky/kernel/setup.c
+++ b/arch/csky/kernel/setup.c
@@ -12,6 +12,45 @@
 #include <asm/mmu_context.h>
 #include <asm/pgalloc.h>
 
+#ifdef CONFIG_BLK_DEV_INITRD
+static void __init setup_initrd(void)
+{
+	unsigned long size;
+
+	if (initrd_start >= initrd_end) {
+		pr_err("initrd not found or empty");
+		goto disable;
+	}
+
+	if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
+		pr_err("initrd extends beyond end of memory");
+		goto disable;
+	}
+
+	size = initrd_end - initrd_start;
+
+	if (memblock_is_region_reserved(__pa(initrd_start), size)) {
+		pr_err("INITRD: 0x%08lx+0x%08lx overlaps in-use memory region",
+		       __pa(initrd_start), size);
+		goto disable;
+	}
+
+	memblock_reserve(__pa(initrd_start), size);
+
+	pr_info("Initial ramdisk at: 0x%p (%lu bytes)\n",
+		(void *)(initrd_start), size);
+
+	initrd_below_start_ok = 1;
+
+	return;
+
+disable:
+	initrd_start = initrd_end = 0;
+
+	pr_err(" - disabling initrd\n");
+}
+#endif
+
 static void __init csky_memblock_init(void)
 {
 	unsigned long lowmem_size = PFN_DOWN(LOWMEM_LIMIT - PHYS_OFFSET_OFFSET);
@@ -40,6 +79,10 @@ static void __init csky_memblock_init(void)
 		max_low_pfn = min_low_pfn + sseg_size;
 	}
 
+#ifdef CONFIG_BLK_DEV_INITRD
+	setup_initrd();
+#endif
+
 	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
 
 	mmu_init(min_low_pfn, max_low_pfn);
diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
index bde7cabd23df..ab51acbc19b2 100644
--- a/arch/csky/mm/init.c
+++ b/arch/csky/mm/init.c
@@ -42,45 +42,6 @@ unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
 						__page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
 
-#ifdef CONFIG_BLK_DEV_INITRD
-static void __init setup_initrd(void)
-{
-	unsigned long size;
-
-	if (initrd_start >= initrd_end) {
-		pr_err("initrd not found or empty");
-		goto disable;
-	}
-
-	if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
-		pr_err("initrd extends beyond end of memory");
-		goto disable;
-	}
-
-	size = initrd_end - initrd_start;
-
-	if (memblock_is_region_reserved(__pa(initrd_start), size)) {
-		pr_err("INITRD: 0x%08lx+0x%08lx overlaps in-use memory region",
-		       __pa(initrd_start), size);
-		goto disable;
-	}
-
-	memblock_reserve(__pa(initrd_start), size);
-
-	pr_info("Initial ramdisk at: 0x%p (%lu bytes)\n",
-		(void *)(initrd_start), size);
-
-	initrd_below_start_ok = 1;
-
-	return;
-
-disable:
-	initrd_start = initrd_end = 0;
-
-	pr_err(" - disabling initrd\n");
-}
-#endif
-
 void __init mem_init(void)
 {
 #ifdef CONFIG_HIGHMEM
@@ -92,10 +53,6 @@ void __init mem_init(void)
 #endif
 	high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT);
 
-#ifdef CONFIG_BLK_DEV_INITRD
-	setup_initrd();
-#endif
-
 	memblock_free_all();
 
 #ifdef CONFIG_HIGHMEM
-- 
2.47.2


