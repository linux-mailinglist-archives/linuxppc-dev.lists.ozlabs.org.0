Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E2318B10D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 11:18:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jjYR1LMpzDqx5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 21:18:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=OdJZDRE3; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jjWK2gFYzDr9w
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 21:16:58 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F0A850035180F69CBC86220.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:8500:3518:f69:cbc8:6220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 57D8D1EC0CF9;
 Thu, 19 Mar 2020 11:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1584613012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=kyXB3LhXMlYk05dewzUxEywSSYigUP22lYt3Q49KHmI=;
 b=OdJZDRE3k65QjZ/LHJJwYG2FZVA1/4CS3YUasQdlMaNOaQxumloXOafvMddSta9Lmp9mYT
 vOHhz35eEaodYgWkBSGWw9zSLIay3NIjKQV0Ktorq9kwlDXEOdBM9dV+vFpCkOr++q0LUJ
 TjuwZ8g+LaouH+iQR0GtJkZ76x8bYfA=
Date: Thu, 19 Mar 2020 11:16:57 +0100
From: Borislav Petkov <bp@alien8.de>
To: Borislav Petkov <bp@suse.de>
Subject: [PATCH -v2] treewide: Rename "unencrypted" to "decrypted"
Message-ID: <20200319101657.GB13073@zn.tnic>
References: <20200317111822.GA15609@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200317111822.GA15609@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-s390@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

here's v2 with build breakage fixed on ppc and s390 (obviously I can't
grep :-\) and commit message extended to explain more why.

Thx.

---
From: Borislav Petkov <bp@suse.de>
Date: Tue, 17 Mar 2020 12:03:05 +0100

Back then when the whole SME machinery started getting mainlined, it
was agreed that for simplicity, clarity and sanity's sake, the terms
denoting encrypted and not-encrypted memory should be "encrypted" and
"decrypted". And the majority of the code sticks to that convention
except those two. So rename them.

The intent of "encrypted" and "decrypted" is to represent the binary
concept of memory which is encrypted and of memory which is not.

The further differentiation between decrypted and unencrypted memory is
not needed in the code (for now) and therefore keep things simple by
using solely the two terms.

No functional changes.

[ Convert forgotten s390 and ppc function variants. ]
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
---
 arch/powerpc/include/asm/mem_encrypt.h |  2 +-
 arch/powerpc/platforms/pseries/Kconfig |  2 +-
 arch/s390/Kconfig                      |  2 +-
 arch/s390/mm/init.c                    |  2 +-
 arch/x86/Kconfig                       |  2 +-
 arch/x86/mm/mem_encrypt.c              |  4 ++--
 include/linux/dma-direct.h             |  8 ++++----
 kernel/dma/Kconfig                     |  2 +-
 kernel/dma/direct.c                    | 14 +++++++-------
 kernel/dma/mapping.c                   |  2 +-
 10 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/mem_encrypt.h b/arch/powerpc/include/asm/mem_encrypt.h
index ba9dab07c1be..f0705cd3b079 100644
--- a/arch/powerpc/include/asm/mem_encrypt.h
+++ b/arch/powerpc/include/asm/mem_encrypt.h
@@ -15,7 +15,7 @@ static inline bool mem_encrypt_active(void)
 	return is_secure_guest();
 }
 
-static inline bool force_dma_unencrypted(struct device *dev)
+static inline bool force_dma_decrypted(struct device *dev)
 {
 	return is_secure_guest();
 }
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 24c18362e5ea..a78e2c3e1d92 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -151,7 +151,7 @@ config PPC_SVM
 	depends on PPC_PSERIES
 	select SWIOTLB
 	select ARCH_HAS_MEM_ENCRYPT
-	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
+	select ARCH_HAS_FORCE_DMA_DECRYPTED
 	help
 	 There are certain POWER platforms which support secure guests using
 	 the Protected Execution Facility, with the help of an Ultravisor
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 8abe77536d9d..ab1dbb7415b4 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -192,7 +192,7 @@ config S390
 	select VIRT_CPU_ACCOUNTING
 	select ARCH_HAS_SCALED_CPUTIME
 	select HAVE_NMI
-	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
+	select ARCH_HAS_FORCE_DMA_DECRYPTED
 	select SWIOTLB
 	select GENERIC_ALLOCATOR
 
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index ac44bd76db4b..5fed85f9fea6 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -157,7 +157,7 @@ int set_memory_decrypted(unsigned long addr, int numpages)
 }
 
 /* are we a protected virtualization guest? */
-bool force_dma_unencrypted(struct device *dev)
+bool force_dma_decrypted(struct device *dev)
 {
 	return is_prot_virt_guest();
 }
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index beea77046f9b..2ae904f505e1 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1525,7 +1525,7 @@ config AMD_MEM_ENCRYPT
 	depends on X86_64 && CPU_SUP_AMD
 	select DYNAMIC_PHYSICAL_MASK
 	select ARCH_USE_MEMREMAP_PROT
