Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CFF6E7E3A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 17:27:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1l5l6TBtz3c8r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 01:27:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WIde/pNc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WIde/pNc;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1l4q1Vs4z3c7d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 01:26:34 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33JEZxp6034942;
	Wed, 19 Apr 2023 15:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=wLNPvVRGxg8hpkzo7WwsYUTm8PK8gZi/YR+4Q12n04Q=;
 b=WIde/pNcdxWKiSeyGtWLs2wR2k0uK22GWhxa9O6OVbi5ZqNCoxN9w9id2tjfzocyi042
 3OhI2M1LH0h0wvY+SZy5yfhX4hY0+x5deombzGV6VtcI77KmM/YRJsOAwLWTui+f3Cxo
 Fl/uUJfFMuQ7FRaBqH1mdhikEoo+06IBV96r/tiIIJcCK5arxQJgrnvFNco3BdL8bQyt
 j4tLTO3KoMqLtQ2JDT5qtOY4pR7UzxR4AAti6hyIDczjxmTvcqDN8r3PsRiUjSz05VNj
 yImZIyvKhwBjo4yStUvhy1lygf2wslplfv3ouFbgmyVCq15c+n4EZGsUsqRKVFAFGB60 Eg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q2apn1kvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Apr 2023 15:26:26 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33JE2MUc026556;
	Wed, 19 Apr 2023 15:26:25 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3q1uxdfn41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Apr 2023 15:26:25 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33JFQOA223134776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Apr 2023 15:26:24 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5312E5805F;
	Wed, 19 Apr 2023 15:26:24 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F15805805A;
	Wed, 19 Apr 2023 15:26:23 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.24.27.252])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Apr 2023 15:26:23 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/iommu: DMA address offset is incorrectly calculated with 2MB TCEs
Date: Wed, 19 Apr 2023 10:26:23 -0500
Message-Id: <20230419152623.26439-1-gbatra@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JQjm7dxg65jGEiIWsFPzrjeVjofGVsyt
X-Proofpoint-GUID: JQjm7dxg65jGEiIWsFPzrjeVjofGVsyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_10,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=995 adultscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190131
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Greg Joyce <gjoyce@linux.vnet.ibm.com>, Gaurav Batra <gbatra@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When DMA window is backed by 2MB TCEs, the DMA address for the mapped
page should be the offset of the page relative to the 2MB TCE. The code
was incorrectly setting the DMA address to the beginning of the TCE
range.

Mellanox driver is reporting timeout trying to ENABLE_HCA for an SR-IOV
ethernet port, when DMA window is backed by 2MB TCEs.

Fixes: 3872731187141d5d0a5c4fb30007b8b9ec36a44d
Signed-off-by: Gaurav Batra <gbatra@linux.vnet.ibm.com>

Reviewed-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/iommu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index ee95937bdaf1..ca57526ce47a 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -517,7 +517,7 @@ int ppc_iommu_map_sg(struct device *dev, struct iommu_table *tbl,
 		/* Convert entry to a dma_addr_t */
 		entry += tbl->it_offset;
 		dma_addr = entry << tbl->it_page_shift;
-		dma_addr |= (s->offset & ~IOMMU_PAGE_MASK(tbl));
+		dma_addr |= (vaddr & ~IOMMU_PAGE_MASK(tbl));
 
 		DBG("  - %lu pages, entry: %lx, dma_addr: %lx\n",
 			    npages, entry, dma_addr);
@@ -904,6 +904,7 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
 	unsigned int order;
 	unsigned int nio_pages, io_order;
 	struct page *page;
+	int tcesize = (1 << tbl->it_page_shift);
 
 	size = PAGE_ALIGN(size);
 	order = get_order(size);
@@ -930,7 +931,8 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
 	memset(ret, 0, size);
 
 	/* Set up tces to cover the allocated range */
-	nio_pages = size >> tbl->it_page_shift;
+	nio_pages = IOMMU_PAGE_ALIGN(size, tbl) >> tbl->it_page_shift;
+
 	io_order = get_iommu_order(size, tbl);
 	mapping = iommu_alloc(dev, tbl, ret, nio_pages, DMA_BIDIRECTIONAL,
 			      mask >> tbl->it_page_shift, io_order, 0);
@@ -938,7 +940,8 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
 		free_pages((unsigned long)ret, order);
 		return NULL;
 	}
-	*dma_handle = mapping;
+
+	*dma_handle = mapping | ((u64)ret & (tcesize - 1));
 	return ret;
 }
 
-- 

