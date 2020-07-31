Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D9123449D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 13:36:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ4xf35W5zDqf4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 21:36:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ4vk1hwXzDqWw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 21:35:14 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VBX045058637; Fri, 31 Jul 2020 07:35:09 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32mg7auq2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 07:35:09 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06VBYaXT020137;
 Fri, 31 Jul 2020 11:35:08 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 32gcy7xjux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 11:35:08 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06VBZ4kj19137234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jul 2020 11:35:04 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01025BE053;
 Fri, 31 Jul 2020 11:35:07 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 829EFBE051;
 Fri, 31 Jul 2020 11:35:05 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.75.5])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 31 Jul 2020 11:35:05 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 1/2] powerpc/vmemmap: Fix memory leak with vmemmap list
 allocation failures.
Date: Fri, 31 Jul 2020 17:04:59 +0530
Message-Id: <20200731113500.248306-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=2 impostorscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007310088
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If we fail to allocate vmemmap list, we don't keep track of allocated
vmemmap block buf. Hence on section deactivate we skip vmemmap block
buf free. This results in memory leak.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/init_64.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 152aa0200cef..8a198504c0e1 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -162,16 +162,16 @@ static __meminit struct vmemmap_backing * vmemmap_list_alloc(int node)
 	return next++;
 }
 
-static __meminit void vmemmap_list_populate(unsigned long phys,
-					    unsigned long start,
-					    int node)
+static __meminit int vmemmap_list_populate(unsigned long phys,
+					   unsigned long start,
+					   int node)
 {
 	struct vmemmap_backing *vmem_back;
 
 	vmem_back = vmemmap_list_alloc(node);
 	if (unlikely(!vmem_back)) {
-		WARN_ON(1);
-		return;
+		pr_debug("vmemap list allocation failed\n");
+		return -ENOMEM;
 	}
 
 	vmem_back->phys = phys;
@@ -179,6 +179,7 @@ static __meminit void vmemmap_list_populate(unsigned long phys,
 	vmem_back->list = vmemmap_list;
 
 	vmemmap_list = vmem_back;
+	return 0;
 }
 
 static bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
@@ -199,6 +200,7 @@ static bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long star
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		struct vmem_altmap *altmap)
 {
+	bool altmap_alloc;
 	unsigned long page_size = 1 << mmu_psize_defs[mmu_vmemmap_psize].shift;
 
 	/* Align to the page size of the linear mapping. */
@@ -228,13 +230,32 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 			p = altmap_alloc_block_buf(page_size, altmap);
 			if (!p)
 				pr_debug("altmap block allocation failed, falling back to system memory");
+			else
+				altmap_alloc = true;
 		}
-		if (!p)
+		if (!p) {
 			p = vmemmap_alloc_block_buf(page_size, node);
+			altmap_alloc = false;
+		}
 		if (!p)
 			return -ENOMEM;
 
-		vmemmap_list_populate(__pa(p), start, node);
+		if (vmemmap_list_populate(__pa(p), start, node)) {
+			/*
+			 * If we don't populate vmemap list, we don't have
+			 * the ability to free the allocated vmemmap
+			 * pages in section_deactivate. Hence free them
+			 * here.
+			 */
+			int nr_pfns = page_size >> PAGE_SHIFT;
+			unsigned long page_order = get_order(page_size);
+
+			if (altmap_alloc)
+				vmem_altmap_free(altmap, nr_pfns);
+			else
+				free_pages((unsigned long)p, page_order);
+			return -ENOMEM;
+		}
 
 		pr_debug("      * %016lx..%016lx allocated at %p\n",
 			 start, start + page_size, p);
-- 
2.26.2

