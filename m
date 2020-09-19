Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF91270CD2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 12:10:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtmgN1TylzDr1f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 20:10:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=vyiEdaXq; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=6sSScZuj; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtmCb1n7MzDqk7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 19:50:19 +1000 (AEST)
Message-Id: <20200919092616.829295857@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=62cg+tYN6oLNqN6Y0vWc+iOKictfSvvkGeKXlIFt6dk=;
 b=vyiEdaXq5ja3yTew3GAtLnOuEr/XR2OQ6GIRvsRazlu6EWdfAw2qyWaKAxuPfwf8ZFD6GB
 uULMkrI6aeC4c4Bu5FzU3aevQOVhMwCjmemiLhOgr4anW+vuu5Mn4eSe/OaXPgg7xYWOAx
 la6PjBUi7WgOuOXY4NxFZwVUun5PA+YLrr/ej5zfbMqVYCFMC7zjrXvbrBlssZWECrHhtC
 sxkPynlpKDp9D0QjjyUpJQukwiZqY0pxTZYfwV6xFBG1715dkBVqUXCfU8tqIFO4b1e/Is
 R2PJNHXkjr1d4QmfEufTs0nbY14qsPYhboBNZw86oh1UuaJQ7LppCCov1BMP4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=62cg+tYN6oLNqN6Y0vWc+iOKictfSvvkGeKXlIFt6dk=;
 b=6sSScZuj1/MIgScXCI8jvZWx/oY1vRFEC5HXEevnuVfmRN5aQnt05IXPVmmUIoJSoTL3PJ
 +LtfA+w09Ob6ShCw==
Date: Sat, 19 Sep 2020 11:18:01 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 10/15] powerpc/mm/highmem: Switch to generic kmap atomic
References: <20200919091751.011116649@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Segall <bsegall@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Vineet Gupta <vgupta@synopsys.com>, Guo Ren <guoren@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
Note: Completely untested
---
 arch/powerpc/Kconfig               |    1 
 arch/powerpc/include/asm/highmem.h |    6 ++-
 arch/powerpc/mm/Makefile           |    1 
 arch/powerpc/mm/highmem.c          |   67 -------------------------------------
 arch/powerpc/mm/mem.c              |    7 ---
 5 files changed, 6 insertions(+), 76 deletions(-)

--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -406,6 +406,7 @@ menu "Kernel options"
 config HIGHMEM
 	bool "High memory support"
 	depends on PPC32
+        select KMAP_ATOMIC_GENERIC
 
 source "kernel/Kconfig.hz"
 
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -29,7 +29,6 @@
 #include <asm/page.h>
 #include <asm/fixmap.h>
 
-extern pte_t *kmap_pte;
 extern pte_t *pkmap_page_table;
 
 /*
@@ -60,6 +59,11 @@ extern pte_t *pkmap_page_table;
 
 #define flush_cache_kmaps()	flush_cache_all()
 
+#define arch_kmap_temp_post_map(vaddr, pteval)	\
+	local_flush_tlb_page(NULL, vaddr)
+#define arch_kmap_temp_post_unmap(vaddr)	\
+	local_flush_tlb_page(NULL, vaddr)
+
 #endif /* __KERNEL__ */
 
 #endif /* _ASM_HIGHMEM_H */
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -16,7 +16,6 @@ obj-$(CONFIG_NEED_MULTIPLE_NODES) += num
 obj-$(CONFIG_PPC_MM_SLICES)	+= slice.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_NOT_COHERENT_CACHE) += dma-noncoherent.o
-obj-$(CONFIG_HIGHMEM)		+= highmem.o
 obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
 obj-$(CONFIG_PPC_PTDUMP)	+= ptdump/
 obj-$(CONFIG_KASAN)		+= kasan/
--- a/arch/powerpc/mm/highmem.c
+++ /dev/null
@@ -1,67 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * highmem.c: virtual kernel memory mappings for high memory
- *
- * PowerPC version, stolen from the i386 version.
- *
- * Used in CONFIG_HIGHMEM systems for memory pages which
- * are not addressable by direct kernel virtual addresses.
- *
- * Copyright (C) 1999 Gerhard Wichert, Siemens AG
- *		      Gerhard.Wichert@pdb.siemens.de
- *
- *
- * Redesigned the x86 32-bit VM architecture to deal with
- * up to 16 Terrabyte physical memory. With current x86 CPUs
- * we now support up to 64 Gigabytes physical RAM.
- *
- * Copyright (C) 1999 Ingo Molnar <mingo@redhat.com>
- *
- * Reworked for PowerPC by various contributors. Moved from
- * highmem.h by Benjamin Herrenschmidt (c) 2009 IBM Corp.
- */
-
-#include <linux/highmem.h>
-#include <linux/module.h>
-
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
-{
-	unsigned long vaddr;
-	int idx, type;
-
-	type = kmap_atomic_idx_push();
-	idx = type + KM_TYPE_NR*smp_processor_id();
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-	WARN_ON(IS_ENABLED(CONFIG_DEBUG_HIGHMEM) && !pte_none(*(kmap_pte - idx)));
-	__set_pte_at(&init_mm, vaddr, kmap_pte-idx, mk_pte(page, prot), 1);
-	local_flush_tlb_page(NULL, vaddr);
-
-	return (void*) vaddr;
-}
-EXPORT_SYMBOL(kmap_atomic_high_prot);
-
-void kunmap_atomic_high(void *kvaddr)
-{
-	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
-
-	if (vaddr < __fix_to_virt(FIX_KMAP_END))
-		return;
-
-	if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM)) {
-		int type = kmap_atomic_idx();
-		unsigned int idx;
-
-		idx = type + KM_TYPE_NR * smp_processor_id();
-		WARN_ON(vaddr != __fix_to_virt(FIX_KMAP_BEGIN + idx));
-
-		/*
-		 * force other mappings to Oops if they'll try to access
-		 * this pte without first remap it
-		 */
-		pte_clear(&init_mm, vaddr, kmap_pte-idx);
-		local_flush_tlb_page(NULL, vaddr);
-	}
-
-	kmap_atomic_idx_pop();
-}
-EXPORT_SYMBOL(kunmap_atomic_high);
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -60,11 +60,6 @@
 unsigned long long memory_limit;
 bool init_mem_is_free;
 
-#ifdef CONFIG_HIGHMEM
-pte_t *kmap_pte;
-EXPORT_SYMBOL(kmap_pte);
-#endif
-
 pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 			      unsigned long size, pgprot_t vma_prot)
 {
@@ -233,8 +228,6 @@ void __init paging_init(void)
 
 	map_kernel_page(PKMAP_BASE, 0, __pgprot(0));	/* XXX gross */
 	pkmap_page_table = virt_to_kpte(PKMAP_BASE);
-
-	kmap_pte = virt_to_kpte(__fix_to_virt(FIX_KMAP_BEGIN));
 #endif /* CONFIG_HIGHMEM */
 
 	printk(KERN_DEBUG "Top of RAM: 0x%llx, Total RAM: 0x%llx\n",

