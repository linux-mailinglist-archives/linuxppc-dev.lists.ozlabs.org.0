Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7438D866DE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 18:20:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464DB31rDCzDqJc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 02:20:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+66be473deb0ef04076c4+5828+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="UTQWvhiK"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464Clm1D44zDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 02:01:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ess16cPXbwlPMdQlB/xmV3Dd8N7gPnmmYAJHlhdUYyM=; b=UTQWvhiKzWRKxbwjgLpwDsLgDC
 mdER2aY5BkjLhbcVD3e7Qn2ZWj8gN9YmhyDOIZXRFaHCOkJqMssGtkgQ6B8/VLEOBirIPphRjIcLq
 tiS8OHDJu2YKmix5fXR8g6vL8uomNeUbO+m/Tuexlii7PxDRAESee02EcVtFUNHSxWkdaEdrhQGi0
 K5xHqvMOWsAMX02BpcU/2C2e4OOxLMReujU0ZBGCPxq2purguCPYY2w0mLbdpOqV00tdd+PU8ms3b
 Vw350H8QjPAmpD/uQ1hyaDUCyLtIOKSt1smGUSm651G33drEHzlSC2shYAz/YSDZpgctQ+GzJKuMh
 Wzl07JIA==;
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hvkqW-0006wr-CU; Thu, 08 Aug 2019 16:00:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 8/8] dma-mapping: remove CONFIG_ARCH_NO_COHERENT_DMA_MMAP
Date: Thu,  8 Aug 2019 19:00:05 +0300
Message-Id: <20190808160005.10325-9-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808160005.10325-1-hch@lst.de>
References: <20190808160005.10325-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
 Vladimir Murzin <vladimir.murzin@arm.com>, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_ARCH_NO_COHERENT_DMA_MMAP is now functionally identical to
!CONFIG_MMU, so remove the separate symbol.  The only difference is that
arm did not set it for !CONFIG_MMU, but arm uses a separate dma mapping
implementation including its own mmap method, which is handled by moving
the CONFIG_MMU check in dma_can_mmap so that is only applies to the
dma-direct case, just as the other ifdefs for it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/Kconfig            |  3 ---
 arch/c6x/Kconfig        |  1 -
 arch/m68k/Kconfig       |  1 -
 arch/microblaze/Kconfig |  1 -
 arch/sh/Kconfig         |  1 -
 arch/xtensa/Kconfig     |  1 -
 kernel/dma/mapping.c    | 12 +++++-------
 7 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index a7b57dd42c26..ec2834206d08 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -790,9 +790,6 @@ config COMPAT_32BIT_TIME
 	  This is relevant on all 32-bit architectures, and 64-bit architectures
 	  as part of compat syscall handling.
 
-config ARCH_NO_COHERENT_DMA_MMAP
-	bool
-
 config ARCH_NO_PREEMPT
 	bool
 
diff --git a/arch/c6x/Kconfig b/arch/c6x/Kconfig
index b4fb61c83494..e65e8d82442a 100644
--- a/arch/c6x/Kconfig
+++ b/arch/c6x/Kconfig
@@ -20,7 +20,6 @@ config C6X
 	select OF_EARLY_FLATTREE
 	select GENERIC_CLOCKEVENTS
 	select MODULES_USE_ELF_RELA
-	select ARCH_NO_COHERENT_DMA_MMAP
 	select MMU_GATHER_NO_RANGE if MMU
 
 config MMU
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index c518d695c376..614b355ae338 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -8,7 +8,6 @@ config M68K
 	select ARCH_HAS_DMA_PREP_COHERENT if HAS_DMA && MMU && !COLDFIRE
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if HAS_DMA
 	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
-	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
 	select ARCH_NO_PREEMPT if !COLDFIRE
 	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
 	select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index d411de05b628..632c9477a0f6 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -9,7 +9,6 @@ config MICROBLAZE
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_MIGHT_HAVE_PC_PARPORT
-	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BUILDTIME_EXTABLE_SORT
 	select TIMER_OF
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 6b1b5941b618..f356ee674d89 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -5,7 +5,6 @@ config SUPERH
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_MIGHT_HAVE_PC_PARPORT
-	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
 	select HAVE_PATA_PLATFORM
 	select CLKDEV_LOOKUP
 	select DMA_DECLARE_COHERENT
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index ebc135bda921..70653aed3005 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -5,7 +5,6 @@ config XTENSA
 	select ARCH_HAS_BINFMT_FLAT if !MMU
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
-	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_FRAME_POINTERS
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 64d1de59e133..fc17016b0871 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -186,7 +186,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs)
 {
-#ifndef CONFIG_ARCH_NO_COHERENT_DMA_MMAP
+#ifdef CONFIG_MMU
 	unsigned long user_count = vma_pages(vma);
 	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
 	unsigned long off = vma->vm_pgoff;
@@ -217,7 +217,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 			user_count << PAGE_SHIFT, vma->vm_page_prot);
 #else
 	return -ENXIO;
-#endif /* !CONFIG_ARCH_NO_COHERENT_DMA_MMAP */
+#endif /* CONFIG_MMU */
 }
 
 /**
@@ -231,12 +231,10 @@ bool dma_can_mmap(struct device *dev)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
-	if (IS_ENABLED(CONFIG_ARCH_NO_COHERENT_DMA_MMAP))
-		return false;
-
 	if (dma_is_direct(ops)) {
-		return dev_is_dma_coherent(dev) ||
-			IS_ENABLED(CONFIG_ARCH_HAS_DMA_COHERENT_TO_PFN);
+		return IS_ENABLED(CONFIG_MMU) &&
+		       (dev_is_dma_coherent(dev) ||
+			IS_ENABLED(CONFIG_ARCH_HAS_DMA_COHERENT_TO_PFN));
 	}
 
 	return ops->mmap != NULL;
-- 
2.20.1

