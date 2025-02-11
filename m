Return-Path: <linuxppc-dev+bounces-6092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2467FA310F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 17:15:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ysmk95FrWz306S;
	Wed, 12 Feb 2025 03:14:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739290497;
	cv=none; b=hh2T/TuaXODtupP+LfotXq/iTrlcxtAH0IKBY1Y114ZFx+Ic0RmJaMJdLjNmYbuDPvhY6QInB4GqR79CEpyTv5yfOucL9ApxaMFpimLYbQk+zZzrb4rQvbXevo7dXj/xkcDbL/CUEYk3Ir7K5+2ceyRzZrJW+n2JBFZ5bjFbEyklva29txGY2kmGS/KHsdT+qIIvG/MNLmG93ogGZgZLS22Ye9gfZgCU0TpU/pgYCkkK1w5BToxfhyl9KuVbkXqG7gWtAM6S4xiNciARTy2tNEN8zVc12fnyaMyQZA3NSUE05+7W0IGdg5IDmf6oTTIrkcA77eUu/Weuy4GT+AfWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739290497; c=relaxed/relaxed;
	bh=cOJ/idVVi4I+VLd6I1wuyddjlEKwOnj76qUNXKgrS20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQ+fuAcgtu4UVJEqGiL8xfJMpo+2zk1G+GDCSjBmxoq1tuooca6EcReZTMj+u3pVWmz+UXcYR6sXpsy8lFv5zjerbbnxkXZ6yCKkLVyJP3Ddg4lF/K8pqAxXQsufUPJtzhg2JpgPbqvxk1SUtBAsRDYa+tyQDPgcFlrH9NFL6a1qrvFrFPyb2SNceBX6tkbKgbqRNwJ9LRpoZmwOtzi955/wUF78/wkhC3MLgBqqSRdQVEE+YvvupvfwV+P/czDEEHYroHQ+oT1nHukHaA12x2np4JTTAYjCwP1eb9pu0U9Yq29bqI5xyNwprvrHje4C4lD5MiqmRCfLSq3vI6iryg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a33UVj84; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a33UVj84;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ysmk90TV8z3bkg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 03:14:56 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BFdWVF020597;
	Tue, 11 Feb 2025 16:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=cOJ/idVVi4I+VLd6I
	1wuyddjlEKwOnj76qUNXKgrS20=; b=a33UVj84qwnewyiJlZiznhJDn5pprJXYS
	jn+/LhwGhNvfu1dUkv8PDPCjU13piKvxlDqX2+x5Ku9kUUpipSGvEXOp35g13la/
	udt0TT8joq7M/pT9niT1xzoa46PQJ4QTTreIl6d1cNzqLjtrjO7i1GUEKhnLzaTG
	1Gl5teJrTuqMHwXvwTI3FzqQqiVkiOPB1gqjIP+X8t2p4sFSCPG3THC2ibUCk3vK
	tn3+7nCGJf0voWA6lBUx0//ttIlVWJsyK1ldYHKfzrLXAzcm4T4perz55i78TrWg
	WymfwbAzhu93sXsi55dCVZnAkioB6L/cxVZXvrkaPEgg8ienMX07Q==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44r9cu85ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:14:45 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51BExDJs028735;
	Tue, 11 Feb 2025 16:14:45 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44pma1kpsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:14:45 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51BGEhT141156968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 16:14:43 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86F7C2004E;
	Tue, 11 Feb 2025 16:14:43 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8B9F2004D;
	Tue, 11 Feb 2025 16:14:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Feb 2025 16:14:42 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.150.7.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7F0D86013D;
	Wed, 12 Feb 2025 03:14:38 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me
Subject: [PATCH v13 04/11] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pud_clear()
Date: Wed, 12 Feb 2025 03:13:57 +1100
Message-ID: <20250211161404.850215-5-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211161404.850215-1-ajd@linux.ibm.com>
References: <20250211161404.850215-1-ajd@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tjPDSFhAazrBNbpzNDvfJsZceKEWPyxT
X-Proofpoint-GUID: tjPDSFhAazrBNbpzNDvfJsZceKEWPyxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 bulkscore=0 mlxlogscore=947 mlxscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

This reverts commit 931c38e16499 ("mm/page_table_check: remove unused
parameter in [__]page_table_check_pud_clear").

Reinstate previously unused parameters for the purpose of supporting
powerpc platforms, as many do not encode user/kernel ownership of the
page in the pte, but instead in the address of the access.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/x86/include/asm/pgtable.h   |  2 +-
 include/linux/page_table_check.h | 11 +++++++----
 include/linux/pgtable.h          |  2 +-
 mm/page_table_check.c            |  5 +++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 366cdb9d75d9..5ec052ef07ff 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1398,7 +1398,7 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 {
 	pud_t pud = native_pudp_get_and_clear(pudp);
 
-	page_table_check_pud_clear(mm, pud);
+	page_table_check_pud_clear(mm, addr, pud);
 
 	return pud;
 }
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 9243c920ed02..d01a00ffc1f9 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -16,7 +16,8 @@ extern struct page_ext_operations page_table_check_ops;
 void __page_table_check_zero(struct page *page, unsigned int order);
 void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte);
 void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
-void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
+void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
+				  pud_t pud);
 void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
 				 pte_t *ptep, pte_t pte, unsigned int nr);
 void __page_table_check_pmd_set(struct mm_struct *mm, unsigned long addr,
@@ -59,12 +60,13 @@ static inline void page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
 	__page_table_check_pmd_clear(mm, pmd);
 }
 
-static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
+static inline void page_table_check_pud_clear(struct mm_struct *mm,
+					      unsigned long addr, pud_t pud)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_pud_clear(mm, pud);
+	__page_table_check_pud_clear(mm, addr, pud);
 }
 
 static inline void page_table_check_ptes_set(struct mm_struct *mm,
@@ -125,7 +127,8 @@ static inline void page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
 {
 }
 
-static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
+static inline void page_table_check_pud_clear(struct mm_struct *mm,
+					      unsigned long addr, pud_t pud)
 {
 }
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 2b25dd17ec67..e41cf0622aa4 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -648,7 +648,7 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 	pud_t pud = *pudp;
 
 	pud_clear(pudp);
-	page_table_check_pud_clear(mm, pud);
+	page_table_check_pud_clear(mm, address, pud);
 
 	return pud;
 }
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 959e11e1af24..7c2f3f93e377 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -182,7 +182,8 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
 }
 EXPORT_SYMBOL(__page_table_check_pmd_clear);
 
-void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
+void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
+				  pud_t pud)
 {
 	if (&init_mm == mm)
 		return;
@@ -256,7 +257,7 @@ void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	__page_table_check_pud_clear(mm, *pudp);
+	__page_table_check_pud_clear(mm, addr, *pudp);
 	if (pud_user_accessible_page(pud)) {
 		page_table_check_set(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT,
 				     pud_write(pud));
-- 
2.48.1


