Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8947571CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:33:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aV7G7Sk9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4jgP6qMZz3cbR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:33:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aV7G7Sk9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4jbg4PJ0z2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 12:30:23 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36I2HuA9004145;
	Tue, 18 Jul 2023 02:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=T4CIGxYsn2ZY3t+396XjS8G0EOxy7nPVMwImDAF6xkk=;
 b=aV7G7Sk92L5cCffO7oaWU1WZDx3RAYvqD0DSkwBhZLx1KksZWleRqr40/ZBsYzdbsnnP
 fx8B4U2Yb3Ib+HyoxVVkZli4nH3RW+x8IWDMRADo5UApuDdHKdHaogkv3hP8cxZ7+y1n
 sn5hoErbAUKSFaPXhpkC6ht+bGDCcgvfKl8h7h8U/U2fN/xrTYHLBNvXyIsoP+C6neQ8
 ua1qmBZv+K9XJ1EgpA0iDZ2eM5iY5W+x29xqnPa8jijuQmgdsVuwLh5qBcEByCsRHou6
 GgGVozxoClEpSNoZikEhYmrjJghi4+3RqF5AJzhWVZ/xH2ZBAO+7C/AZcJvCptfhILYQ aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhu0g66n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:02 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36I2KYo0009773;
	Tue, 18 Jul 2023 02:30:02 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhu0g668-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:02 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36I0UBak004479;
	Tue, 18 Jul 2023 02:30:01 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv8g0vhx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:01 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36I2U1lY36176292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 02:30:01 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10A355806D;
	Tue, 18 Jul 2023 02:30:01 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 073275805D;
	Tue, 18 Jul 2023 02:29:56 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.62.199])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Jul 2023 02:29:55 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v5 03/13] mm/vmemmap: Improve vmemmap_can_optimize and allow architectures to override
Date: Tue, 18 Jul 2023 07:59:23 +0530
Message-ID: <20230718022934.90447-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
References: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H-niJDl6tndVBlgUkGFBwAfDB0akcG6a
X-Proofpoint-ORIG-GUID: Yn_dCHohjLvOGRxGviNHvSMLo4qaEfB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180017
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

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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

