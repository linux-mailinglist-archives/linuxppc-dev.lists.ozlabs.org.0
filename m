Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA27B87A250
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 05:29:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q1XuDJWo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tvcx85Tqrz3w14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 15:29:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q1XuDJWo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvcs76YsGz3vm5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 15:26:19 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42D4QGvm014679
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 04:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zz6b2GoqtvFL4wsCL2sT5vLh0Mr7Obs2MobE/IAnAlY=;
 b=q1XuDJWoD+q9F1uNoUYMm3nJzp3xC43KHTz/IDbRKI+9gezw3QooucLKFVkz3k4xdWCo
 qCvQrBMpOObSqMRUFBqPcsVowDB2B3QBFl+Fn9SP+QAjhGLDB5DQNahsgMvjEedqSrTI
 LvbzBh9MK6WJKJQu0ZjG8mNFWvVxyfwayn1TikQMPKHMCfQsx2rYEOXq9RTU3pDQdr5W
 zVlqNRLbHy3rrdzBoFxuZuEaiNUv185YbXQB/JBGjj4XM9QLbuPj2rPE3ub++T9NVGe4
 YWrW8A1czwZ9erE/331bBeC+UHGkFnVIb87K6wIfrsHDEz48t+tRhGq75tfa0R1D8Gqh Sg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wu3vrrpqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 04:26:16 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42D0x5Ci020601
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 04:21:36 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ws3km3cq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 04:21:35 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42D4LWZU34210186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 04:21:34 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E18932004B;
	Wed, 13 Mar 2024 04:21:31 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DE132004F;
	Wed, 13 Mar 2024 04:21:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Mar 2024 04:21:31 +0000 (GMT)
Received: from socotra.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0A89C603DA;
	Wed, 13 Mar 2024 15:21:26 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 05/12] Revert "mm/page_table_check: remove unused parameter in [__]page_table_check_pmd_clear"
Date: Wed, 13 Mar 2024 15:21:10 +1100
Message-ID: <20240313042118.230397-6-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313042118.230397-1-rmclure@linux.ibm.com>
References: <20240313042118.230397-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ukdGo1zIQd-Wp97ZPc5Y1-LYD16Z5doC
X-Proofpoint-ORIG-GUID: ukdGo1zIQd-Wp97ZPc5Y1-LYD16Z5doC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_04,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403130031
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
Cc: x86@kernel.org, linux-mm@kvack.org, Rohan McLure <rmclure@linux.ibm.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 1831414cd729a34af937d56ad684a66599de6344.

Reinstate previously unused parameters for the purpose of supporting
powerpc platforms, as many do not encode user/kernel ownership of the
page in the pte, but instead in the address of the access.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/riscv/include/asm/pgtable.h |  2 +-
 arch/x86/include/asm/pgtable.h   |  2 +-
 include/linux/page_table_check.h | 11 +++++++----
 include/linux/pgtable.h          |  2 +-
 mm/page_table_check.c            |  5 +++--
 6 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 965e35adb206..4210d3b071ec 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -965,7 +965,7 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 {
 	pmd_t pmd = __pmd(xchg_relaxed(&pmd_val(*pmdp), 0));
 
-	page_table_check_pmd_clear(mm, pmd);
+	page_table_check_pmd_clear(mm, address, pmd);
 
 	return pmd;
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index a4b5da7f0704..cf8e18f27649 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -765,7 +765,7 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 {
 	pmd_t pmd = __pmd(atomic_long_xchg((atomic_long_t *)pmdp, 0));
 
-	page_table_check_pmd_clear(mm, pmd);
+	page_table_check_pmd_clear(mm, address, pmd);
 
 	return pmd;
 }
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 3e7003b01c9d..26722f553c43 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1352,7 +1352,7 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm, unsigned long
 {
 	pmd_t pmd = native_pmdp_get_and_clear(pmdp);
 
-	page_table_check_pmd_clear(mm, pmd);
+	page_table_check_pmd_clear(mm, addr, pmd);
 
 	return pmd;
 }
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index d01a00ffc1f9..0a6ebfa46a31 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -15,7 +15,8 @@ extern struct page_ext_operations page_table_check_ops;
 
 void __page_table_check_zero(struct page *page, unsigned int order);
 void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte);
-void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
+void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
+				  pmd_t pmd);
 void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
 				  pud_t pud);
 void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
@@ -52,12 +53,13 @@ static inline void page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
 	__page_table_check_pte_clear(mm, pte);
 }
 
-static inline void page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
+static inline void page_table_check_pmd_clear(struct mm_struct *mm,
+					      unsigned long addr, pmd_t pmd)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_pmd_clear(mm, pmd);
+	__page_table_check_pmd_clear(mm, addr, pmd);
 }
 
 static inline void page_table_check_pud_clear(struct mm_struct *mm,
@@ -123,7 +125,8 @@ static inline void page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
 {
 }
 
-static inline void page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
+static inline void page_table_check_pmd_clear(struct mm_struct *mm,
+					      unsigned long addr, pmd_t pmd)
 {
 }
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 77877ae8abef..d0d1a0bbf905 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -531,7 +531,7 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 	pmd_t pmd = *pmdp;
 
 	pmd_clear(pmdp);
-	page_table_check_pmd_clear(mm, pmd);
+	page_table_check_pmd_clear(mm, address, pmd);
 
 	return pmd;
 }
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index a8c8fd7f06f8..7afaad9c6e6f 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -160,7 +160,8 @@ void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
 }
 EXPORT_SYMBOL(__page_table_check_pte_clear);
 
-void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
+void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
+				  pmd_t pmd)
 {
 	if (&init_mm == mm)
 		return;
@@ -204,7 +205,7 @@ void __page_table_check_pmd_set(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	__page_table_check_pmd_clear(mm, *pmdp);
+	__page_table_check_pmd_clear(mm, addr, *pmdp);
 	if (pmd_user_accessible_page(pmd)) {
 		page_table_check_set(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT,
 				     pmd_write(pmd));
-- 
2.44.0

