Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA45C7497D9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 11:02:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iG1zm2bc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxVsP2rQTz3cBb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 19:02:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iG1zm2bc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxVnn0S7Vz3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 18:59:08 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3668mSRt012947;
	Thu, 6 Jul 2023 08:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wRpOvZEenjvDphBufXXJXjaJM9fWCo+EyUTVYUwsbTE=;
 b=iG1zm2bcmvr0m3aEc3ZhzyeVEctsTzRpc4vXyqFbQteqEDyPDMxfJAuBcfVKVMOrh7vc
 HJ6wFCK9Wim7gx4d+THahjsKi9pnDR2ROsQg4B+96CgKwTXFI7A1QVJZ19VEDwqrVD6Y
 LuplTicjvt5CL/Fx0ESGvelSpXE4wj81HLaIi6sdvRgDhdoWtWLVEKEUeo20aPTcwN7y
 YupKnkwm6rec/UlYb3ltTE/ziA0t4/6726wU6nxIyvhXf0Bsez69y9RgSn6v8OKcpKkk
 owQzgyaHzDgM6aIHLi1qTMzYUG7Lg9/W5pAhOsg9TphdUTP+t1hwaAECNx14ut1jaCnt pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnte408pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:58:51 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3668oUkj024681;
	Thu, 6 Jul 2023 08:58:50 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnte408nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:58:50 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3668U1BB004414;
	Thu, 6 Jul 2023 08:58:49 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3rjbs5quwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:58:49 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3668wmjR66191850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 08:58:48 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DAF858058;
	Thu,  6 Jul 2023 08:58:48 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73A7F58057;
	Thu,  6 Jul 2023 08:58:43 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 08:58:43 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v3 03/13] mm/vmemmap: Improve vmemmap_can_optimize and allow architectures to override
Date: Thu,  6 Jul 2023 14:28:09 +0530
Message-ID: <20230706085819.827761-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706085819.827761-1-aneesh.kumar@linux.ibm.com>
References: <20230706085819.827761-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w85QwxJHUvyU5O4k89ARA3kbIUQVepph
X-Proofpoint-ORIG-GUID: q7Yv54e6Sp5kY0GDyNPjEzDJrq-2NIvR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_05,2023-07-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=943 mlxscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060075
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
 include/linux/mm.h | 27 +++++++++++++++++++++++----
 mm/mm_init.c       |  2 +-
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2dd73e4f3d8e..1a2234ee14d2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3639,13 +3639,32 @@ void vmemmap_free(unsigned long start, unsigned long end,
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
+	unsigned long nr_pages;
+	unsigned long nr_vmemmap_pages;
+
+	if (!pgmap || !is_power_of_2(sizeof(struct page)))
+		return false;
+
+	nr_pages = pgmap_vmemmap_nr(pgmap);
+	nr_vmemmap_pages = ((nr_pages * sizeof(struct page)) >> PAGE_SHIFT);
+	/*
+	 * For vmemmap optimization with DAX we need minimum 2 vmemmap
+	 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
+	 */
+	return !altmap && (nr_vmemmap_pages > VMEMMAP_RESERVE_NR);
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
index a1963c3322af..245ac69b66a5 100644
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
2.41.0

