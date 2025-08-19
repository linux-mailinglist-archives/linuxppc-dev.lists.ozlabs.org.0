Return-Path: <linuxppc-dev+bounces-11143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F186B2CAF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 19:39:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5xdk6DR9z3dKv;
	Wed, 20 Aug 2025 03:38:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755625130;
	cv=none; b=B/9fY/V514K+SJjT4loNotCU8NekthO+NIXM5IkRi1vhdWzkCZvEjyNv4VXo4Sz4iy0wGabjvnt4+xRmRMQ1MevzquU2MWFueSRPbNnFUYZu/BsZtKoOZRXQ2EenevAUP/yWz+HQINac8SN5x+6j5ZtVCeODFsIYv5dSqDlbvQOK8FBHv81gGQFwgbXKtul51ty9dVZxynqXkc5O0/tva6ZMSblcyihiU4+q+Zit+zMJEYvZqyUGuUlJphra8wpmfYwH0hrumIkHHD87WtvACoGwY6qGj9tRhGuRfBZ7fTJLpoGoz74igOxEGM/gYwmEo38t3ry/WgcUMF9aYLdGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755625130; c=relaxed/relaxed;
	bh=R5yI4ppcUgD8Bd1a/05yP97T6Kybd80cY9LOjBBrnlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etw7l6Z7auOsCWO87AyriA1o2k5eD0czlZ06W1M13ms1UNc7GWXx2C0zRJYW+ok0QPZl6Z6HdR85hqyfR5NDso1+24UD7BL26ykmeaIKGyLXrZrKP03rpII+OrmVhWapp/a2KPMHlWuHLCHdVfleQtHF0utVK6Apz8MmLm99qlcxSlOyFnCMgLsyf2JAzoZn3hM7/jAQ3ehgu250T0W/sUjj5aHBaEcIoo+YWYjhGAXoJ+qSWp5gGq83Uy7dIfmrQ87asKp4/+NIDPIJavWN7XhJf3GQFzjQHfk0pYfKSsNvfsEh3UXtBYlpNzyxslENIr59wRHudFqGUToXtT6b4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ATZH+tt0; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ATZH+tt0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5xdk1Qgtz3dKp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 03:38:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7C374552E;
	Tue, 19 Aug 2025 17:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9165BC4CEF1;
	Tue, 19 Aug 2025 17:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755625116;
	bh=O9XZOHlHvjORXmOt4kTIQrFLHTrONFqw1ae8lUbcYw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ATZH+tt0E0CIypcrTSNKTLVbz11CKQWPuWVv8Uj9hFXpVu8WhMldVqGJubdEEOKA5
	 ihrhveF/7PK4ciLaP1743VsR6NY/mkFLhxNufmCXwfsaz906MGNVzEujW1yZCGg7UJ
	 V0f9Op2bM/LDCmIDoTw89nki6nqBzfilToxhqaVR8w0WmvQL8B8EY2oxWuG20cX/6j
	 TL1fryJQsGuMrJZkOQ1NbVtcj71sbARhi2TXWmqIIZ9BTi18mEhP8usOCf32R7gnLD
	 uaTJdR9D9iuPFRWq/Gj2stVOJgLdUiBmlsVIk3TNaKhBqMgGSVJIQ5h9MDirkdjHNx
	 bZTvCl5dJvTcQ==
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
Subject: [PATCH v4 12/16] mm/hmm: migrate to physical address-based DMA mapping API
Date: Tue, 19 Aug 2025 20:36:56 +0300
Message-ID: <18165db0ff83f8222bfd05c4807cda206bec02f7.1755624249.git.leon@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755624249.git.leon@kernel.org>
References: <cover.1755624249.git.leon@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Leon Romanovsky <leonro@nvidia.com>

Convert HMM DMA operations from the legacy page-based API to the new
physical address-based dma_map_phys() and dma_unmap_phys() functions.
This demonstrates the preferred approach for new code that should use
physical addresses directly rather than page+offset parameters.

The change replaces dma_map_page() and dma_unmap_page() calls with
dma_map_phys() and dma_unmap_phys() respectively, using the physical
address that was already available in the code. This eliminates the
redundant page-to-physical address conversion and aligns with the
DMA subsystem's move toward physical address-centric interfaces.

This serves as an example of how new code should be written to leverage
the more efficient physical address API, which provides cleaner interfaces
for drivers that already have access to physical addresses.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 mm/hmm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index d545e2494994..015ab243f081 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -775,8 +775,8 @@ dma_addr_t hmm_dma_map_pfn(struct device *dev, struct hmm_dma_map *map,
 		if (WARN_ON_ONCE(dma_need_unmap(dev) && !dma_addrs))
 			goto error;
 
-		dma_addr = dma_map_page(dev, page, 0, map->dma_entry_size,
-					DMA_BIDIRECTIONAL);
+		dma_addr = dma_map_phys(dev, paddr, map->dma_entry_size,
+					DMA_BIDIRECTIONAL, 0);
 		if (dma_mapping_error(dev, dma_addr))
 			goto error;
 
@@ -819,8 +819,8 @@ bool hmm_dma_unmap_pfn(struct device *dev, struct hmm_dma_map *map, size_t idx)
 		dma_iova_unlink(dev, state, idx * map->dma_entry_size,
 				map->dma_entry_size, DMA_BIDIRECTIONAL, attrs);
 	} else if (dma_need_unmap(dev))
-		dma_unmap_page(dev, dma_addrs[idx], map->dma_entry_size,
-			       DMA_BIDIRECTIONAL);
+		dma_unmap_phys(dev, dma_addrs[idx], map->dma_entry_size,
+			       DMA_BIDIRECTIONAL, 0);
 
 	pfns[idx] &=
 		~(HMM_PFN_DMA_MAPPED | HMM_PFN_P2PDMA | HMM_PFN_P2PDMA_BUS);
-- 
2.50.1


