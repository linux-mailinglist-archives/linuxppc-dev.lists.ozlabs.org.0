Return-Path: <linuxppc-dev+bounces-11959-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E77B6B4FCF7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 15:29:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLl5s0hpWz3cyM;
	Tue,  9 Sep 2025 23:29:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757424544;
	cv=none; b=KR4f98z7D/AZOTBSoIDpeupoh3EYtlvIYRFKm+s9VtJ/bXsBr6DFDHsO6N/2bAv7od07v1qeEZyw7IDHUx+DGGXGzvOWWy4D71XQqZX4ljmID2P62XRtOn8pRxlq4BcMFoPZ4llYyYQYxpJWrCXA0uxcQ0jZJGWjlmIhcqC3e1hEE+QApReoK3mXy18nIoDk26Hp4wUT0FfR6GpsuBAqetcCfpSRs3tCXXVhmEIG4gs5EDn4tlD8reSBmWaqASzdwmYtyB3Jp0Ok1OZwpALWG94q3atwjQlYd8vK18B1cewW9KeUDXBTIyqRI2v1E4xnMDWxU0vVje7LQuFX2mZSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757424544; c=relaxed/relaxed;
	bh=Wq5tVW5DvJDE81W0cJJf75vfvzKk8m83klZ2MPhgbjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ca57oysBQsbjlKHaJ97nuNM4v3Sw2iuDgvxgkzn1w4qN1TkYfbkqMaVOrEIz8GR3YeRxWCfyZJx3FSGBXtfbJymYvUQ2pT7ONx9WjcN9SeTFedTVLG4q0g31qQbfJz9uiRLvLbWoq/rlm6XDWzowBC2zHkBBx/6U6wWPGYZdTa4o8/BI+/BfBr9XJkLSxedQzm8bqsCLduox+yJyRzvVzdHBQNQSjw9YfabYUlemylYowfsdPLaRMalWuLvsFa2l/Vsu8OViKuGm+yOMIJ4Fb2pGqjPfonzICUs0US4VFXwC2cpoVN0+c25aT/Etnv01VVJ7t3BKYCmJEA/Hr9+/kQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yn9O7EXt; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yn9O7EXt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLl5r1zG0z3cyL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 23:29:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C5B360230;
	Tue,  9 Sep 2025 13:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA0AC4CEFB;
	Tue,  9 Sep 2025 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757424542;
	bh=OcM9fkdXGiKETEVH8cBKggBd8afyqoLB0RolB6LyNkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yn9O7EXt2i8TlTaF6Sd1iT2ojuajj2KIE2jrl5UhotsRQnaPwquEa2I6cD/7jlt78
	 XzUOKFVinPt3koMpplOVHfrrycPx1YW4URaCTEj9GV17QqK1Icqmm24uElNn4aNE6g
	 dyEXXglk755dAMizt1Low/9xHQbk9wGW/sAxTH/ig1Nx27Rmc511QRKeXmuB4uajDS
	 ry3EbwT8QF9bfs0VlcNQJBaOrGGd32GVtmtPUIlyAl6AFO5fHanUGGe7YyTbMEnZUk
	 af3JTensL0djx/ZctZdYrUUhgTz59dgEpyExsvDCG5MthdUQLFpoXIVWvYnKwiOkhb
	 czV9UQ2BdYnEw==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com,
	Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v6 09/16] dma-mapping: implement DMA_ATTR_MMIO for dma_(un)map_page_attrs()
Date: Tue,  9 Sep 2025 16:27:37 +0300
Message-ID: <3660e2c78ea409d6c483a215858fb3af52cd0ed3.1757423202.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1757423202.git.leonro@nvidia.com>
References: <cover.1757423202.git.leonro@nvidia.com>
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

Make dma_map_page_attrs() and dma_map_page_attrs() respect
DMA_ATTR_MMIO.

DMA_ATR_MMIO makes the functions behave the same as
dma_(un)map_resource():
 - No swiotlb is possible
 - Legacy dma_ops arches use ops->map_resource()
 - No kmsan
 - No arch_dma_map_phys_direct()

The prior patches have made the internal functions called here
support DMA_ATTR_MMIO.

This is also preparation for turning dma_map_resource() into an inline
calling dma_map_phys(DMA_ATTR_MMIO) to consolidate the flows.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 kernel/dma/mapping.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index e47bcf7cc43d7..95eab531e2273 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -158,6 +158,7 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	phys_addr_t phys = page_to_phys(page) + offset;
+	bool is_mmio = attrs & DMA_ATTR_MMIO;
 	dma_addr_t addr;
 
 	BUG_ON(!valid_dma_direction(dir));
@@ -166,14 +167,25 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 		return DMA_MAPPING_ERROR;
 
 	if (dma_map_direct(dev, ops) ||
-	    arch_dma_map_phys_direct(dev, phys + size))
+	    (!is_mmio && arch_dma_map_phys_direct(dev, phys + size)))
 		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
 	else if (use_dma_iommu(dev))
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
-	else
+	else if (is_mmio) {
+		if (!ops->map_resource)
+			return DMA_MAPPING_ERROR;
+
+		addr = ops->map_resource(dev, phys, size, dir, attrs);
+	} else {
+		/*
+		 * The dma_ops API contract for ops->map_page() requires
+		 * kmappable memory, while ops->map_resource() does not.
+		 */
 		addr = ops->map_page(dev, page, offset, size, dir, attrs);
+	}
 
-	kmsan_handle_dma(phys, size, dir);
+	if (!is_mmio)
+		kmsan_handle_dma(phys, size, dir);
 	trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
 	debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
 
@@ -185,14 +197,18 @@ void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
+	bool is_mmio = attrs & DMA_ATTR_MMIO;
 
 	BUG_ON(!valid_dma_direction(dir));
 	if (dma_map_direct(dev, ops) ||
-	    arch_dma_unmap_phys_direct(dev, addr + size))
+	    (!is_mmio && arch_dma_unmap_phys_direct(dev, addr + size)))
 		dma_direct_unmap_phys(dev, addr, size, dir, attrs);
 	else if (use_dma_iommu(dev))
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
-	else
+	else if (is_mmio) {
+		if (ops->unmap_resource)
+			ops->unmap_resource(dev, addr, size, dir, attrs);
+	} else
 		ops->unmap_page(dev, addr, size, dir, attrs);
 	trace_dma_unmap_phys(dev, addr, size, dir, attrs);
 	debug_dma_unmap_phys(dev, addr, size, dir);
-- 
2.51.0


