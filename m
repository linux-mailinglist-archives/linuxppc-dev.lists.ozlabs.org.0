Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93324270CBC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 12:01:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtmSn6MWJzDqdg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 20:01:45 +1000 (AEST)
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
 header.s=2020 header.b=tBc3M34N; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=1qSvMlnb; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtmCT5MjGzDqjx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 19:50:13 +1000 (AEST)
Message-Id: <20200919092616.432209211@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=jclUu4zqBnMoAgnjVWRzYviXiZ3I4mTRnQhinkHtvd8=;
 b=tBc3M34NDWCfRm9kBNe/gOSN8ot/VrzaVTc44OS/XkDX6c8gqCTU5uF/YgxzWPOM75nGwD
 Wi+R5qzjK8V6KLz8YmVBxOiGTQ4xGknGj8uH6H3jPLnpA9k2as5YSpwPK6kJxEotV74gR6
 UQFwDMEmTvkqmGDYD3NFJkbs+V4ItQQgdbDAm4xid3Ljd3AFzpsgUx/CIfzcvfJDCuwXrl
 XXsXWM+WLtr51DZbJmhT/OQVchzsCwYv69l9ta8OrXt6Dsy0ZxV64x8BPitDOdnTtC52At
 XPwnqL0UwqOwKaPqdYTHXM6lAswoKoOIyK//O6IlMieNWX8gq8NxATAWYYFNfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=jclUu4zqBnMoAgnjVWRzYviXiZ3I4mTRnQhinkHtvd8=;
 b=1qSvMlnbK+4c6ghEEmnVHzM1WyJkW5hcw/ahISBhkYCF+wRB5cxcz9ZTXXeNLNQIbcDwed
 IF7HPs45LBNVF3DA==
Date: Sat, 19 Sep 2020 11:17:57 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 06/15] csky/mm/highmem: Switch to generic kmap atomic
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
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org
---
Note: Completely untested
---
 arch/csky/Kconfig               |    1 
 arch/csky/include/asm/highmem.h |    4 +-
 arch/csky/mm/highmem.c          |   75 ----------------------------------------
 3 files changed, 5 insertions(+), 75 deletions(-)

--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -285,6 +285,7 @@ config NR_CPUS
 config HIGHMEM
 	bool "High Memory Support"
 	depends on !CPU_CK610
+	select KMAP_ATOMIC_GENERIC
 	default y
 
 config FORCE_MAX_ZONEORDER
--- a/arch/csky/include/asm/highmem.h
+++ b/arch/csky/include/asm/highmem.h
@@ -32,10 +32,12 @@ extern pte_t *pkmap_page_table;
 
 #define ARCH_HAS_KMAP_FLUSH_TLB
 extern void kmap_flush_tlb(unsigned long addr);
-extern void *kmap_atomic_pfn(unsigned long pfn);
 
 #define flush_cache_kmaps() do {} while (0)
 
+#define arch_kmap_temp_post_map(vaddr, pteval)	kmap_flush_tlb(vaddr)
+#define arch_kmap_temp_post_unmap(vaddr)	kmap_flush_tlb(vaddr)
+
 extern void kmap_init(void);
 
 #endif /* __KERNEL__ */
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -9,8 +9,6 @@
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 
-static pte_t *kmap_pte;
-
 unsigned long highstart_pfn, highend_pfn;
 
 void kmap_flush_tlb(unsigned long addr)
@@ -19,67 +17,7 @@ void kmap_flush_tlb(unsigned long addr)
 }
 EXPORT_SYMBOL(kmap_flush_tlb);
 
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
-{
-	unsigned long vaddr;
-	int idx, type;
-
-	type = kmap_atomic_idx_push();
-	idx = type + KM_TYPE_NR*smp_processor_id();
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-#ifdef CONFIG_DEBUG_HIGHMEM
-	BUG_ON(!pte_none(*(kmap_pte - idx)));
-#endif
-	set_pte(kmap_pte-idx, mk_pte(page, prot));
-	flush_tlb_one((unsigned long)vaddr);
-
-	return (void *)vaddr;
-}
-EXPORT_SYMBOL(kmap_atomic_high_prot);
-
-void kunmap_atomic_high(void *kvaddr)
-{
-	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
-	int idx;
-
-	if (vaddr < FIXADDR_START)
-		return;
-
-#ifdef CONFIG_DEBUG_HIGHMEM
-	idx = KM_TYPE_NR*smp_processor_id() + kmap_atomic_idx();
-
-	BUG_ON(vaddr != __fix_to_virt(FIX_KMAP_BEGIN + idx));
-
-	pte_clear(&init_mm, vaddr, kmap_pte - idx);
-	flush_tlb_one(vaddr);
-#else
-	(void) idx; /* to kill a warning */
-#endif
-	kmap_atomic_idx_pop();
-}
-EXPORT_SYMBOL(kunmap_atomic_high);
-
-/*
- * This is the same as kmap_atomic() but can map memory that doesn't
- * have a struct page associated with it.
- */
-void *kmap_atomic_pfn(unsigned long pfn)
-{
-	unsigned long vaddr;
-	int idx, type;
-
-	pagefault_disable();
-
-	type = kmap_atomic_idx_push();
-	idx = type + KM_TYPE_NR*smp_processor_id();
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-	set_pte(kmap_pte-idx, pfn_pte(pfn, PAGE_KERNEL));
-	flush_tlb_one(vaddr);
-
-	return (void *) vaddr;
-}
-
-static void __init kmap_pages_init(void)
+void __init kmap_init(void)
 {
 	unsigned long vaddr;
 	pgd_t *pgd;
@@ -96,14 +34,3 @@ static void __init kmap_pages_init(void)
 	pte = pte_offset_kernel(pmd, vaddr);
 	pkmap_page_table = pte;
 }
-
-void __init kmap_init(void)
-{
-	unsigned long vaddr;
-
-	kmap_pages_init();
-
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN);
-
-	kmap_pte = pte_offset_kernel((pmd_t *)pgd_offset_k(vaddr), vaddr);
-}

