Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAF896256
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 16:24:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CY2V6nCrzDqKh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 00:24:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="UzwYaPa2"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CXfw1ZsqzDr45
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 00:07:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CXfq4dC4z9v0Gl;
 Tue, 20 Aug 2019 16:07:15 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=UzwYaPa2; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HcTDbkpANpoL; Tue, 20 Aug 2019 16:07:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CXfq3WcCz9v0GZ;
 Tue, 20 Aug 2019 16:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566310035; bh=qz+pPdC1G+mo30Fx/0cNs3zoD0kntRfmzksofk6rzz0=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=UzwYaPa2OMNBCTf/CXy3zZnyIDo8wplTvsWXtYZAsI9NApPYmRQk6KSfnsG0cejOd
 XSF6BH0daR9kSLqMqaPq97dMu6CIMdq+cpN4Lgo8nRfU+csMxN7ZfBlsvQEBd4tqMj
 Q2xQy08Ov4+fxbFJ6bSc4MtJItr0xUttCgN9MOm4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D491C8B7D0;
 Tue, 20 Aug 2019 16:07:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3u25EvomztU7; Tue, 20 Aug 2019 16:07:15 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 93BFC8B7C9;
 Tue, 20 Aug 2019 16:07:15 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 722A66B734; Tue, 20 Aug 2019 14:07:15 +0000 (UTC)
Message-Id: <0b3eb0e0f1490a99fd6c983e166fb8946233f151.1566309262.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566309262.git.christophe.leroy@c-s.fr>
References: <cover.1566309262.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 07/12] powerpc/mm: move ioremap_prot() into ioremap.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, hch@lst.de
Date: Tue, 20 Aug 2019 14:07:15 +0000 (UTC)
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

Both ioremap_prot() are idenfical, move them into ioremap.c

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/ioremap.c    | 19 +++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c | 17 -----------------
 arch/powerpc/mm/pgtable_64.c | 24 ------------------------
 3 files changed, 19 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 7f1d462e7745..3d388aaa3ee6 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -34,3 +34,22 @@ void __iomem *ioremap_coherent(phys_addr_t addr, unsigned long size)
 		return iowa_ioremap(addr, size, prot, caller);
 	return __ioremap_caller(addr, size, prot, caller);
 }
+
+void __iomem *ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long flags)
+{
+	pte_t pte = __pte(flags);
+	void *caller = __builtin_return_address(0);
+
+	/* writeable implies dirty for kernel addresses */
+	if (pte_write(pte))
+		pte = pte_mkdirty(pte);
+
+	/* we don't want to let _PAGE_USER and _PAGE_EXEC leak out */
+	pte = pte_exprotect(pte);
+	pte = pte_mkprivileged(pte);
+
+	if (iowa_is_active())
+		return iowa_ioremap(addr, size, pte_pgprot(pte), caller);
+	return __ioremap_caller(addr, size, pte_pgprot(pte), caller);
+}
+EXPORT_SYMBOL(ioremap_prot);
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 3a4972007ec0..b0f2d45da232 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -48,23 +48,6 @@ ioremap_wt(phys_addr_t addr, unsigned long size)
 EXPORT_SYMBOL(ioremap_wt);
 
 void __iomem *
-ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long flags)
-{
-	pte_t pte = __pte(flags);
-
-	/* writeable implies dirty for kernel addresses */
-	if (pte_write(pte))
-		pte = pte_mkdirty(pte);
-
-	/* we don't want to let _PAGE_USER and _PAGE_EXEC leak out */
-	pte = pte_exprotect(pte);
-	pte = pte_mkprivileged(pte);
-
-	return __ioremap_caller(addr, size, pte_pgprot(pte), __builtin_return_address(0));
-}
-EXPORT_SYMBOL(ioremap_prot);
-
-void __iomem *
 __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *caller)
 {
 	unsigned long v, i;
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 358233ea8d85..2b9078e1bc43 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -203,29 +203,6 @@ void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
 	return ret;
 }
 
-void __iomem * ioremap_prot(phys_addr_t addr, unsigned long size,
-			     unsigned long flags)
-{
-	pte_t pte = __pte(flags);
-	void *caller = __builtin_return_address(0);
-
-	/* writeable implies dirty for kernel addresses */
-	if (pte_write(pte))
-		pte = pte_mkdirty(pte);
-
-	/* we don't want to let _PAGE_EXEC leak out */
-	pte = pte_exprotect(pte);
-	/*
-	 * Force kernel mapping.
-	 */
-	pte = pte_mkprivileged(pte);
-
-	if (iowa_is_active())
-		return iowa_ioremap(addr, size, pte_pgprot(pte), caller);
-	return __ioremap_caller(addr, size, pte_pgprot(pte), caller);
-}
-
-
 /*  
  * Unmap an IO region and remove it from imalloc'd list.
  * Access to IO memory should be serialized by driver.
@@ -247,7 +224,6 @@ void iounmap(volatile void __iomem *token)
 	vunmap(addr);
 }
 
-EXPORT_SYMBOL(ioremap_prot);
 EXPORT_SYMBOL(__ioremap_at);
 EXPORT_SYMBOL(iounmap);
 EXPORT_SYMBOL(__iounmap_at);
-- 
2.13.3

