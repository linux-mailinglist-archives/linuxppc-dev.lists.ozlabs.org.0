Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A75357ADF21
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:39:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvWqw4TLhz3gg9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:39:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWh03lLpz3dDW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:32:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgD1HVcz9v8v;
	Mon, 25 Sep 2023 20:31:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2VtD_PyQJK6s; Mon, 25 Sep 2023 20:31:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg11nGvz9v97;
	Mon, 25 Sep 2023 20:31:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 398D18B78D;
	Mon, 25 Sep 2023 20:31:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XH8jzWk3oP77; Mon, 25 Sep 2023 20:31:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5EF5B8B78F;
	Mon, 25 Sep 2023 20:31:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVWDB1499159
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:32 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVW0B1499158;
	Mon, 25 Sep 2023 20:31:32 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 07/37] powerpc: Untangle fixmap.h and pgtable.h and mmu.h
Date: Mon, 25 Sep 2023 20:31:21 +0200
Message-ID: <5eba12392a018be28ad0a02ed844767b132589e7.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666674; l=6788; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=WbExHNjBqZE4k3Bo9AO6aayCzBM9n49FgTIGMLqVjjc=; b=KbInGWVfKSPe1AxCCj6D54i8PUHziWAuTyAP8j8YlgRk4MIm7YCxcX/fip4TaoenIREvZ6hnQ ai7qCOjO6vQBnsSH4pZTqg4IvDx9wyiEi398qgWl+i4XuawMmwWJQ5Y
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

fixmap.h need pgtable.h for [un]map_kernel_page()

pgtable.h need fixmap.h for FIXADDR_TOP.

Untangle the two files by moving FIXADDR_TOP into pgtable.h

Also move VIRT_IMMR_BASE to fixmap.h to avoid fixmap.h in mmu.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Add asm/fixmap.h to platforms/83xx/misc.c
---
 arch/powerpc/include/asm/book3s/32/pgtable.h |  9 ++++++++-
 arch/powerpc/include/asm/book3s/64/pgtable.h |  1 +
 arch/powerpc/include/asm/fixmap.h            | 16 ++++------------
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h |  1 -
 arch/powerpc/include/asm/nohash/32/pgtable.h |  9 ++++++++-
 arch/powerpc/include/asm/nohash/64/pgtable.h |  1 +
 arch/powerpc/mm/init_32.c                    |  1 +
 arch/powerpc/mm/mem.c                        |  1 +
 arch/powerpc/mm/nohash/8xx.c                 |  2 ++
 arch/powerpc/platforms/83xx/misc.c           |  2 ++
 arch/powerpc/platforms/8xx/cpm1.c            |  1 +
 11 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 543c3691839b..45b69ae2631e 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -170,7 +170,14 @@ void unmap_kernel_page(unsigned long va);
  * value (for now) on others, from where we can start layout kernel
  * virtual space that goes below PKMAP and FIXMAP
  */
