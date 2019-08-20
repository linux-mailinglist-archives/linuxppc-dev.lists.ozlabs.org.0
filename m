Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A3496250
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 16:22:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CXzl59SKzDqtl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 00:21:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="VRyHc+g2"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CXfr1X0nzDr4Y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 00:07:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CXfm4NrVz9v0Gg;
 Tue, 20 Aug 2019 16:07:12 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VRyHc+g2; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hklT6zho8N0y; Tue, 20 Aug 2019 16:07:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CXfm3D1Jz9v0GZ;
 Tue, 20 Aug 2019 16:07:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566310032; bh=wYmWQVbOL8+HyhpkF7UnISkf2nMl4sTU2NwnfBVkSic=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=VRyHc+g2lcnsNgDrluO1aW6YmcSnztD3Xp6HxV+1VRwSs1VSBtlMxsm9clacEjkKb
 lEyLIp3g804qEptg5KC4saUF4mxMy/Nljx5BBCe0RZ+i4l4sI4T1S0B45q3RyGRXZH
 DyI5E9fGXNza2EqwcpOzTCLCiR/DqVrruCV9PH7M=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AF1F98B7D0;
 Tue, 20 Aug 2019 16:07:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4IEqfRPCvbSD; Tue, 20 Aug 2019 16:07:12 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 72AB08B7C9;
 Tue, 20 Aug 2019 16:07:12 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5C0D06B734; Tue, 20 Aug 2019 14:07:12 +0000 (UTC)
Message-Id: <ccc439f481a0884e00a6be1bab44bab2a4477fea.1566309262.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566309262.git.christophe.leroy@c-s.fr>
References: <cover.1566309262.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 04/12] powerpc/mm: drop function __ioremap()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, hch@lst.de
Date: Tue, 20 Aug 2019 14:07:12 +0000 (UTC)
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

__ioremap() is not used anymore, drop it.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/io.h |  6 ------
 arch/powerpc/mm/pgtable_32.c  | 11 ++---------
 arch/powerpc/mm/pgtable_64.c  |  7 -------
 3 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 02d6256fe1ea..8e65ba59f06a 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -705,10 +705,6 @@ static inline void iosync(void)
  *   create hand-made mappings for use only by the PCI code and cannot
  *   currently be hooked. Must be page aligned.
  *
- * * __ioremap is the low level implementation used by ioremap and
- *   ioremap_prot and cannot be hooked (but can be used by a hook on one
- *   of the previous ones)
- *
  * * __ioremap_caller is the same as above but takes an explicit caller
  *   reference rather than using __builtin_return_address(0)
  *
@@ -726,8 +722,6 @@ void __iomem *ioremap_coherent(phys_addr_t address, unsigned long size);
 
 extern void iounmap(volatile void __iomem *addr);
 
-extern void __iomem *__ioremap(phys_addr_t, unsigned long size,
-			       unsigned long flags);
 extern void __iomem *__ioremap_caller(phys_addr_t, unsigned long size,
 				      pgprot_t prot, void *caller);
 
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 35cb96cfc258..848ee4a30dd1 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -92,12 +92,6 @@ ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long flags)
 EXPORT_SYMBOL(ioremap_prot);
 
 void __iomem *
-__ioremap(phys_addr_t addr, unsigned long size, unsigned long flags)
-{
-	return __ioremap_caller(addr, size, __pgprot(flags), __builtin_return_address(0));
-}
-
-void __iomem *
 __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *caller)
 {
 	unsigned long v, i;
@@ -127,8 +121,8 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 	 */
 	if (slab_is_available() && p <= virt_to_phys(high_memory - 1) &&
 	    page_is_ram(__phys_to_pfn(p))) {
-		printk("__ioremap(): phys addr 0x%llx is RAM lr %ps\n",
-		       (unsigned long long)p, __builtin_return_address(0));
+		pr_warn("%s(): phys addr 0x%llx is RAM lr %ps\n", __func__,
+			(unsigned long long)p, __builtin_return_address(0));
 		return NULL;
 	}
 #endif
@@ -171,7 +165,6 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 out:
 	return (void __iomem *) (v + ((unsigned long)addr & ~PAGE_MASK));
 }
-EXPORT_SYMBOL(__ioremap);
 
 void iounmap(volatile void __iomem *addr)
 {
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 57cdd6182932..2882419737b9 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -203,12 +203,6 @@ void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
 	return ret;
 }
 
-void __iomem * __ioremap(phys_addr_t addr, unsigned long size,
-			 unsigned long flags)
-{
-	return __ioremap_caller(addr, size, __pgprot(flags), __builtin_return_address(0));
-}
-
 void __iomem * ioremap(phys_addr_t addr, unsigned long size)
 {
 	pgprot_t prot = pgprot_noncached(PAGE_KERNEL);
@@ -286,7 +280,6 @@ void iounmap(volatile void __iomem *token)
 EXPORT_SYMBOL(ioremap);
 EXPORT_SYMBOL(ioremap_wc);
 EXPORT_SYMBOL(ioremap_prot);
-EXPORT_SYMBOL(__ioremap);
 EXPORT_SYMBOL(__ioremap_at);
 EXPORT_SYMBOL(iounmap);
 EXPORT_SYMBOL(__iounmap_at);
-- 
2.13.3

