Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1594C7FE77C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 04:01:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lt7j86F2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sggtg0037z3vs1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 14:00:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lt7j86F2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SggmK1zDQz3cSN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 13:55:28 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU2NXt4029504;
	Thu, 30 Nov 2023 02:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=if3tjC7VQSnV9sEoF/NvYnU7men9YgofcKf/r/77wPk=;
 b=Lt7j86F273X9vXIr3C5MZL0v0YdBBXGttTc1thWvVuI6wp2sPa5UIkCz2+7t3L+CqLDq
 PP/s8XlloQFUlJLyN+9Sl+JttH/ThrkaHTYwZYJKqARj7Q9ZROaCeKUaUKZ4+Xm7WI2n
 2dm1aDg6ybxH2d8x/eWdfVpoNzI+m5nO0ZEed2k32T/vTYLZ34LlCMnQ2TSv0gi9hEuB
 eieDhHwqEXRzyeLD+VFgWZWW5bDH1YOBDqND0bDoTmfksZjPzvmPew5RSP4iwio9pmR8
 AEZI7iITgzzTWAZegROm0AgI5MkB42D/jKkYfXVYFtWjiqEsFE+XPFjJTjEFsTcQswPp tw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uphjersud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 02:55:18 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU0Y6eI018269;
	Thu, 30 Nov 2023 02:55:17 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uku8tbtsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 02:55:17 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AU2tFnF9830942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Nov 2023 02:55:16 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4AE120043;
	Thu, 30 Nov 2023 02:55:15 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A1C520040;
	Thu, 30 Nov 2023 02:55:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Nov 2023 02:55:14 +0000 (GMT)
Received: from socotra.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9C4026032C;
	Thu, 30 Nov 2023 13:55:13 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 2/7] powerpc: mm: Implement p{m,u,4}d_leaf on all platforms
Date: Thu, 30 Nov 2023 13:53:55 +1100
Message-ID: <20231130025404.37179-5-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130025404.37179-2-rmclure@linux.ibm.com>
References: <20231130025404.37179-2-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Lnhu28kyf1d2t31F9iXcF2WfqPheTOwO
X-Proofpoint-ORIG-GUID: Lnhu28kyf1d2t31F9iXcF2WfqPheTOwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_21,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=480 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300020
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

The check that a higher-level entry in multi-level pages contains a page
translation entry (pte) is performed by p{m,u,4}d_leaf stubs, which may
be specialised for each choice of mmu. In a prior commit, we replace
uses to the catch-all stubs, p{m,u,4}d_is_leaf with p{m,u,4}d_leaf.

Replace the catch-all stub definitions for p{m,u,4}d_is_leaf with
definitions for p{m,u,4}d_leaf. A future patch will assume that
p{m,u,4}d_leaf is defined on all platforms.

In particular, implement pud_leaf for Book3E-64, pmd_leaf for all Book3E
and Book3S-64 platforms, with a catch-all definition for p4d_leaf.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v9: No longer required in order implement page table check, just
refactoring.
---
 arch/powerpc/include/asm/book3s/32/pgtable.h |  5 +++++
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ++++-----
 arch/powerpc/include/asm/nohash/64/pgtable.h |  6 ++++++
 arch/powerpc/include/asm/pgtable.h           | 22 ++------------------
 4 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 52971ee30717..9cc95a61d2a6 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -223,6 +223,11 @@ static inline void pmd_clear(pmd_t *pmdp)
 	*pmdp = __pmd(0);
 }
 
+#define pmd_leaf pmd_leaf
+static inline bool pmd_leaf(pmd_t pmd)
+{
+	return false;
+}
 
 /*
  * When flushing the tlb entry for a page, we also need to flush the hash
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index cb77eddca54b..8fdb7667c509 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1459,16 +1459,14 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
 /*
  * Like pmd_huge() and pmd_large(), but works regardless of config options
  */
-#define pmd_is_leaf pmd_is_leaf
-#define pmd_leaf pmd_is_leaf
-static inline bool pmd_is_leaf(pmd_t pmd)
+#define pmd_leaf pmd_leaf
+static inline bool pmd_leaf(pmd_t pmd)
 {
 	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
 }
 
-#define pud_is_leaf pud_is_leaf
-#define pud_leaf pud_is_leaf
-static inline bool pud_is_leaf(pud_t pud)
+#define pud_leaf pud_leaf
+static inline bool pud_leaf(pud_t pud)
 {
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
 }
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 2202c78730e8..f58cbebde26e 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -116,6 +116,12 @@ static inline void pud_clear(pud_t *pudp)
 	*pudp = __pud(0);
 }
 
+#define pud_leaf pud_leaf
+static inline bool pud_leaf(pud_t pud)
+{
+	return false;
+}
+
 #define pud_none(pud)		(!pud_val(pud))
 #define	pud_bad(pud)		(!is_kernel_addr(pud_val(pud)) \
 				 || (pud_val(pud) & PUD_BAD_BITS))
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 9224f23065ff..db0231afca9d 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -180,29 +180,11 @@ static inline void pte_frag_set(mm_context_t *ctx, void *p)
 }
 #endif
 
-#ifndef pmd_is_leaf
-#define pmd_is_leaf pmd_is_leaf
-static inline bool pmd_is_leaf(pmd_t pmd)
+#define p4d_leaf p4d_leaf
+static inline bool p4d_leaf(p4d_t p4d)
 {
 	return false;
 }
-#endif
-
-#ifndef pud_is_leaf
-#define pud_is_leaf pud_is_leaf
-static inline bool pud_is_leaf(pud_t pud)
-{
-	return false;
-}
-#endif
-
-#ifndef p4d_is_leaf
-#define p4d_is_leaf p4d_is_leaf
-static inline bool p4d_is_leaf(p4d_t p4d)
-{
-	return false;
-}
-#endif
 
 #define pmd_pgtable pmd_pgtable
 static inline pgtable_t pmd_pgtable(pmd_t pmd)
-- 
2.43.0

