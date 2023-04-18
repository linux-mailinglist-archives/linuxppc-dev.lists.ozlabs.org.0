Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C71256E7897
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:27:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dmY3LHHz3g4T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:27:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hdHpwVmF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hdHpwVmF;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1G5j4RC7z3ccv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 06:40:41 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33IJNMZc026291;
	Tue, 18 Apr 2023 20:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=peXMO9MUetGAKE7znYwOGBo+oePluvtSEvJSG1JiRMI=;
 b=hdHpwVmF8E4eb9sfiUGeHIKw+KVQ/bF6ran7/RInB3KTqPPmy3g83s3DbNcy2oNxG1iS
 MFIneqlX1ThjlOsgXZH3mkIVQw1zEnCwb/VgziVgQieWSgZJNplYA5Cv8fOfk/lCxevE
 7vTTPfQaKvfb51XY84w5S5zKZ3aI/iGy9rNEvdnYCn7j+Xpm6OhLNSLjvEybg7lNxYZW
 s3hL2HkyqhnCwtrucppFhtFcT1G4jVqBXYNEHy/B3hOnJLzEATsLhXSK3AwRJrb/R5rp
 Pul1PX1f6p3yPIUCrlurlzpXEzMj2Q18j/qLqPqUr0QrdlH+z686JTr0mWUtvtEacWtr QQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q1q35nr0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 20:40:33 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33IJ1oZF003683;
	Tue, 18 Apr 2023 20:40:33 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pykj7yhxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 20:40:32 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33IKeVZQ11010672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Apr 2023 20:40:32 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 911FA5804E;
	Tue, 18 Apr 2023 20:40:31 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F16B5803F;
	Tue, 18 Apr 2023 20:40:31 +0000 (GMT)
Received: from ltcd41-lp9.aus.stglabs.ibm.com (unknown [9.53.174.38])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Apr 2023 20:40:31 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/iommu: DMA address offset is incorrectly calculated with 2MB TCEs
Date: Tue, 18 Apr 2023 15:44:01 -0500
Message-Id: <20230418204401.13168-1-gbatra@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kw7ex-bM21reZuAR6oqlyzMWDTFtiwEd
X-Proofpoint-ORIG-GUID: kw7ex-bM21reZuAR6oqlyzMWDTFtiwEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_15,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=952 bulkscore=0
 phishscore=0 mlxscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304180170
X-Mailman-Approved-At: Wed, 19 Apr 2023 20:57:19 +1000
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

