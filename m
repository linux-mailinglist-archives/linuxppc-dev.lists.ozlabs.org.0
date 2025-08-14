Return-Path: <linuxppc-dev+bounces-11021-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D65B26E19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 19:55:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2tDG6Ns2z3blF;
	Fri, 15 Aug 2025 03:54:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755194078;
	cv=none; b=Zi5P8ImOrXxVnSnHQeormmXCvaBqLyzz+SbF7AyUighrp75AWbHqFQs2Db6Kpnwqpz4f2kYpmTO0mfVbo79Z031y8zuNj1QKT+0QtFK7S3riCYAjHKYO6Q6KVuAWyWUGq8UwOP37C23rA/nQ9tmJTbUBuvxKWa7wrYMON1T6kexnH8Suxy9b8i6TgxIj3VztrbTmjRqG4mL1k/sK5/7ZkORtGJ3oGp6PJk07yXoNt+FYIGCQkNPVV4yf+nxT6d/Yiai23APWlT5IKdj+iyMWfSmNX4aLEY7TU61OfzevA2C8tqmkVBqYp8u6Qnqc8IVrToURxOuLUbcIo45xosAIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755194078; c=relaxed/relaxed;
	bh=KfgzUojTM/DB/MYkk7DA2Hi+SCW1x3wlstgTHhLqb3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVHbUa+djpiE3fcfEaTkpzdgvB/f8piU1t05QWWgaOmefCq263KFysQQVIWpiA1KI2DF1bYesxEuy+FdlT9fUyYeiU0804L402iCKu+23MKseguCBbbLp2FXxaUFIx9Kedr9EVA4i1ljUiDoiKHwpnGxJpwLAibascuQ4XGMH6PFmyF77e/ObANblj770j90QCFqav4C7l17I9EHQI1HTldtxluAWDTbHkHYRzNVY7i0xcsf4V4Zr5u80Yh+cu1adUbX1+D74uTaygLQFHcrblcVo8GL7inApPmrLCPvvYGa+aYmWV7BVm9DP7Lts2bPYVa+nKrkYBSfA1ljUX7Eag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pIdx8ZwA; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pIdx8ZwA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2tDG1xTRz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 03:54:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 731A16112C;
	Thu, 14 Aug 2025 17:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FB6C4CEF1;
	Thu, 14 Aug 2025 17:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755194076;
	bh=mXPBKGOTAXMaA8YnIACrT4VeK6ColaZH6f/lOi0T5+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pIdx8ZwArqOnC8H1WXZmJQviGN3PGljxwaImYvA1qdYzR2oZxq3BM7DrGyd+Zf4kP
	 Rd3GxG3TTrXgG4p3B8bnSvGoXzofBO6pR9DN5xqqJUqBkNiUODxcew5WfU2rcNXmuA
	 msiVJMJNHMiWaw7xktQtXRAejc40yXlJLZHm+8dGVrXFyuKeW1Gzk10A2714lELSbu
	 mW6vabq71pTXUgj0NwjVhP65AQZCzZMov1zm1TCRq9mnHTR7T1OH8xQrOi6VGMm03z
	 QAlg6gJCETG/pVwnhN3rm4ne2MlguCRzIbsgIodAK+qQM4i4CRjQu8fdnlnPNos/O4
	 PwKx8Ppt/xhjA==
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
Subject: [PATCH v3 02/16] iommu/dma: implement DMA_ATTR_MMIO for dma_iova_link().
Date: Thu, 14 Aug 2025 20:53:53 +0300
Message-ID: <62d9a6c3ca03037631f6d0640ebec5fbac41d547.1755193625.git.leon@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755193625.git.leon@kernel.org>
References: <cover.1755193625.git.leon@kernel.org>
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

This will replace the hacky use of DMA_ATTR_SKIP_CPU_SYNC to avoid
touching the possibly non-KVA MMIO memory.

Also correct the incorrect caching attribute for the IOMMU, MMIO
memory should not be cachable inside the IOMMU mapping or it can
possibly create system problems. Set IOMMU_MMIO for DMA_ATTR_MMIO.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index ea2ef53bd4fe..e1185ba73e23 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -724,7 +724,12 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, struct device *dev
 static int dma_info_to_prot(enum dma_data_direction dir, bool coherent,
 		     unsigned long attrs)
 {
-	int prot = coherent ? IOMMU_CACHE : 0;
+	int prot;
+
+	if (attrs & DMA_ATTR_MMIO)
+		prot = IOMMU_MMIO;
+	else
+		prot = coherent ? IOMMU_CACHE : 0;
 
 	if (attrs & DMA_ATTR_PRIVILEGED)
 		prot |= IOMMU_PRIV;
@@ -1838,12 +1843,13 @@ static int __dma_iova_link(struct device *dev, dma_addr_t addr,
 		unsigned long attrs)
 {
 	bool coherent = dev_is_dma_coherent(dev);
+	int prot = dma_info_to_prot(dir, coherent, attrs);
 
-	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
 		arch_sync_dma_for_device(phys, size, dir);
 
 	return iommu_map_nosync(iommu_get_dma_domain(dev), addr, phys, size,
-			dma_info_to_prot(dir, coherent, attrs), GFP_ATOMIC);
+			prot, GFP_ATOMIC);
 }
 
 static int iommu_dma_iova_bounce_and_link(struct device *dev, dma_addr_t addr,
@@ -1949,9 +1955,13 @@ int dma_iova_link(struct device *dev, struct dma_iova_state *state,
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


