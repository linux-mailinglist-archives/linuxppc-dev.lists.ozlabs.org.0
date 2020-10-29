Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2372629E148
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 02:59:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM7sq6bQvzDqbf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 12:59:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=ozlabs.ru (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM7kX16bhzDqXD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 12:53:07 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09T1WA8S117498; Wed, 28 Oct 2020 21:52:52 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34esjmh1wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 21:52:52 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09T1niJn005432;
 Thu, 29 Oct 2020 01:52:50 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 34f7s3rb1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 01:52:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09T1qlvk35848644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Oct 2020 01:52:47 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81C83AE045;
 Thu, 29 Oct 2020 01:52:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0C9EAE055;
 Thu, 29 Oct 2020 01:52:46 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 29 Oct 2020 01:52:46 +0000 (GMT)
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id D5AE2A020E;
 Thu, 29 Oct 2020 12:52:45 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (fstn1-p1.ozlabs.ibm.com
 [10.61.161.111])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id C4FD1E0105;
 Thu, 29 Oct 2020 12:52:45 +1100 (AEDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v4 1/2] dma: Allow mixing bypass and mapped DMA
 operation
Date: Thu, 29 Oct 2020 12:52:40 +1100
Message-Id: <20201029015241.73920-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201029015241.73920-1-aik@ozlabs.ru>
References: <20201029015241.73920-1-aik@ozlabs.ru>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_09:2020-10-28,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1034 priorityscore=1501 suspectscore=29
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290002
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the moment we allow bypassing DMA ops only when we can do this for
the entire RAM. However there are configs with mixed type memory
where we could still allow bypassing IOMMU in most cases;
POWERPC with persistent memory is one example.

This adds an arch hook to determine where bypass can still work and
we invoke direct DMA API. The following patch checks the bus limit
on POWERPC to allow or disallow direct mapping.

This adds a CONFIG_ARCH_HAS_DMA_SET_MASK config option to make arch_xxxx
hooks no-op by default.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v4:
* wrapped long lines
---
 kernel/dma/mapping.c | 26 ++++++++++++++++++++++----
 kernel/dma/Kconfig   |  4 ++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 51bb8fa8eb89..ad1f052e046d 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -137,6 +137,20 @@ static inline bool dma_map_direct(struct device *dev,
 	return dma_go_direct(dev, *dev->dma_mask, ops);
 }
 
+#ifdef CONFIG_ARCH_HAS_DMA_MAP_DIRECT
+bool arch_dma_map_page_direct(struct device *dev, phys_addr_t addr);
+bool arch_dma_unmap_page_direct(struct device *dev, dma_addr_t dma_handle);
+bool arch_dma_map_sg_direct(struct device *dev, struct scatterlist *sg,
+			    int nents);
+bool arch_dma_unmap_sg_direct(struct device *dev, struct scatterlist *sg,
+			      int nents);
+#else
+#define arch_dma_map_page_direct(d, a) (0)
+#define arch_dma_unmap_page_direct(d, a) (0)
+#define arch_dma_map_sg_direct(d, s, n) (0)
+#define arch_dma_unmap_sg_direct(d, s, n) (0)
+#endif
+
 dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 		size_t offset, size_t size, enum dma_data_direction dir,
 		unsigned long attrs)
@@ -149,7 +163,8 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 	if (WARN_ON_ONCE(!dev->dma_mask))
 		return DMA_MAPPING_ERROR;
 
-	if (dma_map_direct(dev, ops))
+	if (dma_map_direct(dev, ops) ||
+	    arch_dma_map_page_direct(dev, page_to_phys(page) + offset + size))
 		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
 	else
 		addr = ops->map_page(dev, page, offset, size, dir, attrs);
@@ -165,7 +180,8 @@ void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_map_direct(dev, ops))
+	if (dma_map_direct(dev, ops) ||
+	    arch_dma_unmap_page_direct(dev, addr + size))
 		dma_direct_unmap_page(dev, addr, size, dir, attrs);
 	else if (ops->unmap_page)
 		ops->unmap_page(dev, addr, size, dir, attrs);
@@ -188,7 +204,8 @@ int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg, int nents,
 	if (WARN_ON_ONCE(!dev->dma_mask))
 		return 0;
 
-	if (dma_map_direct(dev, ops))
+	if (dma_map_direct(dev, ops) ||
+	    arch_dma_map_sg_direct(dev, sg, nents))
 		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
 	else
 		ents = ops->map_sg(dev, sg, nents, dir, attrs);
@@ -207,7 +224,8 @@ void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg,
 
 	BUG_ON(!valid_dma_direction(dir));
 	debug_dma_unmap_sg(dev, sg, nents, dir);
-	if (dma_map_direct(dev, ops))
+	if (dma_map_direct(dev, ops) ||
+	    arch_dma_unmap_sg_direct(dev, sg, nents))
 		dma_direct_unmap_sg(dev, sg, nents, dir, attrs);
 	else if (ops->unmap_sg)
 		ops->unmap_sg(dev, sg, nents, dir, attrs);
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index c99de4a21458..43d106598e82 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -20,6 +20,10 @@ config DMA_OPS
 config DMA_OPS_BYPASS
 	bool
 
+# Lets platform IOMMU driver choose between bypass and IOMMU
+config ARCH_HAS_DMA_MAP_DIRECT
+	bool
+
 config NEED_SG_DMA_LENGTH
 	bool
 
-- 
2.17.1

