Return-Path: <linuxppc-dev+bounces-12391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0542B86776
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 20:46:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSPjJ2752z3cgJ;
	Fri, 19 Sep 2025 04:45:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758221156;
	cv=none; b=PD+KQHfBWiFQtKmZBWsF4XIJCAmHIdICGBmmyZfiiU0kdfcNusHu1nKE/mfCTbTbUhFacMCxLK+jjx3TiXHlh5kYZCJK7czj/rJ2H+VSvgpzyj9Ia/EYCYToJlwvvO2QsNJ/z5Ah/HMMBTl8qztkSku/qIoNwc6558VNW8n3ehqIiWQzc77ND7jerBfxPTLJqQJjx5CRAZHomW5kHr5QmmlhKqoDwEhLXo/T8ZfWMJEpZcHqZrOLYahrdhhi3g6mkTpjx33NyaTjdKpM4GGO9Z9fZ0fidJ4F/N6BKxIKKBptPZy4NsWoTdO9lRzlzuVwfNNRY+Hj3kBr1MZEtObC3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758221156; c=relaxed/relaxed;
	bh=aWaC+c7hwZ5eRPvtgnbBjwtRjkdyMblq8zSMhxF4ppc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/7ueD2oIZJg9k0SpNtugzjuPRb+bZjEQN5sPSUdLW/m7F2TXMQhLItYvxkLDYNV2kof2ESdtUqJM1yYL4zMTQVGBnPfG7Vt2udqu9fjlWqO4RBDUo7sYTbLoFsoJ8h1TyKQ7DquI+S0PpQcOQ4xBLW4MAF9UA3nRO01aWHoPnL7LB8LIDKGUi7ULqTAmKyz2gck702y3E66YKNoMmlLJE7BSt9mnV9M2gfkP/s1KSpDH+ES/nutcNkHExCSr1Xv57V90HdlduLg+KrL9pERhsTc6h2dDNEF2fhuXFtDnb7f3a3efPBYelqCFFwUpmjRgccK6zD+/aoj0F1+sYCDCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ApQAftbQ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ApQAftbQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSPjH3Ycwz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 04:45:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2518444D6;
	Thu, 18 Sep 2025 18:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED33C4CEF1;
	Thu, 18 Sep 2025 18:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221152;
	bh=t2K4sW07xLmohMbEHNKuCoco8SWkCKi7+Pye3QSpGNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ApQAftbQR/jnJU2HzvT/hfBSzMBH8l9oVxYJvIJILBwOkF6XJJC/bSesqHAbmBP6u
	 P4kPqKENM/py7u+cYWOMrhH3+pE/5jyp4qqyE4UDzVb5l/1iNNb4ImC6JoUa2UrQ9g
	 HoDSVJ65VO2VyCLe7wSh33JQyAtAUnbol0LakPZkT5VHxvJDQfwyo07wdmIvS+pi4k
	 JMnu0sgJrSZKHOTVtah/XqsI+nbf7OeODzaRmr6BIlvfuaSaKWkBbjh/9OLnt/fQR+
	 lKPYEZvVCBIvFLx87aT6KZk9bOv12pyvRFyBIive/3aZYoD0fFeZBsrH9oOTiFNFcj
	 4zp+LosB4q3Vw==
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
Subject: [PATCH 6/9] x86: Use physical address for DMA mapping
Date: Thu, 18 Sep 2025 21:45:06 +0300
Message-ID: <d79efd8add2678d883d79aedda68d54add61d3ec.1758219787.git.leon@kernel.org>
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

Perform mechanical conversion from DMA .map_page to .map_phys.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/x86/kernel/amd_gart_64.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index 3485d419c2f5e..f1ffdc0e4a3ab 100644
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
+	if (attrs & DMA_ATTR_MMIO)
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


