Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7235E73B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 08:10:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYhb12W2Yz3dqM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 16:10:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i5duR17N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i5duR17N;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYhYY078dz3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 16:09:04 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28N5LDYs027380;
	Fri, 23 Sep 2022 06:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Iwxl3RuZCCHRA83MyniC4wNZGGlpv/T6GGbpVAfzL1k=;
 b=i5duR17Nwy/B/dGxmXKJOqO4omP021hhEANNtvwQbuyD5xeLAyr220fYj3n1yIvMlqd+
 djljcnmkfJcRK2OeR8WUkIpnAPa0DcI08mqbbsJyLZTznWTFN+55xGaV2h//lA/Zb/ZL
 DZ5CiWKW8icXcEGFdKxo/mqzSbDVqY8LF6uN5iHottkbhaujsgGDJgcrqaJiPp0ehZKv
 5EWsDzkVb8BadKfeODE/QUbSmY9IWxa4dce5OR8jenRlhdB95zrLwXulUBWyn/BxXwJ1
 k2VB8tNzhhI0pNTHPmwZWBMUnHHFfqyh58HS8jKuOvYx1PldoDR5wd2BdB9DxQ31JJ5Y LA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3js4egm66q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 06:08:58 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28N65Ld0020892;
	Fri, 23 Sep 2022 06:08:55 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3jn5gj7h5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 06:08:55 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28N64nqx32047574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Sep 2022 06:04:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6618B4C040;
	Fri, 23 Sep 2022 06:08:53 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCEAE4C046;
	Fri, 23 Sep 2022 06:08:52 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 23 Sep 2022 06:08:52 +0000 (GMT)
Received: from civic.. (unknown [9.177.17.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8714260556;
	Fri, 23 Sep 2022 16:08:49 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page helpers
Date: Fri, 23 Sep 2022 16:08:01 +1000
Message-Id: <20220923060802.1187520-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923060802.1187520-1-rmclure@linux.ibm.com>
References: <20220923060802.1187520-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4PfSTur87tumQ8aQ0rwzgQK6pADYfSdc
X-Proofpoint-ORIG-GUID: 4PfSTur87tumQ8aQ0rwzgQK6pADYfSdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_02,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=661 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209230038
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

Also implement missing pud_user definitions for both Book3S/E 64-bit
systems.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V2: Provide missing pud_user implementations, use p{u,m}d_is_leaf.
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ++++++
 arch/powerpc/include/asm/nohash/64/pgtable.h | 10 ++++++
 arch/powerpc/include/asm/pgtable.h           | 33 ++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index f9aefa492df0..3083111f9d0a 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -621,6 +621,16 @@ static inline bool pte_user(pte_t pte)
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
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 599921cc257e..23c5135178d1 100644
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
index 36956fb440e1..69eed4e03da0 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -172,6 +172,39 @@ static inline int pud_pfn(pud_t pud)
 }
 #endif
 
+static inline bool pte_user_accessible_page(pte_t pte)
+{
+	return pte_present(pte) && pte_user(pte);
+}
+
+#ifdef CONFIG_PPC64
+
+static inline bool pmd_user_accessible_page(pmd_t pmd)
+{
+	return pmd_is_leaf(pmd) && pmd_present(pmd) && pmd_user(pmd);
+}
+
+static inline bool pud_user_accessible_page(pud_t pud)
+{
+	return pud_is_leaf(pud) && pud_present(pud) && pud_user(pud);
+}
+
+#else
+
+static inline bool pmd_user_accessible_page(pmd_t pmd)
+{
+	WARN(1, "pmd: multi-level paging unsupported on ppc32");
+	return false;
+}
+
+static inline bool pud_user_accessible_page(pud_t pud)
+{
+	WARN(1, "pud: multi-level paging unsupported on ppc32");
+	return false;
+}
+
+#endif /* CONFIG_PPC64 */
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
-- 
2.34.1

