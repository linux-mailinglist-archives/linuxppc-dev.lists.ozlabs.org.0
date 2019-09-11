Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B223AFE28
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 15:56:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T3N70DLFzF36v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 23:56:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="GMqpO/CD"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T3GS6qlpzF36n
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 23:51:27 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46T3GL3TBkzB09Zl;
 Wed, 11 Sep 2019 15:51:22 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=GMqpO/CD; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gkiGr0Q8LTXV; Wed, 11 Sep 2019 15:51:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46T3GL20Z1zB09Zk;
 Wed, 11 Sep 2019 15:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568209882; bh=aFoR0EE25KxrXQBvyb70fW7SuTw+tqYJ2ji2+VGVo/I=;
 h=From:Subject:To:Cc:Date:From;
 b=GMqpO/CD6k/T039tPPd+RCv2yO1ifh84PKQBKzkz21m+ocSJB/iirJdtqSOeD1oiy
 zGkNCSXNjkDgHApz/uQOucDHDoDf8axy4O6cwSb6HcsSGXqYv3qcP8W3DDwZJtStUn
 mc2OGv05QtQGvfovBm528XkdhXj/aZ5mNXtls+xk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B9C328B8D1;
 Wed, 11 Sep 2019 15:51:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id s8WrJoXk0Ydr; Wed, 11 Sep 2019 15:51:23 +0200 (CEST)
Received: from localhost.localdomain (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8A7258B8CB;
 Wed, 11 Sep 2019 15:51:23 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 4FCEE6B723; Wed, 11 Sep 2019 13:51:23 +0000 (UTC)
Message-Id: <01c3846a26faf47b11ba580fccded281c3b0a6ee.1568209870.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32: add support of KASAN_VMALLOC
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 dja@axtens.net
Date: Wed, 11 Sep 2019 13:51:23 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support of KASAN_VMALLOC on PPC32.

To allow this, the early shadow covering the VMALLOC space
need to be removed once high_memory var is set and before
freeing memblock.

And the VMALLOC area need to be aligned such that boundaries
are covered by a full shadow page.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
Applies on top of Daniel's series which add KASAN_VMALLOC support.
---
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h |  5 +++++
 arch/powerpc/include/asm/kasan.h             |  2 ++
 arch/powerpc/include/asm/nohash/32/pgtable.h |  5 +++++
 arch/powerpc/mm/kasan/kasan_init_32.c        | 31 ++++++++++++++++++++++++++++
 arch/powerpc/mm/mem.c                        |  3 +++
 6 files changed, 47 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6a7c797fa9d2..9d270d50ac9e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -172,6 +172,7 @@ config PPC
 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_KASAN			if PPC32
+	select HAVE_ARCH_KASAN_VMALLOC		if PPC32
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 0796533d37dd..5b39c11e884a 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -193,7 +193,12 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
 #else
 #define VMALLOC_START ((((long)high_memory + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))
 #endif
+
+#ifdef CONFIG_KASAN_VMALLOC
+#define VMALLOC_END	_ALIGN_DOWN(ioremap_bot, PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
+#else
 #define VMALLOC_END	ioremap_bot
+#endif
 
 #ifndef __ASSEMBLY__
 #include <linux/sched.h>
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index 296e51c2f066..fbff9ff9032e 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -31,9 +31,11 @@
 void kasan_early_init(void);
 void kasan_mmu_init(void);
 void kasan_init(void);
+void kasan_late_init(void);
 #else
 static inline void kasan_init(void) { }
 static inline void kasan_mmu_init(void) { }
+static inline void kasan_late_init(void) { }
 #endif
 
 #endif /* __ASSEMBLY */
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 552b96eef0c8..60c4d829152e 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -114,7 +114,12 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
 #else
 #define VMALLOC_START ((((long)high_memory + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))
 #endif
+
+#ifdef CONFIG_KASAN_VMALLOC
+#define VMALLOC_END	_ALIGN_DOWN(ioremap_bot, PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
+#else
 #define VMALLOC_END	ioremap_bot
+#endif
 
 /*
  * Bits in a linux-style PTE.  These match the bits in the
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index 0e6ed4413eea..fb3cd8037f19 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -129,6 +129,31 @@ static void __init kasan_remap_early_shadow_ro(void)
 	flush_tlb_kernel_range(KASAN_SHADOW_START, KASAN_SHADOW_END);
 }
 
+static void __init kasan_unmap_early_shadow_vmalloc(void)
+{
+	unsigned long k_start = (unsigned long)kasan_mem_to_shadow((void *)VMALLOC_START);
+	unsigned long k_end = (unsigned long)kasan_mem_to_shadow((void *)VMALLOC_END);
+	unsigned long k_cur;
+	phys_addr_t pa = __pa(kasan_early_shadow_page);
+
+	if (!early_mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
+		int ret = kasan_init_shadow_page_tables(k_start, k_end);
+
+		if (ret)
+			panic("kasan: kasan_init_shadow_page_tables() failed");
+	}
+	for (k_cur = k_start & PAGE_MASK; k_cur < k_end; k_cur += PAGE_SIZE) {
+		pmd_t *pmd = pmd_offset(pud_offset(pgd_offset_k(k_cur), k_cur), k_cur);
+		pte_t *ptep = pte_offset_kernel(pmd, k_cur);
+
+		if ((pte_val(*ptep) & PTE_RPN_MASK) != pa)
+			continue;
+
+		__set_pte_at(&init_mm, k_cur, ptep, __pte(0), 0);
+	}
+	flush_tlb_kernel_range(k_start, k_end);
+}
+
 void __init kasan_mmu_init(void)
 {
 	int ret;
@@ -165,6 +190,12 @@ void __init kasan_init(void)
 	pr_info("KASAN init done\n");
 }
 
+void __init kasan_late_init(void)
+{
+	if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
+		kasan_unmap_early_shadow_vmalloc();
+}
+
 #ifdef CONFIG_MODULES
 void *module_alloc(unsigned long size)
 {
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index be941d382c8d..34bfe2c81f15 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -265,6 +265,9 @@ void __init mem_init(void)
 
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
 	set_max_mapnr(max_pfn);
+
+	kasan_late_init();
+
 	memblock_free_all();
 
 #ifdef CONFIG_HIGHMEM
-- 
2.13.3

