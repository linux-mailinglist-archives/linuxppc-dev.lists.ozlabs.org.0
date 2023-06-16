Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A7F732FA2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:16:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bf6hySyB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjGnx66Cpz3cRg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:16:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bf6hySyB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjGdw4h00z3bmp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 21:09:56 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GAowna018749;
	Fri, 16 Jun 2023 11:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2nIHSSUSxuasnMPG57XtfkGpKEslBIgIjQykIV+BjZI=;
 b=Bf6hySyB9OdGKdq/zlFMV6Xr9cWAzlH7wJSONsWfT9w6IlizdKuFxEG2hXb9wFf3zYS+
 I1kAHZvcNwMtve6upiULELVaAOB84u3O6n3l2/RnTX/TB5X4nl8eVyUUAdxUDgbsV/A3
 q4ZVUzAmM4aKuXosZkVXIm+9oZxHa5D5YHTKnhSy+PjD67Rzhqt6ng90hPWKoSU0E3bs
 TIsfk261FQOOVFY8/PKZJRxJaQ2wGs7VLvoyXTfeUh9CF8Szmr3z2ntwcCkPXW8wlUqL
 SsFXhC5Z//cbIfGXvqlCSWAAMDy7+6OZeh/bPXYq0kDy+EC6ZsI1OTUZoiaygT418QB2 lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8pbm0f7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:09:39 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35GApBnB019196;
	Fri, 16 Jun 2023 11:09:38 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8pbm0f6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:09:38 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35GAlmZr010717;
	Fri, 16 Jun 2023 11:09:36 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3r4gt5yhe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:09:36 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35GB9ZFJ28967198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 11:09:35 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 479845805C;
	Fri, 16 Jun 2023 11:09:35 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F82C58058;
	Fri, 16 Jun 2023 11:09:29 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.52.24])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 11:09:28 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2 08/16] mm/vmemmap: Improve vmemmap_can_optimize and allow architectures to override
Date: Fri, 16 Jun 2023 16:38:18 +0530
Message-Id: <20230616110826.344417-9-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
References: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kYPxs0AVpUyxr9Dw0HjJ-6Dc32dedHBR
X-Proofpoint-ORIG-GUID: RZSIYIkuDjT9w6LwUdE6d3PlYbkqnWEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_06,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxlogscore=983 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160099
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dax vmemmap optimization requires a minimum of 2 PAGE_SIZE area within
vmemmap such that tail page mapping can point to the second PAGE_SIZE area.
Enforce that in vmemmap_can_optimize() function.

Architectures like powerpc also want to enable vmemmap optimization
conditionally (only with radix MMU translation). Hence allow architecture
override.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 include/linux/mm.h | 30 ++++++++++++++++++++++++++----
 mm/mm_init.c       |  2 +-
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 27ce77080c79..9a45e61cd83f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -31,6 +31,8 @@
 #include <linux/memremap.h>
 #include <linux/slab.h>
 
+#include <asm/page.h>
+
 struct mempolicy;
 struct anon_vma;
 struct anon_vma_chain;
@@ -3550,13 +3552,33 @@ void vmemmap_free(unsigned long start, unsigned long end,
 		struct vmem_altmap *altmap);
 #endif
 
+#define VMEMMAP_RESERVE_NR	2
 #ifdef CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP
-static inline bool vmemmap_can_optimize(struct vmem_altmap *altmap,
-					   struct dev_pagemap *pgmap)
+static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
+					  struct dev_pagemap *pgmap)
 {
-	return is_power_of_2(sizeof(struct page)) &&
-		pgmap && (pgmap_vmemmap_nr(pgmap) > 1) && !altmap;
+	if (pgmap) {
+		unsigned long nr_pages;
+		unsigned long nr_vmemmap_pages;
+
+		nr_pages = pgmap_vmemmap_nr(pgmap);
+		nr_vmemmap_pages = ((nr_pages * sizeof(struct page)) >> PAGE_SHIFT);
+		/*
+		 * For vmemmap optimization with DAX we need minimum 2 vmemmap
+		 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
+		 */
+		return is_power_of_2(sizeof(struct page)) &&
+			(nr_vmemmap_pages > VMEMMAP_RESERVE_NR) && !altmap;
+	}
+	return false;
 }
+/*
+ * If we don't have an architecture override, use the generic rule
+ */
+#ifndef vmemmap_can_optimize
+#define vmemmap_can_optimize __vmemmap_can_optimize
+#endif
+
 #else
 static inline bool vmemmap_can_optimize(struct vmem_altmap *altmap,
 					   struct dev_pagemap *pgmap)
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 7f7f9c677854..d1676afc94f1 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1020,7 +1020,7 @@ static inline unsigned long compound_nr_pages(struct vmem_altmap *altmap,
 	if (!vmemmap_can_optimize(altmap, pgmap))
 		return pgmap_vmemmap_nr(pgmap);
 
-	return 2 * (PAGE_SIZE / sizeof(struct page));
+	return VMEMMAP_RESERVE_NR * (PAGE_SIZE / sizeof(struct page));
 }
 
 static void __ref memmap_init_compound(struct page *head,
-- 
2.40.1

