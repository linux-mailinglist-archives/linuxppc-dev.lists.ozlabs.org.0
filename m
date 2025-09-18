Return-Path: <linuxppc-dev+bounces-12395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 968C4B867AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 20:46:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSPjd6p9mz3cll;
	Fri, 19 Sep 2025 04:46:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758221173;
	cv=none; b=QnqbPFaQElpAvOqjBlzSFmYJMcuZ7Kt558uAdlrvAtT7iTA5mZFbGwLX53azJ/3JlyeKQxta40bfbgts1fyex1GDpp5E9ktFLX+86gF5hggdRaOrn0iOWPvd1iIro/nKfZDSS/g6s4wjItcsHUCZEvcNtkK1R+qsYg+HeUXJHpJPX3q3zKZe2YRh528wbZo+1Om4xzuPjnXAmWfEa9VE+vDuM4crim1LoPQduJHj18LF7Ew3my5PFdwsS2VIaZYhC4NygKB+fBgy/CkE1rLab//jG4Qa1vbWQPLVE4z5WawD6STN/gNK4WnJ/jOhX4krC5oGYz1j1OW3oTrvM6Wniw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758221173; c=relaxed/relaxed;
	bh=PqUci7OKZb5rhYbLe6roHnru9rUzL16Jv9A0eB8jT0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HtEzIwNihqh6gUyaCMRwHHYcfIVQFEoKPDxFsP/ItNoxxgW57z3ft0nV9WS5GzxzcN5YKR/YIhx2M2dE6v7oTY5zdzNJDOVGsbbfb9nkQKlBkuFu64ZjVfR0r54W8Gyd1H+I4Y32H1OUTjKEOWXm0zUjgGPMvR9ojBEpOkTVboMszkxjl+0xf3kBVUluT29eu5Smq0M20nLwzRSMkYWEBIS72tjj+HsOQ7xKocA8xrC+dsq6h2Ln9UfHn2Z2QFAzSHT4E/+NoZbmG/f+qZoBME6+JpUYgvpkSzwwCRWfQGhHvdnSYQ0xJxgvrOA5/cu3nrvtLjvuvX5aPcphuLL59g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XcDUWoml; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XcDUWoml;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSPjd0tZ6z3cYy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 04:46:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4988060207;
	Thu, 18 Sep 2025 18:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BE7C4CEE7;
	Thu, 18 Sep 2025 18:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221171;
	bh=uXtCKxAn4lJIk0uyzU0s1tMehbPq4hSpIpuFU2JE2Qo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XcDUWomlStMMeFZ3/TJvShNKVI2ne4pT3ymiWQxIQ5cB6pCz+OArBrbwKpELnS63X
	 AsFRL1spAgwyeCLnIS2Br262lbJnqBbpCVd4ULOZVZtnj2C10kT6CvJ8n+8JUEAfYP
	 jFqxdtfM+opMXomXA3Ct9jKZuU3nvXXXih1anUIUmeYA2+NA0FUjI4Yl436qNKhCCW
	 Aa/Vm8u8X4+psfEgiqdpsNqbGjvUEPS8JA0bNbKSpeXk0dd7H1N/gfHZ8mh5pUso/C
	 fhMyzuZ9ej7kREv+eyKj/qcU15OhLAX2+3kVxzRJlcJjo/s2nJbBu1ygM503fdcjcp
	 lkA9Tjnlkw/og==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jason Wang <jasowang@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 8/9] xen: swiotlb: Convert mapping routine to rely  on physical address
Date: Thu, 18 Sep 2025 21:45:08 +0300
Message-ID: <bdc496de560c8a62ab934a65ebab4137421c4cb1.1758219787.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758219786.git.leon@kernel.org>
References: <cover.1758219786.git.leon@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Leon Romanovsky <leonro@nvidia.com>

Switch to .map_phys callback instead of .map_page.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/xen/grant-dma-ops.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 29257d2639dbf..7f76e516fe24c 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -163,18 +163,22 @@ static void xen_grant_dma_free_pages(struct device *dev, size_t size,
 	xen_grant_dma_free(dev, size, page_to_virt(vaddr), dma_handle, 0);
 }
 
-static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
-					 unsigned long offset, size_t size,
+static dma_addr_t xen_grant_dma_map_phys(struct device *dev, phys_addr_t phys,
+					 size_t size,
 					 enum dma_data_direction dir,
 					 unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
+	unsigned long offset = offset_in_page(phys);
 	unsigned long dma_offset = xen_offset_in_page(offset),
 			pfn_offset = XEN_PFN_DOWN(offset);
 	unsigned int i, n_pages = XEN_PFN_UP(dma_offset + size);
 	grant_ref_t grant;
 	dma_addr_t dma_handle;
 
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
+
 	if (WARN_ON(dir == DMA_NONE))
 		return DMA_MAPPING_ERROR;
 
@@ -190,7 +194,7 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 
 	for (i = 0; i < n_pages; i++) {
 		gnttab_grant_foreign_access_ref(grant + i, data->backend_domid,
-				pfn_to_gfn(page_to_xen_pfn(page) + i + pfn_offset),
+				pfn_to_gfn(page_to_xen_pfn(phys_to_page(phys)) + i + pfn_offset),
 				dir == DMA_TO_DEVICE);
 	}
 
@@ -199,7 +203,7 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 	return dma_handle;
 }
 
-static void xen_grant_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
+static void xen_grant_dma_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 				     size_t size, enum dma_data_direction dir,
 				     unsigned long attrs)
 {
@@ -242,7 +246,7 @@ static void xen_grant_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
 		return;
 
 	for_each_sg(sg, s, nents, i)
-		xen_grant_dma_unmap_page(dev, s->dma_address, sg_dma_len(s), dir,
+		xen_grant_dma_unmap_phys(dev, s->dma_address, sg_dma_len(s), dir,
 				attrs);
 }
 
@@ -257,7 +261,7 @@ static int xen_grant_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		return -EINVAL;
 
 	for_each_sg(sg, s, nents, i) {
-		s->dma_address = xen_grant_dma_map_page(dev, sg_page(s), s->offset,
+		s->dma_address = xen_grant_dma_map_phys(dev, sg_phys(s),
 				s->length, dir, attrs);
 		if (s->dma_address == DMA_MAPPING_ERROR)
 			goto out;
@@ -286,8 +290,8 @@ static const struct dma_map_ops xen_grant_dma_ops = {
 	.free_pages = xen_grant_dma_free_pages,
 	.mmap = dma_common_mmap,
 	.get_sgtable = dma_common_get_sgtable,
-	.map_page = xen_grant_dma_map_page,
-	.unmap_page = xen_grant_dma_unmap_page,
+	.map_phys = xen_grant_dma_map_phys,
+	.unmap_phys = xen_grant_dma_unmap_phys,
 	.map_sg = xen_grant_dma_map_sg,
 	.unmap_sg = xen_grant_dma_unmap_sg,
 	.dma_supported = xen_grant_dma_supported,
-- 
2.51.0