-	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
+	select ARCH_HAS_FORCE_DMA_DECRYPTED
 	---help---
 	  Say yes to enable support for the encryption of system memory.
 	  This requires an AMD processor that supports Secure Memory
diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index a03614bd3e1a..66d09f269e6d 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -350,8 +350,8 @@ bool sev_active(void)
 	return sme_me_mask && sev_enabled;
 }
 
-/* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
-bool force_dma_unencrypted(struct device *dev)
+/* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_DECRYPTED */
+bool force_dma_decrypted(struct device *dev)
 {
 	/*
 	 * For SEV, all DMA must be to unencrypted addresses.
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 24b8684aa21d..9f955844e9c7 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -26,14 +26,14 @@ static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
 }
 #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 
-#ifdef CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED
-bool force_dma_unencrypted(struct device *dev);
+#ifdef CONFIG_ARCH_HAS_FORCE_DMA_DECRYPTED
+bool force_dma_decrypted(struct device *dev);
 #else
-static inline bool force_dma_unencrypted(struct device *dev)
+static inline bool force_dma_decrypted(struct device *dev)
 {
 	return false;
 }
-#endif /* CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED */
+#endif /* CONFIG_ARCH_HAS_FORCE_DMA_DECRYPTED */
 
 /*
  * If memory encryption is supported, phys_to_dma will set the memory encryption
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 4c103a24e380..55c4147bb2b1 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -51,7 +51,7 @@ config ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
 config ARCH_HAS_DMA_PREP_COHERENT
 	bool
 
-config ARCH_HAS_FORCE_DMA_UNENCRYPTED
+config ARCH_HAS_FORCE_DMA_DECRYPTED
 	bool
 
 config DMA_NONCOHERENT_CACHE_SYNC
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index ac7956c38f69..a0576c0ccacd 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -26,7 +26,7 @@ unsigned int zone_dma_bits __ro_after_init = 24;
 static inline dma_addr_t phys_to_dma_direct(struct device *dev,
 		phys_addr_t phys)
 {
-	if (force_dma_unencrypted(dev))
+	if (force_dma_decrypted(dev))
 		return __phys_to_dma(dev, phys);
 	return phys_to_dma(dev, phys);
 }
@@ -49,7 +49,7 @@ static gfp_t __dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
 {
 	u64 dma_limit = min_not_zero(dma_mask, dev->bus_dma_limit);
 
-	if (force_dma_unencrypted(dev))
+	if (force_dma_decrypted(dev))
 		*phys_limit = __dma_to_phys(dev, dma_limit);
 	else
 		*phys_limit = dma_to_phys(dev, dma_limit);
@@ -138,7 +138,7 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 		return NULL;
 
 	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
-	    !force_dma_unencrypted(dev)) {
+	    !force_dma_decrypted(dev)) {
 		/* remove any dirty cache lines on the kernel alias */
 		if (!PageHighMem(page))
 			arch_dma_prep_coherent(page, size);
@@ -179,7 +179,7 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 	}
 
 	ret = page_address(page);
-	if (force_dma_unencrypted(dev))
+	if (force_dma_decrypted(dev))
 		set_memory_decrypted((unsigned long)ret, 1 << get_order(size));
 
 	memset(ret, 0, size);
@@ -190,7 +190,7 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 		ret = uncached_kernel_address(ret);
 	}
 done:
-	if (force_dma_unencrypted(dev))
+	if (force_dma_decrypted(dev))
 		*dma_handle = __phys_to_dma(dev, page_to_phys(page));
 	else
 		*dma_handle = phys_to_dma(dev, page_to_phys(page));
@@ -203,7 +203,7 @@ void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
 	unsigned int page_order = get_order(size);
 
 	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
-	    !force_dma_unencrypted(dev)) {
+	    !force_dma_decrypted(dev)) {
 		/* cpu_addr is a struct page cookie, not a kernel address */
 		dma_free_contiguous(dev, cpu_addr, size);
 		return;
@@ -213,7 +213,7 @@ void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
 	    dma_free_from_pool(cpu_addr, PAGE_ALIGN(size)))
 		return;
 
-	if (force_dma_unencrypted(dev))
+	if (force_dma_decrypted(dev))
 		set_memory_encrypted((unsigned long)cpu_addr, 1 << page_order);
 
 	if (IS_ENABLED(CONFIG_DMA_REMAP) && is_vmalloc_addr(cpu_addr))
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 98e3d873792e..dbd0605a39c5 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -154,7 +154,7 @@ EXPORT_SYMBOL(dma_get_sgtable_attrs);
  */
 pgprot_t dma_pgprot(struct device *dev, pgprot_t prot, unsigned long attrs)
 {
-	if (force_dma_unencrypted(dev))
+	if (force_dma_decrypted(dev))
 		prot = pgprot_decrypted(prot);
 	if (dev_is_dma_coherent(dev) ||
 	    (IS_ENABLED(CONFIG_DMA_NONCOHERENT_CACHE_SYNC) &&
-- 
2.21.0


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
