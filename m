Return-Path: <linuxppc-dev+bounces-12906-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D116DBDDA8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 11:14:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmlkg36Kxz3dSR;
	Wed, 15 Oct 2025 20:13:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760519627;
	cv=none; b=SAM7Yvas6ydPWXR8pgc+53B1MaFJSC/OR/iB6P/Qd+ungKrre/H64VxWM+SNXyCfnhdb0sbM+Mz/8EexnBgArfipqY5Qke0g2ZKIHDm4TZewFhuCv375/0zB2VCCpW+qF078spsqYeCBee5ysfMeTryqr1uGqQKCIFGIJVaqqXKkYAOdW+t5qPjqG0aI1Vw9TRhtvcY2eDhbPwt2WqgCkXF6RoLyhTSw43REeis4HxvvQXP14/XrjjELeseQ9rFzGtf09ianhFEqnmMXazHESGheApaNyNsO03+shUayyxmkPinWJGRYIekybPde/EK6H4U25EPXNMac1ixLyyFzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760519627; c=relaxed/relaxed;
	bh=TJlRyQ1VJm/K2tuHDToeDl7+QCmOoL3L7U1K1RQjuyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B1yHGYFHTW++NogRYpZ0vli3lttiDZ9IKJHxzCyxYVjo0UZIhsA9O5+wkRt++ssS7kSRcIdXA65fAAyXPd5HpThzjIN5Lt/F0Qqi7zzitIMTleKtLgEflxSSOcFS1qK3q/lHkdSimAOMQ43qubRRSU1SuKQ5Gdr+g7ZHIpgYVHVtCy0RCwTqdNz9PN6jyQXQpseUJUZ4yF3O2PS0V/gQOYg1kKr77BXRgRt/4Iev6SBXpM3Wmk2Gbdb0zad6SDFcmksleybk9bkRuT4Ai42LYw2hcqtiJGPtIW7EX9Q+PZwmW7dsGUzJ+e8WEUOIqXP+KytIO7HdGayxCrA3qIDh6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KczTkmrb; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KczTkmrb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmlkf378mz3d9L
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 20:13:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86F3C63BF7;
	Wed, 15 Oct 2025 09:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833DCC4CEFE;
	Wed, 15 Oct 2025 09:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519624;
	bh=VJMEonbngsbL6IpijrzIYHbjAMBroRqSUu3lz2uAAqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KczTkmrb6bYU8Tg9j49OYe6YFKsv5pKXc/7hhZGsvcfW/wQgfV3qMC+lUeGrd2hUc
	 5zpPw/ZMjilS2KzneKF6/BHue7NxPjjRokSrqt0egj3uQim/5oLmDLiV18WAxxuXRH
	 AwmUbgF2eCa2HLDg30cM/Zq+hYSEmp9m66qrcC2r5aS2bBcWr+scUqtrtFkAz3ayhK
	 jdrrQUkifKtfJkBj8o4umhVpXAysn34TBn3haaSXGmxtbq7dyLZthT2Arkgqqtnhit
	 lpWDHniY0RhzMRDC1by7nUOQ3eiURectjDf0dLDCPYQvbXTMlwDVSffrfvAqOW7G12
	 S0FUxgeWE1dDA==
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
	sparclinux@vger.kernel.org
Subject: [PATCH v5 11/14] sparc: Use physical address DMA mapping
Date: Wed, 15 Oct 2025 12:12:57 +0300
Message-ID: <20251015-remove-map-page-v5-11-3bbfe3a25cdf@kernel.org>
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

Convert sparc architecture DMA code to use .map_phys callback.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/sparc/kernel/iommu.c     | 30 +++++++++++++++++-----------
 arch/sparc/kernel/pci_sun4v.c | 31 ++++++++++++++++++-----------
 arch/sparc/mm/io-unit.c       | 38 ++++++++++++++++++-----------------
 arch/sparc/mm/iommu.c         | 46 ++++++++++++++++++++++---------------------
 4 files changed, 82 insertions(+), 63 deletions(-)

diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
index da0363692528..46ef88bc9c26 100644
--- a/arch/sparc/kernel/iommu.c
+++ b/arch/sparc/kernel/iommu.c
@@ -260,26 +260,35 @@ static void dma_4u_free_coherent(struct device *dev, size_t size,
 		free_pages((unsigned long)cpu, order);
 }
 
-static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
-				  unsigned long offset, size_t sz,
-				  enum dma_data_direction direction,
+static dma_addr_t dma_4u_map_phys(struct device *dev, phys_addr_t phys,
+				  size_t sz, enum dma_data_direction direction,
 				  unsigned long attrs)
 {
 	struct iommu *iommu;
 	struct strbuf *strbuf;
 	iopte_t *base;
 	unsigned long flags, npages, oaddr;
-	unsigned long i, base_paddr, ctx;
+	unsigned long i, ctx;
 	u32 bus_addr, ret;
 	unsigned long iopte_protection;
 
+	if (unlikely(attrs & DMA_ATTR_MMIO))
+		/*
+		 * This check is included because older versions of the code
+		 * lacked MMIO path support, and my ability to test this path
+		 * is limited. However, from a software technical standpoint,
+		 * there is no restriction, as the following code operates
+		 * solely on physical addresses.
+		 */
+		goto bad_no_ctx;
+
 	iommu = dev->archdata.iommu;
 	strbuf = dev->archdata.stc;
 
 	if (unlikely(direction == DMA_NONE))
 		goto bad_no_ctx;
 
-	oaddr = (unsigned long)(page_address(page) + offset);
+	oaddr = (unsigned long)(phys_to_virt(phys));
 	npages = IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
 	npages >>= IO_PAGE_SHIFT;
 
@@ -296,7 +305,6 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
 	bus_addr = (iommu->tbl.table_map_base +
 		    ((base - iommu->page_table) << IO_PAGE_SHIFT));
 	ret = bus_addr | (oaddr & ~IO_PAGE_MASK);
-	base_paddr = __pa(oaddr & IO_PAGE_MASK);
 	if (strbuf->strbuf_enabled)
 		iopte_protection = IOPTE_STREAMING(ctx);
 	else
@@ -304,8 +312,8 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
 	if (direction != DMA_TO_DEVICE)
 		iopte_protection |= IOPTE_WRITE;
 
-	for (i = 0; i < npages; i++, base++, base_paddr += IO_PAGE_SIZE)
-		iopte_val(*base) = iopte_protection | base_paddr;
+	for (i = 0; i < npages; i++, base++, phys += IO_PAGE_SIZE)
+		iopte_val(*base) = iopte_protection | phys;
 
 	return ret;
 
@@ -383,7 +391,7 @@ static void strbuf_flush(struct strbuf *strbuf, struct iommu *iommu,
 		       vaddr, ctx, npages);
 }
 
