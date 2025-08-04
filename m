Return-Path: <linuxppc-dev+bounces-10572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6BAB1A1A0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 14:43:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwbnj2cFTz3bjG;
	Mon,  4 Aug 2025 22:43:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754311401;
	cv=none; b=WW5PdXou4uShML1mVGpKpIJ8M9BJyNmfnM8uxMaep4OlxnGVJjJEcXkUHj7S2lhiXHuM5KK5X10Luaao43cAkazURM//S9xdhH2BEipUzfnT9XWlSxj2T4nsiRaL0eQ3SzURoQrUrsjPpUBdbG5bx03EwalF0KC4CN97oJN7TdaR8kgCAVfWBPW6rKWD24OQDGHqJBa5b4y4IfeU4YaFja52Y+7afuwX+VoaC11qrK7hOPOX2XEUa6S3QV1My0qiSNFvS5+aJw95LsQUkyp38dITEpOOHHFn6DYeJpqNMb6rBlsMAcp0rBSYj3kaqe1E1GRfB0T4pYofLeNqT8FcTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754311401; c=relaxed/relaxed;
	bh=4AS9Yc3IoSR3Vqk1MHpbcTKCwde8JIMHurGCZB+n6Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHzAmOyPELh3gtOxWuUe4KHzSis6sloMMixYwm/G90zeetLXKJPGzcynqUzgknv2Of7AybAykG0cJx+jqziqnXTpcc57L5i97atJ4kPRKrh1dQCnU8jsV/nR59CXOq0pk65skO5mKhK7XUFFSEo1SLdN/Ju5r+Z6j455V2xzSxQN8Q+j0VnbYXH9dyr8WWX4FORO3DrT7tG6lc4t+LebY6wlC546yMP77Mtif6h6uWJ+vB/UbHuI9dNX5yShgPzBdpT0InbCov/hPwF3x3Lo16iky5NIDsbblKseUiw+sZiUu/xASMxB+c/Tl+Bds4s4wvv96Fg9KkJ10ott+Jut3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QrFIfUaO; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QrFIfUaO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwbnh4lxYz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 22:43:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56FE04423C;
	Mon,  4 Aug 2025 12:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B783C4CEF0;
	Mon,  4 Aug 2025 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754311398;
	bh=rlkoLHmieI8GnOBig0uhL3NMd0vvRWDvv2oEih0mzFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QrFIfUaOpq0zgYoSf2B1eOFHhzxa8uJ9rI7ao3LQ15JdOAmXwx/vS3c+eYH6QTWOC
	 CZmPIb28BNkyQUhEkXmvY3ou31ivX2Y6W+QyRQ5lEcadqA118EYMjd4CMO32TmndIt
	 q9x/mE/Grc0mkPr/feAp0D8366SSjD6FCJuMLM/iEpxRFuKKQJHqb6OZAv8QT4n2gA
	 l8UYQWJxtJiMLDORYH+k0vFOc3W5LIKBdC/UjGKILIXxW7YyF57t2tVDzjmI4Hs2SY
	 Y6Y7brOxqet5SSMB18NQiaM/FfQfmONk81U59gW5ymq8VCTWf5/3zTUjdvPe68z/B6
	 YFqU3TERLKLDQ==
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
Subject: [PATCH v1 02/16] iommu/dma: handle MMIO path in dma_iova_link
Date: Mon,  4 Aug 2025 15:42:36 +0300
Message-ID: <52e39cd31d8f30e54a27afac84ea35f45ae4e422.1754292567.git.leon@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1754292567.git.leon@kernel.org>
References: <cover.1754292567.git.leon@kernel.org>
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

Make sure that CPU is not synced if MMIO path is taken.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index ea2ef53bd4fef..399838c17b705 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1837,13 +1837,20 @@ static int __dma_iova_link(struct device *dev, dma_addr_t addr,
 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
 		unsigned long attrs)
 {
-	bool coherent = dev_is_dma_coherent(dev);
+	int prot;
 
-	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		arch_sync_dma_for_device(phys, size, dir);
+	if (attrs & DMA_ATTR_MMIO)
+		prot = dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO;
+	else {
+		bool coherent = dev_is_dma_coherent(dev);
+
+		if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+			arch_sync_dma_for_device(phys, size, dir);
+		prot = dma_info_to_prot(dir, coherent, attrs);
+	}
 
 	return iommu_map_nosync(iommu_get_dma_domain(dev), addr, phys, size,
-			dma_info_to_prot(dir, coherent, attrs), GFP_ATOMIC);
+			prot, GFP_ATOMIC);
 }
 
 static int iommu_dma_iova_bounce_and_link(struct device *dev, dma_addr_t addr,
@@ -1949,9 +1956,13 @@ int dma_iova_link(struct device *dev, struct dma_iova_state *state,
 		return -EIO;
 
 	if (dev_use_swiotlb(dev, size, dir) &&
-	    iova_unaligned(iovad, phys, size))
+	    iova_unaligned(iovad, phys, size)) {
+		if (attrs & DMA_ATTR_MMIO)
+			return -EPERM;
+
 		return iommu_dma_iova_link_swiotlb(dev, state, phys, offset,
 				size, dir, attrs);
+	}
 
 	return __dma_iova_link(dev, state->addr + offset - iova_start_pad,
 			phys - iova_start_pad,
-- 
2.50.1


