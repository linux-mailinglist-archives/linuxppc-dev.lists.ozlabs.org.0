Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 403C42A4492
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 12:51:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQSn81tkSzDqZG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 22:51:56 +1100 (AEDT)
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
 header.s=2020 header.b=ZQhpZJ3+; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=+Tr1EUdB; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQR310sF0zDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 21:33:48 +1100 (AEDT)
Message-Id: <20201103095858.311016780@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=Cjsm5AI/c+3evBtpF2KjlIuXYCPOCd9e8tBiUfMlUaw=;
 b=ZQhpZJ3+kLwAZrJXydOt+PuVIPxDpjWDA6FzsVyeE1usg/G1RiAciJ+g/1ozN8xiuc0c17
 RaNnUX66QFZ6g+/Md+sO3vjst9IGcsoVU4cMn4smorjv2YRBImN1+rgl0ttOs2hSC2+XZZ
 G9avgq7GfrZw2d+qivd3YkgN3zLDG+gLAdqZlsS3S5CYxubpcYtuSYKuMNeCyyLY6xUfaB
 8CXdUxNwL64hRfu9SIduSwb1Bz7FjieyT0n/nq9XHMdRdrdAtLLKERmntXNNZ9KSP0MqyP
 J/oz0kwJPhhq7GeT3Gvrytt4up4s+0ead/gIb6+lkesJN+z2l3Xs3f2lPm0k+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=Cjsm5AI/c+3evBtpF2KjlIuXYCPOCd9e8tBiUfMlUaw=;
 b=+Tr1EUdBI2nqN/XcIr0/XkDukOyzZt/P5QZvNyJzjJ2uWVy7DSbkYWtDbt8rT4wXfOusfx
 pgPkyLWSr37o52Bw==
Date: Tue, 03 Nov 2020 10:27:29 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 17/37] xtensa/mm/highmem: Switch to generic kmap atomic
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
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
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
 Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No reason having the same code in every architecture

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-xtensa@linux-xtensa.org
---
V3: Remove the kmap types cruft
---
 arch/xtensa/Kconfig               |    1 
 arch/xtensa/include/asm/fixmap.h  |    4 +--
 arch/xtensa/include/asm/highmem.h |   12 ++++++++-
 arch/xtensa/mm/highmem.c          |   46 ++++----------------------------------
 4 files changed, 18 insertions(+), 45 deletions(-)

--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -666,6 +666,7 @@ endchoice
 config HIGHMEM
 	bool "High Memory Support"
 	depends on MMU
+	select KMAP_LOCAL
 	help
 	  Linux can use the full amount of RAM in the system by
 	  default. However, the default MMUv2 setup only maps the
--- a/arch/xtensa/include/asm/fixmap.h
+++ b/arch/xtensa/include/asm/fixmap.h
@@ -16,7 +16,7 @@
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
 #include <linux/pgtable.h>
-#include <asm/kmap_types.h>
+#include <asm/kmap_size.h>
 #endif
 
 /*
@@ -39,7 +39,7 @@ enum fixed_addresses {
 	/* reserved pte's for temporary kernel mappings */
 	FIX_KMAP_BEGIN,
 	FIX_KMAP_END = FIX_KMAP_BEGIN +
-		(KM_TYPE_NR * NR_CPUS * DCACHE_N_COLORS) - 1,
+		(KM_MAX_IDX * NR_CPUS * DCACHE_N_COLORS) - 1,
 #endif
 	__end_of_fixed_addresses
 };
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -16,9 +16,8 @@
 #include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 #include <asm/fixmap.h>
-#include <asm/kmap_types.h>
 
-#define PKMAP_BASE		((FIXADDR_START - \
+#define PKMAP_BASE		((FIXADDR_START -			\
 				  (LAST_PKMAP + 1) * PAGE_SIZE) & PMD_MASK)
 #define LAST_PKMAP		(PTRS_PER_PTE * DCACHE_N_COLORS)
 #define LAST_PKMAP_MASK		(LAST_PKMAP - 1)
@@ -68,6 +67,15 @@ static inline void flush_cache_kmaps(voi
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
@@ -33,59 +31,25 @@ static inline void kmap_waitqueues_init(
 
 static inline enum fixed_addresses kmap_idx(int type, unsigned long color)
 {
-	return (type + KM_TYPE_NR * smp_processor_id()) * DCACHE_N_COLORS +
+	return (type + KM_MAX_IDX * smp_processor_id()) * DCACHE_N_COLORS +
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
+	return kmap_idx(type, DCACHE_ALIAS(pfn << PAGE_SHIFT));
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

