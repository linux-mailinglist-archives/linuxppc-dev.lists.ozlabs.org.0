Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3282A4418
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 12:22:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQS6g2sWTzDqX7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 22:22:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=YrCDKz93; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=euAZ2tpp; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQR2v5XdSzDqV8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 21:33:43 +1100 (AEDT)
Message-Id: <20201103095857.980576055@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=KpyA3a1Xo75yVhQvaPuA7Fk/5PcMn7a0eJxDd+9rZFg=;
 b=YrCDKz932HbpJdB1Ovswk3kIEHrrFpFM7BD36DvvxyEth/CYPlGfItygnSIqoI6PoZ9Z/n
 6hC0ZuoT80elU8CHbCQr0fHHRJ3A1QHV8hYDeuzKW3F3G1jODuF0hGXa3p5eo1f5CL3h0m
 mvPJbu1gd6RilHZPBUG/H/5nLiHDqY2isN5mxaPhrn9WM/RJp+LRNmHyUB7oxkQWjQT4wM
 ZLRmPc4c/6Oow9gWdXR7+WWQzVxtwM4nEpxuemQYN3qRdUOOq1L0jXu3C1ldf+8ujM+mdQ
 ohWVt2Hp5iLc65BFOuRA06UNiV3yg6B6ouLgzducm6Kwvt5QKb2kbWNBQTmjxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=KpyA3a1Xo75yVhQvaPuA7Fk/5PcMn7a0eJxDd+9rZFg=;
 b=euAZ2tpprrIyTefRLNP/P6Rxtm3nJite0axS+LZAHFnDm1mQ3sSmpWDqcjwQLk35BkXmiw
 ylLG+RpY4pjgDfCw==
Date: Tue, 03 Nov 2020 10:27:26 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 14/37] nds32/mm/highmem: Switch to generic kmap atomic
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
X-Mailman-Approved-At: Tue, 03 Nov 2020 21:51:17 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Greentime Hu <green.hu@gmail.com>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The mapping code is odd and looks broken. See FIXME in the comment.

Also fix the harmless off by one in the FIX_KMAP_END define.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Nick Hu <nickhu@andestech.com>
Cc: Greentime Hu <green.hu@gmail.com>
Cc: Vincent Chen <deanbo422@gmail.com>
---
V3: Remove the kmap types cruft
---
 arch/nds32/Kconfig.cpu           |    1 
 arch/nds32/include/asm/fixmap.h  |    4 +--
 arch/nds32/include/asm/highmem.h |   22 +++++++++++++----
 arch/nds32/mm/Makefile           |    1 
 arch/nds32/mm/highmem.c          |   48 ---------------------------------------
 5 files changed, 19 insertions(+), 57 deletions(-)

--- a/arch/nds32/Kconfig.cpu
+++ b/arch/nds32/Kconfig.cpu
@@ -157,6 +157,7 @@ config HW_SUPPORT_UNALIGNMENT_ACCESS
 config HIGHMEM
 	bool "High Memory Support"
 	depends on MMU && !CPU_CACHE_ALIASING
+	select KMAP_LOCAL
 	help
 	  The address space of Andes processors is only 4 Gigabytes large
 	  and it has to accommodate user address space, kernel address