-static void dma_4u_unmap_page(struct device *dev, dma_addr_t bus_addr,
+static void dma_4u_unmap_phys(struct device *dev, dma_addr_t bus_addr,
 			      size_t sz, enum dma_data_direction direction,
 			      unsigned long attrs)
 {
@@ -753,8 +761,8 @@ static int dma_4u_supported(struct device *dev, u64 device_mask)
 static const struct dma_map_ops sun4u_dma_ops = {
 	.alloc			= dma_4u_alloc_coherent,
 	.free			= dma_4u_free_coherent,
-	.map_page		= dma_4u_map_page,
-	.unmap_page		= dma_4u_unmap_page,
+	.map_phys		= dma_4u_map_phys,
+	.unmap_phys		= dma_4u_unmap_phys,
 	.map_sg			= dma_4u_map_sg,
 	.unmap_sg		= dma_4u_unmap_sg,
 	.sync_single_for_cpu	= dma_4u_sync_single_for_cpu,
diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.c
index b720b21ccfbd..791f0a76665f 100644
--- a/arch/sparc/kernel/pci_sun4v.c
+++ b/arch/sparc/kernel/pci_sun4v.c
@@ -352,9 +352,8 @@ static void dma_4v_free_coherent(struct device *dev, size_t size, void *cpu,
 		free_pages((unsigned long)cpu, order);
 }
 
-static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
-				  unsigned long offset, size_t sz,
-				  enum dma_data_direction direction,
+static dma_addr_t dma_4v_map_phys(struct device *dev, phys_addr_t phys,
+				  size_t sz, enum dma_data_direction direction,
 				  unsigned long attrs)
 {
 	struct iommu *iommu;
@@ -362,18 +361,27 @@ static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
 	struct iommu_map_table *tbl;
 	u64 mask;
 	unsigned long flags, npages, oaddr;
-	unsigned long i, base_paddr;
-	unsigned long prot;
+	unsigned long i, prot;
 	dma_addr_t bus_addr, ret;
 	long entry;
 
+	if (unlikely(attrs & DMA_ATTR_MMIO))
+		/*
+		 * This check is included because older versions of the code
+		 * lacked MMIO path support, and my ability to test this path
+		 * is limited. However, from a software technical standpoint,
+		 * there is no restriction, as the following code operates
+		 * solely on physical addresses.
+		 */
+		goto bad;
+
 	iommu = dev->archdata.iommu;
 	atu = iommu->atu;
 
 	if (unlikely(direction == DMA_NONE))
 		goto bad;
 
-	oaddr = (unsigned long)(page_address(page) + offset);
+	oaddr = (unsigned long)(phys_to_virt(phys));
 	npages = IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
 	npages >>= IO_PAGE_SHIFT;
 
@@ -391,7 +399,6 @@ static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
 
 	bus_addr = (tbl->table_map_base + (entry << IO_PAGE_SHIFT));
 	ret = bus_addr | (oaddr & ~IO_PAGE_MASK);
-	base_paddr = __pa(oaddr & IO_PAGE_MASK);
 	prot = HV_PCI_MAP_ATTR_READ;
 	if (direction != DMA_TO_DEVICE)
 		prot |= HV_PCI_MAP_ATTR_WRITE;
@@ -403,8 +410,8 @@ static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
 
 	iommu_batch_start(dev, prot, entry);
 
-	for (i = 0; i < npages; i++, base_paddr += IO_PAGE_SIZE) {
-		long err = iommu_batch_add(base_paddr, mask);
+	for (i = 0; i < npages; i++, phys += IO_PAGE_SIZE) {
+		long err = iommu_batch_add(phys, mask);
 		if (unlikely(err < 0L))
 			goto iommu_map_fail;
 	}
@@ -426,7 +433,7 @@ static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
 	return DMA_MAPPING_ERROR;
 }
 
-static void dma_4v_unmap_page(struct device *dev, dma_addr_t bus_addr,
+static void dma_4v_unmap_phys(struct device *dev, dma_addr_t bus_addr,
 			      size_t sz, enum dma_data_direction direction,
 			      unsigned long attrs)
 {
@@ -686,8 +693,8 @@ static int dma_4v_supported(struct device *dev, u64 device_mask)
 static const struct dma_map_ops sun4v_dma_ops = {
 	.alloc				= dma_4v_alloc_coherent,
 	.free				= dma_4v_free_coherent,
-	.map_page			= dma_4v_map_page,
-	.unmap_page			= dma_4v_unmap_page,
+	.map_phys			= dma_4v_map_phys,
+	.unmap_phys			= dma_4v_unmap_phys,
 	.map_sg				= dma_4v_map_sg,
 	.unmap_sg			= dma_4v_unmap_sg,
 	.dma_supported			= dma_4v_supported,
diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
index d8376f61b4d0..d409cb450de4 100644
--- a/arch/sparc/mm/io-unit.c
+++ b/arch/sparc/mm/io-unit.c
@@ -94,13 +94,14 @@ static int __init iounit_init(void)
 subsys_initcall(iounit_init);
 
 /* One has to hold iounit->lock to call this */
-static unsigned long iounit_get_area(struct iounit_struct *iounit, unsigned long vaddr, int size)
+static dma_addr_t iounit_get_area(struct iounit_struct *iounit,
+				  phys_addr_t phys, int size)
 {
 	int i, j, k, npages;
 	unsigned long rotor, scan, limit;
 	iopte_t iopte;
 
-        npages = ((vaddr & ~PAGE_MASK) + size + (PAGE_SIZE-1)) >> PAGE_SHIFT;
+	npages = (offset_in_page(phys) + size + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
 
 	/* A tiny bit of magic ingredience :) */
 	switch (npages) {
@@ -109,7 +110,7 @@ static unsigned long iounit_get_area(struct iounit_struct *iounit, unsigned long
 	default: i = 0x0213; break;
 	}
 	
-	IOD(("iounit_get_area(%08lx,%d[%d])=", vaddr, size, npages));
+	IOD(("%s(%pa,%d[%d])=", __func__, &phys, size, npages));
 	
 next:	j = (i & 15);
 	rotor = iounit->rotor[j - 1];
@@ -124,7 +125,8 @@ nexti:	scan = find_next_zero_bit(iounit->bmap, limit, scan);
 		}
 		i >>= 4;
 		if (!(i & 15))
-			panic("iounit_get_area: Couldn't find free iopte slots for (%08lx,%d)\n", vaddr, size);
+			panic("iounit_get_area: Couldn't find free iopte slots for (%pa,%d)\n",
+			      &phys, size);
 		goto next;
 	}
 	for (k = 1, scan++; k < npages; k++)
@@ -132,30 +134,29 @@ nexti:	scan = find_next_zero_bit(iounit->bmap, limit, scan);
 			goto nexti;
 	iounit->rotor[j - 1] = (scan < limit) ? scan : iounit->limit[j - 1];
 	scan -= npages;
-	iopte = MKIOPTE(__pa(vaddr & PAGE_MASK));
-	vaddr = IOUNIT_DMA_BASE + (scan << PAGE_SHIFT) + (vaddr & ~PAGE_MASK);
+	iopte = MKIOPTE(phys & PAGE_MASK);
+	phys = IOUNIT_DMA_BASE + (scan << PAGE_SHIFT) + offset_in_page(phys);
 	for (k = 0; k < npages; k++, iopte = __iopte(iopte_val(iopte) + 0x100), scan++) {
 		set_bit(scan, iounit->bmap);
 		sbus_writel(iopte_val(iopte), &iounit->page_table[scan]);
 	}
-	IOD(("%08lx\n", vaddr));
-	return vaddr;
+	IOD(("%pa\n", &phys));
+	return phys;
 }
 
-static dma_addr_t iounit_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t len, enum dma_data_direction dir,
-		unsigned long attrs)
+static dma_addr_t iounit_map_phys(struct device *dev, phys_addr_t phys,
+		size_t len, enum dma_data_direction dir, unsigned long attrs)
 {
-	void *vaddr = page_address(page) + offset;
 	struct iounit_struct *iounit = dev->archdata.iommu;
-	unsigned long ret, flags;
+	unsigned long flags;
+	dma_addr_t ret;
 	
 	/* XXX So what is maxphys for us and how do drivers know it? */
 	if (!len || len > 256 * 1024)
 		return DMA_MAPPING_ERROR;
 
 	spin_lock_irqsave(&iounit->lock, flags);
-	ret = iounit_get_area(iounit, (unsigned long)vaddr, len);
+	ret = iounit_get_area(iounit, phys, len);
 	spin_unlock_irqrestore(&iounit->lock, flags);
 	return ret;
 }
@@ -171,14 +172,15 @@ static int iounit_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 	/* FIXME: Cache some resolved pages - often several sg entries are to the same page */
 	spin_lock_irqsave(&iounit->lock, flags);
 	for_each_sg(sgl, sg, nents, i) {
-		sg->dma_address = iounit_get_area(iounit, (unsigned long) sg_virt(sg), sg->length);
+		sg->dma_address =
+			iounit_get_area(iounit, sg_phys(sg), sg->length);
 		sg->dma_length = sg->length;
 	}
 	spin_unlock_irqrestore(&iounit->lock, flags);
 	return nents;
 }
 
-static void iounit_unmap_page(struct device *dev, dma_addr_t vaddr, size_t len,
+static void iounit_unmap_phys(struct device *dev, dma_addr_t vaddr, size_t len,
 		enum dma_data_direction dir, unsigned long attrs)
 {
 	struct iounit_struct *iounit = dev->archdata.iommu;
@@ -279,8 +281,8 @@ static const struct dma_map_ops iounit_dma_ops = {
 	.alloc			= iounit_alloc,
 	.free			= iounit_free,
 #endif
-	.map_page		= iounit_map_page,
-	.unmap_page		= iounit_unmap_page,
+	.map_phys		= iounit_map_phys,
+	.unmap_phys		= iounit_unmap_phys,
 	.map_sg			= iounit_map_sg,
 	.unmap_sg		= iounit_unmap_sg,
 };
diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
index 5a5080db800f..f48adf62724a 100644
--- a/arch/sparc/mm/iommu.c
+++ b/arch/sparc/mm/iommu.c
@@ -181,18 +181,20 @@ static void iommu_flush_iotlb(iopte_t *iopte, unsigned int niopte)
 	}
 }
 
-static dma_addr_t __sbus_iommu_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t len, bool per_page_flush)
+static dma_addr_t __sbus_iommu_map_phys(struct device *dev, phys_addr_t paddr,
+		size_t len, bool per_page_flush, unsigned long attrs)
 {
 	struct iommu_struct *iommu = dev->archdata.iommu;
-	phys_addr_t paddr = page_to_phys(page) + offset;
-	unsigned long off = paddr & ~PAGE_MASK;
+	unsigned long off = offset_in_page(paddr);
 	unsigned long npages = (off + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
 	unsigned long pfn = __phys_to_pfn(paddr);
 	unsigned int busa, busa0;
 	iopte_t *iopte, *iopte0;
 	int ioptex, i;
 
+	if (unlikely(attrs & DMA_ATTR_MMIO))
+		return DMA_MAPPING_ERROR;
+
 	/* XXX So what is maxphys for us and how do drivers know it? */
 	if (!len || len > 256 * 1024)
 		return DMA_MAPPING_ERROR;
@@ -202,10 +204,10 @@ static dma_addr_t __sbus_iommu_map_page(struct device *dev, struct page *page,
 	 * XXX Is this a good assumption?
 	 * XXX What if someone else unmaps it here and races us?
 	 */
-	if (per_page_flush && !PageHighMem(page)) {
+	if (per_page_flush && !PhysHighMem(paddr)) {
 		unsigned long vaddr, p;
 
-		vaddr = (unsigned long)page_address(page) + offset;
+		vaddr = (unsigned long)phys_to_virt(paddr);
 		for (p = vaddr & PAGE_MASK; p < vaddr + len; p += PAGE_SIZE)
 			flush_page_for_dma(p);
 	}
@@ -231,19 +233,19 @@ static dma_addr_t __sbus_iommu_map_page(struct device *dev, struct page *page,
 	return busa0 + off;
 }
 
-static dma_addr_t sbus_iommu_map_page_gflush(struct device *dev,
-		struct page *page, unsigned long offset, size_t len,
-		enum dma_data_direction dir, unsigned long attrs)
+static dma_addr_t sbus_iommu_map_phys_gflush(struct device *dev,
+		phys_addr_t phys, size_t len, enum dma_data_direction dir,
+		unsigned long attrs)
 {
 	flush_page_for_dma(0);
-	return __sbus_iommu_map_page(dev, page, offset, len, false);
+	return __sbus_iommu_map_phys(dev, phys, len, false, attrs);
 }
 
-static dma_addr_t sbus_iommu_map_page_pflush(struct device *dev,
-		struct page *page, unsigned long offset, size_t len,
-		enum dma_data_direction dir, unsigned long attrs)
+static dma_addr_t sbus_iommu_map_phys_pflush(struct device *dev,
+		phys_addr_t phys, size_t len, enum dma_data_direction dir,
+		unsigned long attrs)
 {
-	return __sbus_iommu_map_page(dev, page, offset, len, true);
+	return __sbus_iommu_map_phys(dev, phys, len, true, attrs);
 }
 
 static int __sbus_iommu_map_sg(struct device *dev, struct scatterlist *sgl,
@@ -254,8 +256,8 @@ static int __sbus_iommu_map_sg(struct device *dev, struct scatterlist *sgl,
 	int j;
 
 	for_each_sg(sgl, sg, nents, j) {
-		sg->dma_address =__sbus_iommu_map_page(dev, sg_page(sg),
-				sg->offset, sg->length, per_page_flush);
+		sg->dma_address = __sbus_iommu_map_phys(dev, sg_phys(sg),
+				sg->length, per_page_flush, attrs);
 		if (sg->dma_address == DMA_MAPPING_ERROR)
 			return -EIO;
 		sg->dma_length = sg->length;
@@ -277,7 +279,7 @@ static int sbus_iommu_map_sg_pflush(struct device *dev, struct scatterlist *sgl,
 	return __sbus_iommu_map_sg(dev, sgl, nents, dir, attrs, true);
 }
 
-static void sbus_iommu_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void sbus_iommu_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 		size_t len, enum dma_data_direction dir, unsigned long attrs)
 {
 	struct iommu_struct *iommu = dev->archdata.iommu;
@@ -303,7 +305,7 @@ static void sbus_iommu_unmap_sg(struct device *dev, struct scatterlist *sgl,
 	int i;
 
 	for_each_sg(sgl, sg, nents, i) {
-		sbus_iommu_unmap_page(dev, sg->dma_address, sg->length, dir,
+		sbus_iommu_unmap_phys(dev, sg->dma_address, sg->length, dir,
 				attrs);
 		sg->dma_address = 0x21212121;
 	}
@@ -426,8 +428,8 @@ static const struct dma_map_ops sbus_iommu_dma_gflush_ops = {
 	.alloc			= sbus_iommu_alloc,
 	.free			= sbus_iommu_free,
 #endif
-	.map_page		= sbus_iommu_map_page_gflush,
-	.unmap_page		= sbus_iommu_unmap_page,
+	.map_phys		= sbus_iommu_map_phys_gflush,
+	.unmap_phys		= sbus_iommu_unmap_phys,
 	.map_sg			= sbus_iommu_map_sg_gflush,
 	.unmap_sg		= sbus_iommu_unmap_sg,
 };
@@ -437,8 +439,8 @@ static const struct dma_map_ops sbus_iommu_dma_pflush_ops = {
 	.alloc			= sbus_iommu_alloc,
 	.free			= sbus_iommu_free,
 #endif
-	.map_page		= sbus_iommu_map_page_pflush,
-	.unmap_page		= sbus_iommu_unmap_page,
+	.map_phys		= sbus_iommu_map_phys_pflush,
+	.unmap_phys		= sbus_iommu_unmap_phys,
 	.map_sg			= sbus_iommu_map_sg_pflush,
 	.unmap_sg		= sbus_iommu_unmap_sg,
 };

-- 
2.51.0


