Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C568C4B00
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 03:47:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FlfxUvx2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdfNf1R2Jz3cTP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 11:46:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FlfxUvx2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdfMw3BRwz30Tj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 11:46:19 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44E1Kf8x004444;
	Tue, 14 May 2024 01:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=IPBYzr9Z0ikvvD30gG88ZaySiKeH2fF0GVe1B8/LI0A=;
 b=FlfxUvx2AxidS6TYslVQNiy4lDIR/Hqk0qErAZwsVBgQYdacAf/xl//DjmffasdV9ijf
 RJ70b85EuyMleb/LrqECT/sX1U0mPPRc9hautz0jmPejSYIIptzFTuG8vuAnFSBQgQRF
 j7NZ8cUVX6pXdxdOeIg1gicrje+drI1FtAKbN9DYdb4dOkWMjbshz4X4hRGdhQIX0ro2
 ls33nChSYTFfH7EH8FSr44VAAH5lnnj6VZa+l8n7+x1kZ8hgl1OyEmuIqS4twcaV1jOW
 t7AxH/XStjyRgMolaPbWGsnzxSaqQ01tXVxr4C9j7LUaRSj2+HMMS1S2lDCAKSy2jf1x TQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y3wbr84uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 01:46:13 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44E13LqR005981;
	Tue, 14 May 2024 01:46:12 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2mgmapgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 01:46:12 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44E1kAvv16974570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 01:46:12 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7E6C58155;
	Tue, 14 May 2024 01:46:09 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E2A258143;
	Tue, 14 May 2024 01:46:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.91.85])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 May 2024 01:46:09 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/pseries/iommu: Split Dynamic DMA Window to be used in Hybrid mode
Date: Mon, 13 May 2024 20:46:08 -0500
Message-Id: <20240514014608.35537-1-gbatra@linux.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qxauSdMZj5Dy8RkeQSUqSDuRTsN9if5J
X-Proofpoint-GUID: qxauSdMZj5Dy8RkeQSUqSDuRTsN9if5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_17,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405140011
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Gaurav Batra <gbatra@linux.ibm.com>, Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dynamic DMA Window (DDW) supports TCEs that are backed by 2MB page size.
In most configurations, DDW is big enough to pre-map all of LPAR memory
for IO. Pre-mapping of memory for DMA results in improvements in IO
performance.

Persistent memory, vPMEM, can be assigned to an LPAR as well. vPMEM is not
contiguous with LPAR memory and usually is assigned at high memory
addresses.  This makes is not possible to pre-map both vPMEM and LPAR
memory in the same DDW.

For a dedicated adapter this limitation is not an issue. Dedicated
adapters can have both Default DMA window, which is backed by 4K page size
and a DDW backed by 2MB page size TCEs. In this scenario, LPAR memory is
pre-mapped in the DDW.  Any DMA going to the vPMEM is routed via
dynamically allocated TCEs in the default window.

The issue arises with SR-IOV adapters. There is only one DMA window -
either Default or DDW. If an LPAR has vPMEM assigned, memory is not
pre-mapped in the DDW since TCEs needs to be allocated for vPMEM as well.
In this case, DDW is created and TCEs are dynamically allocated for both
vPMEM and LPAR memory.

Today, DDW is only used in single mode - direct mapped TCEs or dynamically
mapped TCEs. This enhancement breaks a single DDW in 2 regions -

	1. First region to pre-map LPAR memory
	2. Second region to dynamically allocate TCEs for IO to vPMEM

The DDW is split only if it is big enough to pre-map complete LPAR memory
and still have some space left to dynamically map vPMEM. Maximum size
possible DDW is created as permitted by the Hypervisor.

Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/iommu.h       |  2 +
 arch/powerpc/platforms/pseries/iommu.c | 71 ++++++++++++++++++++------
 2 files changed, 56 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 026695943550..bb252a15cd4c 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -31,6 +31,8 @@
 #define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
 #define DMA64_PROPNAME "linux,dma64-ddr-window-info"
 
+#define	MIN_DDW_VPMEM_DMA_WINDOW	SZ_2G
+
 /* Boot time flags */
 extern int iommu_is_off;
 extern int iommu_force_on;
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index e8c4129697b1..b0a8e8d2159e 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1296,7 +1296,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	struct ddw_query_response query;
 	struct ddw_create_response create;
 	int page_shift;
-	u64 win_addr;
+	u64 win_addr, dynamic_offset = 0;
 	const char *win_name;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
@@ -1304,6 +1304,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	struct property *win64;
 	struct failed_ddw_pdn *fpdn;
 	bool default_win_removed = false, direct_mapping = false;
+	bool dynamic_mapping = false;
 	bool pmem_present;
 	struct pci_dn *pci = PCI_DN(pdn);
 	struct property *default_win = NULL;
