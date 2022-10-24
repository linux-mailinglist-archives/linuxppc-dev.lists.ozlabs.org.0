Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D54C609783
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 02:37:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mwbl70Jk2z3bm9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 11:37:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NR1dQlMZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NR1dQlMZ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwbj65C2Rz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 11:36:10 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29NNcYj9005553;
	Mon, 24 Oct 2022 00:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Gsms0L/qT3M9jk/+clVXbzfvET+mfV2NZFpP/ZpsHvo=;
 b=NR1dQlMZ/mumS8C9iSoWRm8BUu64PRvUtlnbJGYn3o8t85mmGi0rmz03noxwgnIIJabn
 yAOznGYOUfaVnIM9E6xbE1ifgnf4PzrPagTtD4snlOhRMuvNXlufNVkKk/bo8ECUjI4u
 WaUG+L6Xdvpizi0NB4tnCsd2QAy1AThj6yreH751jBl1jr3j3d4SQT/dGqox4GTrK0Js
 CoHUXVJZAsS/PzERqJAYIWFDy2NC4Cjwq4j/GbUtQl6KSYO/C/6WJU48XcBWb7TrK5D2
 9kFSjPFVRgI743CSTp2NpKuOiwaU31CWmcLOmu3ACw/1jKI2xVbUV4L3Bwo7OV6zbdWt aA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kctjt926r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Oct 2022 00:36:03 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29O0a2jh023702;
	Mon, 24 Oct 2022 00:36:02 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma05fra.de.ibm.com with ESMTP id 3kc8591ujh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Oct 2022 00:36:01 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29O0ZxJF50332062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Oct 2022 00:35:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC474A4054;
	Mon, 24 Oct 2022 00:35:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EDBFA405B;
	Mon, 24 Oct 2022 00:35:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 24 Oct 2022 00:35:59 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 220EF600BA;
	Mon, 24 Oct 2022 11:35:56 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page helpers
Date: Mon, 24 Oct 2022 11:35:40 +1100
Message-Id: <20221024003541.1347364-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024003541.1347364-1-rmclure@linux.ibm.com>
References: <20221024003541.1347364-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ymzFKbYOEUs15hVXgJ9KdzDgvks2_mZg
X-Proofpoint-ORIG-GUID: ymzFKbYOEUs15hVXgJ9KdzDgvks2_mZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=777 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240002
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
---
 arch/powerpc/include/asm/book3s/32/pgtable.h |  4 ++++
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ++++++++++
 arch/powerpc/include/asm/nohash/32/pgtable.h |  1 +
 arch/powerpc/include/asm/nohash/64/pgtable.h | 10 ++++++++++
 arch/powerpc/include/asm/pgtable.h           | 15 +++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 40041ac713d9..8bf1c538839a 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -531,6 +531,10 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
 }
 
+static inline bool pmd_user(pmd_t pmd)
+{
+	return 0;
+}
 
 
 /* This low level function performs the actual PTE insertion
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
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 9091e4904a6b..b92044d9d778 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -354,6 +354,7 @@ static inline int pte_young(pte_t pte)
 #endif
 
 #define pmd_page(pmd)		pfn_to_page(pmd_pfn(pmd))
+#define pmd_user(pmd)		0
 /*
  * Encode and decode a swap entry.
  * Note that the bits we use in a PTE for representing a swap entry
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
index 36956fb440e1..3cb5de9f1aa4 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -172,6 +172,21 @@ static inline int pud_pfn(pud_t pud)
 }
 #endif
 
+static inline bool pte_user_accessible_page(pte_t pte)
+{
+	return pte_present(pte) && pte_user(pte);
+}
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
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
-- 
2.34.1

