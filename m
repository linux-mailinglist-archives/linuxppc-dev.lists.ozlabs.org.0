Return-Path: <linuxppc-dev+bounces-12900-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F22EBBDDA3D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 11:13:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmlkF3PNTz3d9s;
	Wed, 15 Oct 2025 20:13:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760519605;
	cv=none; b=EiHWlHV7HyxO+1wiMQVDyXFyomA7BIa6WMgSFYPxbuDWBXRZiS1iIjtHTHEU8Mn0V/fHuXnYmbRCK1Ft+Dw41tlM0d0PcsOqB3t1Y3SJTpa0cbKJevMyGHgqDKaSpX7uFVEkPUHR6YeXWoAH9+1ROspM2Lw7D/wuBjZSO4GPyf0CW+X53/QcsaTFO/041KscrDp4QPlY+9XtgqTp2E2z6HrfLxU+w3GVegHkmx9YAaSE6Zl88nldUhpRLWq10Zmba6uHIWkFKYgVagjszvd+H4wJOLvdeElYT2Bb+UByr2Z625+k5wS1WIWhxsEXD4qf23x6v9e8hkoBOUiDMrxIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760519605; c=relaxed/relaxed;
	bh=UkOLY0bMOAegRX2PLwNVc1xekduhJqcvNYaejGV6Jnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AnrLLzrR54dIF4h6rXXNR2RfpGWrEAaS0uCK05Cs5jE7OaVF7D5UgPfvF6PfYEf6qPSWlcCB2NPCtxxFlfylWIMvjLvmAHQhw1l+IOP+t6VrodZMypu414tfJWrKDQJWqvLgVbuj7Qt4jCdIjPC4W5YrmnDv1rq5NDE6KsfMuTFXsICpU9LWkVlQpvVdJa/2yp+kcIES571V5RhUCILIauES/PVhHMgvQturBQvbOUH3segnipRL9GoR8dJj3XUdk1DZTyVfcTXfvoKZsaJrNT5Mc3A2qfQFNX4NCp8YUUOOHJD2JN91lIPyfUW4ixgn3j2E1cqr1ahzYn+nO9Fslg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qIrMBqnu; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qIrMBqnu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmlkD4gnFz3d9q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 20:13:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFF4940246;
	Wed, 15 Oct 2025 09:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DE5C19421;
	Wed, 15 Oct 2025 09:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519602;
	bh=VnMG1AI6BvgRLCN60ENFie/apQCA7LYrL0xFWoo7RpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qIrMBqnuHuFqyNXyGEUvjAWSrGuP7BHKNjv3W6RybkmzvAtE/8s4IA/VJ9GgZGWEB
	 7bm6DuwWphduE+9B2nQ+hsAaoABhi1mvrnEwifkp0w0oOcXl5GDl8SFAl/4Hsn2XU3
	 qHwmOdQ7pqCuYsn/djnTr4K19DmpdZaqVnSDdvaMvNqskBH0ZJwkuOQDubU0sCtpq5
	 W+VFnqQwdlPVM8EnzBLjjI3VgMDfGi1EtCEG8d7wYwOwwWXwNpe/pcGzB9IKEGu2uL
	 HHQzw8zSVXRKXjzRor9TvOjzpRxPPnksJzz0TpmzYizTMT+05dps2oNMrK/FjdOH2y
	 mqyatvpalS22Q==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v5 05/14] xen: swiotlb: Switch to physical address mapping callbacks
Date: Wed, 15 Oct 2025 12:12:51 +0300
Message-ID: <20251015-remove-map-page-v5-5-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Leon Romanovsky <leonro@nvidia.com>

Combine resource and page mappings routines to one function
and remove .map_resource/.unmap_resource callbacks completely.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/xen/swiotlb-xen.c | 63 ++++++++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 34 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index dd7747a2de87..ccf25027bec1 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -200,17 +200,32 @@ xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
  * physical address to use is returned.
  *
  * Once the device is given the dma address, the device owns this memory until
- * either xen_swiotlb_unmap_page or xen_swiotlb_dma_sync_single is performed.
+ * either xen_swiotlb_unmap_phys or xen_swiotlb_dma_sync_single is performed.
  */
