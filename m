Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32262962BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 16:44:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CYVC3zjGzDqTx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 00:44:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ikOqgZaj"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CXg01NgJzDr3j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 00:07:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CXfw5XNcz9v0Gc;
 Tue, 20 Aug 2019 16:07:20 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ikOqgZaj; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ewWAh4cjCbxz; Tue, 20 Aug 2019 16:07:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CXfw4VNkz9v0GZ;
 Tue, 20 Aug 2019 16:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566310040; bh=fEKTnQR511zC4BbLO9lGh5SrlsGqL0fcduzithuH3Gc=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=ikOqgZajqm3fHvX9Ydjl6rZk8lx1jkcIzngS8/RJiq/yS70HenQxfKBX9HdDQjBLt
 ndQ20ne1oQl5/Z9wK+M1RiCmm9BUKF6XJQ6sC26B/16WjsqaxDtO3pmrHcBu7cdywx
 mHGDCrbcJXKwrh29rgq8LsrUQWQCQEYgVmFcmaJI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 060618B7D0;
 Tue, 20 Aug 2019 16:07:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QFb82Afi1vuj; Tue, 20 Aug 2019 16:07:20 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B6D258B7C9;
 Tue, 20 Aug 2019 16:07:20 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 923616B734; Tue, 20 Aug 2019 14:07:20 +0000 (UTC)
Message-Id: <3acd2dbe04b04f111475e7a59f2b6f2ab9b95ab6.1566309263.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566309262.git.christophe.leroy@c-s.fr>
References: <cover.1566309262.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 12/12] powerpc/mm: split out early ioremap path.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, hch@lst.de
Date: Tue, 20 Aug 2019 14:07:20 +0000 (UTC)
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

ioremap does things differently depending on whether
SLAB is available or not at different levels.

Try to separate the early path from the beginning.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/io.h |  3 ++-
 arch/powerpc/mm/ioremap.c     | 17 +++++++----------
 arch/powerpc/mm/ioremap_32.c  | 13 +++++--------
 arch/powerpc/mm/ioremap_64.c  | 30 +++++++++++++++++++++---------
 4 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index dc529ea0fffa..a63ec938636d 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -722,7 +722,8 @@ void __iomem *ioremap_coherent(phys_addr_t address, unsigned long size);
 
 extern void iounmap(volatile void __iomem *addr);
 
-int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot);
+int early_ioremap_range(unsigned long ea, phys_addr_t pa,
+			unsigned long size, pgprot_t prot);
 void __iomem *do_ioremap(phys_addr_t pa, phys_addr_t offset, unsigned long size,
 			 pgprot_t prot, void *caller);
 
diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 57630325846c..fc669643ce6a 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -59,18 +59,11 @@ void __iomem *ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long f
 }
 EXPORT_SYMBOL(ioremap_prot);
 
-int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot)
+int early_ioremap_range(unsigned long ea, phys_addr_t pa,
+			unsigned long size, pgprot_t prot)
 {
 	unsigned long i;
 
-	if (slab_is_available()) {
-		int err = ioremap_page_range(ea, ea + size, pa, prot);
-
-		if (err)
-			unmap_kernel_range(ea, size);
-		return err;
-	}
-
 	for (i = 0; i < size; i += PAGE_SIZE) {
 		int err = map_kernel_page(ea + i, pa + i, prot);
 
@@ -86,16 +79,20 @@ void __iomem *do_ioremap(phys_addr_t pa, phys_addr_t offset, unsigned long size,
 {
 	struct vm_struct *area;
 	int ret;
+	unsigned long va;
 
 	area = __get_vm_area_caller(size, VM_IOREMAP, IOREMAP_START, IOREMAP_END, caller);
 	if (area == NULL)
 		return NULL;
 
 	area->phys_addr = pa;
-	ret = ioremap_range((unsigned long)area->addr, pa, size, prot);
+	va = (unsigned long)area->addr;
+
+	ret = ioremap_page_range(va, va + size, pa, prot);
 	if (!ret)
 		return (void __iomem *)area->addr + offset;
 
+	unmap_kernel_range(va, size);
 	free_vm_area(area);
 
 	return NULL;
diff --git a/arch/powerpc/mm/ioremap_32.c b/arch/powerpc/mm/ioremap_32.c
index fcf343dbf2bf..f36121f25243 100644
--- a/arch/powerpc/mm/ioremap_32.c
+++ b/arch/powerpc/mm/ioremap_32.c
@@ -60,24 +60,21 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 	 */
 	v = p_block_mapped(p);
 	if (v)
-		goto out;
+		return (void __iomem *)v + offset;
 
-	if (slab_is_available()) {
+	if (slab_is_available())
 		return do_ioremap(p, offset, size, prot, caller);
-	} else {
-		v = (ioremap_bot -= size);
-	}
 
 	/*
 	 * Should check if it is a candidate for a BAT mapping
 	 */
 
-	err = ioremap_range((unsigned long)v, p, size, prot);
+	err = early_ioremap_range(ioremap_bot - size, p, size, prot);
 	if (err)
 		return NULL;
+	ioremap_bot -= size;
 
-out:
-	return (void __iomem *)(v + ((unsigned long)addr & ~PAGE_MASK));
+	return (void __iomem *)ioremap_bot + offset;
 }
 
 void iounmap(volatile void __iomem *addr)
diff --git a/arch/powerpc/mm/ioremap_64.c b/arch/powerpc/mm/ioremap_64.c
index e37b68b7f0e8..fd29e51700cd 100644
--- a/arch/powerpc/mm/ioremap_64.c
+++ b/arch/powerpc/mm/ioremap_64.c
@@ -9,6 +9,9 @@
  */
 void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
 {
+	int ret;
+	unsigned long va = (unsigned long)ea;
+
 	/* We don't support the 4K PFN hack with ioremap */
 	if (pgprot_val(prot) & H_PAGE_4K_PFN)
 		return NULL;
@@ -22,7 +25,15 @@ void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_
 	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
 	WARN_ON(size & ~PAGE_MASK);
 
-	if (ioremap_range((unsigned long)ea, pa, size, prot))
+	if (slab_is_available()) {
+		ret = ioremap_page_range(va, va + size, pa, prot);
+		if (ret)
+			unmap_kernel_range(va, size);
+	} else {
+		ret = early_ioremap_range(va, pa, size, prot);
+	}
+
+	if (ret)
 		return NULL;
 
 	return (void __iomem *)ea;
@@ -48,6 +59,7 @@ void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
 {
 	phys_addr_t paligned, offset;
 	void __iomem *ret;
+	int err;
 
 	/* We don't support the 4K PFN hack with ioremap */
 	if (pgprot_val(prot) & H_PAGE_4K_PFN)
@@ -66,16 +78,16 @@ void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
 	if (size == 0 || paligned == 0)
 		return NULL;
 
-	if (slab_is_available()) {
+	if (slab_is_available())
 		return do_ioremap(paligned, offset, size, prot, caller);
-	} else {
-		ret = __ioremap_at(paligned, (void *)ioremap_bot, size, prot);
-		if (ret)
-			ioremap_bot += size;
-	}
 
-	if (ret)
-		ret += addr & ~PAGE_MASK;
+	err = early_ioremap_range(ioremap_bot, paligned, size, prot);
+	if (err)
+		return NULL;
+
+	ret = (void __iomem *)ioremap_bot + offset;
+	ioremap_bot += size;
+
 	return ret;
 }
 
-- 
2.13.3

