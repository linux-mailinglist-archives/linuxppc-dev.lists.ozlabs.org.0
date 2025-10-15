Return-Path: <linuxppc-dev+bounces-12907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D09BDDA96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 11:14:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmlkk6tZLz3dTG;
	Wed, 15 Oct 2025 20:13:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760519630;
	cv=none; b=U2P6Yhll5ohC1nOX2hoce0JI3OI7QPsC9ecOMMV+q23/PuO5haPOynL6+JXi8KqWVB3TJGCQaPVQOqoRUIlTGpME6zTTax9tSSlgb3LRjghO69fu/ueO/4yzc6ISFDXyzTlseNrf5f5UHNnDBdhvY1SJ5LD0782FzOv/tRSUm3Zl89Fa8TdR9S574aCpIHIPU2mlpm05GOZXmr0lZ66xHJIMZBt5r0QJgKszXqKprpTGzPaBIf4xHFqUIgSJhPlHn5T0+zO7xyXjw5JAc2WTeDATzKPOCxr6QrOBMWmWGHI9I/c3CSPUUKxXzGGG9ajGW6+WRQ84qMCPGRD4jRQjag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760519630; c=relaxed/relaxed;
	bh=sre/v2PIJcECdOMDCEV3Iq4dNO+3sWkzLnrrmxn4z08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVYdYWvKJqakR9Nngm92xBM4lN4sXFK1vDiKRZpgww+g5drK6ucHoqn7SIF6mEiyAdzGTE8UHgnQJj+OEv0GqrocbespxlhqnmmXo3tEPDhL7pJ2Fu9rhFQvMYfkebB9ROCl/XT5BBZqMubg0xVi75mYK9AUUg683HvJWWgA/c3y0gTZcySttj5raMJmkZIXankNX8dcZh2GXb43D7iH8ZiAD7KjmJazolegMGKSUIPviU0kbAwG5PXwwP68pJ9OweygkcXrg/Ga/Upuw3KDJkiRs2Jb6f24DyUBsAv3Elxf9UoT9ETYzrjQZiTNHs2p9NdHzUaEL3fgGHK532vxyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j9yhFgPg; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j9yhFgPg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmlkk0Qwqz3dT4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 20:13:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E839962559;
	Wed, 15 Oct 2025 09:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25B0C4CEF8;
	Wed, 15 Oct 2025 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519627;
	bh=zzQXTsnLOGdg76KODINeBFjFs4FSyl4KUo2bG+1GZ8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j9yhFgPgwpVs4tFWOcDRtxYhD6QBmPU5x7MeRpM5LRrV4SFruJeJ2VKVX1hlNzzev
	 RKyxdFpLxe4VxNNS1i19yVfZuvwnTr6N7nozN8QELaDHuFUcpL3uFe4KZ9kZ1Qo5T8
	 lVSnqYkJQXMvInE6HUFHqyIlw2YQz+CdLBulm6tyKPsu65Y3ehdRM9odQAFkbpL0un
	 x1cqSGLjI8L3B3I3mxWUVA6cdGriTZNj1DPjR0stP3cP9PiCRwc932+lC3wrCrzzgD
	 ghjh1wbCy4td07EhnhZgJCk7Oroyhryf2f0kU1EDufHOl+tbg2mWKnvNf9h0EXS+Ck
	 7KY0MmP16+Uvg==
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
Subject: [PATCH v5 12/14] x86: Use physical address for DMA mapping
Date: Wed, 15 Oct 2025 12:12:58 +0300
Message-ID: <20251015-remove-map-page-v5-12-3bbfe3a25cdf@kernel.org>
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

Perform mechanical conversion from DMA .map_page to .map_phys.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/x86/kernel/amd_gart_64.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index 3485d419c2f5..93a06307d953 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -222,13 +222,14 @@ static dma_addr_t dma_map_area(struct device *dev, dma_addr_t phys_mem,
 }
 
 /* Map a single area into the IOMMU */
-static dma_addr_t gart_map_page(struct device *dev, struct page *page,
-				unsigned long offset, size_t size,
-				enum dma_data_direction dir,
+static dma_addr_t gart_map_phys(struct device *dev, phys_addr_t paddr,
+				size_t size, enum dma_data_direction dir,
 				unsigned long attrs)
 {
 	unsigned long bus;
-	phys_addr_t paddr = page_to_phys(page) + offset;
+
+	if (unlikely(attrs & DMA_ATTR_MMIO))
+		return DMA_MAPPING_ERROR;
 
 	if (!need_iommu(dev, paddr, size))
 		return paddr;
@@ -242,7 +243,7 @@ static dma_addr_t gart_map_page(struct device *dev, struct page *page,
 /*
  * Free a DMA mapping.
  */
-static void gart_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void gart_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 			    size_t size, enum dma_data_direction dir,
 			    unsigned long attrs)
 {
@@ -282,7 +283,7 @@ static void gart_unmap_sg(struct device *dev, struct scatterlist *sg, int nents,
 	for_each_sg(sg, s, nents, i) {
 		if (!s->dma_length || !s->length)
 			break;
-		gart_unmap_page(dev, s->dma_address, s->dma_length, dir, 0);
+		gart_unmap_phys(dev, s->dma_address, s->dma_length, dir, 0);
 	}
 }
 
@@ -487,7 +488,7 @@ static void
 gart_free_coherent(struct device *dev, size_t size, void *vaddr,
 		   dma_addr_t dma_addr, unsigned long attrs)
 {
-	gart_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL, 0);
+	gart_unmap_phys(dev, dma_addr, size, DMA_BIDIRECTIONAL, 0);
 	dma_direct_free(dev, size, vaddr, dma_addr, attrs);
 }
 
@@ -668,8 +669,8 @@ static __init int init_amd_gatt(struct agp_kern_info *info)
 static const struct dma_map_ops gart_dma_ops = {
 	.map_sg				= gart_map_sg,
 	.unmap_sg			= gart_unmap_sg,
-	.map_page			= gart_map_page,
-	.unmap_page			= gart_unmap_page,
+	.map_phys			= gart_map_phys,
+	.unmap_phys			= gart_unmap_phys,
 	.alloc				= gart_alloc_coherent,
 	.free				= gart_free_coherent,
 	.mmap				= dma_common_mmap,

-- 
2.51.0


