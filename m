Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B459628F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 16:38:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CYLk3kbZzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 00:38:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="fQPxsiK9"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CXfy41vxzDr45
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 00:07:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CXft5h7vz9v0Gd;
 Tue, 20 Aug 2019 16:07:18 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=fQPxsiK9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EAyCmI3xJLmI; Tue, 20 Aug 2019 16:07:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CXft4KkSz9v0GZ;
 Tue, 20 Aug 2019 16:07:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566310038; bh=wx48njDXhmU8rR/wJp0BbiY+hBbYgTcSRrBvI9yQFTw=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=fQPxsiK9rJrZXwnydlltdhqiwwrpXOAVbnDHyBsTiawfdAC2Tlx4PneDHYS1lOr35
 ypbp0koZaxWiNy0Oryx8MO+/iI/eE9Ba0JyJ77AQpg/mys2irUadnL2bDMDjo0+cRb
 7pxElVlnYNKFmUW7Wvjep8KNTln0OrR4SROxA5rY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 008D28B7D0;
 Tue, 20 Aug 2019 16:07:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XABRplMn5tcI; Tue, 20 Aug 2019 16:07:18 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A83D38B7C9;
 Tue, 20 Aug 2019 16:07:18 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 83F046B734; Tue, 20 Aug 2019 14:07:18 +0000 (UTC)
Message-Id: <4b1dca7096b01823b101be7338983578641547f1.1566309263.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566309262.git.christophe.leroy@c-s.fr>
References: <cover.1566309262.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 10/12] powerpc/mm: refactor ioremap_range() and use
 ioremap_page_range()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, hch@lst.de
Date: Tue, 20 Aug 2019 14:07:18 +0000 (UTC)
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

book3s64's ioremap_range() is almost same as fallback ioremap_range(),
except that it calls radix__ioremap_range() when radix is enabled.

radix__ioremap_range() is also very similar to the other ones, expect
that it calls ioremap_page_range when slab is available.

PPC32 __ioremap_caller() have a loop doing the same thing as
ioremap_range() so use it on PPC32 as well.

Lets keep only one version of ioremap_range() which calls
ioremap_page_range() on all platforms when slab is available.

At the same time, drop the nid parameter which is not used.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  3 ---
 arch/powerpc/include/asm/io.h              |  2 ++
 arch/powerpc/mm/book3s64/pgtable.c         | 21 ---------------------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 20 --------------------
 arch/powerpc/mm/ioremap.c                  | 24 ++++++++++++++++++++++++
 arch/powerpc/mm/ioremap_32.c               |  6 ++----
 arch/powerpc/mm/ioremap_64.c               | 21 +--------------------
 7 files changed, 29 insertions(+), 68 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index e04a839cb5b9..574eca33f893 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -266,9 +266,6 @@ extern void radix__vmemmap_remove_mapping(unsigned long start,
 extern int radix__map_kernel_page(unsigned long ea, unsigned long pa,
 				 pgprot_t flags, unsigned int psz);
 
-extern int radix__ioremap_range(unsigned long ea, phys_addr_t pa,
-				unsigned long size, pgprot_t prot, int nid);
-
 static inline unsigned long radix__get_tree_size(void)
 {
 	unsigned long rts_field;
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 8e65ba59f06a..8e00d95f9600 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -722,6 +722,8 @@ void __iomem *ioremap_coherent(phys_addr_t address, unsigned long size);
 
 extern void iounmap(volatile void __iomem *addr);
 
+int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot);
+
 extern void __iomem *__ioremap_caller(phys_addr_t, unsigned long size,
 				      pgprot_t prot, void *caller);
 
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 7d0e0d0d22c4..4c8bed856533 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -446,24 +446,3 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
 
 	return true;
 }
-
-int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
-{
-	unsigned long i;
-
-	if (radix_enabled())
-		return radix__ioremap_range(ea, pa, size, prot, nid);
-
-	for (i = 0; i < size; i += PAGE_SIZE) {
-		int err = map_kernel_page(ea + i, pa + i, prot);
-		if (err) {
-			if (slab_is_available())
-				unmap_kernel_range(ea, size);
-			else
-				WARN_ON_ONCE(1); /* Should clean up */
-			return err;
-		}
-	}
-
-	return 0;
-}
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index b4ca9e95e678..01d47a763a8d 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1218,26 +1218,6 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 	return 1;
 }
 
