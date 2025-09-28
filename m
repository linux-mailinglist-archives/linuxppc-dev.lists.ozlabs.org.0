Return-Path: <linuxppc-dev+bounces-12604-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AC1BA7322
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 17:03:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZSHY4Wkgz3ck4;
	Mon, 29 Sep 2025 01:03:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759071785;
	cv=none; b=ls00a76UqouwaEiAYmpB9EDTRSgg7bSP8Bpbr70hFqTNfuPCPvELq+2wCjVx7zLP9sGXWZvK1A8NELtKMvpGjCBUvFKzg1bJF4KS2M7GTLHFukUHFzR0nd2EZgPZ1DvzRzzsYysBikMu2MRtB9mKh1+/i2P8mEYSy3L2awb4ue37XHiO0EJ+C7vKx8edPcewT/mAhCpUmyFUoVPIspi4ViKyv/aKTuZhWErpi6hl0XkZKKu/UDt/0mTf84JIw/cq8pRdbHPxD7yF87wpY9GaMNEywiIG2YXJ6JljouUJWc5nj3uoqWegNZslSy+srsD2A17GdeEChBWeUvPvtkyArg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759071785; c=relaxed/relaxed;
	bh=eY68ab6biffJ8DQLyEXLbD6NOq1+9heroYHxDvT5S/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EB235sdsUzm5eeErzEx35u0D7Pp5V2te6HK9bZ1CVoajzNjkaMwrK8GR0u+0L5FdZMq9K9GxMACiSC243OJifcxScO9YTals22eTFQBj1sMEOajNcT1e+/kYu6fqSQ2w7Gq2B6AZ1FLGc+7dQoHRAxYv/2qRbka/mwI8VyZR11gldbNNzRszHeU/hw95YSXn3ghHXaiDsVHMAFaxa+L+G0EWs9HynYu0YOdKFqPWu82o8JjvyCma1LKmR7CBArkgoQGLUxZS41ixFz48447YxaizQZOPlYE4p4rqqYtb0uKsCHItDqjr48wlNQ3aGRQ2BWSah0Y9FJMn6JC8YhOpUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fY7jKenQ; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fY7jKenQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZSHX6H7Lz30V1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 01:03:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58E35443D9;
	Sun, 28 Sep 2025 15:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A390C4CEF0;
	Sun, 28 Sep 2025 15:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071783;
	bh=Ij0uTy1OlJGAg7lnkUtDmxO01shTBaaj+uIPzSERgrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fY7jKenQggaIx2jtjZuB6uQLISTNufTm8rMgGJzO07IYL8vO6GWLJYx3TECVsXMXN
	 wBFOb8xnO78E31d0k727L1YDuVOkZOwLaN14A38UC4OIl5z6NwYopVhauUQgN4uYjd
	 Z1j0Hzf/aow0u91fDEfE2ibxWJkzECaGulmiSQijgWdmZvmBETmsJsFYG01wE9kV2V
	 gMBiAQh0oxrYUoXayv5CaRb11u4XY/2FzJUdgEhJ9m38AxCZiSOdfCYSFId/skTbqm
	 odl03w8FwLQt7lISHmEvTFzKcnJaFoaDlCKkL8sjMV3FOlwH3nlebDL4QRSHUhfx6m
	 R/MlI/Ps05Isg==
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
	xen-devel@lists.xenproject.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v1 7/9] vdpa: Convert to physical address DMA mapping
Date: Sun, 28 Sep 2025 18:02:27 +0300
Message-ID: <fafaec3eb3830aa726b86ac7b145763c8be25a8a.1759071169.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759071169.git.leon@kernel.org>
References: <cover.1759071169.git.leon@kernel.org>
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

Use physical address directly in DMA mapping flow.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/vdpa/vdpa_user/iova_domain.c | 11 +++++------
 drivers/vdpa/vdpa_user/iova_domain.h |  8 ++++----
 drivers/vdpa/vdpa_user/vduse_dev.c   | 18 ++++++++++--------
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/vdpa/vdpa_user/iova_domain.c b/drivers/vdpa/vdpa_user/iova_domain.c
index 58116f89d8da..c0ecf01003cd 100644
--- a/drivers/vdpa/vdpa_user/iova_domain.c
+++ b/drivers/vdpa/vdpa_user/iova_domain.c
@@ -396,17 +396,16 @@ void vduse_domain_sync_single_for_cpu(struct vduse_iova_domain *domain,
 	read_unlock(&domain->bounce_lock);
 }
 
