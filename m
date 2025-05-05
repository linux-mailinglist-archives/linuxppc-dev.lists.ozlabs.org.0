Return-Path: <linuxppc-dev+bounces-8311-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F02AAA07E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 00:35:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrxDh0LXhz2yGy;
	Tue,  6 May 2025 08:35:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746484516;
	cv=none; b=A+gMTKkxXMwbAvCGr+qry7WfAYJ6e5RzBG01XjpEC1suwf8e0tu9tPnNLcUVxwoXjxOzdRHqmCwIMrx3i4y5383nVQusrMh6sfUitsZZVW7spcTIKo3Ef/R1wukNp1Qxm4XiTPwHwbyksFprsami8HZE9+ryBVLqzt5qnVPXnFGUtx24FjHapNp7ddmIq12+R2B43ZHqTH4BNM9ujQ899YTD2/h5D1zsYtmsjMFd7BKK2w7mnpkI+7VRd0k9F3b0qhJ30qdmSAB7s6IE7XfIZIn7c1QE6qcYxhtdV9arvGihgggbVd762F00s+HjC4CXPWRav/wTA6NaAPxSTQgKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746484516; c=relaxed/relaxed;
	bh=kUvMFBgfGlNu5N+roYcXKea+vUsbuaDQlUuqER5utrA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E3CZSvmINZpDs1x/m/bAKtqnfAecx3YxPDim55oSb0AIGQ+Svso4rUia71H7UmsRwZetGeDkANZhI+G2xcBOzVg6GX5XI6DmSmC25eNNqOpAdw+7A89SNRwpJrasAb5xPDXCKpOzSdgswD2ulm/WluUHZZy+uIGQOA9H8WVEgWCeSkNvnsgP40wiSiuZKenSM7Ek9vUzl1XKBRIDklkL78gN10WN8j1YcQP+IGsnKSIWI3WVWJz9+UENgUWMu7JiDu5DqpNb/Y/us6qNa9lzwUz6GEWYUXd9RtyOMchXAThCu/2ghEg08DKMwYCk690+UKCKPaWBny40v2N+N2R01g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oE2rMf9M; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oE2rMf9M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrxDf6mBjz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 08:35:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8503E629C1;
	Mon,  5 May 2025 22:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1669BC4CEED;
	Mon,  5 May 2025 22:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484512;
	bh=rvINE1xczsfYHzY4skdGfLUM0secf1TOZYDxrR9/9gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oE2rMf9M1+wgGPXacFzfOLri9w2hr2KTgLch6w3yVm6rQy3UECtJUZuqnXUwinpNL
	 b3xYQEgBkHDvgCl1mZ7SRyv0nCK/dADVdqxdRNa9ZPS6aMRfrabEJbyF6/SZEkmaOI
	 ULmHPnqPXkpOChOc0y01q4yaZwuc41ulUCAOG08ObXxXiz8+tfBBfWEGRTs2Bm515P
	 aqY4aARKqIxLU/Fs3DdFTISNAZkVQ3AQ2Mjz4tsEJVbSXQ1u9J5PkIYJH2TuDfqwrO
	 S+H9Eyq43fk18qctjV99WN7djtr2UM5rTFKF2UDWoSMC7wSaJUNMbRoVRPXYc6vmAk
	 uLBU6iTnhD0Gg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Gaurav Batra <gbatra@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Sasha Levin <sashal@kernel.org>,
	mpe@ellerman.id.au,
	sbhat@linux.ibm.com,
	donettom@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.14 509/642] powerpc/pseries/iommu: create DDW for devices with DMA mask less than 64-bits
Date: Mon,  5 May 2025 18:12:05 -0400
Message-Id: <20250505221419.2672473-509-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
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
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Gaurav Batra <gbatra@linux.ibm.com>

[ Upstream commit 67dfc11982f7e3c37f0977e74671da2391b29181 ]

Starting with PAPR level 2.13, platform supports placing PHB in limited
address mode. Devices that support DMA masks less that 64-bit but greater
than 32-bits are placed in limited address mode. In this mode, the
starting DMA address returned by the DDW is 4GB.

