Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B237329F8BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 23:57:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMgn00k9nzDqh2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 09:57:08 +1100 (AEDT)
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
 header.s=2020 header.b=j4Kq3J1x; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=J4VL1zNL; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMgDb1TbrzDqY3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 09:32:31 +1100 (AEDT)
Message-Id: <20201029222651.885593433@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604010744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=LufW3kO54Nr2100PGampKWimA5aEr8Imx1WFVO7xrw4=;
 b=j4Kq3J1xytiwogkgzVlHOciXiJ1X9e95juvY5nmiB8tzupy22IadS0O40bAyqBJmkCN9Ur
 y0qPPUW2tXbG0Lkda23fNJOralmhD/EGP2JuAKX0QBasC9PdPQusNLgaKt33z4tbDpM9VU
 6PUTm98f4CRQimklmHRbrKuiRHshN4e4ADG4f4lP0gdK4odT7QjzwbtfYoKLeYcj1d6a+m
 LNeB1MFNWX45WX7NSeq+Pgk22CsjEA91O3osOymgoANaexT9zV7bmthjqtLuA5RpPNbQ9i
 iHKyjRVf8dRstiFVXwDT/tKcEwHUeXNL2cbIUddGM4Xmalxi84w6i4ZSXQsZJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604010744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=LufW3kO54Nr2100PGampKWimA5aEr8Imx1WFVO7xrw4=;
 b=J4VL1zNL7oBS8xSf4hW/0svoZPMGaKoJMwK2efYvA+sVXzcWMChJ2eGLsxyFbxD64uPr9d
 GMJEsGE96Dl8XECg==
Date: Thu, 29 Oct 2020 23:18:19 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 13/18] xtensa/mm/highmem: Switch to generic kmap atomic
References: <20201029221806.189523375@linutronix.de>
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
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Paul McKenney <paulmck@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Greentime Hu <green.hu@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Ard Biesheuvel <ardb@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No reason having the same code in every architecture

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-xtensa@linux-xtensa.org

---
 arch/xtensa/Kconfig               |    1 
 arch/xtensa/include/asm/highmem.h |    9 +++++++
 arch/xtensa/mm/highmem.c          |   44 +++-----------------------------------
 3 files changed, 14 insertions(+), 40 deletions(-)

--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -666,6 +666,7 @@ endchoice
 config HIGHMEM
 	bool "High Memory Support"
 	depends on MMU
+        select KMAP_LOCAL
 	help
 	  Linux can use the full amount of RAM in the system by
 	  default. However, the default MMUv2 setup only maps the
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -68,6 +68,15 @@ static inline void flush_cache_kmaps(voi
 	flush_cache_all();
 }
 
+enum fixed_addresses kmap_local_map_idx(int type, unsigned long pfn);
+#define arch_kmap_local_map_idx		kmap_local_map_idx
+
+enum fixed_addresses kmap_local_unmap_idx(int type, unsigned long addr);
+#define arch_kmap_local_unmap_idx	kmap_local_unmap_idx
+
+#define arch_kmap_local_post_unmap(vaddr)	\
+	local_flush_tlb_kernel_range(vaddr, vaddr + PAGE_SIZE)
+
 void kmap_init(void);
 
 #endif
--- a/arch/xtensa/mm/highmem.c
+++ b/arch/xtensa/mm/highmem.c
@@ -12,8 +12,6 @@
 #include <linux/highmem.h>
 #include <asm/tlbflush.h>
 
-static pte_t *kmap_pte;
-
 #if DCACHE_WAY_SIZE > PAGE_SIZE
 unsigned int last_pkmap_nr_arr[DCACHE_N_COLORS];
 wait_queue_head_t pkmap_map_wait_arr[DCACHE_N_COLORS];
@@ -37,55 +35,21 @@ static inline enum fixed_addresses kmap_
 		color;
 }
 
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
+enum fixed_addresses kmap_local_map_idx(int type, unsigned long pfn)
 {
-	enum fixed_addresses idx;
-	unsigned long vaddr;
-
-	idx = kmap_idx(kmap_atomic_idx_push(),
-		       DCACHE_ALIAS(page_to_phys(page)));
-	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-#ifdef CONFIG_DEBUG_HIGHMEM
-	BUG_ON(!pte_none(*(kmap_pte + idx)));
-#endif
-	set_pte(kmap_pte + idx, mk_pte(page, prot));
-
-	return (void *)vaddr;
+	return kmap_idx(type, DCACHE_ALIAS(pfn << PAGE_SHIFT);
 }
-EXPORT_SYMBOL(kmap_atomic_high_prot);
 
-void kunmap_atomic_high(void *kvaddr)
+enum fixed_addresses kmap_local_unmap_idx(int type, unsigned long addr)
 {
-	if (kvaddr >= (void *)FIXADDR_START &&
-	    kvaddr < (void *)FIXADDR_TOP) {
-		int idx = kmap_idx(kmap_atomic_idx(),
-				   DCACHE_ALIAS((unsigned long)kvaddr));
-
-		/*
-		 * Force other mappings to Oops if they'll try to access this
-		 * pte without first remap it.  Keeping stale mappings around
-		 * is a bad idea also, in case the page changes cacheability
-		 * attributes or becomes a protected page in a hypervisor.
-		 */
-		pte_clear(&init_mm, kvaddr, kmap_pte + idx);
-		local_flush_tlb_kernel_range((unsigned long)kvaddr,
-					     (unsigned long)kvaddr + PAGE_SIZE);
-
-		kmap_atomic_idx_pop();
-	}
+	return kmap_idx(type, DCACHE_ALIAS(addr));
 }
-EXPORT_SYMBOL(kunmap_atomic_high);
 
 void __init kmap_init(void)
 {
-	unsigned long kmap_vstart;
-
 	/* Check if this memory layout is broken because PKMAP overlaps
 	 * page table.
 	 */
 	BUILD_BUG_ON(PKMAP_BASE < TLBTEMP_BASE_1 + TLBTEMP_SIZE);
-	/* cache the first kmap pte */
-	kmap_vstart = __fix_to_virt(FIX_KMAP_BEGIN);
-	kmap_pte = virt_to_kpte(kmap_vstart);
 	kmap_waitqueues_init();
 }

