Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C33168C214
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 22:28:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467PS81sCKzDqP2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 06:28:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="GOARWqum"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467P4f4YW9zDqLv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 06:11:45 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467P4V30s9z9v0CP;
 Tue, 13 Aug 2019 22:11:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=GOARWqum; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ETnBwsFF4CiC; Tue, 13 Aug 2019 22:11:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467P4V1yv7z9v0CM;
 Tue, 13 Aug 2019 22:11:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565727098; bh=fWESdiJOEhqopqv9pmvMpyC9QDIf6/EZbHgCKEO0na0=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=GOARWqumr3a9JtCdQxN2IqcFcjNTaXYD5lF6CUOFEWnRZpF+rgviv4hRCrQB5Xyrt
 PFibgtkN6r9s+P7Y2Sab4Y9s70Ua2I6RJ602xU5ZHrc5mOj52bB+MJ0BWkZSkpiCa6
 VvuZggMHzXD+Y96uWPAAa33rYDjtgnP7LvcAUOLQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6B6668B7F2;
 Tue, 13 Aug 2019 22:11:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6u8WfcFOvfOe; Tue, 13 Aug 2019 22:11:38 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E8F58B7F0;
 Tue, 13 Aug 2019 22:11:38 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1439A69632; Tue, 13 Aug 2019 20:11:38 +0000 (UTC)
Message-Id: <019c5d90f7027ccff00e38a3bcd633d290f6af59.1565726867.git.christophe.leroy@c-s.fr>
In-Reply-To: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
References: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 05/10] powerpc/mm: Do early ioremaps from top to bottom on
 PPC64 too.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 13 Aug 2019 20:11:38 +0000 (UTC)
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

Until vmalloc system is up and running, ioremap basically
allocates addresses at the border of the IOREMAP area.

On PPC32, addresses are allocated down from the top of the area
while on PPC64, addresses are allocated up from the base of the
area.

On PPC32, the base of vmalloc area is not known yet when ioremap()
starts to be used, while the end of it is fixed. On PPC64, both the
start and the end are already fixed when ioremap() starts to being
used.

Changing PPC64 behaviour is the lighest change, so change PPC64
ioremap() to allocate addresses from the top as PPC32 does.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/book3s64/hash_utils.c    |  2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c |  2 +-
 arch/powerpc/mm/pgtable_64.c             | 18 +++++++++---------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index e6d471058597..0f954dc40346 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1030,7 +1030,7 @@ void __init hash__early_init_mmu(void)
 	__kernel_io_start = H_KERN_IO_START;
 	__kernel_io_end = H_KERN_IO_END;
 	vmemmap = (struct page *)H_VMEMMAP_START;
-	ioremap_bot = IOREMAP_BASE;
+	ioremap_bot = IOREMAP_END;
 
 #ifdef CONFIG_PCI
 	pci_io_base = ISA_IO_BASE;
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index b4ca9e95e678..11303e2fffb1 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -611,7 +611,7 @@ void __init radix__early_init_mmu(void)
 	__kernel_io_start = RADIX_KERN_IO_START;
 	__kernel_io_end = RADIX_KERN_IO_END;
 	vmemmap = (struct page *)RADIX_VMEMMAP_START;
-	ioremap_bot = IOREMAP_BASE;
+	ioremap_bot = IOREMAP_END;
 
 #ifdef CONFIG_PCI
 	pci_io_base = ISA_IO_BASE;
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 6fa2e969bf0e..0f0b1e1ea5ab 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -101,7 +101,7 @@ unsigned long __pte_frag_size_shift;
 EXPORT_SYMBOL(__pte_frag_size_shift);
 unsigned long ioremap_bot;
 #else /* !CONFIG_PPC_BOOK3S_64 */
-unsigned long ioremap_bot = IOREMAP_BASE;
+unsigned long ioremap_bot = IOREMAP_END;
 #endif
 
 int __weak ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
@@ -169,11 +169,11 @@ void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
 
 	/*
 	 * Choose an address to map it to.
-	 * Once the imalloc system is running, we use it.
+	 * Once the vmalloc system is running, we use it.
 	 * Before that, we map using addresses going
-	 * up from ioremap_bot.  imalloc will use
-	 * the addresses from ioremap_bot through
-	 * IMALLOC_END
+	 * down from ioremap_bot.  vmalloc will use
+	 * the addresses from IOREMAP_BASE through
+	 * ioremap_bot
 	 * 
 	 */
 	paligned = addr & PAGE_MASK;
@@ -186,7 +186,7 @@ void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
 		struct vm_struct *area;
 
 		area = __get_vm_area_caller(size, VM_IOREMAP,
-					    ioremap_bot, IOREMAP_END,
+					    IOREMAP_BASE, ioremap_bot,
 					    caller);
 		if (area == NULL)
 			return NULL;
@@ -194,9 +194,9 @@ void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
 		area->phys_addr = paligned;
 		ret = __ioremap_at(paligned, area->addr, size, prot);
 	} else {
-		ret = __ioremap_at(paligned, (void *)ioremap_bot, size, prot);
+		ret = __ioremap_at(paligned, (void *)ioremap_bot - size, size, prot);
 		if (ret)
-			ioremap_bot += size;
+			ioremap_bot -= size;
 	}
 
 	if (ret)
@@ -217,7 +217,7 @@ void __iounmap(volatile void __iomem *token)
 	
 	addr = (void *) ((unsigned long __force)
 			 PCI_FIX_ADDR(token) & PAGE_MASK);
-	if ((unsigned long)addr < ioremap_bot) {
+	if ((unsigned long)addr >= ioremap_bot) {
 		printk(KERN_WARNING "Attempt to iounmap early bolted mapping"
 		       " at 0x%p\n", addr);
 		return;
-- 
2.13.3