-int radix__ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size,
-			pgprot_t prot, int nid)
-{
-	if (likely(slab_is_available())) {
-		int err = ioremap_page_range(ea, ea + size, pa, prot);
-		if (err)
-			unmap_kernel_range(ea, size);
-		return err;
-	} else {
-		unsigned long i;
-
-		for (i = 0; i < size; i += PAGE_SIZE) {
-			int err = map_kernel_page(ea + i, pa + i, prot);
-			if (WARN_ON_ONCE(err)) /* Should clean up */
-				return err;
-		}
-		return 0;
-	}
-}
-
 int __init arch_ioremap_p4d_supported(void)
 {
 	return 0;
diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index eaf5f8a4a63f..50ee6544d0b7 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
 #include <asm/io-workarounds.h>
 
 unsigned long ioremap_bot;
@@ -56,3 +58,25 @@ void __iomem *ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long f
 	return __ioremap_caller(addr, size, pte_pgprot(pte), caller);
 }
 EXPORT_SYMBOL(ioremap_prot);
+
+int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot)
+{
+	unsigned long i;
+
+	if (slab_is_available()) {
+		int err = ioremap_page_range(ea, ea + size, pa, prot);
+
+		if (err)
+			unmap_kernel_range(ea, size);
+		return err;
+	}
+
+	for (i = 0; i < size; i += PAGE_SIZE) {
+		int err = map_kernel_page(ea + i, pa + i, prot);
+
+		if (WARN_ON_ONCE(err))  /* Should clean up */
+			return err;
+	}
+
+	return 0;
+}
diff --git a/arch/powerpc/mm/ioremap_32.c b/arch/powerpc/mm/ioremap_32.c
index fb43ba71aa54..85b90a62e084 100644
--- a/arch/powerpc/mm/ioremap_32.c
+++ b/arch/powerpc/mm/ioremap_32.c
@@ -17,7 +17,7 @@ EXPORT_SYMBOL(ioremap_wt);
 void __iomem *
 __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *caller)
 {
-	unsigned long v, i;
+	unsigned long v;
 	phys_addr_t p;
 	int err;
 
@@ -76,9 +76,7 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 	 * Should check if it is a candidate for a BAT mapping
 	 */
 
-	err = 0;
-	for (i = 0; i < size && err == 0; i += PAGE_SIZE)
-		err = map_kernel_page(v + i, p + i, prot);
+	err = ioremap_range((unsigned long)v, p, size, prot);
 	if (err) {
 		if (slab_is_available())
 			vunmap((void *)v);
diff --git a/arch/powerpc/mm/ioremap_64.c b/arch/powerpc/mm/ioremap_64.c
index 57f3b096143c..d132ce1e538d 100644
--- a/arch/powerpc/mm/ioremap_64.c
+++ b/arch/powerpc/mm/ioremap_64.c
@@ -4,25 +4,6 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
-int __weak ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size,
-			 pgprot_t prot, int nid)
-{
-	unsigned long i;
-
-	for (i = 0; i < size; i += PAGE_SIZE) {
-		int err = map_kernel_page(ea + i, pa + i, prot);
-		if (err) {
-			if (slab_is_available())
-				unmap_kernel_range(ea, size);
-			else
-				WARN_ON_ONCE(1); /* Should clean up */
-			return err;
-		}
-	}
-
-	return 0;
-}
-
 /**
  * Low level function to establish the page tables for an IO mapping
  */
@@ -41,7 +22,7 @@ void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_
 	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
 	WARN_ON(size & ~PAGE_MASK);
 
-	if (ioremap_range((unsigned long)ea, pa, size, prot, NUMA_NO_NODE))
+	if (ioremap_range((unsigned long)ea, pa, size, prot))
 		return NULL;
 
 	return (void __iomem *)ea;
-- 
2.13.3

