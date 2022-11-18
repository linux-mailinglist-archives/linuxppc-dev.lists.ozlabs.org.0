Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C04C862EA30
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 01:25:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCyGv4B0Xz3f6g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 11:25:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cdxZvV8q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cdxZvV8q;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCyCr73FJz3bnZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 11:22:32 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AI0Jegs010768;
	Fri, 18 Nov 2022 00:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=f/IDyGfKEOExT7+uP6Safj7GSMLL9rrSxUWGVab2cXs=;
 b=cdxZvV8qJKajJmbHVCGRAN8nqptGp18HOxQiebfctdBMsYplOFxk/6n0QFe4PgGEgd+5
 oAWDtAL5N/ooVI6Doqvw/Kz8twekbljuV+8256akYiIdzw4FOlFLKSycyDDHul9z0bBK
 tKqfNifTbazZg7fN9r7OOqK7jO2T8HmnYZZKLrDkvtUNDNMH7Ow8tUnWd4LmWEHJTTA1
 ukTmwVB19lA1lz1kSyLQg1OvYj0SSSDRX+htFqS6O/RG/S3LP5A77QDjkpdjQHzwO+6y
 fT0VyEK/3iDSzWZsT1Uf8oM/sBwLyjFD1ExroA/s3zhriTTFGFN3cxd+yBN1l0EPbG0U kQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwydfr1kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 00:22:25 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AI0K9Ai015892;
	Fri, 18 Nov 2022 00:22:23 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3kwthe09gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 00:22:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AI0GI0s34406692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 00:16:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29EF711C04A;
	Fri, 18 Nov 2022 00:22:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FA3411C050;
	Fri, 18 Nov 2022 00:22:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 00:22:20 +0000 (GMT)
Received: from civic.. (unknown [9.177.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 36431603DA;
	Fri, 18 Nov 2022 11:22:16 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 4/5] powerpc: mm: add p{te,md,ud}_user_accessible_page helpers
Date: Fri, 18 Nov 2022 00:21:45 +0000
Message-Id: <20221118002146.25979-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118002146.25979-1-rmclure@linux.ibm.com>
References: <20221118002146.25979-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bp52QxnjbPl74UgxY7SF33VwmHfyk7XK
X-Proofpoint-GUID: bp52QxnjbPl74UgxY7SF33VwmHfyk7XK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=847 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211170170
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

Add the following helpers for detecting whether a page table entry
is a leaf and is accessible to user space.

 * pte_user_accessible_page
 * pmd_user_accessible_page
 * pud_user_accessible_page

Also implement missing pud_user definitions for both Book3S/nohash 64-bit
systems, and pmd_user for Book3S/nohash 32-bit systems.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V2: Provide missing pud_user implementations, use p{u,m}d_is_leaf.
V3: Provide missing pmd_user implementations as stubs in 32-bit.
V4: Use pmd_leaf, pud_leaf, and define pmd_user for 32 Book3E with
static inline method rather than macro.
---
 arch/powerpc/include/asm/book3s/32/pgtable.h |  4 ++++
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ++++++++++
 arch/powerpc/include/asm/nohash/32/pgtable.h |  5 +++++
 arch/powerpc/include/asm/nohash/64/pgtable.h | 10 ++++++++++
 arch/powerpc/include/asm/pgtable.h           | 15 +++++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 921ae95cd939..b2fdd3cc81de 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -515,6 +515,10 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
 }
 
+static inline bool pmd_user(pmd_t pmd)
+{
+	return 0;
+}
 
 
 /* This low level function performs the actual PTE insertion
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 5fb910ab250d..e04e3cd378a6 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -602,6 +602,16 @@ static inline bool pte_user(pte_t pte)
 	return !(pte_raw(pte) & cpu_to_be64(_PAGE_PRIVILEGED));
 }
 
+static inline bool pmd_user(pmd_t pmd)
+{
+	return !(pmd_raw(pmd) & cpu_to_be64(_PAGE_PRIVILEGED));
+}
+
+static inline bool pud_user(pud_t pud)
+{
+	return !(pud_raw(pud) & cpu_to_be64(_PAGE_PRIVILEGED));
+}
+
 #define pte_access_permitted pte_access_permitted
 static inline bool pte_access_permitted(pte_t pte, bool write)
 {
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 0d40b33184eb..94b2a53f73d5 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -209,6 +209,11 @@ static inline void pmd_clear(pmd_t *pmdp)
 	*pmdp = __pmd(0);
 }
 
+static inline bool pmd_user(pmd_t pmd)
+{
+	return false;
+}
+
 /*
  * PTE updates. This function is called whenever an existing
  * valid PTE is updated. This does -not- include set_pte_at()
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 34e618bb9140..69304159aafc 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -123,6 +123,11 @@ static inline pte_t pmd_pte(pmd_t pmd)
 	return __pte(pmd_val(pmd));
 }
 
+static inline bool pmd_user(pmd_t pmd)
+{
+	return (pmd_val(pmd) & _PAGE_USER) == _PAGE_USER;
+}
+
 #define pmd_none(pmd)		(!pmd_val(pmd))
 #define	pmd_bad(pmd)		(!is_kernel_addr(pmd_val(pmd)) \
 				 || (pmd_val(pmd) & PMD_BAD_BITS))
@@ -163,6 +168,11 @@ static inline pte_t pud_pte(pud_t pud)
 	return __pte(pud_val(pud));
 }
 
+static inline bool pud_user(pud_t pud)
+{
+	return (pud_val(pud) & _PAGE_USER) == _PAGE_USER;
+}
+
 static inline pud_t pte_pud(pte_t pte)
 {
 	return __pud(pte_val(pte));
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 5db9fa157685..5227bbaa7acf 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -173,6 +173,21 @@ static inline int pud_pfn(pud_t pud)
 }
 #endif
 
+static inline bool pte_user_accessible_page(pte_t pte)
+{
+	return pte_present(pte) && pte_user(pte);
+}
+
+static inline bool pmd_user_accessible_page(pmd_t pmd)
+{
+	return pmd_leaf(pmd) && pmd_present(pmd) && pmd_user(pmd);
+}
+
+static inline bool pud_user_accessible_page(pud_t pud)
+{
+	return pud_leaf(pud) && pud_present(pud) && pud_user(pud);
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
-- 
2.37.2

