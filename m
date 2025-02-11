Return-Path: <linuxppc-dev+bounces-6090-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69262A310F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 17:15:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ysmk64vqpz306d;
	Wed, 12 Feb 2025 03:14:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739290494;
	cv=none; b=k4ZbkNxm8ualcGI+XDBLZxcya8jMEbkPnc79xwGv1PrUZOE13p3QDyPwoWpxXWJAFe+xaA8mIs2U0Bm5v1AXhzmele78iKlZLbVBIKb2Q3UAmo1Amwem/VIrYMn6ul5p0YmfOPwVZ952GZQHXqN2MtH0HsqN96XcThZud+j8A+ZrvfJV0DZiy43b22hDmsXyXL85LODzLLIuofpcIN0kC3uujpfJ9mEuRzZPeK4WP1yZ3OJSM2SK4wLx3HQcHdPruRA6hhiacZhFdBNDa6gDrpTyDVjN/ZGpQlntban8kJ20HwgdfgBrYNGx5zW3EzRdErTvZ/kPwtBcVMvPuUfMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739290494; c=relaxed/relaxed;
	bh=80YUf/ywVjSGbesvwbJLhfkbTLis/xViQMBOegskX9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jI4NNZh6hQBzMa3TD+CcaiXeAxWfqYXM+mh3f0GElnE34RR95Dquf+GSkL/zU6bXYy2ak5StCWqBQFv18YBFp6uxEd4qIJm+VyQustxcWsJ2rzst/A/1hQYXvQXw6NgNaAdc14Lec//kb2zgPp+6uHHlhsProJndXJkc+EjydoZD/i30GMxru0kYc+UpQx1cYgIOhN40x9HDwYUZZyroby6bc05/Hm8Wn1d6wwIoMB9FtVSqL5WVGLZlhi4M+EWClPkvczb3vsYdxN4rdfYBStd8WJULtWFzLYIozF0WfaDTLyoc5zM0zcVaKKdsEJifJeJiVanoo/tc+RarEYF4Mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RFTFB/us; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RFTFB/us;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ysmk56nW3z306S
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 03:14:53 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BB4IrT023714;
	Tue, 11 Feb 2025 16:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=80YUf/ywVjSGbesvw
	bJLhfkbTLis/xViQMBOegskX9w=; b=RFTFB/usUKYR41QCdmJNN8Wqr9C5ezgoB
	yrm+uirbh+ebWsyaj2+jPmvpRw8caN6Zt56OqiCgdQdLPU53s/UorBllR8KkT1SZ
	kuInfPZPA0hKymKlWspURvkjHKmyH78L6QhWNQuaGehdVg5UlXIO1gfCvcfO0fJ8
	rUN8UzZ+/oqI5g7ZOjmwrnDpBZn07jsz114ou8bPQ8SMdGZwrAuB8sgtZJNZPzCQ
	9Ap/jV42/ciK5AW6rFTcB8m7w/pd+OQ75ju+CxRRYaM79jxFMtJHjy8CUfmW0ubH
	qKQq76T/gwqPWP3HKUf1xGqsSM/JpfIEBM1zYwhAW7C4UJBsRq4/w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44qtkac2bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:14:42 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51BEWNNa028687;
	Tue, 11 Feb 2025 16:14:41 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44pma1kps5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:14:41 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51BGEebr47317282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 16:14:40 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 05EDA20040;
	Tue, 11 Feb 2025 16:14:40 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 394002004B;
	Tue, 11 Feb 2025 16:14:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Feb 2025 16:14:39 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.150.7.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0957A600AE;
	Wed, 12 Feb 2025 03:14:34 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me
Subject: [PATCH v13 03/11] mm/page_table_check: Provide addr parameter to page_table_check_pte_set()
Date: Wed, 12 Feb 2025 03:13:56 +1100
Message-ID: <20250211161404.850215-4-ajd@linux.ibm.com>
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
X-Proofpoint-GUID: WnFAlpqnOaYlwekcppAuf1YDj6QbWgI5
X-Proofpoint-ORIG-GUID: WnFAlpqnOaYlwekcppAuf1YDj6QbWgI5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 spamscore=0
 mlxlogscore=574 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502110106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

To provide support for powerpc platforms, provide an addr parameter to
the page_table_check_pte_set() routine. This parameter is needed on some
powerpc platforms which do not encode whether a mapping is for user or
kernel in the pte. On such platforms, this can be inferred form the
addr parameter.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[ajd: rebase]
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/riscv/include/asm/pgtable.h |  2 +-
 include/linux/page_table_check.h | 12 +++++++-----
 include/linux/pgtable.h          |  2 +-
 mm/page_table_check.c            |  4 ++--
 5 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0262d9e966f9..78f579812c0c 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -424,7 +424,7 @@ static inline void __set_ptes(struct mm_struct *mm,
 			      unsigned long __always_unused addr,
 			      pte_t *ptep, pte_t pte, unsigned int nr)
 {
-	page_table_check_ptes_set(mm, ptep, pte, nr);
+	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
 	__sync_cache_and_tags(pte, nr);
 
 	for (;;) {
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index bd4092b72258..9eb5f85dac82 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -562,7 +562,7 @@ static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_t *ptep, pte_t pteval, unsigned int nr)
 {
-	page_table_check_ptes_set(mm, ptep, pteval, nr);
+	page_table_check_ptes_set(mm, addr, ptep, pteval, nr);
 
 	for (;;) {
 		__set_pte_at(mm, ptep, pteval);
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 5855d690c48a..9243c920ed02 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -17,8 +17,8 @@ void __page_table_check_zero(struct page *page, unsigned int order);
 void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte);
 void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
 void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
-void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
-		unsigned int nr);
+void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
+				 pte_t *ptep, pte_t pte, unsigned int nr);
 void __page_table_check_pmd_set(struct mm_struct *mm, unsigned long addr,
 				pmd_t *pmdp, pmd_t pmd);
 void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
@@ -68,12 +68,13 @@ static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
 }
 
 static inline void page_table_check_ptes_set(struct mm_struct *mm,
-		pte_t *ptep, pte_t pte, unsigned int nr)
+					     unsigned long addr, pte_t *ptep,
+					     pte_t pte, unsigned int nr)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_ptes_set(mm, ptep, pte, nr);
+	__page_table_check_ptes_set(mm, addr, ptep, pte, nr);
 }
 
 static inline void page_table_check_pmd_set(struct mm_struct *mm,
@@ -129,7 +130,8 @@ static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
 }
 
 static inline void page_table_check_ptes_set(struct mm_struct *mm,
-		pte_t *ptep, pte_t pte, unsigned int nr)
+					     unsigned long addr, pte_t *ptep,
+					     pte_t pte, unsigned int nr)
 {
 }
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 94d267d02372..2b25dd17ec67 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -285,7 +285,7 @@ static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_t *ptep, pte_t pte, unsigned int nr)
 {
-	page_table_check_ptes_set(mm, ptep, pte, nr);
+	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
 
 	arch_enter_lazy_mmu_mode();
 	for (;;) {
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 099719d6f788..959e11e1af24 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -209,8 +209,8 @@ static inline void page_table_check_pte_flags(pte_t pte)
 		WARN_ON_ONCE(swap_cached_writable(pte_to_swp_entry(pte)));
 }
 
-void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
-		unsigned int nr)
+void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
+				 pte_t *ptep, pte_t pte, unsigned int nr)
 {
 	unsigned int i;
 
-- 
2.48.1


