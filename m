Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 392CD93258F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 13:26:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HMx+mv1b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNcGY0dgkz30T7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 21:26:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HMx+mv1b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNc3J737fz3dGr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 21:17:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8F7F9CE12EA;
	Tue, 16 Jul 2024 11:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332CBC116B1;
	Tue, 16 Jul 2024 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721128618;
	bh=YeX/zOM98p7oq0+D8eMJgxNsT4zHLIp5lz3y21iev7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HMx+mv1bGMjSPO/WhXFoC7Rb6iwGJqO9+dc/PUQ7veMxE3nuT0c0YLJwrz38TAU5U
	 0Q11IMAbO3FNvgruj4uJVrCJo6jk1vS1LAVFC81AqQ0MuvdcmgStTZWJbieXGzd32z
	 Q1AvmWDPdMBMJcrP6CfzjFyV8++UxYuZCQYAOp+h3jZQ5SWk7yVa1h51Es450b+Bna
	 bZVU+zwGud/LyPykJINM4pTaM5I/ZzInZVcM5NxM3FdZ+R1KpT3irgg+XUabbvLr17
	 V3NQfhWGoJ5Yxgbl2OLtmxSFWA3NTbUkLFBCFfIYdmmncDx1yZMjgx/873JHAnRRkM
	 +SJO1kobq7E8g==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 17/17] mm: make range-to-target_node lookup facility a part of numa_memblks
Date: Tue, 16 Jul 2024 14:13:46 +0300
Message-ID: <20240716111346.3676969-18-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716111346.3676969-1-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

The x86 implementation of range-to-target_node lookup (i.e.
phys_to_target_node() and memory_add_physaddr_to_nid()) relies on
numa_memblks.

Since numa_memblks are now part of the generic code, move these
functions from x86 to mm/numa_memblks.c and select
CONFIG_NUMA_KEEP_MEMINFO when CONFIG_NUMA_MEMBLKS=y for dax and cxl.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/sparsemem.h |  9 --------
 arch/x86/mm/numa.c               | 38 --------------------------------
 drivers/cxl/Kconfig              |  2 +-
 drivers/dax/Kconfig              |  2 +-
 include/linux/numa_memblks.h     |  7 ++++++
 mm/numa.c                        |  1 +
 mm/numa_memblks.c                | 38 ++++++++++++++++++++++++++++++++
 7 files changed, 48 insertions(+), 49 deletions(-)

diff --git a/arch/x86/include/asm/sparsemem.h b/arch/x86/include/asm/sparsemem.h
index 64df897c0ee3..3918c7a434f5 100644
--- a/arch/x86/include/asm/sparsemem.h
+++ b/arch/x86/include/asm/sparsemem.h
@@ -31,13 +31,4 @@
 
 #endif /* CONFIG_SPARSEMEM */
 
-#ifndef __ASSEMBLY__
-#ifdef CONFIG_NUMA_KEEP_MEMINFO
-extern int phys_to_target_node(phys_addr_t start);
-#define phys_to_target_node phys_to_target_node
-extern int memory_add_physaddr_to_nid(u64 start);
-#define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
-#endif
-#endif /* __ASSEMBLY__ */
-
 #endif /* _ASM_X86_SPARSEMEM_H */
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 16bc703c9272..8e790528805e 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -449,41 +449,3 @@ u64 __init numa_emu_dma_end(void)
 	return PFN_PHYS(MAX_DMA32_PFN);
 }
 #endif /* CONFIG_NUMA_EMU */
-
-#ifdef CONFIG_NUMA_KEEP_MEMINFO
-static int meminfo_to_nid(struct numa_meminfo *mi, u64 start)
-{
-	int i;
-
-	for (i = 0; i < mi->nr_blks; i++)
-		if (mi->blk[i].start <= start && mi->blk[i].end > start)
-			return mi->blk[i].nid;
-	return NUMA_NO_NODE;
-}
-
-int phys_to_target_node(phys_addr_t start)
-{
-	int nid = meminfo_to_nid(&numa_meminfo, start);
-
-	/*
-	 * Prefer online nodes, but if reserved memory might be
-	 * hot-added continue the search with reserved ranges.
-	 */
-	if (nid != NUMA_NO_NODE)
-		return nid;
-
-	return meminfo_to_nid(&numa_reserved_meminfo, start);
-}
-EXPORT_SYMBOL_GPL(phys_to_target_node);
-
-int memory_add_physaddr_to_nid(u64 start)
-{
-	int nid = meminfo_to_nid(&numa_meminfo, start);
-
-	if (nid == NUMA_NO_NODE)
-		nid = numa_meminfo.blk[0].nid;
-	return nid;
-}
-EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
-
-#endif
diff --git a/drivers/cxl/Kconfig b/drivers/cxl/Kconfig
index 99b5c25be079..29c192f20082 100644
--- a/drivers/cxl/Kconfig
+++ b/drivers/cxl/Kconfig
@@ -6,7 +6,7 @@ menuconfig CXL_BUS
 	select FW_UPLOAD
 	select PCI_DOE
 	select FIRMWARE_TABLE
