Return-Path: <linuxppc-dev+bounces-10579-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A88B1A1C0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 14:44:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwbpQ0s98z3bn0;
	Mon,  4 Aug 2025 22:43:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754311438;
	cv=none; b=FL1ubsDcPrt2RJqQnUzU1K6W0liAJlFcVqdw8TKeff0z9FkdVQIzdI6CprQzRzHrLh9LvtPtdF56vU2ShleJnVtuwyp7WKp3KPt/QAdVqA7axc2O4iJzIV6lhNU1TS+w3wWZ03locCGdvqcgpKSaqVrnTTmeEXbUGeXw13VrRJpacfF4/oIGv8F2vVAld28k3VjbuBZ0+1WaGUzyLxLsgCMU45/suyBHD2C02g/NHKOAyzMgbCw0Olv8sOBPjCWojX9BXG4QfRBOBo6VeInEhupaBYi9zjmYlozLb+bdYBsgJNZJytXNamV9f/ktFenFhGJuw5HN8AcCzQhEH2oMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754311438; c=relaxed/relaxed;
	bh=6HioLDHG809Vrmu++exqw36yATpmFSDSvFtTDDJtgR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0xgoOZ+6h/8P1hdC/xlF15/T0jugmNInxSGPSGxW0qg5MxwKhsZ2h+XI9hhAEeyzdjKpUnx7uwn3cWAsDmCLsshG3aHm2DYQg0Owz8GTRRSn4X8PdPoXTha28w7QDIQjurXEOTi/9WhgQ4ntzrcgHY09E9KjHDz2CWv/c2jfD2/nnWcSbIF1CbpRWQTo210bk3puidwYzKSmPiGoOkGO1paiZEKQaA8jMLm+UHpExsD0225hHNjMbmUJS71V++cR4WeJvLjgiGjCRHM/tUkIUrOHUJh745L5rmZex70ssGUsRubZL6e794n7SKVIkHrUiO1DG9B1XGdbTE4lbMn1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ihw3Mu90; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ihw3Mu90;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwbpP1trwz3bpP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 22:43:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52057A55826;
	Mon,  4 Aug 2025 12:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EBCC4CEF0;
	Mon,  4 Aug 2025 12:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754311435;
	bh=j/IXC/mk0CucPDkDZSOLBQ/UHxOlDcVl+SoZNP0e+X0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ihw3Mu90j8p2iuP5oqZQ0qRYRAR/2eX9T50SB8VLM/IpeY+W5wW61GhW3av4wc29C
	 5rQPXs1M+s6jjy1+nIw6SWxZuIavX26CaEl38gSuxVMHKz9Ozga++BdX/JbT+AreaD
	 thi1puaSRP5nUcta2FCkabbmnkHrUDPmtBsN8oUFKF0vUAnM1ZHd3jM+br9WjySLQ8
	 NTL3Vo53fSv59+EK2VgBP0cZFK4osZ7IM6oRQqchl8AnWygksQAVNXy453HYzPo2QW
	 I3SOs53kRy1kdIAph2yeNZ5VK6beeqdsIxQeMAXinFMWTJElchVQzM+2upe9a5Me8M
	 xXtsI8WERuQcg==
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
Subject: [PATCH v1 09/16] dma-mapping: handle MMIO flow in dma_map|unmap_page
Date: Mon,  4 Aug 2025 15:42:43 +0300
Message-ID: <152745932ce4200e4baaedcc59ef45c230e47896.1754292567.git.leon@kernel.org>
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

Extend base DMA page API to handle MMIO flow.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 kernel/dma/mapping.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 709405d46b2b4..f5f051737e556 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -158,6 +158,7 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	phys_addr_t phys = page_to_phys(page) + offset;
+	bool is_mmio = attrs & DMA_ATTR_MMIO;
 	dma_addr_t addr;
 
 	BUG_ON(!valid_dma_direction(dir));
@@ -166,12 +167,23 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
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
+		 * All platforms which implement .map_page() don't support
+		 * non-struct page backed addresses.
+		 */
 		addr = ops->map_page(dev, page, offset, size, dir, attrs);
+	}
+
 	kmsan_handle_dma(phys, size, dir);
 	trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
 	debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
@@ -184,14 +196,18 @@ void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
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
2.50.1


