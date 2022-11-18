Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CE862EA2D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 01:24:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCyFt42g7z3f4M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 11:24:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r0Py6mp8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r0Py6mp8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCyCr0d1dz3bnZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 11:22:31 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AI0M07w013517;
	Fri, 18 Nov 2022 00:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pRTesntqKGEmLNsyK7McP5Cek0N5vXsuV7PgXEiZcsE=;
 b=r0Py6mp8ctbSAggB0a0sbNA7rMd95dIkiiRAPu5nVb+V/UIBpV4BiLIkKvYX8XcWfMZ3
 kWuwkSPUQNo7MQZmnYLpqpS8dY2i5XZjRlYQt7HujDMw/ZS20PGTF7C6oiDxnke5JEMM
 IIPOTekTFikBQ7juNRH+G+AdMJcJytzHHoS49Nm31DsEj1xaYp5oRdaVT39og/lQn8Pp
 oxwGg/AkY/3r+WhiIu9TUPEAdEQgfG6Q8moUAlrPFN1aISHBk2ppshIftr1U+9jnfJOy
 8PvnlV7om4D0m0JwnRFii1pAl+5hos35ouglMNPj9lirTJ0W0H4TqaXg5xTI4NaKY8Rq 0w== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwyes00bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 00:22:23 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AI0KIa9022452;
	Fri, 18 Nov 2022 00:22:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04fra.de.ibm.com with ESMTP id 3kwsker7t1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 00:22:21 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AI0MJ0d65733016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 00:22:19 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 353BFA405B;
	Fri, 18 Nov 2022 00:22:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AC81A4054;
	Fri, 18 Nov 2022 00:22:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 00:22:18 +0000 (GMT)
Received: from civic.. (unknown [9.177.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D3EC960129;
	Fri, 18 Nov 2022 11:22:10 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 2/5] powerpc: mm: Implement p{m,u,4}d_leaf on all platforms
Date: Fri, 18 Nov 2022 00:21:43 +0000
Message-Id: <20221118002146.25979-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118002146.25979-1-rmclure@linux.ibm.com>
References: <20221118002146.25979-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rm_hzOrnXMGOQ2ELD43k46NZjfGh0IX1
X-Proofpoint-GUID: rm_hzOrnXMGOQ2ELD43k46NZjfGh0IX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxlogscore=607
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170170
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

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v5: Split patch that replaces p{m,u,4}d_is_leaf into two patches, first
replacing callsites and afterward providing generic definition.
Remove ifndef-defines implementing p{m,u}d_leaf in favour of
implementing stubs in headers belonging to the particular platforms
needing them.
---
 arch/powerpc/include/asm/book3s/32/pgtable.h |  4 ++++
 arch/powerpc/include/asm/book3s/64/pgtable.h |  8 ++-----
 arch/powerpc/include/asm/nohash/64/pgtable.h |  5 +++++
 arch/powerpc/include/asm/nohash/pgtable.h    |  5 +++++
 arch/powerpc/include/asm/pgtable.h           | 22 ++------------------
 5 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 75823f39e042..921ae95cd939 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -242,6 +242,10 @@ static inline void pmd_clear(pmd_t *pmdp)
 	*pmdp = __pmd(0);
 }
 
+static inline bool pmd_leaf(pmd_t pmd)
+{
+	return false;
+}
 
 /*
  * When flushing the tlb entry for a page, we also need to flush the hash
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index c436d8422654..9a6db4ad3228 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1426,16 +1426,12 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
 /*
  * Like pmd_huge() and pmd_large(), but works regardless of config options
  */
-#define pmd_is_leaf pmd_is_leaf
-#define pmd_leaf pmd_is_leaf
-static inline bool pmd_is_leaf(pmd_t pmd)
+static inline bool pmd_leaf(pmd_t pmd)
 {
 	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
 }
 
-#define pud_is_leaf pud_is_leaf
-#define pud_leaf pud_is_leaf
-static inline bool pud_is_leaf(pud_t pud)
+static inline bool pud_leaf(pud_t pud)
 {
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
 }
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 879e9a6e5a87..34e618bb9140 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -141,6 +141,11 @@ static inline void pud_clear(pud_t *pudp)
 	*pudp = __pud(0);
 }
 
+static inline bool pud_leaf(pud_t pud)
+{
+	return false;
+}
+
 #define pud_none(pud)		(!pud_val(pud))
 #define	pud_bad(pud)		(!is_kernel_addr(pud_val(pud)) \
 				 || (pud_val(pud) & PUD_BAD_BITS))
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index d9067dfc531c..455ae13822ee 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -60,6 +60,11 @@ static inline bool pte_hw_valid(pte_t pte)
 	return pte_val(pte) & _PAGE_PRESENT;
 }
 
+static inline bool pmd_leaf(pmd_t pmd)
+{
+	return false;
+}
+
 /*
  * Don't just check for any non zero bits in __PAGE_USER, since for book3e
  * and PTE_64BIT, PAGE_KERNEL_X contains _PAGE_BAP_SR which is also in
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 283f40d05a4d..68a3f271aebe 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -134,29 +134,11 @@ static inline void pte_frag_set(mm_context_t *ctx, void *p)
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
2.37.2

