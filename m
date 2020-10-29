Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4E29F88F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 23:44:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMgVL6VTtzDqdv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 09:44:26 +1100 (AEDT)
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
 header.s=2020 header.b=h5bDqASa; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=qUGB4G8I; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMgDP0hTTzDqX9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 09:32:21 +1100 (AEDT)
Message-Id: <20201029222651.114375025@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604010734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=HnSZZISzS7YHLaWjNBqhnVwkOJGM4uyuebNYkt2dD2Y=;
 b=h5bDqASaJRiw8FTatt1NWMJ1NsBVsKWavB9anSl7SVpd5p52g1JAJSMHeiCJbJ7t5E/WDQ
 lo5agwQi8mlCGBssU8N+6SQ/m8gdsUrJyDSVfl/XL9abKwuajItGXXPXGTHCtGE20Cz2sd
 rCWgtqR8dTl6PWlpd8KNbB8hRWT0khOUoZacONhXdYhTrIIALOF/+GdPCb2i0ejRjfVv2l
 rHXmpoop+1LssPFvuKeXOgTRPyRwBphtIk7tSih4G+KcvPQUfyTy9wLiYnHwMf2kanNUZ3
 gMn0NSIXHFqlSQ1TCkyi/hA3OuYESAxeLSMSN35lQJpya5DiWt5KW6aD6NtppA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604010734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=HnSZZISzS7YHLaWjNBqhnVwkOJGM4uyuebNYkt2dD2Y=;
 b=qUGB4G8IMxu0ZLQ5PIWAx7dEhQA3Wqk8RSi0QcDYGAfZeQ9hWjcWmOwz2v0X9xiOhpcQcf
 yyUJ7Fi+2PVluoCw==
Date: Thu, 29 Oct 2020 23:18:11 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 05/18] arc/mm/highmem: Use generic kmap atomic
 implementation
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-xtensa@linux-xtensa.org,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>, linux-snps-arc@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Greentime Hu <green.hu@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adopt the map ordering to match the other architectures and the generic
code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
---
 arch/arc/Kconfig               |    1 
 arch/arc/include/asm/highmem.h |    8 ++++++-
 arch/arc/mm/highmem.c          |   44 -----------------------------------------
 3 files changed, 9 insertions(+), 44 deletions(-)

--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -507,6 +507,7 @@ config LINUX_RAM_BASE
 config HIGHMEM
 	bool "High Memory Support"
 	select ARCH_DISCONTIGMEM_ENABLE
+	select KMAP_LOCAL
 	help
 	  With ARC 2G:2G address split, only upper 2G is directly addressable by
 	  kernel. Enable this to potentially allow access to rest of 2G and PAE
--- a/arch/arc/include/asm/highmem.h
+++ b/arch/arc/include/asm/highmem.h
@@ -15,7 +15,10 @@
 #define FIXMAP_BASE		(PAGE_OFFSET - FIXMAP_SIZE - PKMAP_SIZE)
 #define FIXMAP_SIZE		PGDIR_SIZE	/* only 1 PGD worth */
 #define KM_TYPE_NR		((FIXMAP_SIZE >> PAGE_SHIFT)/NR_CPUS)
-#define FIXMAP_ADDR(nr)		(FIXMAP_BASE + ((nr) << PAGE_SHIFT))
+
+#define FIX_KMAP_BEGIN		(0)
+#define FIX_KMAP_END		((FIXMAP_SIZE >> PAGE_SHIFT) - 1)
+#define FIXADDR_TOP		(FIXMAP_BASE + FIXMAP_SIZE - PAGE_SIZE)
 
 /* start after fixmap area */
 #define PKMAP_BASE		(FIXMAP_BASE + FIXMAP_SIZE)
@@ -29,6 +32,9 @@
 
 extern void kmap_init(void);
 
+#define arch_kmap_local_post_unmap(vaddr)			\
+	local_flush_tlb_kernel_range(vaddr, vaddr + PAGE_SIZE)
+
 static inline void flush_cache_kmaps(void)
 {
 	flush_cache_all();
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -47,48 +47,6 @@
  */
 
 extern pte_t * pkmap_page_table;
-static pte_t * fixmap_page_table;
-
-void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
-{
-	int idx, cpu_idx;
-	unsigned long vaddr;
-
-	cpu_idx = kmap_atomic_idx_push();
-	idx = cpu_idx + KM_TYPE_NR * smp_processor_id();
-	vaddr = FIXMAP_ADDR(idx);
-
-	set_pte_at(&init_mm, vaddr, fixmap_page_table + idx,
-		   mk_pte(page, prot));
-
-	return (void *)vaddr;
-}
-EXPORT_SYMBOL(kmap_atomic_high_prot);
-
-void kunmap_atomic_high(void *kv)
-{
-	unsigned long kvaddr = (unsigned long)kv;
-
-	if (kvaddr >= FIXMAP_BASE && kvaddr < (FIXMAP_BASE + FIXMAP_SIZE)) {
-
-		/*
-		 * Because preemption is disabled, this vaddr can be associated
-		 * with the current allocated index.
-		 * But in case of multiple live kmap_atomic(), it still relies on
-		 * callers to unmap in right order.
-		 */
-		int cpu_idx = kmap_atomic_idx();
-		int idx = cpu_idx + KM_TYPE_NR * smp_processor_id();
-
-		WARN_ON(kvaddr != FIXMAP_ADDR(idx));
-
-		pte_clear(&init_mm, kvaddr, fixmap_page_table + idx);
-		local_flush_tlb_kernel_range(kvaddr, kvaddr + PAGE_SIZE);
-
-		kmap_atomic_idx_pop();
-	}
-}
-EXPORT_SYMBOL(kunmap_atomic_high);
 
 static noinline pte_t * __init alloc_kmap_pgtable(unsigned long kvaddr)
 {
@@ -113,5 +71,5 @@ void __init kmap_init(void)
 	pkmap_page_table = alloc_kmap_pgtable(PKMAP_BASE);
 
 	BUILD_BUG_ON(LAST_PKMAP > PTRS_PER_PTE);
-	fixmap_page_table = alloc_kmap_pgtable(FIXMAP_BASE);
+	alloc_kmap_pgtable(FIXMAP_BASE);
 }

