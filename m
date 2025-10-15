Return-Path: <linuxppc-dev+bounces-12901-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB39BDDA57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 11:13:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmlkL2Hr7z3d9q;
	Wed, 15 Oct 2025 20:13:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760519610;
	cv=none; b=ISqM73Hup75Gs3C8kppJgArkCbxyMJv6C6dYEtmtTKLvDaVxa1DwDkI3KvcMEcltC1M0epV8mpl6KOjEjZ212GeBgl/Rn71D5dXaZN8J1N3S1yDJDjhBXwQgof9LU1WWvZYqqxBNZWYXuHcaFwaG1Jc6mau9vVNSXalmeyzVzHf0Cp3LXjAfk0z0Wl96V4xLUCkcjeWIavl7UlAYZznMBRQ+wGofYYGpx9DGpWovqBsI8UuWGnlvqiZgR9yY+kLyenjFgjEjC3wUnVEBAnxTjcQGvEu5/kqx5DNRmJcPP7T/DS20heeROao4z2zkgNakJzWyxBIs6txGGF3K2DlhBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760519610; c=relaxed/relaxed;
	bh=oB3+p/Mv9QvTJS4rOTeBrLOF3LEDsZyakK2v4O50YlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dBt2InH/fSh/6GNSh9bu4B52a0hyZ3RobWbd+F8VlR0OPUOGWtDixTQyJcLksATM/NacniCngiTj4vjUZ06ZjwHZ8Sm7OgZqjKMmAkszrPt0YJxklEGiF5lBDRG9M20mAehdeOeWcCIXC24yx8tgCsdM3wz+dFSR1hYZi6bFy2W1F1CiQTloPePVZ+L1cwpohsvdMYRmhd1tsHvW7oGwaPyAhcqW4cw4tQW5MIf5V4LzlfICMzLgmqb5lst+deCw9n2V+DucPlC45c1XV1J3u6S/Ld7hpSFMckKc0b2OIh5WjcLmN+m84GH9MHPpWVYAglfyRNjtiR56Id08qAFJ8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JiSeBjBU; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JiSeBjBU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmlkK3VNdz3cmK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 20:13:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B57B563BF2;
	Wed, 15 Oct 2025 09:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6168C4CEF8;
	Wed, 15 Oct 2025 09:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519606;
	bh=8N5ZxsYLVcDZve6x5HHk+A1JboM5EKxL5gdSKO7Ns2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiSeBjBUKhVwymer3tPYHzwIFC7GJm10nXZ/10XtCNi51kg88RJS1w18W4pvJ7NeM
	 3OwVmb0T1vu2KwfDWjx1io+HgFyPxO0MgtEwlMotfiJ179Y1QgqMPkRKjDJqt5Ao/+
	 VjZfp9uISkci3ImI/5C8oEZdlj4Z+oNMqJTyULPa769DD302IN/VxJv7rJehAO4LNe
	 KeIuGfTQFzyYPb83xzSoo0Sz6I9iQ3Uy0TnyhPQrAye6SrySQGjy96frRmnA4dlk+5
	 xWdb7xuNoLeNJ5dtzrtaGqkyWLhMMmZy2qZFkbs1eHx+/CfxBpfdsutxVsk+ta+jCH
	 50a30dGZYCtdA==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v5 06/14] dma-mapping: remove unused mapping resource callbacks
Date: Wed, 15 Oct 2025 12:12:52 +0300
Message-ID: <20251015-remove-map-page-v5-6-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
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
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Leon Romanovsky <leonro@nvidia.com>

After ARM and XEN conversions to use physical addresses for the mapping,
there are no in-kernel users for map_resource/unmap_resource callbacks,
so remove them.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/dma-map-ops.h |  6 ------
 kernel/dma/mapping.c        | 16 ++++------------
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 79d2a74d4b49..2e98ecc313a3 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -53,12 +53,6 @@ struct dma_map_ops {
 			enum dma_data_direction dir, unsigned long attrs);
 	void (*unmap_sg)(struct device *dev, struct scatterlist *sg, int nents,
 			enum dma_data_direction dir, unsigned long attrs);
-	dma_addr_t (*map_resource)(struct device *dev, phys_addr_t phys_addr,
-			size_t size, enum dma_data_direction dir,
-			unsigned long attrs);
-	void (*unmap_resource)(struct device *dev, dma_addr_t dma_handle,
-			size_t size, enum dma_data_direction dir,
-			unsigned long attrs);
 	void (*sync_single_for_cpu)(struct device *dev, dma_addr_t dma_handle,
 			size_t size, enum dma_data_direction dir);
 	void (*sync_single_for_device)(struct device *dev,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 4080aebe5deb..32a85bfdf873 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -157,7 +157,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	bool is_mmio = attrs & DMA_ATTR_MMIO;
-	dma_addr_t addr;
+	dma_addr_t addr = DMA_MAPPING_ERROR;
 
 	BUG_ON(!valid_dma_direction(dir));
 
@@ -171,18 +171,13 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
 	else if (ops->map_phys)
 		addr = ops->map_phys(dev, phys, size, dir, attrs);
-	else if (is_mmio) {
-		if (!ops->map_resource)
-			return DMA_MAPPING_ERROR;
-
-		addr = ops->map_resource(dev, phys, size, dir, attrs);
-	} else {
+	else if (!is_mmio && ops->map_page) {
 		struct page *page = phys_to_page(phys);
 		size_t offset = offset_in_page(phys);
 
 		/*
 		 * The dma_ops API contract for ops->map_page() requires
-		 * kmappable memory, while ops->map_resource() does not.
+		 * kmappable memory.
 		 */
 		addr = ops->map_page(dev, page, offset, size, dir, attrs);
 	}
@@ -227,10 +222,7 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
 	else if (ops->unmap_phys)
 		ops->unmap_phys(dev, addr, size, dir, attrs);
-	else if (is_mmio) {
-		if (ops->unmap_resource)
-			ops->unmap_resource(dev, addr, size, dir, attrs);
-	} else
+	else
 		ops->unmap_page(dev, addr, size, dir, attrs);
 	trace_dma_unmap_phys(dev, addr, size, dir, attrs);
 	debug_dma_unmap_phys(dev, addr, size, dir);

-- 
2.51.0


