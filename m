Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96624723694
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 07:04:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZz0j2bZyz3fgt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 15:04:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UlBKyw1P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UlBKyw1P;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZyrr2dffz3f67
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 14:57:32 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3564pJHU026673;
	Tue, 6 Jun 2023 04:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hisoaMieO1fHPCU1/wtHXvGIEKKBHjerAj5gLeTU7B8=;
 b=UlBKyw1Pg1s7+ht/ZQJD+OOeFp/9KN69WfClTnUq0DoP99UcOCk7gZrOeURJU48PniTX
 /5/PqZtfoNZpqmtU4MMfQUmxpD9houJJZSolm8Jv4yT8ymDNVPvsMyDrrZMjS+M90YoR
 u24j5el5FwTufRBlr9iYJf+6WGRCSfsFNBYe2GulkWGUzMSAjwSHtIr509eXNB61DQPS
 9p4KQxyTI/Yrllu1lmwVQ28Jsmh2l24u2BWwPUR3IOiLOoCv0E3J3ngrv9ztOQb34UHA
 kxpUAZc5JNY/gWnk2G07CAFy7Z3LwLq+CJoyl0jaecd/g4Zv4ljI/450HT1DhN+5ycbR /w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1x50r340-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:14 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3564pafS028746;
	Tue, 6 Jun 2023 04:57:14 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1x50r33m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:14 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3564W57D028546;
	Tue, 6 Jun 2023 04:57:12 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3qyxmx4gr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:12 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3564vBda2032226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 04:57:11 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A3695805B;
	Tue,  6 Jun 2023 04:57:11 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F27B5804B;
	Tue,  6 Jun 2023 04:57:06 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.204.255])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 04:57:05 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 08/16] mm/vmemmap: Improve vmemmap_can_optimize and allow architectures to override
Date: Tue,  6 Jun 2023 10:26:00 +0530
Message-Id: <20230606045608.55127-9-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
References: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yoi9bSdF1pgFYpHOISmcr-QwzurbvXhy
X-Proofpoint-ORIG-GUID: U6gP6qR3kkEN9BT2D9yMMZMHSAQSduY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_02,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=998 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060040
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
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dax vmemmap optimization requires a minimum of 2 PAGE_SIZE area within vmemmap
such that tail page mapping can point to the second PAGE_SIZE area. Enforce that
in vmemmap_can_optimize() function.

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

