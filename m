Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD70661E721
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 23:54:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N58n757twz3cFy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 09:54:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iS46s9jV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iS46s9jV;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N58j75S17z3cFR
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 09:50:51 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A6IpfbQ031709;
	Sun, 6 Nov 2022 22:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=d/fYmkVmAO1ZON6SGgVAHntARa9VPSuxsZzRL5rPsK8=;
 b=iS46s9jVM92wLgaoFhCevHqbf5xPHIQB5hft/aPMg48YvFSuosHwfmTNtWcblxSPqft5
 XOroDeUtDICKPWY/zdpIrz3ChaCSNY+UBQ9yIQxzPfUnbaRAgSyOWVZbrNg3iXh788Id
 xXuXhTEK/PBxNZrYO9w87v8IbJpBYipBUtLMX+OjnVUH+QFkO+47tJM//JKRVNSnFFTe
 mSrspoCf3zJ0yNQo50XulWcVzpmyM25QNqWL6dMSSEB75ZfqhXszLJvxCAAs9CDrsu8E
 /UNHqZTgrq3mEA8G6p3BrASelHP1j4ty5sabD/bQ6CiNFlaB2Rff52hrKfdMhxTQTYLU 2w== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1gkexvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 22:50:43 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A6Ma60K019389;
	Sun, 6 Nov 2022 22:50:41 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3kngp5h8wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 22:50:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A6ModHO52429060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 6 Nov 2022 22:50:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 693FDA404D;
	Sun,  6 Nov 2022 22:50:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE9CAA4051;
	Sun,  6 Nov 2022 22:50:38 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun,  6 Nov 2022 22:50:38 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D3E1D6038D;
	Mon,  7 Nov 2022 09:50:34 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc: mm: add p{te,md,ud}_user_accessible_page helpers
Date: Mon,  7 Nov 2022 09:49:57 +1100
Message-Id: <20221106224958.1320664-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106224958.1320664-1-rmclure@linux.ibm.com>
References: <20221106224958.1320664-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: n5NfNMJgTL1nU908I2_3WpPmbN1IXBtU
X-Proofpoint-GUID: n5NfNMJgTL1nU908I2_3WpPmbN1IXBtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_15,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=885 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211060201
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
index f1b91ad8f3a5..06e89bc4418a 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -511,6 +511,10 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
 }
 
+static inline bool pmd_user(pmd_t pmd)
+{
+	return 0;
+}
 
 
 /* This low level function performs the actual PTE insertion
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 788a9effb03e..acbb37e5f82f 100644
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
index 04a3b0b128eb..1d3cf7fe60ec 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -210,6 +210,11 @@ static inline void pmd_clear(pmd_t *pmdp)
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
index 879e9a6e5a87..2f6b5124e64c 100644
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
@@ -158,6 +163,11 @@ static inline pte_t pud_pte(pud_t pud)
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
index c9ce5019f8a8..6851a7a90553 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -191,6 +191,21 @@ static inline int pud_pfn(pud_t pud)
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
2.34.1

