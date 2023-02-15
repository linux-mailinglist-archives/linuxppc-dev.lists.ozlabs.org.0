Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F906988B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 00:16:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHDVZ3JSbz3bT0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 10:16:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=psf5ohyo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=psf5ohyo;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHDPc6kfLz3cdB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 10:12:36 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31FKNQmi040698;
	Wed, 15 Feb 2023 23:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=B/OnZKV6NITF7aQHtAiUT3EN/N3GnxoKIq82DXHkFaY=;
 b=psf5ohyoieSWgYOz8DiOgmKfDNzasiYw+UIgkQFq45/kaSvDM6qnfuEnujPNrau3l7dN
 /LFoA0dEs19JhLgAFrHyAHtXVYF5yi9DQLvtetPWAhyOl9eoz3t5AsoxmH3qMsStkYvQ
 gnSi1XF5ghnxx3zmTR5bn2+J1qADz9hhGiUzQNBfR8UHamzyjoTqfFxiWX3asspfF+Za
 QT+dCxtBUlExsgm1eXKPIVplsEdms39JSDmLU4tpBqK7Vivfk+jKh3RmgEh3OQn1yb/8
 LToMBapCe1X+vGcG54LHFvM3Kq/WZ8NyO7z6XTPOTIBQ7e2ZMF7/2pJeFbdDEkkf3RaG GQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ns67fbt49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 23:12:29 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31FMKLoU029130;
	Wed, 15 Feb 2023 23:12:27 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3np2n6mcg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 23:12:27 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31FNCOON48497054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Feb 2023 23:12:25 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0E602004B;
	Wed, 15 Feb 2023 23:12:24 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB63420043;
	Wed, 15 Feb 2023 23:12:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Feb 2023 23:12:23 +0000 (GMT)
Received: from civic.. (unknown [9.177.83.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DCDF2600D2;
	Thu, 16 Feb 2023 10:12:19 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 4/7] powerpc: mm: Implement p{m,u,4}d_leaf on all platforms
Date: Thu, 16 Feb 2023 10:11:50 +1100
Message-Id: <20230215231153.2147454-5-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230215231153.2147454-1-rmclure@linux.ibm.com>
References: <20230215231153.2147454-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: auxW6XEJRnHZ1_XM6d_AOTGf9zHjr-3T
X-Proofpoint-GUID: auxW6XEJRnHZ1_XM6d_AOTGf9zHjr-3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_13,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=805 classifier=spam adjust=0 reason=mlx scancount=1
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
v5: Split patch that replaces p{m,u,4}d_is_leaf into two patches, first
replacing callsites and afterward providing generic definition.
Remove ifndef-defines implementing p{m,u}d_leaf in favour of
implementing stubs in headers belonging to the particular platforms
needing them.
---
 arch/powerpc/include/asm/book3s/32/pgtable.h |  5 +++++
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ++++-----
 arch/powerpc/include/asm/nohash/64/pgtable.h |  6 ++++++
 arch/powerpc/include/asm/nohash/pgtable.h    |  6 ++++++
 arch/powerpc/include/asm/pgtable.h           | 22 ++------------------
 5 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 75823f39e042..a090cb13a4a0 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -242,6 +242,11 @@ static inline void pmd_clear(pmd_t *pmdp)
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
index 7e0d546f4b3c..589d2dbe3873 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1359,16 +1359,14 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
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
index 879e9a6e5a87..d391a45e0f11 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -141,6 +141,12 @@ static inline void pud_clear(pud_t *pudp)
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
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index f36dd2e2d591..43b50fd8d236 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -60,6 +60,12 @@ static inline bool pte_hw_valid(pte_t pte)
 	return pte_val(pte) & _PAGE_PRESENT;
 }
 
+#define pmd_leaf pmd_leaf
+static inline bool pmd_leaf(pmd_t pmd)
+{
+	return false;
+}
+
 /*
  * Don't just check for any non zero bits in __PAGE_USER, since for book3e
  * and PTE_64BIT, PAGE_KERNEL_X contains _PAGE_BAP_SR which is also in
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 17d30359d1f4..284408829fa3 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -128,29 +128,11 @@ static inline void pte_frag_set(mm_context_t *ctx, void *p)
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