-static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
-				unsigned long offset, size_t size,
-				enum dma_data_direction dir,
+static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
+				size_t size, enum dma_data_direction dir,
 				unsigned long attrs)
 {
-	phys_addr_t map, phys = page_to_phys(page) + offset;
-	dma_addr_t dev_addr = xen_phys_to_dma(dev, phys);
+	dma_addr_t dev_addr;
+	phys_addr_t map;
 
 	BUG_ON(dir == DMA_NONE);
+
+	if (attrs & DMA_ATTR_MMIO) {
+		if (unlikely(!dma_capable(dev, phys, size, false))) {
+			dev_err_once(
+				dev,
+				"DMA addr %pa+%zu overflow (mask %llx, bus limit %llx).\n",
+				&phys, size, *dev->dma_mask,
+				dev->bus_dma_limit);
+			WARN_ON_ONCE(1);
+			return DMA_MAPPING_ERROR;
+		}
+		return phys;
+	}
+
+	dev_addr = xen_phys_to_dma(dev, phys);
+
 	/*
 	 * If the address happens to be in the device's DMA window,
 	 * we can safely return the device addr and not worry about bounce
@@ -257,13 +272,13 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 
 /*
  * Unmap a single streaming mode DMA translation.  The dma_addr and size must
- * match what was provided for in a previous xen_swiotlb_map_page call.  All
+ * match what was provided for in a previous xen_swiotlb_map_phys call.  All
  * other usages are undefined.
  *
  * After this call, reads by the cpu to the buffer are guaranteed to see
  * whatever the device wrote there.
  */
-static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
+static void xen_swiotlb_unmap_phys(struct device *hwdev, dma_addr_t dev_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	phys_addr_t paddr = xen_dma_to_phys(hwdev, dev_addr);
@@ -325,7 +340,7 @@ xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 
 /*
  * Unmap a set of streaming mode DMA translations.  Again, cpu read rules
- * concerning calls here are the same as for swiotlb_unmap_page() above.
+ * concerning calls here are the same as for swiotlb_unmap_phys() above.
  */
 static void
 xen_swiotlb_unmap_sg(struct device *hwdev, struct scatterlist *sgl, int nelems,
@@ -337,7 +352,7 @@ xen_swiotlb_unmap_sg(struct device *hwdev, struct scatterlist *sgl, int nelems,
 	BUG_ON(dir == DMA_NONE);
 
 	for_each_sg(sgl, sg, nelems, i)
-		xen_swiotlb_unmap_page(hwdev, sg->dma_address, sg_dma_len(sg),
+		xen_swiotlb_unmap_phys(hwdev, sg->dma_address, sg_dma_len(sg),
 				dir, attrs);
 
 }
@@ -352,8 +367,8 @@ xen_swiotlb_map_sg(struct device *dev, struct scatterlist *sgl, int nelems,
 	BUG_ON(dir == DMA_NONE);
 
 	for_each_sg(sgl, sg, nelems, i) {
-		sg->dma_address = xen_swiotlb_map_page(dev, sg_page(sg),
-				sg->offset, sg->length, dir, attrs);
+		sg->dma_address = xen_swiotlb_map_phys(dev, sg_phys(sg),
+				sg->length, dir, attrs);
 		if (sg->dma_address == DMA_MAPPING_ERROR)
 			goto out_unmap;
 		sg_dma_len(sg) = sg->length;
@@ -392,25 +407,6 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 	}
 }
 
-static dma_addr_t xen_swiotlb_direct_map_resource(struct device *dev,
-						  phys_addr_t paddr,
-						  size_t size,
-						  enum dma_data_direction dir,
-						  unsigned long attrs)
-{
-	dma_addr_t dma_addr = paddr;
-
-	if (unlikely(!dma_capable(dev, dma_addr, size, false))) {
-		dev_err_once(dev,
-			     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
-			     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
-		WARN_ON_ONCE(1);
-		return DMA_MAPPING_ERROR;
-	}
-
-	return dma_addr;
-}
-
 /*
  * Return whether the given device DMA address mask can be supported
  * properly.  For example, if your device can only drive the low 24-bits
@@ -437,13 +433,12 @@ const struct dma_map_ops xen_swiotlb_dma_ops = {
 	.sync_sg_for_device = xen_swiotlb_sync_sg_for_device,
 	.map_sg = xen_swiotlb_map_sg,
 	.unmap_sg = xen_swiotlb_unmap_sg,
-	.map_page = xen_swiotlb_map_page,
-	.unmap_page = xen_swiotlb_unmap_page,
+	.map_phys = xen_swiotlb_map_phys,
+	.unmap_phys = xen_swiotlb_unmap_phys,
 	.dma_supported = xen_swiotlb_dma_supported,
 	.mmap = dma_common_mmap,
 	.get_sgtable = dma_common_get_sgtable,
 	.alloc_pages_op = dma_common_alloc_pages,
 	.free_pages = dma_common_free_pages,
 	.max_mapping_size = swiotlb_max_mapping_size,
-	.map_resource = xen_swiotlb_direct_map_resource,
 };

-- 
2.51.0


