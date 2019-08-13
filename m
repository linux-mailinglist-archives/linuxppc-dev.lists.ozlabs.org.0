Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 987048C21D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 22:32:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467PXV1kDKzDqcj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 06:32:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="h/6N/lhQ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467P4m5vNczDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 06:11:52 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467P4X3mgdz9v0CR;
 Tue, 13 Aug 2019 22:11:40 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=h/6N/lhQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5yXt0iKoOEDC; Tue, 13 Aug 2019 22:11:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467P4X2k12z9v0CM;
 Tue, 13 Aug 2019 22:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565727100; bh=Eg4BsJwWuE7MGcENwQ0vEsGXtgfhJfI2/qPOmnsDzK4=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=h/6N/lhQxv48XI2nh6UjQiGJTzmYGTj7cRV0QwksvV68npEEc53p2bQeBYmaVF9Jm
 hhctDC75h7LIezTyYV1dYgzUYHVoPz+FZIux1frHkILebvF63BYTsMRvTWYgm/qnrt
 2tkVoO8636DyWiqTeKq0UVeaoX6m5zGN0b/SAie4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 86E238B7F2;
 Tue, 13 Aug 2019 22:11:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BK8ZE-PwoEb6; Tue, 13 Aug 2019 22:11:40 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3DB158B7F0;
 Tue, 13 Aug 2019 22:11:40 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2089B69632; Tue, 13 Aug 2019 20:11:40 +0000 (UTC)
Message-Id: <005a2b9321c10e23ca399e6ff4b19960009561f5.1565726867.git.christophe.leroy@c-s.fr>
In-Reply-To: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
References: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 07/10] powerpc/mm: move iounmap() into ioremap.c and drop
 __iounmap()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 13 Aug 2019 20:11:40 +0000 (UTC)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On PPC64 iounmap() does nothing else than calling __iounmap()
and is the only user of __iounmap().
__iounmap() is almost similar to PPC32 iounmap().

Lets define a common iounmap() and drop __iounmap().

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h |  2 ++
 arch/powerpc/include/asm/io.h                |  5 -----
 arch/powerpc/include/asm/nohash/32/pgtable.h |  2 ++
 arch/powerpc/mm/ioremap.c                    | 31 ++++++++++++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c                 | 14 -------------
 arch/powerpc/mm/pgtable_64.c                 | 28 -------------------------
 6 files changed, 35 insertions(+), 47 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index aa1bc5f8da90..af34554d19e8 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -165,6 +165,8 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
 #define IOREMAP_TOP	KVIRT_TOP
 #endif
 
+#define IOREMAP_BASE	VMALLOC_START
+
 /*
  * Just any arbitrary offset to the start of the vmalloc VM area: the
  * current 16MB value just means that there will be a 64MB "hole" after the
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 23e5d5d16c7e..02d6256fe1ea 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -712,9 +712,6 @@ static inline void iosync(void)
  * * __ioremap_caller is the same as above but takes an explicit caller
  *   reference rather than using __builtin_return_address(0)
  *
- * * __iounmap, is the low level implementation used by iounmap and cannot
- *   be hooked (but can be used by a hook on iounmap)
- *
  */
 extern void __iomem *ioremap(phys_addr_t address, unsigned long size);
 extern void __iomem *ioremap_prot(phys_addr_t address, unsigned long size,
@@ -734,8 +731,6 @@ extern void __iomem *__ioremap(phys_addr_t, unsigned long size,
 extern void __iomem *__ioremap_caller(phys_addr_t, unsigned long size,
 				      pgprot_t prot, void *caller);
 
-extern void __iounmap(volatile void __iomem *addr);
-
 extern void __iomem * __ioremap_at(phys_addr_t pa, void *ea,
 				   unsigned long size, pgprot_t prot);
 extern void __iounmap_at(void *ea, unsigned long size);
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 7ce2a7c9fade..09f2739ab556 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -93,6 +93,8 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
 #define IOREMAP_TOP	KVIRT_TOP
 #endif
 
+#define IOREMAP_BASE	VMALLOC_START
+
 /*
  * Just any arbitrary offset to the start of the vmalloc VM area: the
  * current 16MB value just means that there will be a 64MB "hole" after the
diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 0c23660522ca..57d742509cec 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -1,7 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
 #include <asm/io-workarounds.h>
+#include <mm/mmu_decl.h>
 
 unsigned long ioremap_bot;
 EXPORT_SYMBOL(ioremap_bot);
@@ -72,3 +75,31 @@ void __iomem *ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long f
 	return __ioremap_caller(addr, size, pte_pgprot(pte), caller);
 }
 EXPORT_SYMBOL(ioremap_prot);
+
+/*
+ * Unmap an IO region and remove it from vmalloc'd list.
+ * Access to IO memory should be serialized by driver.
+ */
+void iounmap(volatile void __iomem *token)
+{
+	void *addr;
+
+	/*
+	 * If mapped by BATs then there is nothing to do.
+	 */
+	if (v_block_mapped((unsigned long)token))
+		return;
+
+	if (!slab_is_available())
+		return;
+
+	addr = (void *)((unsigned long __force)PCI_FIX_ADDR(token) & PAGE_MASK);
+	if (WARN_ON((unsigned long)addr < IOREMAP_BASE))
+		return;
+	if ((unsigned long)addr >= ioremap_bot) {
+		pr_warn("Attempt to %s early bolted mapping at 0x%p\n", __func__, addr);
+		return;
+	}
+	vunmap(addr);
+}
+EXPORT_SYMBOL(iounmap);
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 7efdb1dee19b..4597f45e4dc6 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -110,20 +110,6 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 	return (void __iomem *) (v + ((unsigned long)addr & ~PAGE_MASK));
 }
 
-void iounmap(volatile void __iomem *addr)
-{
-	/*
-	 * If mapped by BATs then there is nothing to do.
-	 * Calling vfree() generates a benign warning.
-	 */
-	if (v_block_mapped((unsigned long)addr))
-		return;
-
-	if (addr > high_memory && (unsigned long) addr < ioremap_bot)
-		vunmap((void *) (PAGE_MASK & (unsigned long)addr));
-}
-EXPORT_SYMBOL(iounmap);
-
 static void __init *early_alloc_pgtable(unsigned long size)
 {
 	void *ptr = memblock_alloc(size, size);
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index d631659c8859..b50a53a0a42b 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -201,35 +201,7 @@ void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
 	return ret;
 }
 
-/*  
- * Unmap an IO region and remove it from imalloc'd list.
- * Access to IO memory should be serialized by driver.
- */
-void __iounmap(volatile void __iomem *token)
-{
-	void *addr;
-
-	if (!slab_is_available())
-		return;
-	
-	addr = (void *) ((unsigned long __force)
-			 PCI_FIX_ADDR(token) & PAGE_MASK);
-	if ((unsigned long)addr >= ioremap_bot) {
-		printk(KERN_WARNING "Attempt to iounmap early bolted mapping"
-		       " at 0x%p\n", addr);
-		return;
-	}
-	vunmap(addr);
-}
-
-void iounmap(volatile void __iomem *token)
-{
-	__iounmap(token);
-}
-
 EXPORT_SYMBOL(__ioremap_at);
-EXPORT_SYMBOL(iounmap);
-EXPORT_SYMBOL(__iounmap);
 EXPORT_SYMBOL(__iounmap_at);
 
 #ifndef __PAGETABLE_PUD_FOLDED
-- 
2.13.3

