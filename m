Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26841270CAB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 11:53:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtmHL2GdKzDqvW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 19:53:34 +1000 (AEST)
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
 header.s=2020 header.b=xblMuftY; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=vAoFl7Wc; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtmCP0sjhzDqjx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 19:50:08 +1000 (AEST)
Message-Id: <20200919092615.990731525@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=S6KU1KWy/lGVQn652M3xMcWy5K0UgzlQ/mgAGCWt/lM=;
 b=xblMuftY5jYyMH/el6sRH9mxt5PCM3leR1q+j20zh6Qql3nR4u9Uk2grBk636h93mnObTk
 n3uaG8DEiNSY5czxHesoexZ1obJp/nfx+0xFZlyPr/88FELlLh8aq2ETLXkEosvS+DA96/
 Efe54gqO4hMysb28uBpcoFDWM5vODoNsM6y8u6j/psb0Udypt9f5G8CMxQbGT7xKq8vaab
 0Ss2WcAapYfAvFMhYmpzjaeK6b6MRfYkid7ZQcHDr4AwQXfcpTKa4QckAnh4VnptYPbomu
 pZ+HLbr36Iy6WEPhRzNUxwU/+TJ9ZtZBFUmERW4W8EFnHp8O/GjF7YDG6eUY+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=S6KU1KWy/lGVQn652M3xMcWy5K0UgzlQ/mgAGCWt/lM=;
 b=vAoFl7WcLR80EJSWSGOYXyydz95Bve1rLLlT6/9fA8CNv7nsOR4a+j4hsc6vsrmWpFiZXu
 cxg34BQOcLaHVrBQ==
Date: Sat, 19 Sep 2020 11:17:53 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 02/15] highmem: Provide generic variant of kmap_atomic*
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

The kmap_atomic* interfaces in all architectures are pretty much the same
except for post map operations (flush) and pre- and post unmap operations.

Provide a generic variant for that.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/highmem.h |   87 ++++++++++++++++++++++++++++-------
 mm/Kconfig              |    3 +
 mm/highmem.c            |  119 +++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 192 insertions(+), 17 deletions(-)

--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -31,9 +31,22 @@ static inline void invalidate_kernel_vma
 
 #include <asm/kmap_types.h>
 
+/*
+ * Outside of CONFIG_HIGHMEM to support X86 32bit iomap_atomic() cruft.
+ */
+#ifdef CONFIG_KMAP_ATOMIC_GENERIC
+void *kmap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot);
+void *kmap_atomic_page_prot(struct page *page, pgprot_t prot);
+void kunmap_atomic_indexed(void *vaddr);
+# ifndef ARCH_NEEDS_KMAP_HIGH_GET
+static inline void *arch_kmap_temporary_high_get(struct page *page)
+{
+	return NULL;
+}
+# endif
+#endif
+
 #ifdef CONFIG_HIGHMEM
-extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
-extern void kunmap_atomic_high(void *kvaddr);
 #include <asm/highmem.h>
 
 #ifndef ARCH_HAS_KMAP_FLUSH_TLB
