Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07FFAB25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 08:40:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cc365YXBzF62f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 18:40:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+b6a0ef5c1751a0763e03+5925+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="gwEo0ANr"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cby01KqRzF72x
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 18:35:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Er/y4mwtjnKYDshN2Y6bJdu0EODDUK1HpqXVne8W2r8=; b=gwEo0ANrjzcGiiEXsc8eEnSGWj
 XXl8Qi5QvTLJJVVLfydUHDxb7txUIiJIi6Gl+FR/HdXlMP9XwNdc1XBWKGpiI/w0oQqeD3JjcyKt5
 AO3PJWr8PP+T3U5SE9/7Ygavq1tteO9MLQOa3uoEG7yGf+V05jxGuSka6Y47vZPEmPKVIC56bgBc6
 4fxx6oQGl1JGEwj3SGHWk+nQKgr7lGx/l/jUfqZY6s7PXXHHsCJ3MpQTRaKakvMWwCCcgaEBA3QTs
 SR5rYZNFHqMfchn4jLUTdGxtCv5N0OQ7KgmhpGoYPwlYlRzXdioU+84Dp/xOLEeetq4G4I0sEmeAx
 baC9Eq9g==;
Received: from [2001:4bb8:180:3806:c70:4a89:bc61:5] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUnBq-0008Tp-Td; Wed, 13 Nov 2019 07:35:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 iommu@lists.linux-foundation.org, Russell King <linux@armlinux.org.uk>
Subject: [PATCH 2/3] dma-direct: avoid a forward declaration for phys_to_dma
Date: Wed, 13 Nov 2019 08:35:38 +0100
Message-Id: <20191113073539.9660-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113073539.9660-1-hch@lst.de>
References: <20191113073539.9660-1-hch@lst.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move dma_capable down a bit so that we don't need a forward declaration
for phys_to_dma.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-direct.h | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 991f8aa2676e..f8959f75e496 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -6,8 +6,6 @@
 #include <linux/memblock.h> /* for min_low_pfn */
 #include <linux/mem_encrypt.h>
 
-static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr);
-
 #ifdef CONFIG_ARCH_HAS_PHYS_TO_DMA
 #include <asm/dma-direct.h>
 #else
@@ -26,20 +24,6 @@ static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
 }
 #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 
-static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
-{
-	dma_addr_t end = addr + size - 1;
-
-	if (!dev->dma_mask)
-		return false;
-
-	if (!IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) &&
-	    min(addr, end) < phys_to_dma(dev, PFN_PHYS(min_low_pfn)))
-		return false;
-
-	return end <= min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
-}
-
 #ifdef CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED
 bool force_dma_unencrypted(struct device *dev);
 #else
@@ -65,6 +49,20 @@ static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
 	return __sme_clr(__dma_to_phys(dev, daddr));
 }
 
+static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
+{
+	dma_addr_t end = addr + size - 1;
+
+	if (!dev->dma_mask)
+		return false;
+
+	if (!IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) &&
+	    min(addr, end) < phys_to_dma(dev, PFN_PHYS(min_low_pfn)))
+		return false;
+
+	return end <= min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
+}
+
 u64 dma_direct_get_required_mask(struct device *dev);
 void *dma_direct_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t gfp, unsigned long attrs);
-- 
2.20.1

