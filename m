Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBCB391A9C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 16:46:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fqv0759Dqz3096
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 00:46:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ackABWeR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ackABWeR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqtzf3SlHz2xvZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 00:45:50 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14QEYunU094511; Wed, 26 May 2021 10:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=JLLQK5U1iGPdy6tfyd/TpIUVbT4W6O5VHoqCVhZiQFY=;
 b=ackABWeRFYs0ohuvIb1cjUT3M6y+/L6/uCmF/goUM9W6kmKQ/TEmFuFPMWoxUoatFnS0
 GqSCcpJs+PIiUdgJAiQJHjWOFPJXdEOyVOxpyDd5DR43yB25fZ85akIGTx9B8oIcfA87
 4AAwc6Kr8Dd4HPFeXGiEkf6r9LdLuAanBSKU0FQNlE5wDk21rgtLMDqj4REE+10CDD/L
 333oAz+m9H4k2s7y9O1t3i5iXuYXgzSOPsJEEC/kRPNH4D4uDav4rh3z8XAxhJQ6lh5H
 T51SafK/8JvxNFWZvZNmNpGBvBi4AcdH4DpCPqW+TmC+FdgCkypWktuZL9dm0x1JUg+R VQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38snh1p1kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 10:45:46 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14QEjiQp013972;
 Wed, 26 May 2021 14:45:44 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 38s1rp0b46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 14:45:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14QEjfUd30933354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 May 2021 14:45:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DCB84C050;
 Wed, 26 May 2021 14:45:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FFCE4C044;
 Wed, 26 May 2021 14:45:41 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.83.74])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 May 2021 14:45:41 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, aik@ozlabs.ru
Subject: [PATCH] Revert "powerpc/kernel/iommu: Align size for
 IOMMU_PAGE_SIZE() to save TCEs"
Date: Wed, 26 May 2021 16:45:40 +0200
Message-Id: <20210526144540.117795-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j3eDkfPCAksp0W90Ix6Jy4eThI6E_fHo
X-Proofpoint-ORIG-GUID: j3eDkfPCAksp0W90Ix6Jy4eThI6E_fHo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-26_09:2021-05-26,
 2021-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105260098
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
Cc: zdai@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 3c0468d4451eb6b4f6604370639f163f9637a479.

That commit was breaking alignment guarantees for the DMA address when
allocating coherent mappings, as described in
Documentation/core-api/dma-api-howto.rst

It was also noticed by Mellanox' driver:
[ 1515.763621] mlx5_core c002:01:00.0: mlx5_frag_buf_alloc_node:146:(pid 13402): unexpected map alignment: 0x0800000000c61000, page_shift=16
[ 1515.763635] mlx5_core c002:01:00.0: mlx5_cqwq_create:181:(pid
13402): mlx5_frag_buf_alloc_node() failed, -12

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 arch/powerpc/kernel/iommu.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 57d6b85e9b96..2af89a5e379f 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -898,7 +898,6 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
 	unsigned int order;
 	unsigned int nio_pages, io_order;
 	struct page *page;
-	size_t size_io = size;
 
 	size = PAGE_ALIGN(size);
 	order = get_order(size);
@@ -925,9 +924,8 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
 	memset(ret, 0, size);
 
 	/* Set up tces to cover the allocated range */
-	size_io = IOMMU_PAGE_ALIGN(size_io, tbl);
-	nio_pages = size_io >> tbl->it_page_shift;
-	io_order = get_iommu_order(size_io, tbl);
+	nio_pages = size >> tbl->it_page_shift;
+	io_order = get_iommu_order(size, tbl);
 	mapping = iommu_alloc(dev, tbl, ret, nio_pages, DMA_BIDIRECTIONAL,
 			      mask >> tbl->it_page_shift, io_order, 0);
 	if (mapping == DMA_MAPPING_ERROR) {
@@ -942,9 +940,10 @@ void iommu_free_coherent(struct iommu_table *tbl, size_t size,
 			 void *vaddr, dma_addr_t dma_handle)
 {
 	if (tbl) {
-		size_t size_io = IOMMU_PAGE_ALIGN(size, tbl);
-		unsigned int nio_pages = size_io >> tbl->it_page_shift;
+		unsigned int nio_pages;
 
+		size = PAGE_ALIGN(size);
+		nio_pages = size >> tbl->it_page_shift;
 		iommu_free(tbl, dma_handle, nio_pages);
 		size = PAGE_ALIGN(size);
 		free_pages((unsigned long)vaddr, get_order(size));
-- 
2.31.1

