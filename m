Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A146988B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 00:17:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHDWm02c0z3fRN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 10:17:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n4/ab+5b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n4/ab+5b;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHDPk5fCsz3cjJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 10:12:42 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31FMDk7K014994;
	Wed, 15 Feb 2023 23:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IhMfp4SxqeWghdzXm3WT5q6cfu3aKEZOJrHlQMt6Mag=;
 b=n4/ab+5brxxhhXK55NEk/vN5vDUdUBHsjP6zrzCyuPRYLWKQTPN92XIH3cImQOFCwoxL
 AefN9+F9pCgtq/Fex0/TOOJ95R5EWaNmB/AioPb4lFQsxGXp6QXcLlqFcMtoSYBVQCw3
 3Ob3oUlwvOWQiZWbxADu0HbuvFLIoY5aSKpdYeNCHCLcAPqnLb4BuuQsZJAKXyQFknLY
 sK0obpqCo7//AR7Db/8tjem4OkV/9pY54ABOK0esLOGZ7WQaTYA0nk8SEyKJ8gtp5dgv
 8n7mddEp+IU3KNvoT1+qW8wqNYfR+tIqLEJuS2SMmiL1jWpzvGQZTQCZb7lCNZe87cgi Qg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ns80bh1ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 23:12:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31FBCqPt029894;
	Wed, 15 Feb 2023 23:12:32 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3np29fnxvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 23:12:32 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31FNCUOq46924054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Feb 2023 23:12:30 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DB9620043;
	Wed, 15 Feb 2023 23:12:30 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EDF320040;
	Wed, 15 Feb 2023 23:12:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Feb 2023 23:12:29 +0000 (GMT)
Received: from civic.. (unknown [9.177.83.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0A08B60418;
	Thu, 16 Feb 2023 10:12:22 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 5/7] powerpc: mm: Add common pud_pfn stub for all platforms
Date: Thu, 16 Feb 2023 10:11:51 +1100
Message-Id: <20230215231153.2147454-6-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230215231153.2147454-1-rmclure@linux.ibm.com>
References: <20230215231153.2147454-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0Mw93qsqddb4sqawIJzPblRhOH5cc42j
X-Proofpoint-ORIG-GUID: 0Mw93qsqddb4sqawIJzPblRhOH5cc42j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_13,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 mlxlogscore=909 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150197
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prior to this commit, pud_pfn was implemented with BUILD_BUG as the inline
function for 64-bit Book3S systems but is never included, as its
invocations in generic code are guarded by calls to pud_devmap which return
zero on such systems. A future patch will provide support for page table
checks, the generic code for which depends on a pud_pfn stub being
implemented, even while the patch will not interact with puds directly.

Remove the 64-bit Book3S stub and define pud_pfn to warn on all
platforms. pud_pfn may be defined properly on a per-platform basis
should it grow real usages in future.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V2: Remove conditional BUILD_BUG and BUG. Instead warn on usage.
V3: Replace WARN with WARN_ONCE, which should suffice to demonstrate
misuse of puds.
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ----------
 arch/powerpc/include/asm/pgtable.h           | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 589d2dbe3873..df5ee856444d 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1327,16 +1327,6 @@ static inline int pgd_devmap(pgd_t pgd)
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-static inline int pud_pfn(pud_t pud)
-{
-	/*
-	 * Currently all calls to pud_pfn() are gated around a pud_devmap()
-	 * check so this should never be used. If it grows another user we
-	 * want to know about it.
-	 */
-	BUILD_BUG();
-	return 0;
-}
 #define __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
 pte_t ptep_modify_prot_start(struct vm_area_struct *, unsigned long, pte_t *);
 void ptep_modify_prot_commit(struct vm_area_struct *, unsigned long,
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 284408829fa3..ad0829f816e9 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -153,6 +153,20 @@ struct seq_file;
 void arch_report_meminfo(struct seq_file *m);
 #endif /* CONFIG_PPC64 */
 
+/*
+ * Currently only consumed by page_table_check_pud_{set,clear}. Since clears
+ * and sets to page table entries at any level are done through
+ * page_table_check_pte_{set,clear}, provide stub implementation.
+ */
+#ifndef pud_pfn
+#define pud_pfn pud_pfn
+static inline int pud_pfn(pud_t pud)
+{
+	WARN_ONCE(1, "pud: platform does not use pud entries directly");
+	return 0;
+}
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
-- 
2.37.2

