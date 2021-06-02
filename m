Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C040C398758
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 12:55:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw5Y210HXz3c5p
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 20:55:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aenRwMba;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aenRwMba; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw5WK6tp4z303g
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 20:54:21 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E38A613B8;
 Wed,  2 Jun 2021 10:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622631259;
 bh=wiXTn//eiKgcS7LspEevBm9W4ghqhPpXnabDtNpHAWc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aenRwMba72rCI0f0+YNCvpuF+B89DZZZcNy9A9qwZOX6ztizS+NE4FPYA+R2Z5DXy
 QYv8+KSCh6yjWLYdBikUAv7ieP4WMTl94vBwxzbYcnCTRTAGBIyKSVSP2gQG/05lMD
 +DwqtVWXRXNkgKAw56m8CW6AJoabI3YW+EfCfTd9lrYhPayUhA0fOCDd0Yyijv33ox
 /sBbmXZ8VZZpnfRgcKD9Jbkqxyp1ZCAEGc0kCUIWKXx5LhlqP653x+i94BLo0J2/Kb
 PvtG19vRg2yFN7Z8DuxiaI0hWRcGrZDHaooM5xN0EpA7pMJUV4VvTcv6PXqzg7KKfh
 G7quvwCN3TybQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/9] arc: remove support for DISCONTIGMEM
Date: Wed,  2 Jun 2021 13:53:42 +0300
Message-Id: <20210602105348.13387-4-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210602105348.13387-1-rppt@kernel.org>
References: <20210602105348.13387-1-rppt@kernel.org>
MIME-Version: 1.0
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

DISCONTIGMEM was replaced by FLATMEM with freeing of the unused memory map
in v5.11.

Remove the support for DISCONTIGMEM entirely.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arc/Kconfig              | 13 ------------
 arch/arc/include/asm/mmzone.h | 40 -----------------------------------
 arch/arc/mm/init.c            |  8 -------
 3 files changed, 61 deletions(-)
 delete mode 100644 arch/arc/include/asm/mmzone.h

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 2d98501c0897..d8f51eb8963b 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -62,10 +62,6 @@ config SCHED_OMIT_FRAME_POINTER
 config GENERIC_CSUM
 	def_bool y
 
-config ARCH_DISCONTIGMEM_ENABLE
-	def_bool n
-	depends on BROKEN
-
 config ARCH_FLATMEM_ENABLE
 	def_bool y
 
@@ -344,15 +340,6 @@ config ARC_HUGEPAGE_16M
 
 endchoice
 
-config NODES_SHIFT
-	int "Maximum NUMA Nodes (as a power of 2)"
-	default "0" if !DISCONTIGMEM
-	default "1" if DISCONTIGMEM
-	depends on NEED_MULTIPLE_NODES
-	help
-	  Accessing memory beyond 1GB (with or w/o PAE) requires 2 memory
-	  zones.
-
 config ARC_COMPACT_IRQ_LEVELS
 	depends on ISA_ARCOMPACT
 	bool "Setup Timer IRQ as high Priority"
diff --git a/arch/arc/include/asm/mmzone.h b/arch/arc/include/asm/mmzone.h
deleted file mode 100644
index b86b9d1e54dc..000000000000
--- a/arch/arc/include/asm/mmzone.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
- */
-
-#ifndef _ASM_ARC_MMZONE_H
-#define _ASM_ARC_MMZONE_H
-
-#ifdef CONFIG_DISCONTIGMEM
-
-extern struct pglist_data node_data[];
-#define NODE_DATA(nid) (&node_data[nid])
-
-static inline int pfn_to_nid(unsigned long pfn)
-{
-	int is_end_low = 1;
-
-	if (IS_ENABLED(CONFIG_ARC_HAS_PAE40))
-		is_end_low = pfn <= virt_to_pfn(0xFFFFFFFFUL);
-
-	/*
-	 * node 0: lowmem:             0x8000_0000   to 0xFFFF_FFFF
-	 * node 1: HIGHMEM w/o  PAE40: 0x0           to 0x7FFF_FFFF
-	 *         HIGHMEM with PAE40: 0x1_0000_0000 to ...
-	 */
-	if (pfn >= ARCH_PFN_OFFSET && is_end_low)
-		return 0;
-
-	return 1;
-}
-
-static inline int pfn_valid(unsigned long pfn)
-{
-	int nid = pfn_to_nid(pfn);
-
-	return (pfn <= node_end_pfn(nid));
-}
-#endif /* CONFIG_DISCONTIGMEM  */
-
-#endif
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 397a201adfe3..abfeef7bf6f8 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -32,11 +32,6 @@ unsigned long arch_pfn_offset;
 EXPORT_SYMBOL(arch_pfn_offset);
 #endif
 
-#ifdef CONFIG_DISCONTIGMEM
-struct pglist_data node_data[MAX_NUMNODES] __read_mostly;
-EXPORT_SYMBOL(node_data);
-#endif
-
 long __init arc_get_mem_sz(void)
 {
 	return low_mem_sz;
@@ -147,9 +142,6 @@ void __init setup_arch_memory(void)
 	 * to the hole is freed and ARC specific version of pfn_valid()
 	 * handles the hole in the memory map.
 	 */
-#ifdef CONFIG_DISCONTIGMEM
-	node_set_online(1);
-#endif
 
 	min_high_pfn = PFN_DOWN(high_mem_start);
 	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
-- 
2.28.0