When the device driver calls dma_supported, with mask less then 64-bit, the
PowerPC IOMMU driver places PHB in the Limited Addressing Mode before
creating DDW.

Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Link: https://patch.msgid.link/20250108164814.73250-1-gbatra@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/pseries/iommu.c | 110 +++++++++++++++++++++----
 1 file changed, 94 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 8f32340960e21..d6ebc19fb99c5 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -52,7 +52,8 @@ enum {
 enum {
 	DDW_EXT_SIZE = 0,
 	DDW_EXT_RESET_DMA_WIN = 1,
-	DDW_EXT_QUERY_OUT_SIZE = 2
+	DDW_EXT_QUERY_OUT_SIZE = 2,
+	DDW_EXT_LIMITED_ADDR_MODE = 3
 };
 
 static struct iommu_table *iommu_pseries_alloc_table(int node)
@@ -1327,6 +1328,54 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
 			 ret);
 }
 
+/*
+ * Platforms support placing PHB in limited address mode starting with LoPAR
+ * level 2.13 implement. In this mode, the DMA address returned by DDW is over
+ * 4GB but, less than 64-bits. This benefits IO adapters that don't support
+ * 64-bits for DMA addresses.
+ */
+static int limited_dma_window(struct pci_dev *dev, struct device_node *par_dn)
+{
+	int ret;
+	u32 cfg_addr, reset_dma_win, las_supported;
+	u64 buid;
+	struct device_node *dn;
+	struct pci_dn *pdn;
+
+	ret = ddw_read_ext(par_dn, DDW_EXT_RESET_DMA_WIN, &reset_dma_win);
+	if (ret)
+		goto out;
+
+	ret = ddw_read_ext(par_dn, DDW_EXT_LIMITED_ADDR_MODE, &las_supported);
+
+	/* Limited Address Space extension available on the platform but DDW in
+	 * limited addressing mode not supported
+	 */
+	if (!ret && !las_supported)
+		ret = -EPROTO;
+
+	if (ret) {
+		dev_info(&dev->dev, "Limited Address Space for DDW not Supported, err: %d", ret);
+		goto out;
+	}
+
+	dn = pci_device_to_OF_node(dev);
+	pdn = PCI_DN(dn);
+	buid = pdn->phb->buid;
+	cfg_addr = (pdn->busno << 16) | (pdn->devfn << 8);
+
+	ret = rtas_call(reset_dma_win, 4, 1, NULL, cfg_addr, BUID_HI(buid),
+			BUID_LO(buid), 1);
+	if (ret)
+		dev_info(&dev->dev,
+			 "ibm,reset-pe-dma-windows(%x) for Limited Addr Support: %x %x %x returned %d ",
+			 reset_dma_win, cfg_addr, BUID_HI(buid), BUID_LO(buid),
+			 ret);
+
+out:
+	return ret;
+}
+
 /* Return largest page shift based on "IO Page Sizes" output of ibm,query-pe-dma-window. */
 static int iommu_get_page_shift(u32 query_page_size)
 {
@@ -1394,7 +1443,7 @@ static struct property *ddw_property_create(const char *propname, u32 liobn, u64
  *
  * returns true if can map all pages (direct mapping), false otherwise..
  */
-static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
+static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn, u64 dma_mask)
 {
 	int len = 0, ret;
 	int max_ram_len = order_base_2(ddw_memory_hotplug_max());
@@ -1413,6 +1462,9 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	bool pmem_present;
 	struct pci_dn *pci = PCI_DN(pdn);
 	struct property *default_win = NULL;
+	bool limited_addr_req = false, limited_addr_enabled = false;
+	int dev_max_ddw;
+	int ddw_sz;
 
 	dn = of_find_node_by_type(NULL, "ibm,pmemory");
 	pmem_present = dn != NULL;
@@ -1439,7 +1491,6 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	 * the ibm,ddw-applicable property holds the tokens for:
 	 * ibm,query-pe-dma-window
 	 * ibm,create-pe-dma-window
-	 * ibm,remove-pe-dma-window
 	 * for the given node in that order.
 	 * the property is actually in the parent, not the PE
 	 */
@@ -1459,6 +1510,20 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	if (ret != 0)
 		goto out_failed;
 
+	/* DMA Limited Addressing required? This is when the driver has
+	 * requested to create DDW but supports mask which is less than 64-bits
+	 */
+	limited_addr_req = (dma_mask != DMA_BIT_MASK(64));
+
+	/* place the PHB in Limited Addressing mode */
+	if (limited_addr_req) {
+		if (limited_dma_window(dev, pdn))
+			goto out_failed;
+
+		/* PHB is in Limited address mode */
+		limited_addr_enabled = true;
+	}
+
 	/*
 	 * If there is no window available, remove the default DMA window,
 	 * if it's present. This will make all the resources available to the
@@ -1505,6 +1570,15 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		goto out_failed;
 	}
 
+	/* Maximum DMA window size that the device can address (in log2) */
+	dev_max_ddw = fls64(dma_mask);
+
+	/* If the device DMA mask is less than 64-bits, make sure the DMA window
+	 * size is not bigger than what the device can access
+	 */
+	ddw_sz = min(order_base_2(query.largest_available_block << page_shift),
+			dev_max_ddw);
+
 	/*
 	 * The "ibm,pmemory" can appear anywhere in the address space.
 	 * Assuming it is still backed by page structs, try MAX_PHYSMEM_BITS
@@ -1513,23 +1587,21 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	 */
 	len = max_ram_len;
 	if (pmem_present) {
-		if (query.largest_available_block >=
-		    (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
+		if (ddw_sz >= MAX_PHYSMEM_BITS)
 			len = MAX_PHYSMEM_BITS;
 		else
 			dev_info(&dev->dev, "Skipping ibm,pmemory");
 	}
 
 	/* check if the available block * number of ptes will map everything */
-	if (query.largest_available_block < (1ULL << (len - page_shift))) {
+	if (ddw_sz < len) {
 		dev_dbg(&dev->dev,
 			"can't map partition max 0x%llx with %llu %llu-sized pages\n",
 			1ULL << len,
 			query.largest_available_block,
 			1ULL << page_shift);
 
-		len = order_base_2(query.largest_available_block << page_shift);
-
+		len = ddw_sz;
 		dynamic_mapping = true;
 	} else {
 		direct_mapping = !default_win_removed ||
@@ -1543,8 +1615,9 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		 */
 		if (default_win_removed && pmem_present && !direct_mapping) {
 			/* DDW is big enough to be split */
-			if ((query.largest_available_block << page_shift) >=
-			     MIN_DDW_VPMEM_DMA_WINDOW + (1ULL << max_ram_len)) {
+			if ((1ULL << ddw_sz) >=
+			    MIN_DDW_VPMEM_DMA_WINDOW + (1ULL << max_ram_len)) {
+
 				direct_mapping = true;
 
 				/* offset of the Dynamic part of DDW */
@@ -1555,8 +1628,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			dynamic_mapping = true;
 
 			/* create max size DDW possible */
-			len = order_base_2(query.largest_available_block
-							<< page_shift);
+			len = ddw_sz;
 		}
 	}
 
@@ -1685,7 +1757,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	__remove_dma_window(pdn, ddw_avail, create.liobn);
 
 out_failed:
-	if (default_win_removed)
+	if (default_win_removed || limited_addr_enabled)
 		reset_dma_window(dev, pdn);
 
 	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
@@ -1704,6 +1776,9 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		dev->dev.bus_dma_limit = dev->dev.archdata.dma_offset +
 						(1ULL << max_ram_len);
 
+	dev_info(&dev->dev, "lsa_required: %x, lsa_enabled: %x, direct mapping: %x\n",
+			limited_addr_req, limited_addr_enabled, direct_mapping);
+
 	return direct_mapping;
 }
 
@@ -1829,8 +1904,11 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 {
 	struct device_node *dn = pci_device_to_OF_node(pdev), *pdn;
 
-	/* only attempt to use a new window if 64-bit DMA is requested */
-	if (dma_mask < DMA_BIT_MASK(64))
+	/* For DDW, DMA mask should be more than 32-bits. For mask more then
+	 * 32-bits but less then 64-bits, DMA addressing is supported in
+	 * Limited Addressing mode.
+	 */
+	if (dma_mask <= DMA_BIT_MASK(32))
 		return false;
 
 	dev_dbg(&pdev->dev, "node is %pOF\n", dn);
@@ -1843,7 +1921,7 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 	 */
 	pdn = pci_dma_find(dn, NULL);
 	if (pdn && PCI_DN(pdn))
-		return enable_ddw(pdev, pdn);
+		return enable_ddw(pdev, pdn, dma_mask);
 
 	return false;
 }
-- 
2.39.5


