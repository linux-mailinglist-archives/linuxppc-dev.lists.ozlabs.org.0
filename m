Return-Path: <linuxppc-dev+bounces-13943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D877C40C90
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 17:11:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d33vj6vgQz3btS;
	Sat,  8 Nov 2025 03:11:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762531873;
	cv=none; b=FiIiSeutNuo67JsBP2Iz4z7uRLYikiXTxPWuvk2CVqt1c30UkLawMT7hZocrgxq5QpkXeYgkOJ76FRgteH2Dg+FpAzOsr2ItaKOeGoOufYBhjFu0CKLGa3MTKNC5OBVsqtp+RN9PSl5w5d6SQM0FFCW7OiwYmaEz13ihhRpdm0jamqPHfBDKfQ6gNtnCaYPbzmCDwf7sGIWi/dW138EC4rIkqKymXuC2wJIpcBwks5YA8s+EX1IeYyoJLg/t/A5hVwELravNLJrQd5K8MwG2/ykIdx+525JtYCVIJ0OPlfb9hmX1oG7/UIPOy1LHjXvisWRmfvVNkBgje3thXg4Zag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762531873; c=relaxed/relaxed;
	bh=qKHRzcmb21dh+QiddmwrfEcS2SnG+YNnn4HAGl0wYJM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GlLPbAZ65TnqtY5UOk4xCMSrhEwmos++pcoWGBuyAIgZEn1XBpGDvtcOGgWCNvwjqWoz2+R+JS2l49xdcF1DLegG+aJoYGy/XKmNqNc32hxmvSdZkWsAtIdbWNh2+zNSAW4/aUbN6vG29YonmSM1hvjhdg6gxqtuZtA8EkiotR2jIA+sYzxowW5yz+wsTJRumSeP0EPJKZ8VJ/QwXZJxb4SmsKXeIF3clDgRlvWhhLIj/MxiSuo8LE7wfkpguCx5nZM+omFeNsNAPFswrYOdcJrkomp2vQbFCeg8WYdRaj9UKZYIjQY8zX4nCdULgM/7+qxhboESC6svod9V5ahmmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PhIuTssS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PhIuTssS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d33vg30Z2z3bsN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 03:11:11 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A78CEMw031322
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Nov 2025 16:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=qKHRzcmb21dh+QiddmwrfEcS2SnG+YNnn4HAGl0wY
	JM=; b=PhIuTssS+CNUw+IZBwRgYop7K/L62uQsoB7Cv5BXdxk4WVoOTWOlGNMX7
	uE+50m+sFlXly9Bsp+edTzCjnXqWaKJN5xmRRDaTESZycnJ+PV0yUjt+M2YngjWq
	1iWBv2CvYgBHC5lBFFrAqygPiNowic3ZcUbMs6EYYk1hJH8PGQ9Dw8UPxh3Ev9sm
	8MOTQamHLAwkRIR7+30I670DjBAWmmr+AduSdHGvXjR6w3WSclpLKvcZUV0pka8E
	xG0S0BXDeLyx3qYrJv4f6tJP+FpU6ZbA0Il/Pw3DWsuSZ65sMl/1DDwqxPBv6Hqo
	ZN0RCPMAk3pwYgfRX/mJdql4MEhMg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vuwvu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Nov 2025 16:11:08 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7G5odH021471
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Nov 2025 16:11:07 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5xrk3dnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Nov 2025 16:11:07 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A7GB6WO25690780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Nov 2025 16:11:06 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C6235805E;
	Fri,  7 Nov 2025 16:11:06 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F09B958059;
	Fri,  7 Nov 2025 16:11:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.24.22.141])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Nov 2025 16:11:05 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.ibm.com>
To: maddy@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.ibm.com>
Subject: [PATCH] powerpc/iommu: bypass DMA APIs for coherent allocations for pre-mapped memory
Date: Fri,  7 Nov 2025 10:11:05 -0600
Message-Id: <20251107161105.85999-1-gbatra@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jox9_B2gVxRr8unmpDpnzclzGOa21m09
X-Proofpoint-GUID: jox9_B2gVxRr8unmpDpnzclzGOa21m09
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX6Ri0+AJ4FCb3
 Mmykh2AZG/LOpsl9zOHwJ/idR9mtvPAS3oc/pgFsl1Py2aBNnw5X8eQ5DM1m9T1RB2kQyEqLZa8
 O8GPv4SVAWuBXqRrMz8k592Gr+ibhHBzu1VdnU0ysIqegDaScPj2sj0s6DQQFkmlygBYpPiUNh2
 x/SfPL6e44oa3bVBBBNckGc+ldPNl8TB8R1r3nCJTuqLWqEyWEOEVPklwjfbM/aWSJxj7um0gRb
 JuFOow3F1HMAjnTVsGD4FS1Kmik+Fx0ViXNlj+yscf2aiKlWqCpj5A7K3gSbmvDszk2Od1f26/1
 JOUiBImgo3hSTRPNZpjFb2WSOBSfJ1AboSzt1iuxHBfuZNjmy6qrd+uMkJGYWmLLZElg9BDRZte
 yMHoy6nRO7rv1DCnXOkcpYCaDz5s5A==