-#include <asm/fixmap.h>
+
+#define FIXADDR_SIZE	0
+#ifdef CONFIG_KASAN
+#include <asm/kasan.h>
+#define FIXADDR_TOP	(KASAN_SHADOW_START - PAGE_SIZE)
+#else
+#define FIXADDR_TOP	((unsigned long)(-PAGE_SIZE))
+#endif
 
 /*
  * ioremap_bot starts at that address. Early ioremaps move down from there,
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 7c4ad1e03a49..dbd545e73161 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -316,6 +316,7 @@ extern unsigned long pci_io_base;
 #define IOREMAP_START	(ioremap_bot)
 #define IOREMAP_END	(KERN_IO_END - FIXADDR_SIZE)
 #define FIXADDR_SIZE	SZ_32M
+#define FIXADDR_TOP	(IOREMAP_END + FIXADDR_SIZE)
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/fixmap.h
index a832aeafe560..f9068dd8dfce 100644
--- a/arch/powerpc/include/asm/fixmap.h
+++ b/arch/powerpc/include/asm/fixmap.h
@@ -23,18 +23,6 @@
 #include <asm/kmap_size.h>
 #endif
 
-#ifdef CONFIG_PPC64
-#define FIXADDR_TOP	(IOREMAP_END + FIXADDR_SIZE)
-#else
-#define FIXADDR_SIZE	0
-#ifdef CONFIG_KASAN
-#include <asm/kasan.h>
-#define FIXADDR_TOP	(KASAN_SHADOW_START - PAGE_SIZE)
-#else
-#define FIXADDR_TOP	((unsigned long)(-PAGE_SIZE))
-#endif
-#endif
-
 /*
  * Here we define all the compile-time 'special' virtual
  * addresses. The point is to have a constant address at
@@ -119,5 +107,9 @@ static inline void __set_fixmap(enum fixed_addresses idx,
 
 #define __early_set_fixmap	__set_fixmap
 
+#ifdef CONFIG_PPC_8xx
+#define VIRT_IMMR_BASE (__fix_to_virt(FIX_IMMR_BASE))
+#endif
+
 #endif /* !__ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index 0e93a4728c9e..141d82e249a8 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -188,7 +188,6 @@ typedef struct {
 } mm_context_t;
 
 #define PHYS_IMMR_BASE (mfspr(SPRN_IMMR) & 0xfff80000)
-#define VIRT_IMMR_BASE (__fix_to_virt(FIX_IMMR_BASE))
 
 /* Page size definitions, common between 32 and 64-bit
  *
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 868aecbec8d1..c8311ee08811 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -71,7 +71,14 @@ void unmap_kernel_page(unsigned long va);
  * value (for now) on others, from where we can start layout kernel
  * virtual space that goes below PKMAP and FIXMAP
  */
-#include <asm/fixmap.h>
+
+#define FIXADDR_SIZE	0
+#ifdef CONFIG_KASAN
+#include <asm/kasan.h>
+#define FIXADDR_TOP	(KASAN_SHADOW_START - PAGE_SIZE)
+#else
+#define FIXADDR_TOP	((unsigned long)(-PAGE_SIZE))
+#endif
 
 /*
  * ioremap_bot starts at that address. Early ioremaps move down from there,
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 8083c04a1e6d..dee3fc654d40 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -57,6 +57,7 @@
 #define IOREMAP_START	(ioremap_bot)
 #define IOREMAP_END	(KERN_IO_START + KERN_IO_SIZE - FIXADDR_SIZE)
 #define FIXADDR_SIZE	SZ_32M
+#define FIXADDR_TOP	(IOREMAP_END + FIXADDR_SIZE)
 
 /*
  * Defines the address of the vmemap area, in its own region on
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index d8adc452f431..4e71dfe7d026 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -39,6 +39,7 @@
 #include <asm/hugetlb.h>
 #include <asm/kup.h>
 #include <asm/kasan.h>
+#include <asm/fixmap.h>
 
 #include <mm/mmu_decl.h>
 
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 8b121df7b08f..08f3ec9d522b 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -26,6 +26,7 @@
 #include <asm/ftrace.h>
 #include <asm/code-patching.h>
 #include <asm/setup.h>
+#include <asm/fixmap.h>
 
 #include <mm/mmu_decl.h>
 
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index dbbfe897455d..bb9c39b449d1 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -10,6 +10,8 @@
 #include <linux/memblock.h>
 #include <linux/hugetlb.h>
 
+#include <asm/fixmap.h>
+
 #include <mm/mmu_decl.h>
 
 #define IMMR_SIZE (FIX_IMMR_SIZE << PAGE_SHIFT)
diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
index 2fb2a85d131f..1135c1ab923c 100644
--- a/arch/powerpc/platforms/83xx/misc.c
+++ b/arch/powerpc/platforms/83xx/misc.c
@@ -14,6 +14,8 @@
 #include <asm/io.h>
 #include <asm/hw_irq.h>
 #include <asm/ipic.h>
+#include <asm/fixmap.h>
+
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
 
diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index ebb5f6a27dbf..b24d4102fbf6 100644
--- a/arch/powerpc/platforms/8xx/cpm1.c
+++ b/arch/powerpc/platforms/8xx/cpm1.c
@@ -40,6 +40,7 @@
 #include <asm/io.h>
 #include <asm/rheap.h>
 #include <asm/cpm.h>
+#include <asm/fixmap.h>
 
 #include <sysdev/fsl_soc.h>
 
-- 
2.41.0