@@ -1399,7 +1400,6 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		goto out_failed;
 	}
 
-
 	/*
 	 * The "ibm,pmemory" can appear anywhere in the address space.
 	 * Assuming it is still backed by page structs, try MAX_PHYSMEM_BITS
@@ -1424,14 +1424,43 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			1ULL << page_shift);
 
 		len = order_base_2(query.largest_available_block << page_shift);
-		win_name = DMA64_PROPNAME;
+
+		dynamic_mapping = true;
 	} else {
 		direct_mapping = !default_win_removed ||
 			(len == MAX_PHYSMEM_BITS) ||
 			(!pmem_present && (len == max_ram_len));
-		win_name = direct_mapping ? DIRECT64_PROPNAME : DMA64_PROPNAME;
+
+		/* DDW is big enough to direct map RAM. If there is vPMEM, check
+		 * if enough space is left in DDW where we can dynamically
+		 * allocate TCEs for vPMEM. For now, this Hybrid sharing of DDW
+		 * is only for SR-IOV devices.
+		 */
+		if (default_win_removed && pmem_present && !direct_mapping) {
+			/* DDW is big enough to be split */
+			if ((query.largest_available_block << page_shift) >=
+			     MIN_DDW_VPMEM_DMA_WINDOW + (1ULL << max_ram_len)) {
+
+				direct_mapping = true;
+
+				/* offset of the Dynamic part of DDW */
+				dynamic_offset = 1ULL << max_ram_len;
+			}
+
+			/* DDW will at least have dynamic allocation */
+			dynamic_mapping = true;
+
+			/* create max size DDW possible */
+			len = order_base_2(query.largest_available_block
+							<< page_shift);
+		}
 	}
 
+	/* Even if the DDW is split into both direct mapped RAM and dynamically
+	 * mapped vPMEM, the DDW property in OF will be marked as Direct.
+	 */
+	win_name = direct_mapping ? DIRECT64_PROPNAME : DMA64_PROPNAME;
+
 	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
 	if (ret != 0)
 		goto out_failed;
@@ -1459,9 +1488,9 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	if (!window)
 		goto out_del_prop;
 
-	if (direct_mapping) {
-		window->direct = true;
+	window->direct = direct_mapping;
 
+	if (direct_mapping) {
 		/* DDW maps the whole partition, so enable direct DMA mapping */
 		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
 					    win64->value, tce_setrange_multi_pSeriesLP_walk);
@@ -1473,12 +1502,13 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			clean_dma_window(pdn, win64->value);
 			goto out_del_list;
 		}
-	} else {
+	}
+
+	if (dynamic_mapping) {
 		struct iommu_table *newtbl;
 		int i;
 		unsigned long start = 0, end = 0;
-
-		window->direct = false;
+		u64 dynamic_addr, dynamic_len;
 
 		for (i = 0; i < ARRAY_SIZE(pci->phb->mem_resources); i++) {
 			const unsigned long mask = IORESOURCE_MEM_64 | IORESOURCE_MEM;
@@ -1498,8 +1528,16 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			goto out_del_list;
 		}
 
-		iommu_table_setparms_common(newtbl, pci->phb->bus->number, create.liobn, win_addr,
-					    1UL << len, page_shift, NULL, &iommu_table_lpar_multi_ops);
+		/* If the DDW is split between directly mapped RAM and Dynamic
+		 * mapped for TCES, offset into the DDW where the dynamic part
+		 * begins.
+		 */
+		dynamic_addr = win_addr + dynamic_offset;
+		dynamic_len = (1UL << len) - dynamic_offset;
+		iommu_table_setparms_common(newtbl, pci->phb->bus->number,
+						create.liobn, dynamic_addr,
+						dynamic_len, page_shift, NULL,
+						&iommu_table_lpar_multi_ops);
 		iommu_init_table(newtbl, pci->phb->node, start, end);
 
 		pci->table_group->tables[1] = newtbl;
@@ -1551,13 +1589,12 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 out_unlock:
 	mutex_unlock(&dma_win_init_mutex);
 
-	/*
-	 * If we have persistent memory and the window size is only as big
-	 * as RAM, then we failed to create a window to cover persistent
-	 * memory and need to set the DMA limit.
+	/* If we have persistent memory and the window size is not big enough
+	 * to directly map both RAM and vPMEM, then we need to set DMA limit.
 	 */
-	if (pmem_present && direct_mapping && len == max_ram_len)
-		dev->dev.bus_dma_limit = dev->dev.archdata.dma_offset + (1ULL << len);
+	if (pmem_present && direct_mapping && len != MAX_PHYSMEM_BITS)
+		dev->dev.bus_dma_limit = dev->dev.archdata.dma_offset +
+						(1ULL << max_ram_len);
 
 	return direct_mapping;
 }

base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
-- 
2.39.3 (Apple Git-146)

