Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2358A87A241
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 05:23:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XQZrE75O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tvcnd6mLHz3vbT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 15:23:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XQZrE75O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvcm566jnz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 15:21:57 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42D45svD024252;
	Wed, 13 Mar 2024 04:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gOM1jQ5TGs+7co2DLVATHmlKmZxVcVUKYlgUWUHRdrg=;
 b=XQZrE75O3c5BVmTDn578KS9oIi5IVpdjeh/HHswS89YSIY3+Om8WY4PqyqE4SOLycFth
 kaT7PTXTGiTMeViezSq5bbazacEmWgPDGoB/DCMZ1NnfmJrgrLdExaazisjdVSiJF6km
 baygb5I016UgATjJcE7YXO+X/JE724XqEEf4sHHD7AcJdr8zSpnwUT3N7GtdXdB9CLK1
 bdSt73mgZCNPL9dTzBUByDYi471hfwzgfqGilA9sBU5MkYQ/co96a/T5Pk0MHEO6Nbqc
 v1oaKWpr3GxWDZOcJMZgntxEHclmrv4lCJZI4+5XP7/s0vx29Lzok95AHu9xETi1OM0G Aw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wu4t2r5rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 04:21:34 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42D3uTwd020423;
	Wed, 13 Mar 2024 04:21:33 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ws3km3cq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 04:21:33 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42D4LTkO37683534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Mar 2024 04:21:31 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8873A2004B;
	Wed, 13 Mar 2024 04:21:29 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EAE420040;
	Wed, 13 Mar 2024 04:21:28 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Mar 2024 04:21:28 +0000 (GMT)
Received: from socotra.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F284160366;
	Wed, 13 Mar 2024 15:21:25 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 01/12] Revert "mm/page_table_check: remove unused parameter in [__]page_table_check_pud_set"
Date: Wed, 13 Mar 2024 15:21:06 +1100
Message-ID: <20240313042118.230397-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313042118.230397-1-rmclure@linux.ibm.com>
References: <20240313042118.230397-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HAb4b7Hi4qTULx6MeBIwcyoCRRhaSd-x
X-Proofpoint-ORIG-GUID: HAb4b7Hi4qTULx6MeBIwcyoCRRhaSd-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_04,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403130030
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

This reverts commit 6d144436d954311f2dbacb5bf7b084042448d83e.

Reinstate previously unused parameters for the purpose of supporting
powerpc platforms, as many do not encode user/kernel ownership of the
page in the pte, but instead in the address of the access.

riscv: Respect change to delete mm, addr parameters from __set_pte_at()

This commit also changed calls to __set_pte_at() to use fewer parameters
on riscv. Keep that change rather than reverting it, as the signature of
__set_pte_at() is changed in a different commit.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/riscv/include/asm/pgtable.h |  2 +-
 arch/x86/include/asm/pgtable.h   |  2 +-
 include/linux/page_table_check.h | 11 +++++++----
 mm/page_table_check.c            |  3 ++-
 5 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 79ce70fbb751..a965b59401b3 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -548,7 +548,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 			      pud_t *pudp, pud_t pud)
 {
-	page_table_check_pud_set(mm, pudp, pud);
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	return __set_pte_at(mm, addr, (pte_t *)pudp, pud_pte(pud),
 						PUD_SIZE >> PAGE_SHIFT);
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 6066822e7396..4fc99dd3bb42 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -717,7 +717,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 				pud_t *pudp, pud_t pud)
 {
-	page_table_check_pud_set(mm, pudp, pud);
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	return __set_pte_at((pte_t *)pudp, pud_pte(pud));
 }
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 9d077bca6a10..a9b1e8e6d4b9 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1252,7 +1252,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 			      pud_t *pudp, pud_t pud)
 {
-	page_table_check_pud_set(mm, pudp, pud);
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	native_set_pud(pudp, pud);
 }
 
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 6722941c7cb8..d188428512f5 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -20,7 +20,8 @@ void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
 void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
 		unsigned int nr);
 void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd);
-void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud);
+void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
+				pud_t *pudp, pud_t pud);
 void __page_table_check_pte_clear_range(struct mm_struct *mm,
 					unsigned long addr,
 					pmd_t pmd);
@@ -83,13 +84,14 @@ static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
 	__page_table_check_pmd_set(mm, pmdp, pmd);
 }
 
-static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
+static inline void page_table_check_pud_set(struct mm_struct *mm,
+					    unsigned long addr, pud_t *pudp,
 					    pud_t pud)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_pud_set(mm, pudp, pud);
+	__page_table_check_pud_set(mm, addr, pudp, pud);
 }
 
 static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
@@ -134,7 +136,8 @@ static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
 {
 }
 
-static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
+static inline void page_table_check_pud_set(struct mm_struct *mm,
+					    unsigned long addr, pud_t *pudp,
 					    pud_t pud)
 {
 }
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index af69c3c8f7c2..75167537ebd7 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -210,7 +210,8 @@ void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd)
 }
 EXPORT_SYMBOL(__page_table_check_pmd_set);
 
-void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud)
+void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
+				pud_t *pudp, pud_t pud)
 {
 	if (&init_mm == mm)
 		return;
-- 
2.44.0