--- a/arch/nds32/include/asm/fixmap.h
+++ b/arch/nds32/include/asm/fixmap.h
@@ -6,7 +6,7 @@
 
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
-#include <asm/kmap_types.h>
+#include <asm/kmap_size.h>
 #endif
 
 enum fixed_addresses {
@@ -14,7 +14,7 @@ enum fixed_addresses {
 	FIX_KMAP_RESERVED,
 	FIX_KMAP_BEGIN,
 #ifdef CONFIG_HIGHMEM
-	FIX_KMAP_END = FIX_KMAP_BEGIN + (KM_TYPE_NR * NR_CPUS),
+	FIX_KMAP_END = FIX_KMAP_BEGIN + (KM_MAX_IDX * NR_CPUS) - 1,
 #endif
 	FIX_EARLYCON_MEM_BASE,
 	__end_of_fixed_addresses
--- a/arch/nds32/include/asm/highmem.h
+++ b/arch/nds32/include/asm/highmem.h
@@ -5,7 +5,6 @@
 #define _ASM_HIGHMEM_H
 
 #include <asm/proc-fns.h>
-#include <asm/kmap_types.h>
 #include <asm/fixmap.h>
 
 /*
@@ -45,11 +44,22 @@ extern pte_t *pkmap_page_table;
 extern void kmap_init(void);
 
 /*
- * The following functions are already defined by <linux/highmem.h>
- * when CONFIG_HIGHMEM is not set.
+ * FIXME: The below looks broken vs. a kmap_atomic() in task context which
+ * is interupted and another kmap_atomic() happens in interrupt context.
+ * But what do I know about nds32. -- tglx
  */
-#ifdef CONFIG_HIGHMEM
-extern void *kmap_atomic_pfn(unsigned long pfn);
-#endif
+#define arch_kmap_local_post_map(vaddr, pteval)			\
+	do {							\
+		__nds32__tlbop_inv(vaddr);			\
+		__nds32__mtsr_dsb(vaddr, NDS32_SR_TLB_VPN);	\
+		__nds32__tlbop_rwr(pteval);			\
+		__nds32__isb();					\
+	} while (0)
+
+#define arch_kmap_local_pre_unmap(vaddr)			\
+	do {							\
+		__nds32__tlbop_inv(vaddr);			\
+		__nds32__isb();					\
+	} while (0)
 
 #endif
--- a/arch/nds32/mm/Makefile
+++ b/arch/nds32/mm/Makefile
@@ -3,7 +3,6 @@ obj-y				:= extable.o tlb.o fault.o init
                                    mm-nds32.o cacheflush.o proc.o
 
 obj-$(CONFIG_ALIGNMENT_TRAP)	+= alignment.o
-obj-$(CONFIG_HIGHMEM)           += highmem.o
 
 ifdef CONFIG_FUNCTION_TRACER
 CFLAGS_REMOVE_proc.o     = $(CC_FLAGS_FTRACE)
--- a/arch/nds32/mm/highmem.c
+++ /dev/null
@@ -1,48 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-// Copyright (C) 2005-2017 Andes Technology Corporation
-
-#include <linux/export.h>
-#include <linux/highmem.h>
-#include <linux/sched.h>
-#include <linux/smp.h>
-#include <linux/interrupt.h>
-#include <linux/memblock.h>
-#include <asm/fixmap.h>
-#include <asm/tlbflush.h>
-
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
-{
-	unsigned int idx;
-	unsigned long vaddr, pte;
-	int type;
-	pte_t *ptep;
-
-	type = kmap_atomic_idx_push();
-
-	idx = type + KM_TYPE_NR * smp_processor_id();
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-	pte = (page_to_pfn(page) << PAGE_SHIFT) | prot;
-	ptep = pte_offset_kernel(pmd_off_k(vaddr), vaddr);
-	set_pte(ptep, pte);
-
-	__nds32__tlbop_inv(vaddr);
-	__nds32__mtsr_dsb(vaddr, NDS32_SR_TLB_VPN);
-	__nds32__tlbop_rwr(pte);
-	__nds32__isb();
-	return (void *)vaddr;
-}
-EXPORT_SYMBOL(kmap_atomic_high_prot);
-
-void kunmap_atomic_high(void *kvaddr)
-{
-	if (kvaddr >= (void *)FIXADDR_START) {
-		unsigned long vaddr = (unsigned long)kvaddr;
-		pte_t *ptep;
-		kmap_atomic_idx_pop();
-		__nds32__tlbop_inv(vaddr);
-		__nds32__isb();
-		ptep = pte_offset_kernel(pmd_off_k(vaddr), vaddr);
-		set_pte(ptep, 0);
-	}
-}
-EXPORT_SYMBOL(kunmap_atomic_high);