X-Authority-Analysis: v=2.4 cv=U6qfzOru c=1 sm=1 tr=0 ts=690e1a1c cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=oCnNJdMaCV4sxdFHq80A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Leverage ARCH_HAS_DMA_MAP_DIRECT config option for coherent allocations as
well. This will bypass DMA ops for memory allocations that have been
pre-mapped.

Always set device bus_dma_limit when memory is pre-mapped. In some
architectures, like PowerPC, pmemory can be converted to regular memory via
daxctl command. This will gate the coherent allocations to pre-mapped RAM
only, by dma_coherent_ok().

Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
---
 arch/powerpc/kernel/dma-iommu.c        | 30 +++++++++++++++++---------
 arch/powerpc/platforms/pseries/iommu.c |  6 ++----
 include/linux/dma-map-ops.h            |  4 ++++
 kernel/dma/mapping.c                   |  4 ++--
 4 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index 0359ab72cd3b..a8742afb0d2e 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -65,6 +65,21 @@ bool arch_dma_unmap_sg_direct(struct device *dev, struct scatterlist *sg,
 
 	return true;
 }
+bool arch_dma_alloc_direct(struct device *dev)
+{
+	if (dev->dma_ops_bypass)
+		return true;
+
+	return false;
+}
+
+bool arch_dma_free_direct(struct device *dev, dma_addr_t dma_handle)
+{
+	if (!dev->dma_ops_bypass)
+		return false;
+
+	return is_direct_handle(dev, dma_handle);
+}
 #endif /* CONFIG_ARCH_HAS_DMA_MAP_DIRECT */
 
 /*
@@ -148,17 +163,12 @@ int dma_iommu_dma_supported(struct device *dev, u64 mask)
 
 	if (dev_is_pci(dev) && dma_iommu_bypass_supported(dev, mask)) {
 		/*
-		 * dma_iommu_bypass_supported() sets dma_max when there is
-		 * 1:1 mapping but it is somehow limited.
-		 * ibm,pmemory is one example.
+		 * fixed ops will be used for RAM. This is limited by
+		 * bus_dma_limit which is set when RAM is pre-mapped.
 		 */
-		dev->dma_ops_bypass = dev->bus_dma_limit == 0;
-		if (!dev->dma_ops_bypass)
-			dev_warn(dev,
-				 "iommu: 64-bit OK but direct DMA is limited by %llx\n",
-				 dev->bus_dma_limit);
-		else
-			dev_dbg(dev, "iommu: 64-bit OK, using fixed ops\n");
+		dev->dma_ops_bypass = true;
+		dev_info(dev, "iommu: 64-bit OK but direct DMA is limited by %llx\n",
+			 dev->bus_dma_limit);
 		return 1;
 	}
 
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index eec333dd2e59..5497b130e026 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1769,10 +1769,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn, u64 dma_mas
 out_unlock:
 	mutex_unlock(&dma_win_init_mutex);
 
-	/* If we have persistent memory and the window size is not big enough
-	 * to directly map both RAM and vPMEM, then we need to set DMA limit.
-	 */
-	if (pmem_present && direct_mapping && len != MAX_PHYSMEM_BITS)
+	/* For pre-mapped memory, set bus_dma_limit to the max RAM */
+	if (direct_mapping)
 		dev->dev.bus_dma_limit = dev->dev.archdata.dma_offset +
 						(1ULL << max_ram_len);
 
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 10882d00cb17..0b5bb6fea90f 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -401,11 +401,15 @@ bool arch_dma_map_sg_direct(struct device *dev, struct scatterlist *sg,
 		int nents);
 bool arch_dma_unmap_sg_direct(struct device *dev, struct scatterlist *sg,
 		int nents);
+bool arch_dma_alloc_direct(struct device *dev);
+bool arch_dma_free_direct(struct device *dev, dma_addr_t dma_handle);
 #else
 #define arch_dma_map_phys_direct(d, a)		(false)
 #define arch_dma_unmap_phys_direct(d, a)	(false)
 #define arch_dma_map_sg_direct(d, s, n)		(false)
 #define arch_dma_unmap_sg_direct(d, s, n)	(false)
+#define arch_dma_alloc_direct(d)            (false)
+#define arch_dma_free_direct(d, a)          (false)
 #endif
 
 #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index fe7472f13b10..d5743b3c3ab3 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -654,7 +654,7 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 	/* let the implementation decide on the zone to allocate from: */
 	flag &= ~(__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM);
 
-	if (dma_alloc_direct(dev, ops)) {
+	if (dma_alloc_direct(dev, ops) || arch_dma_alloc_direct(dev)) {
 		cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
 	} else if (use_dma_iommu(dev)) {
 		cpu_addr = iommu_dma_alloc(dev, size, dma_handle, flag, attrs);
@@ -695,7 +695,7 @@ void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
 		return;
 
 	debug_dma_free_coherent(dev, size, cpu_addr, dma_handle);
-	if (dma_alloc_direct(dev, ops))
+	if (dma_alloc_direct(dev, ops) || arch_dma_free_direct(dev, dma_handle))
 		dma_direct_free(dev, size, cpu_addr, dma_handle, attrs);
 	else if (use_dma_iommu(dev))
 		iommu_dma_free(dev, size, cpu_addr, dma_handle, attrs);

base-commit: c2c2ccfd4ba72718266a56f3ecc34c989cb5b7a0
-- 
2.39.3