-	select NUMA_KEEP_MEMINFO if (NUMA && X86)
+	select NUMA_KEEP_MEMINFO if NUMA_MEMBLKS
 	help
 	  CXL is a bus that is electrically compatible with PCI Express, but
 	  layers three protocols on that signalling (CXL.io, CXL.cache, and
diff --git a/drivers/dax/Kconfig b/drivers/dax/Kconfig
index a88744244149..d656e4c0eb84 100644
--- a/drivers/dax/Kconfig
+++ b/drivers/dax/Kconfig
@@ -30,7 +30,7 @@ config DEV_DAX_PMEM
 config DEV_DAX_HMEM
 	tristate "HMEM DAX: direct access to 'specific purpose' memory"
 	depends on EFI_SOFT_RESERVE
-	select NUMA_KEEP_MEMINFO if (NUMA && X86)
+	select NUMA_KEEP_MEMINFO if NUMA_MEMBLKS
 	default DEV_DAX
 	help
 	  EFI 2.8 platforms, and others, may advertise 'specific purpose'
diff --git a/include/linux/numa_memblks.h b/include/linux/numa_memblks.h
index 5c6e12ad0b7a..17d4bcc34091 100644
--- a/include/linux/numa_memblks.h
+++ b/include/linux/numa_memblks.h
@@ -46,6 +46,13 @@ static inline int numa_emu_cmdline(char *str)
 }
 #endif /* CONFIG_NUMA_EMU */
 
+#ifdef CONFIG_NUMA_KEEP_MEMINFO
+extern int phys_to_target_node(phys_addr_t start);
+#define phys_to_target_node phys_to_target_node
+extern int memory_add_physaddr_to_nid(u64 start);
+#define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
+#endif /* CONFIG_NUMA_KEEP_MEMINFO */
+
 #endif /* CONFIG_NUMA_MEMBLKS */
 
 #endif	/* __NUMA_MEMBLKS_H */
diff --git a/mm/numa.c b/mm/numa.c
index 0483cabc4c4b..64c30cab2208 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -3,6 +3,7 @@
 #include <linux/memblock.h>
 #include <linux/printk.h>
 #include <linux/numa.h>
+#include <linux/numa_memblks.h>
 
 struct pglist_data *node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(node_data);
diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
index 640f3a3ce0ee..46ac3f998b4e 100644
--- a/mm/numa_memblks.c
+++ b/mm/numa_memblks.c
@@ -525,3 +525,41 @@ int __init numa_fill_memblks(u64 start, u64 end)
 	}
 	return 0;
 }
+
+#ifdef CONFIG_NUMA_KEEP_MEMINFO
+static int meminfo_to_nid(struct numa_meminfo *mi, u64 start)
+{
+	int i;
+
+	for (i = 0; i < mi->nr_blks; i++)
+		if (mi->blk[i].start <= start && mi->blk[i].end > start)
+			return mi->blk[i].nid;
+	return NUMA_NO_NODE;
+}
+
+int phys_to_target_node(phys_addr_t start)
+{
+	int nid = meminfo_to_nid(&numa_meminfo, start);
+
+	/*
+	 * Prefer online nodes, but if reserved memory might be
+	 * hot-added continue the search with reserved ranges.
+	 */
+	if (nid != NUMA_NO_NODE)
+		return nid;
+
+	return meminfo_to_nid(&numa_reserved_meminfo, start);
+}
+EXPORT_SYMBOL_GPL(phys_to_target_node);
+
+int memory_add_physaddr_to_nid(u64 start)
+{
+	int nid = meminfo_to_nid(&numa_meminfo, start);
+
+	if (nid == NUMA_NO_NODE)
+		nid = numa_meminfo.blk[0].nid;
+	return nid;
+}
+EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
+
+#endif /* CONFIG_NUMA_KEEP_MEMINFO */
-- 
2.43.0

