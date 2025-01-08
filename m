Return-Path: <linuxppc-dev+bounces-4858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B33A06283
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 17:48:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSv4N6nGNz30T2;
	Thu,  9 Jan 2025 03:48:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736354900;
	cv=none; b=nlY0kznNKWFcnKO8qT+F57N6+mSuFnTqTdM6Lr6HLx9ny21JDxKTgj7AuwcDA6U2RFtsDnBCH/gNG4v+tQQutoW/qcMdG1f17G7QdRBDORRJwYWw1jrMpGNBkQGqNhxJJ0Oh3QS/7pfS13msK+MM5JycTeN0irSC++F4fI9W8rcJT7I00xP0FvuEMrPizZJOeIh9TZLDjL0Vkx2zGhExKTVDTKrspCMYJYWDyxgibfqIyDxBBOQYU1ocwoZK+v51jf1S+of0PeQacFY5zMXnZU3cvkLO/M8dYNzBEkuUp7XC/RCVovDOHCB2SiQJ6FLy6/f2b3dgErdNR+nqztXlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736354900; c=relaxed/relaxed;
	bh=O4Mc8c6uM51ivX9BCoaX07Rr74LW0rOWxJl6TFPjMJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CmX1xFL4rODv/t9r4qKu9fGpqEwOveVONe8LkjL+pnIqk4uxuWXSdallxFCtSX0q4iseXs906Pw3BfgjewnllZW9xopMf7furcaF+EpbR22u9jSlpvbK3nmQ3rhODXYmy03+FT8AEZ7XPC2/oUbqZwe/sAHyxEVolRAMXVMDue8tMPuxP+LYLyqnVe9xP50hKaq1N03D0WibbTfJTjKgmCV7iDsk3EUFsf9Lyx3ryzoLJ4rgOQLL4UTvhajM8XF4kgoVTwaaHeghrgbUIoPXxc1ffTKsjdfkdwRiSRXVAFDh5Bc7hs5kiYOp81bCdSgnBbnCopSIlDgJfqb100DDPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LDa1BRFD; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LDa1BRFD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSv4M5dgsz2yNs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 03:48:19 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508D8TC7023466
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 8 Jan 2025 16:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=O4Mc8c6uM51ivX9BCoaX07Rr74LW0rOWxJl6TFPjM
	JI=; b=LDa1BRFD5NvuT8/EaQPA+X0tYAlqZZshb3h9HtqOy3+JCtk1SzxOLtjVo
	k6/b8T4QckHUkZ+iR7hL8kqDxowh6pVCb+NAPPUxzibgqb6sxtzreg6G+6iuzQMe
	2+doC2bAlasibpH2apec/M9bCiSup0lAA4XdE6rmf1R4E/5948T6vkCpFsGk4LCy
	dbJ2FH9N7Tr/9DYy2p9MgTGmY5M7UJz3Nwqt3foO5q3YBro3dGntlhesVGdYUKZc
	NLEX9Tn+SPqIRjZ/KqPuL62tMRli/zcyjONa6J2kUMBMq4bs9FmPHzmfWlBo9HaU
	JYLGfaVwsw9TV+oUsIzauDJdSaySw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441edj44b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2025 16:48:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 508DYM53015798
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 8 Jan 2025 16:48:15 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygtm0mwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2025 16:48:15 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508GmEcf21365378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 16:48:14 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94FED58056;
	Wed,  8 Jan 2025 16:48:14 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7585558052;
	Wed,  8 Jan 2025 16:48:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.62])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jan 2025 16:48:14 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Gaurav Batra <gbatra@linux.ibm.com>
Subject: [PATCH] powerpc/pseries/iommu: create DDW for devices with DMA mask less than 64-bits
Date: Wed,  8 Jan 2025 10:48:14 -0600
Message-Id: <20250108164814.73250-1-gbatra@linux.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Odmtj8yEzsPAfQMTwYN-nRM1PEIOliz9
X-Proofpoint-ORIG-GUID: Odmtj8yEzsPAfQMTwYN-nRM1PEIOliz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080137
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Starting with PAPR level 2.13, platform supports placing PHB in limited
address mode. Devices that support DMA masks less that 64-bit but greater
than 32-bits are placed in limited address mode. In this mode, the
starting DMA address returned by the DDW is 4GB.

When the device driver calls dma_supported, with mask less then 64-bit, the
PowerPC IOMMU driver places PHB in the Limited Addressing Mode before
creating DDW.

Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 110 +++++++++++++++++++++----
 1 file changed, 94 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 534cd159e9ab..551e9ca4dcc2 100644
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
@@ -1331,6 +1332,54 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
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
@@ -1398,7 +1447,7 @@ static struct property *ddw_property_create(const char *propname, u32 liobn, u64
  *
  * returns true if can map all pages (direct mapping), false otherwise..
  */
-static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
+static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn, u64 dma_mask)
 {
 	int len = 0, ret;
 	int max_ram_len = order_base_2(ddw_memory_hotplug_max());
@@ -1417,6 +1466,9 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	bool pmem_present;
 	struct pci_dn *pci = PCI_DN(pdn);
 	struct property *default_win = NULL;
+	bool limited_addr_req = false, limited_addr_enabled = false;
+	int dev_max_ddw;
+	int ddw_sz;
 
 	dn = of_find_node_by_type(NULL, "ibm,pmemory");
 	pmem_present = dn != NULL;
@@ -1443,7 +1495,6 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	 * the ibm,ddw-applicable property holds the tokens for:
 	 * ibm,query-pe-dma-window
 	 * ibm,create-pe-dma-window
-	 * ibm,remove-pe-dma-window
 	 * for the given node in that order.
 	 * the property is actually in the parent, not the PE
 	 */
@@ -1463,6 +1514,20 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
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
@@ -1509,6 +1574,15 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
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
@@ -1517,23 +1591,21 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
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
@@ -1547,8 +1619,9 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
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
@@ -1559,8 +1632,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			dynamic_mapping = true;
 
 			/* create max size DDW possible */
-			len = order_base_2(query.largest_available_block
-							<< page_shift);
+			len = ddw_sz;
 		}
 	}
 
@@ -1688,7 +1760,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	__remove_dma_window(pdn, ddw_avail, create.liobn);
 
 out_failed:
-	if (default_win_removed)
+	if (default_win_removed || limited_addr_enabled)
 		reset_dma_window(dev, pdn);
 
 	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
@@ -1707,6 +1779,9 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		dev->dev.bus_dma_limit = dev->dev.archdata.dma_offset +
 						(1ULL << max_ram_len);
 
+	dev_info(&dev->dev, "lsa_required: %x, lsa_enabled: %x, direct mapping: %x\n",
+			limited_addr_req, limited_addr_enabled, direct_mapping);
+
 	return direct_mapping;
 }
 
@@ -1832,8 +1907,11 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
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
@@ -1846,7 +1924,7 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 	 */
 	pdn = pci_dma_find(dn, NULL);
 	if (pdn && PCI_DN(pdn))
-		return enable_ddw(pdev, pdn);
+		return enable_ddw(pdev, pdn, dma_mask);
 
 	return false;
 }

base-commit: e32cde8d2bd7d251a8f9b434143977ddf13dcec6
-- 
2.39.3 (Apple Git-146)


