Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BC58C222
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 22:34:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467PZh4ZpwzDqP9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 06:34:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="qfBhulLY"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467P4m6QHXzDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 06:11:52 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467P4Y3wJNz9v0CS;
 Tue, 13 Aug 2019 22:11:41 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qfBhulLY; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rA5jPD3yY6uL; Tue, 13 Aug 2019 22:11:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467P4Y2th6z9v0CM;
 Tue, 13 Aug 2019 22:11:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565727101; bh=WeqLxZtr9LFGc7QK6NMnLOJ1YD4PPAgjsmOOJfb818k=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=qfBhulLYnl51N21MMmLo279huThx4jtQC1qL/WJcUFmpbPx8PTjrw1K3k7b6Y0ZO+
 FYy/8s4IkGcFglyJOCtxis2ByUI9v+BXncZusntKKvVvroHEDSY4jatCdbgBgo16EN
 AYMorBS8NijUeTXcFx7gvjmzMBInGqEat3OfdzF0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 89C298B7F2;
 Tue, 13 Aug 2019 22:11:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eGQYKY7h5hGX; Tue, 13 Aug 2019 22:11:41 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C8068B7F0;
 Tue, 13 Aug 2019 22:11:41 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2DF2469632; Tue, 13 Aug 2019 20:11:41 +0000 (UTC)
Message-Id: <84bab66e7afc4b35e2bd460a87b5911c1b0830d2.1565726867.git.christophe.leroy@c-s.fr>
In-Reply-To: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
References: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 08/10] powerpc/mm: move __ioremap_at() and __iounmap_at()
 into ioremap.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 13 Aug 2019 20:11:41 +0000 (UTC)
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

Allthough __ioremap_at() and __iounmap_at() are specific to PPC64,
lets move them into ioremap.c as it wouldn't be worth creating an
ioremap_64.c only for those functions.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/ioremap.c    | 43 +++++++++++++++++++++++++++++++++++++++++++
 arch/powerpc/mm/pgtable_64.c | 42 ------------------------------------------
 2 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 57d742509cec..889ee656cf64 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -103,3 +103,46 @@ void iounmap(volatile void __iomem *token)
 	vunmap(addr);
 }
 EXPORT_SYMBOL(iounmap);
+
+#ifdef CONFIG_PPC64
+/**
+ * __ioremap_at - Low level function to establish the page tables
+ *                for an IO mapping
+ */
+void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
+{
+	/* We don't support the 4K PFN hack with ioremap */
+	if (pgprot_val(prot) & H_PAGE_4K_PFN)
+		return NULL;
+
+	if ((ea + size) >= (void *)IOREMAP_END) {
+		pr_warn("Outside the supported range\n");
+		return NULL;
+	}
+
+	WARN_ON(pa & ~PAGE_MASK);
+	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
+	WARN_ON(size & ~PAGE_MASK);
+
+	if (ioremap_range((unsigned long)ea, pa, size, prot, NUMA_NO_NODE))
+		return NULL;
+
+	return (void __iomem *)ea;
+}
+EXPORT_SYMBOL(__ioremap_at);
+
+/**
+ * __iounmap_from - Low level function to tear down the page tables
+ *                  for an IO mapping. This is used for mappings that
+ *                  are manipulated manually, like partial unmapping of
+ *                  PCI IOs or ISA space.
+ */
+void __iounmap_at(void *ea, unsigned long size)
+{
+	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
+	WARN_ON(size & ~PAGE_MASK);
+
+	unmap_kernel_range((unsigned long)ea, size);
+}
+EXPORT_SYMBOL(__iounmap_at);
+#endif
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index b50a53a0a42b..32220f7381d7 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -119,45 +119,6 @@ int __weak ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, p
 	return 0;
 }
 
-/**
- * __ioremap_at - Low level function to establish the page tables
- *                for an IO mapping
- */
-void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
-{
-	/* We don't support the 4K PFN hack with ioremap */
-	if (pgprot_val(prot) & H_PAGE_4K_PFN)
-		return NULL;
-
-	if ((ea + size) >= (void *)IOREMAP_END) {
-		pr_warn("Outside the supported range\n");
-		return NULL;
-	}
-
-	WARN_ON(pa & ~PAGE_MASK);
-	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
-	WARN_ON(size & ~PAGE_MASK);
-
-	if (ioremap_range((unsigned long)ea, pa, size, prot, NUMA_NO_NODE))
-		return NULL;
-
-	return (void __iomem *)ea;
-}
-
-/**
- * __iounmap_from - Low level function to tear down the page tables
- *                  for an IO mapping. This is used for mappings that
- *                  are manipulated manually, like partial unmapping of
- *                  PCI IOs or ISA space.
- */
-void __iounmap_at(void *ea, unsigned long size)
-{
-	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
-	WARN_ON(size & ~PAGE_MASK);
-
-	unmap_kernel_range((unsigned long)ea, size);
-}
-
 void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
 				pgprot_t prot, void *caller)
 {
@@ -201,9 +162,6 @@ void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
 	return ret;
 }
 
-EXPORT_SYMBOL(__ioremap_at);
-EXPORT_SYMBOL(__iounmap_at);
-
 #ifndef __PAGETABLE_PUD_FOLDED
 /* 4 level page table */
 struct page *pgd_page(pgd_t pgd)
-- 
2.13.3

