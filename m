Return-Path: <linuxppc-dev+bounces-12607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D196CBA734C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 17:03:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZSHn3h3pz3cnc;
	Mon, 29 Sep 2025 01:03:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759071797;
	cv=none; b=Dmcep8euKRhqhIGomiMfV7LKsYDRyf1vP/neY0hWURhfrJpPmaIfAvmFc3ZJX7wYPTirlCL+WGyv6hBbuMzefIXGov+2jJB4gMhrFT+QXBuE+lf9+6uhH83AV0Re/Voizu2z6614Tiw5cdU+sNZQhHrTCRy5JQ3+PrI99ywedF+exzXzCIN9z9+MjU5T/WtGDCTG5uAxMkA2L3AAL4C5fY5myu8nGHtnjTMcXeeUR9kKaL8qHczE8oRgWRYzRAjmZWAv8RlZPXL7zz409sE2BSxZzwttZ9ya/RgBoVUAlyarJefHPl2wy61Xd42sxw36T7NSCkiHHnV5rUYuj2nGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759071797; c=relaxed/relaxed;
	bh=sTuMRoeAhFkusJYiCgFYmc6CFqklXC9sW85WiPHvJyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7lO07vd/inKeaElZQ4bEcvpY3uhz/Gecg9nb4aEQVCtsGHPZHcGTe1TBPK+FaN2aPFSwfuiAOMCdcdA4vRzY1c0wmUwcnyKS3LSsRZeGD1kqiDaVPEODw+7Mv867neL6LgZtFPLnObFpgSaIgdZrZ+dTzs8hhTODng1VMb5l/qzHtMffyp0jaqPF1EVW9bmpm3U5gBJdWMP6IcEAUAkhSrfCVD7mzAxtauxPcOLIFBn7KbaEate4Aaa1leLJIuBZ/VfnARGoMpC8/KovRs8NPqasf4qjVmt2uPOrfMK0QZvgqagLeuWjerdRWrFUml9iAsM4wl1SBCMGyaPMNurNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FsaEhpye; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FsaEhpye;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZSHm4Jb1z3cnS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 01:03:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF484621A8;
	Sun, 28 Sep 2025 15:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1811C116C6;
	Sun, 28 Sep 2025 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071794;
	bh=Nw/X8vX+8f0l2pbMmARhDnsF0lUGz2K7mDJQIwz58Is=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FsaEhpyeGH3xgtFa1Y8w5h7Ts5l82ievUD0lfLRGlqV4tl7HVv9bjHbYliznmCWjs
	 XIswOwbrLhL/lqBZDDpgUGa8gdF4R6bcCbJBPSqa9GRkFwHJMd2nGn9jeZAzizyOfu
	 54DTvGsE/K3wvtVyzMCHvcvGz9R9dmQ3OT+/w0ZCM3FzAhtlqzlY+kCeIKxno1O0Od
	 C1Ih5862x6UMYSCAAaLZ2E1CW3M0tASDzvlC2jUWGNlTgPEIUjab8JpmERGcGq50t3
	 CdD1LnfZcH17lDECmZ4j1WinLIfELZhHuaYwgHhdXOlf+ghx9/qq03uAwI9Cvhcn38
	 JtS6nCcss5SzQ==
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
Subject: [PATCH v1 9/9] dma-mapping: remove unused map_page callback
Date: Sun, 28 Sep 2025 18:02:29 +0300
Message-ID: <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
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

After conversion of arch code to use physical address mapping,
there are no users of .map_page() and .unmap_page() callbacks,
so let's remove them.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/dma-map-ops.h |  7 -------
 kernel/dma/mapping.c        | 12 ------------
 kernel/dma/ops_helpers.c    |  8 +-------
 3 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index a2ec1566aa27..e0a78991fa8a 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -31,13 +31,6 @@ struct dma_map_ops {
 			void *cpu_addr, dma_addr_t dma_addr, size_t size,
 			unsigned long attrs);
 
-	dma_addr_t (*map_page)(struct device *dev, struct page *page,
-			unsigned long offset, size_t size,
-			enum dma_data_direction dir, unsigned long attrs);
-	void (*unmap_page)(struct device *dev, dma_addr_t dma_handle,
-			size_t size, enum dma_data_direction dir,
-			unsigned long attrs);
-
 	dma_addr_t (*map_phys)(struct device *dev, phys_addr_t phys,
 			size_t size, enum dma_data_direction dir,
 			unsigned long attrs);
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 32a85bfdf873..37163eb49f9f 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -171,16 +171,6 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
 	else if (ops->map_phys)
 		addr = ops->map_phys(dev, phys, size, dir, attrs);
-	else if (!is_mmio && ops->map_page) {
-		struct page *page = phys_to_page(phys);
-		size_t offset = offset_in_page(phys);
-
-		/*
-		 * The dma_ops API contract for ops->map_page() requires
-		 * kmappable memory.
-		 */
-		addr = ops->map_page(dev, page, offset, size, dir, attrs);
-	}
 
 	if (!is_mmio)
 		kmsan_handle_dma(phys, size, dir);
@@ -222,8 +212,6 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
 	else if (ops->unmap_phys)
 		ops->unmap_phys(dev, addr, size, dir, attrs);
-	else
-		ops->unmap_page(dev, addr, size, dir, attrs);
 	trace_dma_unmap_phys(dev, addr, size, dir, attrs);
 	debug_dma_unmap_phys(dev, addr, size, dir);
 }
diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
index 1eccbdbc99c1..20caf9cabf69 100644
--- a/kernel/dma/ops_helpers.c
+++ b/kernel/dma/ops_helpers.c
@@ -76,11 +76,8 @@ struct page *dma_common_alloc_pages(struct device *dev, size_t size,
 	if (use_dma_iommu(dev))
 		*dma_handle = iommu_dma_map_phys(dev, phys, size, dir,
 						 DMA_ATTR_SKIP_CPU_SYNC);
-	else if (ops->map_phys)
-		*dma_handle = ops->map_phys(dev, phys, size, dir,
-					    DMA_ATTR_SKIP_CPU_SYNC);
 	else
-		*dma_handle = ops->map_page(dev, page, 0, size, dir,
+		*dma_handle = ops->map_phys(dev, phys, size, dir,
 					    DMA_ATTR_SKIP_CPU_SYNC);
 	if (*dma_handle == DMA_MAPPING_ERROR) {
 		dma_free_contiguous(dev, page, size);
@@ -102,8 +99,5 @@ void dma_common_free_pages(struct device *dev, size_t size, struct page *page,
 	else if (ops->unmap_phys)
 		ops->unmap_phys(dev, dma_handle, size, dir,
 				DMA_ATTR_SKIP_CPU_SYNC);
-	else if (ops->unmap_page)
-		ops->unmap_page(dev, dma_handle, size, dir,
-				DMA_ATTR_SKIP_CPU_SYNC);
 	dma_free_contiguous(dev, page, size);
 }
-- 
2.51.0


