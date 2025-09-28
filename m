Return-Path: <linuxppc-dev+bounces-12603-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D90BA7307
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 17:03:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZSHV55Vcz3cZL;
	Mon, 29 Sep 2025 01:03:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759071782;
	cv=none; b=mtwhsTJGJf++z4K6WcsqTo/KJ4bMApJbdHdTWbn5rumNDYxdybhGtH9nMCSVG7U0rLQ6xwJ4HyATgufraKuTPJTnNHeGu6dLICAq19aN5Zb45iiBRf60dIzAzfMjpWx1xmSNH2EWXQPi4sbXD9MZKzEAtOWZa5gAhT+ECZCvhSW5BiNqVazoobB79Phal0JasXYok5/c8OvoevIWIA6rZ1rLlMbXhMRXctcgjNV6YlzWzYx8OFcljOvEcpNRtwVe6PtrbxDjNUxfZIUd6cOHkcsdB1USXFyjnGtpoXa/DwiKrn67IzthT2VeFxX6VfyDpB94rExMdeMqsmS604uinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759071782; c=relaxed/relaxed;
	bh=c114cwHv94GLwp1HjodtWzwKoSLXmqlkpOaNeqsgQn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ccuATFLFOV+6QaCxmybhMeAOEspfbWOq9Fj/GxGzUG/Bm9wyINmPfQkXn5U2DcYitWeZXTHDy9cEQHONkQX/HuLkzjwclnQglT/JIilM+0i2afUBVPo6iyZFTVmV1ksGYuJ3vtWBdyBMupxmF663Mu6yyFYXWZGUgqUNUVqMQTOiyq0Meg4xeOtSX7CeabIiw/A7GKgkY46Sz2i98qmhwE6nfDngqVeUxAHxtlZ93LSQ7e0H0KE4mdPdQCPhmisFWuwKe6pwQwdkx+ls/9LR8LqITK1R01zsjvs4tTko1ze5N5eSUcxRRLHYTG1/O9/wQL0DhFnay7PsBg+T1YU29g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gLZHsFQQ; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gLZHsFQQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZSHT5zJ5z30V1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 01:03:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0216C6218E;
	Sun, 28 Sep 2025 15:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7E5C4CEF0;
	Sun, 28 Sep 2025 15:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071779;
	bh=rTsxFZePz2yuX+NtfO2kDwccU3HnGAbQvISKF3+oa1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gLZHsFQQ8HQtfOqWgjtzTUBMSHZQ3R4/SOszE4+XoG4l/f2FLRJbyk9ezRQXXc2h8
	 ONJjl8yAKs3hxu8eNi4l+ERA0I3gjnJVzz0YroJWkBOomuoob/TeHDNUoV+39jEb6I
	 rmjhiT1PTSLErsackYjS82wmKYR5VC0J1GfIDBfN1M8bl4dVJUZKKtkNL9qsVq9J8i
	 z2rb1M+mt3pTqkh1QBhu87GzTbDK00LU0Pp8n65VlnXBK70s7NVf1n/VoKncnswPQE
	 fGBCpVF6nMJFCLyCcZjEduuiExQJxRrhtAfRZpFV+iZrHKlwqoLeHvuBYUekHkubmz
	 Jkaop5Zi+ew4Q==
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
Subject: [PATCH v1 6/9] x86: Use physical address for DMA mapping
Date: Sun, 28 Sep 2025 18:02:26 +0300
Message-ID: <d3ce41b94c8facae446c67d85f731c031bb6ff35.1759071169.git.leon@kernel.org>
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

Perform mechanical conversion from DMA .map_page to .map_phys.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/x86/kernel/amd_gart_64.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index 3485d419c2f5..f1ffdc0e4a3a 100644
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