@@ -81,6 +94,11 @@ static inline void kunmap(struct page *p
  * be used in IRQ contexts, so in some (very limited) cases we need
  * it.
  */
+
+#ifndef CONFIG_KMAP_ATOMIC_GENERIC
+void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
+void kunmap_atomic_high(void *kvaddr);
+
 static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	preempt_disable();
@@ -89,7 +107,38 @@ static inline void *kmap_atomic_prot(str
 		return page_address(page);
 	return kmap_atomic_high_prot(page, prot);
 }
-#define kmap_atomic(page)	kmap_atomic_prot(page, kmap_prot)
+
+static inline void __kunmap_atomic(void *vaddr)
+{
+	kunmap_atomic_high(vaddr);
+	pagefault_enable();
+}
+#else /* !CONFIG_KMAP_ATOMIC_GENERIC */
+
+static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
+{
+	preempt_disable();
+	return kmap_atomic_page_prot(page, prot);
+}
+
+static inline void *kmap_atomic_pfn(unsigned long pfn)
+{
+	preempt_disable();
+	return kmap_atomic_pfn_prot(pfn, kmap_prot);
+}
+
+static inline void __kunmap_atomic(void *addr)
+{
+	kumap_atomic_indexed(addr);
+}
+
+
+#endif /* CONFIG_KMAP_ATOMIC_GENERIC */
+
+static inline void *kmap_atomic(struct page *page)
+{
+	return kmap_atomic_prot(page, kmap_prot);
+}
 
 /* declarations for linux/mm/highmem.c */
 unsigned int nr_free_highpages(void);
@@ -157,21 +206,29 @@ static inline void *kmap_atomic(struct p
 	pagefault_disable();
 	return page_address(page);
 }
-#define kmap_atomic_prot(page, prot)	kmap_atomic(page)
 
-static inline void kunmap_atomic_high(void *addr)
+static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
+{
+	return kmap_atomic(page);
+}
+
+static inline void *kmap_atomic_pfn(unsigned long pfn)
+{
+	return kmap_atomic(pfn_to_page(pfn));
+}
+
+static inline void __kunmap_atomic(void *addr)
 {
 	/*
 	 * Mostly nothing to do in the CONFIG_HIGHMEM=n case as kunmap_atomic()
-	 * handles re-enabling faults + preemption
+	 * handles preemption
 	 */
 #ifdef ARCH_HAS_FLUSH_ON_KUNMAP
 	kunmap_flush_on_unmap(addr);
 #endif
+	pagefault_enable();
 }
 
-#define kmap_atomic_pfn(pfn)	kmap_atomic(pfn_to_page(pfn))
-
 #define kmap_flush_unused()	do {} while(0)
 
 #endif /* CONFIG_HIGHMEM */
@@ -213,14 +270,12 @@ static inline void kmap_atomic_idx_pop(v
  * Prevent people trying to call kunmap_atomic() as if it were kunmap()
  * kunmap_atomic() should get the return value of kmap_atomic, not the page.
  */
-#define kunmap_atomic(addr)                                     \
-do {                                                            \
-	BUILD_BUG_ON(__same_type((addr), struct page *));       \
-	kunmap_atomic_high(addr);                                  \
-	pagefault_enable();                                     \
-	preempt_enable();                                       \
-} while (0)
-
+#define kunmap_atomic(addr)						\
+	do {								\
+		BUILD_BUG_ON(__same_type((addr), struct page *));	\
+		__kunmap_atomic(addr);					\
+		preempt_enable();					\
+	} while (0)
 
 /* when CONFIG_HIGHMEM is not set these will be plain clear/copy_page */
 #ifndef clear_user_highpage
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -868,4 +868,7 @@ config ARCH_HAS_HUGEPD
 config MAPPING_DIRTY_HELPERS
         bool
 
+config KMAP_ATOMIC_GENERIC
+	bool
+
 endmenu
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -314,6 +314,15 @@ void *kmap_high_get(struct page *page)
 	unlock_kmap_any(flags);
 	return (void*) vaddr;
 }
+
+/* Unmap a temporary mapping which was obtained by kmap_high_get() */
+static void kmap_high_unmap_temporary(unsigned long vaddr)
+{
+	if (vaddr >= PKMAP_ADDR(0) && vaddr < PKMAP_ADDR(LAST_PKMAP))
+		kunmap_high(pte_page(pkmap_page_table[PKMAP_NR(vaddr)]));
+}
+#else
+static inline void kmap_high_unmap_temporary(unsigned long vaddr) { }
 #endif
 
 /**
@@ -365,8 +374,116 @@ void kunmap_high(struct page *page)
 	if (need_wakeup)
 		wake_up(pkmap_map_wait);
 }
-
 EXPORT_SYMBOL(kunmap_high);
+#else
+static inline void kmap_high_unmap_temporary(unsigned long vaddr) { }
+#endif /* CONFIG_HIGHMEM */
+
+#ifdef CONFIG_KMAP_ATOMIC_GENERIC
+#ifndef arch_kmap_temp_post_map
+# define arch_kmap_temp_post_map(vaddr, pteval)	do { } while (0)
+#endif
+
+#ifndef arch_kmap_temp_pre_unmap
+# define arch_kmap_temp_pre_unmap(vaddr)	do { } while (0)
+#endif
+
+#ifndef arch_kmap_temp_post_unmap
+# define arch_kmap_temp_post_unmap(vaddr)	do { } while (0)
+#endif
+
+#ifndef arch_kmap_temp_map_idx
+#define arch_kmap_temp_map_idx(type, pfn)	kmap_temp_idx(type)
+#endif
+
+#ifndef arch_kmap_temp_unmap_idx
+#define arch_kmap_temp_unmap_idx(type, vaddr)	kmap_temp_idx(type)
+#endif
+
+static inline int kmap_temp_idx(int type)
+{
+	return type + KM_TYPE_NR * smp_processor_id();
+}
+
+static pte_t *__kmap_pte;
+
+static pte_t *kmap_get_pte(void)
+{
+	if (!__kmap_pte)
+		__kmap_pte = virt_to_kpte(__fix_to_virt(FIX_KMAP_BEGIN));
+	return __kmap_pte;
+}
+
+static void *__kmap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot)
+{
+	pte_t pteval, *kmap_pte = kmap_get_pte();
+	unsigned long vaddr;
+	int idx;
+
+	preempt_disable();
+	idx = arch_kmap_temp_map_idx(kmap_atomic_idx_push(), pfn);
+	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
+	BUG_ON(!pte_none(*(kmap_pte - idx)));
+	pteval = pfn_pte(pfn, prot);
+	set_pte(kmap_pte - idx, pteval);
+	arch_kmap_temp_post_map(vaddr, pteval);
+	preempt_enable();
+
+	return (void *)vaddr;
+}
+
+void *kmap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot)
+{
+	pagefault_disable();
+	return __kmap_atomic_pfn_prot(pfn, prot);
+}
+EXPORT_SYMBOL(kmap_atomic_pfn_prot);
+
+void *kmap_atomic_page_prot(struct page *page, pgprot_t prot)
+{
+	void *kmap;
+
+	pagefault_disable();
+	if (!PageHighMem(page))
+		return page_address(page);
+
+	/* Try kmap_high_get() if architecture has it enabled */
+	kmap = arch_kmap_temporary_high_get(page);
+	if (kmap)
+		return kmap;
+
+	return __kmap_atomic_pfn_prot(page_to_pfn(page), prot);
+}
+EXPORT_SYMBOL(kmap_atomic_page_prot);
+
+void kunmap_atomic_indexed(void *vaddr)
+{
+	unsigned long addr = (unsigned long) vaddr & PAGE_MASK;
+	pte_t *kmap_pte = kmap_get_pte();
+	int idx;
+
+	if (addr < __fix_to_virt(FIX_KMAP_END) ||
+	    addr > __fix_to_virt(FIX_KMAP_BEGIN)) {
+		WARN_ON_ONCE(addr < PAGE_OFFSET);
+
+		/* Handle mappings which were obtained by kmap_high_get() */
+		kmap_high_unmap_temporary(addr);
+		pagefault_enable();
+		return;
+	}
+
+	preempt_disable();
+	idx = arch_kmap_temp_unmap_idx(kmap_atomic_idx(), addr);
+	WARN_ON_ONCE(addr != __fix_to_virt(FIX_KMAP_BEGIN + idx));
+
+	arch_kmap_temp_pre_unmap(addr);
+	pte_clear(&init_mm, addr, kmap_pte - idx);
+	arch_kmap_temp_post_unmap(addr);
+	kmap_atomic_idx_pop();
+	preempt_enable();
+	pagefault_enable();
+}
+EXPORT_SYMBOL(kunmap_atomic_indexed);
 #endif
 
 #if defined(HASHED_PAGE_VIRTUAL)

