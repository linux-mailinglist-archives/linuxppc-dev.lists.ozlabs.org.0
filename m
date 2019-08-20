Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B7396272
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 16:29:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CY8G0swDzDqMK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 00:29:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="flXY65AR"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CXfw1Y78zDr2k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 00:07:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CXfr4Wtyz9v0Gm;
 Tue, 20 Aug 2019 16:07:16 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=flXY65AR; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zU4CGkziDTV7; Tue, 20 Aug 2019 16:07:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CXfr3TS1z9v0GZ;
 Tue, 20 Aug 2019 16:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566310036; bh=x8VWVbLglUfZvDgFPEwd+UI41aIksg/nsGXzHa+iqag=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=flXY65ARrL3U15jyKxwZdYb1o0LWQDA3EhhdOoRd0yOkO20N6/F0PjTQcBm9/q0zo
 K/Tgc5glSnXrxzODbgiex4sf8aNdv+2+V+iF2tn4UngXgRXOPYvasNE2K3DXr6fWuE
 KlcQYLqk881newtvemiG4mm50L4RBg4Logk+vfp8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D8D8E8B7D0;
 Tue, 20 Aug 2019 16:07:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id raTOMNIGGy8G; Tue, 20 Aug 2019 16:07:16 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9605D8B7C9;
 Tue, 20 Aug 2019 16:07:16 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 785A86B734; Tue, 20 Aug 2019 14:07:16 +0000 (UTC)
Message-Id: <920eebfd9f36f14c79d1755847f5bf7c83703bdd.1566309262.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566309262.git.christophe.leroy@c-s.fr>
References: <cover.1566309262.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 08/12] powerpc/mm: make ioremap_bot common to all
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, hch@lst.de
Date: Tue, 20 Aug 2019 14:07:16 +0000 (UTC)
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

Drop multiple definitions of ioremap_bot and make one common to
all subarches.

Only CONFIG_PPC_BOOK3E_64 had a global static init value for
ioremap_bot. Now ioremap_bot is set in early_init_mmu_global().

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 2 --
 arch/powerpc/include/asm/book3s/64/pgtable.h | 1 -
 arch/powerpc/include/asm/nohash/32/pgtable.h | 2 --
 arch/powerpc/include/asm/pgtable.h           | 2 ++
 arch/powerpc/mm/ioremap.c                    | 3 +++
 arch/powerpc/mm/mmu_decl.h                   | 1 -
 arch/powerpc/mm/nohash/tlb.c                 | 2 ++
 arch/powerpc/mm/pgtable_32.c                 | 3 ---
 arch/powerpc/mm/pgtable_64.c                 | 3 ---
 9 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 838de59f6754..aa1bc5f8da90 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -201,8 +201,6 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
 #include <linux/sched.h>
 #include <linux/threads.h>
 
-extern unsigned long ioremap_bot;
-
 /* Bits to mask out from a PGD to get to the PUD page */
 #define PGD_MASKED_BITS		0
 
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 8308f32e9782..11819e3c755e 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -289,7 +289,6 @@ extern unsigned long __kernel_io_end;
 #define KERN_IO_END __kernel_io_end
 
 extern struct page *vmemmap;
-extern unsigned long ioremap_bot;
 extern unsigned long pci_io_base;
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 0284f8f5305f..7ce2a7c9fade 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -11,8 +11,6 @@
 #include <asm/mmu.h>			/* For sub-arch specific PPC_PIN_SIZE */
 #include <asm/asm-405.h>
 
-extern unsigned long ioremap_bot;
-
 #ifdef CONFIG_44x
 extern int icache_44x_need_flush;
 #endif
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index c58ba7963688..c54bb68c1354 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -68,6 +68,8 @@ extern pgd_t swapper_pg_dir[];
 
 extern void paging_init(void);
 
+extern unsigned long ioremap_bot;
+
 /*
  * kern_addr_valid is intended to indicate whether an address is a valid
  * kernel address.  Most 32-bit archs define it as always true (like this)
diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 3d388aaa3ee6..eaf5f8a4a63f 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -3,6 +3,9 @@
 #include <linux/io.h>
 #include <asm/io-workarounds.h>
 
+unsigned long ioremap_bot;
+EXPORT_SYMBOL(ioremap_bot);
+
 void __iomem *ioremap(phys_addr_t addr, unsigned long size)
 {
 	pgprot_t prot = pgprot_noncached(PAGE_KERNEL);
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 32c1a191c28a..6ee64d5e2824 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -108,7 +108,6 @@ extern u8 early_hash[];
 
 #endif /* CONFIG_PPC32 */
 
-extern unsigned long ioremap_bot;
 extern unsigned long __max_low_memory;
 extern phys_addr_t __initial_memory_limit_addr;
 extern phys_addr_t total_memory;
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index bf60983a58c7..696f568253a0 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -703,6 +703,8 @@ static void __init early_init_mmu_global(void)
 	 * for use by the TLB miss code
 	 */
 	linear_map_top = memblock_end_of_DRAM();
+
+	ioremap_bot = IOREMAP_BASE;
 }
 
 static void __init early_mmu_set_memory_limit(void)
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index b0f2d45da232..daab57c78b22 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -33,9 +33,6 @@
 
 #include <mm/mmu_decl.h>
 
-unsigned long ioremap_bot;
-EXPORT_SYMBOL(ioremap_bot);	/* aka VMALLOC_END */
-
 extern char etext[], _stext[], _sinittext[], _einittext[];
 
 void __iomem *
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 2b9078e1bc43..d865e053052d 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -98,9 +98,6 @@ unsigned long __pte_frag_nr;
 EXPORT_SYMBOL(__pte_frag_nr);
 unsigned long __pte_frag_size_shift;
 EXPORT_SYMBOL(__pte_frag_size_shift);
-unsigned long ioremap_bot;
-#else /* !CONFIG_PPC_BOOK3S_64 */
-unsigned long ioremap_bot = IOREMAP_BASE;
 #endif
 
 int __weak ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
-- 
2.13.3

