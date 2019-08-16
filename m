Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E498FBDF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 09:14:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468vhd2M9JzDrWV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 17:14:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+66fbed4ec5b4f711ea06+5836+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="CRP6GQ1L"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468vf948pzzDrcR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 17:12:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M7aCOncE9cdu2lm40wE0sX+3YWUOlwEH41YvffpGGBk=; b=CRP6GQ1Lw34CR/2cSWO1S3ZZo7
 e3qzMt3uC65GaHDy3QSzuRl1aPq3CtXFktR5fKF090cwLGuGBZGa6eAieGRaAnKnpuNfu5cGOn4Tf
 FVjPlPIBzyavJz1TLlKfnWsPNcl0+ZzV951/W6lBM8PV+37b/MZSD/tEOS3Wwr8m51GBht62ZOyFU
 sz7lXUAbthR+KCik65ooNskt93tJYvV69EyKiI2UMWnqSEDzM895lTxZfL/2oEOMUWlZWaQw2DyPt
 PZuyiX/vzX6bI0w3BLRkuuu7yKSXeOODuvIg9eDLOccgfkc0J/tDK1E0fF7L/hCHctEEtVKipkDnM
 aRayUKSA==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hyWPO-0006sq-Qm; Fri, 16 Aug 2019 07:12:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 1/6] MIPS: remove support for DMA_ATTR_WRITE_COMBINE
Date: Fri, 16 Aug 2019 09:07:49 +0200
Message-Id: <20190816070754.15653-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816070754.15653-1-hch@lst.de>
References: <20190816070754.15653-1-hch@lst.de>
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
Cc: Shawn Anastasio <shawn@anastas.io>, Will Deacon <will@kernel.org>,
 linux-m68k@lists.linux-m68k.org, Guan Xuetao <gxt@pku.edu.cn>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mips uses the KSEG1 kernel memory segment do map dma coherent
allocations for non-coherent devices as uncachable, and does not have
any kind of special support for DMA_ATTR_WRITE_COMBINE in the allocation
path.  Thus supporting DMA_ATTR_WRITE_COMBINE in dma_mmap_attrs will
lead to multiple mappings with different caching attributes.

Fixes: 8c172467be36 ("MIPS: Add implementation of dma_map_ops.mmap()")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig              | 1 -
 arch/mips/mm/dma-noncoherent.c | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d50fafd7bf3a..86e6760ef0d0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1119,7 +1119,6 @@ config DMA_PERDEV_COHERENT
 
 config DMA_NONCOHERENT
 	bool
-	select ARCH_HAS_DMA_MMAP_PGPROT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_UNCACHED_SEGMENT
 	select NEED_DMA_MAP_STATE
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index ed56c6fa7be2..1d4d57dd9acf 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -65,14 +65,6 @@ long arch_dma_coherent_to_pfn(struct device *dev, void *cpu_addr,
 	return page_to_pfn(virt_to_page(cached_kernel_address(cpu_addr)));
 }
 
-pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
-		unsigned long attrs)
-{
-	if (attrs & DMA_ATTR_WRITE_COMBINE)
-		return pgprot_writecombine(prot);
-	return pgprot_noncached(prot);
-}
-
 static inline void dma_sync_virt(void *addr, size_t size,
 		enum dma_data_direction dir)
 {
-- 
2.20.1