-dma_addr_t vduse_domain_map_page(struct vduse_iova_domain *domain,
-				 struct page *page, unsigned long offset,
-				 size_t size, enum dma_data_direction dir,
+dma_addr_t vduse_domain_map_phys(struct vduse_iova_domain *domain,
+				 phys_addr_t pa, size_t size,
+				 enum dma_data_direction dir,
 				 unsigned long attrs)
 {
 	struct iova_domain *iovad = &domain->stream_iovad;
 	unsigned long limit = domain->bounce_size - 1;
-	phys_addr_t pa = page_to_phys(page) + offset;
 	dma_addr_t iova = vduse_domain_alloc_iova(iovad, size, limit);
 
-	if (!iova)
+	if (!iova || (attrs & DMA_ATTR_MMIO))
 		return DMA_MAPPING_ERROR;
 
 	if (vduse_domain_init_bounce_map(domain))
@@ -430,7 +429,7 @@ dma_addr_t vduse_domain_map_page(struct vduse_iova_domain *domain,
 	return DMA_MAPPING_ERROR;
 }
 
-void vduse_domain_unmap_page(struct vduse_iova_domain *domain,
+void vduse_domain_unmap_phys(struct vduse_iova_domain *domain,
 			     dma_addr_t dma_addr, size_t size,
 			     enum dma_data_direction dir, unsigned long attrs)
 {
diff --git a/drivers/vdpa/vdpa_user/iova_domain.h b/drivers/vdpa/vdpa_user/iova_domain.h
index 7f3f0928ec78..7c4546fd856a 100644
--- a/drivers/vdpa/vdpa_user/iova_domain.h
+++ b/drivers/vdpa/vdpa_user/iova_domain.h
@@ -53,12 +53,12 @@ void vduse_domain_sync_single_for_cpu(struct vduse_iova_domain *domain,
 				      dma_addr_t dma_addr, size_t size,
 				      enum dma_data_direction dir);
 
-dma_addr_t vduse_domain_map_page(struct vduse_iova_domain *domain,
-				 struct page *page, unsigned long offset,
-				 size_t size, enum dma_data_direction dir,
+dma_addr_t vduse_domain_map_phys(struct vduse_iova_domain *domain,
+				 phys_addr_t phys, size_t size,
+				 enum dma_data_direction dir,
 				 unsigned long attrs);
 
-void vduse_domain_unmap_page(struct vduse_iova_domain *domain,
+void vduse_domain_unmap_phys(struct vduse_iova_domain *domain,
 			     dma_addr_t dma_addr, size_t size,
 			     enum dma_data_direction dir, unsigned long attrs);
 
diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index 04620bb77203..75aa3c9f83fb 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -834,25 +834,27 @@ static void vduse_dev_sync_single_for_cpu(struct device *dev,
 	vduse_domain_sync_single_for_cpu(domain, dma_addr, size, dir);
 }
 
-static dma_addr_t vduse_dev_map_page(struct device *dev, struct page *page,
-				     unsigned long offset, size_t size,
-				     enum dma_data_direction dir,
+static dma_addr_t vduse_dev_map_phys(struct device *dev, phys_addr_t phys,
+				     size_t size, enum dma_data_direction dir,
 				     unsigned long attrs)
 {
 	struct vduse_dev *vdev = dev_to_vduse(dev);
 	struct vduse_iova_domain *domain = vdev->domain;
 
-	return vduse_domain_map_page(domain, page, offset, size, dir, attrs);
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
+
+	return vduse_domain_map_phys(domain, phys, size, dir, attrs);
 }
 
-static void vduse_dev_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void vduse_dev_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 				size_t size, enum dma_data_direction dir,
 				unsigned long attrs)
 {
 	struct vduse_dev *vdev = dev_to_vduse(dev);
 	struct vduse_iova_domain *domain = vdev->domain;
 
-	return vduse_domain_unmap_page(domain, dma_addr, size, dir, attrs);
+	return vduse_domain_unmap_phys(domain, dma_addr, size, dir, attrs);
 }
 
 static void *vduse_dev_alloc_coherent(struct device *dev, size_t size,
@@ -896,8 +898,8 @@ static size_t vduse_dev_max_mapping_size(struct device *dev)
 static const struct dma_map_ops vduse_dev_dma_ops = {
 	.sync_single_for_device = vduse_dev_sync_single_for_device,
 	.sync_single_for_cpu = vduse_dev_sync_single_for_cpu,
-	.map_page = vduse_dev_map_page,
-	.unmap_page = vduse_dev_unmap_page,
+	.map_phys = vduse_dev_map_phys,
+	.unmap_phys = vduse_dev_unmap_phys,
 	.alloc = vduse_dev_alloc_coherent,
 	.free = vduse_dev_free_coherent,
 	.max_mapping_size = vduse_dev_max_mapping_size,
-- 
2.51.0


