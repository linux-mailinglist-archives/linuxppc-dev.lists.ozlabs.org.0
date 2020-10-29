Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2829F8CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 00:02:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMgvQ1FF0zDqv3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 10:02:42 +1100 (AEDT)
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
 header.s=2020 header.b=OGd5ItDy; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=TjFVp80l; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMgDf3kbdzDqYB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 09:32:32 +1100 (AEDT)
Message-Id: <20201029222652.084086429@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604010747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=u8HY47nQ1rEETIi4/9zdfAjblKurxchJCqLvsv7KpOQ=;
 b=OGd5ItDyZBG68g3Q+c21dg4YXqY6AU1fXntD0+4qRXFtAe9myI4S09jA8H5H52VIX6TbEw
 aripnIS0SkNeYd+9JaqJwHgPrF7G/QJzIJsmG3t8J40PuwxNo4M4l462GtszWUqe/bGtPs
 EMM+rXz872Zoer5cxsZcfpRMdIL6T2x6t1VE1Oan43+7K0ue8xxuUk5fWBdH9MPlETFuAR
 YoW9hBRdPZPiPGWDdPc/LK8Wpp0EfGM/tvtHR1KCrHHT+ZmiaZScGhfv5l6MH8jlTjGe9u
 iSt0tQstZ8WNpIvZuQfExYSsXD1wmG497Zjs0XzmNiX4irdf9nzD5T/IQuWKAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604010747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=u8HY47nQ1rEETIi4/9zdfAjblKurxchJCqLvsv7KpOQ=;
 b=TjFVp80l5Qxxiam18N27u7sQ7uvrjLOllX7xFjN/pV6e7D2EkdlFHRvIYC7x8vzRhlstTr
 cTQN3Or0UpEtVZCQ==
Date: Thu, 29 Oct 2020 23:18:21 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 15/18] io-mapping: Cleanup atomic iomap 
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

Switch the atomic iomap implementation over to kmap_local and stick the
preempt/pagefault mechanics into the generic code similar to the
kmap_atomic variants.

Rename the x86 map function in preparation for a non-atomic variant.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: New patch to make review easier
---
 arch/x86/include/asm/iomap.h |    9 +--------
 arch/x86/mm/iomap_32.c       |    6 ++----
 include/linux/io-mapping.h   |    8 ++++++--
 3 files changed, 9 insertions(+), 14 deletions(-)

--- a/arch/x86/include/asm/iomap.h
+++ b/arch/x86/include/asm/iomap.h
@@ -13,14 +13,7 @@
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
 
-void __iomem *iomap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot);
-
-static inline void iounmap_atomic(void __iomem *vaddr)
-{
-	kunmap_local_indexed((void __force *)vaddr);
-	pagefault_enable();
-	preempt_enable();
-}
+void __iomem *__iomap_local_pfn_prot(unsigned long pfn, pgprot_t prot);
 
 int iomap_create_wc(resource_size_t base, unsigned long size, pgprot_t *prot);
 
--- a/arch/x86/mm/iomap_32.c
+++ b/arch/x86/mm/iomap_32.c
@@ -44,7 +44,7 @@ void iomap_free(resource_size_t base, un
 }
 EXPORT_SYMBOL_GPL(iomap_free);
 
-void __iomem *iomap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot)
+void __iomem *__iomap_local_pfn_prot(unsigned long pfn, pgprot_t prot)
 {
 	/*
 	 * For non-PAT systems, translate non-WB request to UC- just in
@@ -60,8 +60,6 @@ void __iomem *iomap_atomic_pfn_prot(unsi
 	/* Filter out unsupported __PAGE_KERNEL* bits: */
 	pgprot_val(prot) &= __default_kernel_pte_mask;
 
-	preempt_disable();
-	pagefault_disable();
 	return (void __force __iomem *)__kmap_local_pfn_prot(pfn, prot);
 }
-EXPORT_SYMBOL_GPL(iomap_atomic_pfn_prot);
+EXPORT_SYMBOL_GPL(__iomap_local_pfn_prot);
--- a/include/linux/io-mapping.h
+++ b/include/linux/io-mapping.h
@@ -69,13 +69,17 @@ io_mapping_map_atomic_wc(struct io_mappi
 
 	BUG_ON(offset >= mapping->size);
 	phys_addr = mapping->base + offset;
-	return iomap_atomic_pfn_prot(PHYS_PFN(phys_addr), mapping->prot);
+	preempt_disable();
+	pagefault_disable();
+	return __iomap_local_pfn_prot(PHYS_PFN(phys_addr), mapping->prot);
 }
 
 static inline void
 io_mapping_unmap_atomic(void __iomem *vaddr)
 {
-	iounmap_atomic(vaddr);
+	kunmap_local_indexed((void __force *)vaddr);
+	pagefault_enable();
+	preempt_enable();
 }
 
 static inline void __iomem *

