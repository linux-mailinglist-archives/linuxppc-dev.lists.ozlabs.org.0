Return-Path: <linuxppc-dev+bounces-10917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 301C1B2416F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 08:27:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1z1x4ccMz30gC;
	Wed, 13 Aug 2025 16:27:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755066453;
	cv=none; b=EAWXw5RXYxs0Si6co+oSJNQsQPWyzhK0egOwqoBL8YJy9usch41u8dp+whiGeKwXNrSy7U32R7fA+49gzHB6aIgIFgibXFjV2c6Ugsxu0Ab4/5McPgIUv1GExxT7zynOIoE/sBWO3Gdyotca6qpSCf+cuvNVxhzpb0z50pyAHbnRcSXAd3oULJ+5LmTJ9Wam+FUFs2R5HPbCNRo4Nt8nm77Os25mCR61e/1oxSgXejaeUNms3cc1vW5+dcHCw7nfp0mVpvPwSGpeNN+BNHHwqiVBzqLjLAYJAd3DKv028Mm/csFVZBTUwFqlg1JeTyGWSC7yad3UjSm4MKOe66ypAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755066453; c=relaxed/relaxed;
	bh=1Q5fgSl2we0xXrwBGTyZUI7uccF0sNxVpckpe5p+JPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZmFxoH5KsqBj/qn1Of7MKGsJj48WstTsFMnwzaTVJCrqUnChhHZY8lAd+3WRNCwDxmGA5T/wh12RcJJNA8+jb0Bx+qY8VTkNUCuGNHyeEDQsxtvqeA18ClP2Y6N4UcfHWtVU5rcftz599Mzv+ulWpB3/GiCs+4G6yXSehHNO2JtMR0UJDQaNLrveN7vUo7ewDsPHm6GyvwW4RYUBkgZf8j7L769CCw7t0HFSHauHdm9iDai9Vytj43zxJ1BzMf8PR9WHvMkCVyvNPuZ55YG+Ifk6qCVmlSsbghj+3u2zPzybHbx1KVZjkgM1i48wHSke+Etc1zj2Uk3oY/2Ey3/9Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V5ik77HZ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V5ik77HZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1z1w74n4z30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 16:27:32 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CNQETU029436;
	Wed, 13 Aug 2025 06:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=1Q5fgSl2we0xXrwBG
	TyZUI7uccF0sNxVpckpe5p+JPU=; b=V5ik77HZ+ar+7vaCe6Q02TaShxsGXR0Vb
	VocHVVmLlHUfcMPHMPX2b62c2NoRwDbtl8CVVapNyU3WEnxQM2KZxBiFfh9rZKlw
	tz4AsFjc17UV2rrg6labBXVKnoklQfbpvxthDeXmpNtID7cCX6/PdPlx9pTi7fYO
	ONOIOLWdjgCCb2OOD1wTtQwTz+bK9S8GHmsp/3TrJO83j9O8yBSbkkW1PqKUqSLV
	WC9GD5TU6hmDo7ondkLfOpTQ2XquFa/ywfLJu0/NjJuUUBtINqI9XKtJ1oHdfM5n
	ORmPJx2J4XZq+ZsDSZzu/1MvlyT6JKNDyraJ1WEcecH3cbwMJUSnw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dwudax31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 06:27:21 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D2F7Y5026485;
	Wed, 13 Aug 2025 06:27:20 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48eh216565-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 06:27:20 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57D6RIRd18678482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Aug 2025 06:27:19 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA14258061;
	Wed, 13 Aug 2025 06:27:18 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 316E058058;
	Wed, 13 Aug 2025 06:27:13 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.10.70])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Aug 2025 06:27:12 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        Rohan McLure <rmclure@linux.ibm.com>
Subject: [PATCH v16 05/13] mm/page_table_check: Provide addr parameter to page_table_check_ptes_set()
Date: Wed, 13 Aug 2025 16:26:06 +1000
Message-ID: <20250813062614.51759-6-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813062614.51759-1-ajd@linux.ibm.com>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfX8rW3e9+BYPJF
 YJdUU9mSLKt3GEbha9u0SuXkic0i9kxj8BVvnWT2zj6FN2r+46eAHeUxEgz5PqwLpYOM8sAfBWd
 AWW0Gzf1WS8H0n3pJQOj0RDKx7VOKvLp7rJfR/vhgdSMI6O1lz+SZ8pYUoGB5P06krpyOfqSK4/
 FtoQgO34qaZRUgL9fyWfKJqcy13iwcF7SKyHpRNulVT8b0u7cvLZzYKJ0LkPCZFahaw5K50gD52
 JDVU2f1jcVfFOfaN0Jf6VproJnN/iRUtMGr4TxMjF8GsBLnHotvpiWjwhUPBmZDucEg0yNNYs6y
 EXpofyOoKl3n5M4kRDvXkbDRwRI0H+dWUg6nT94582dOjL1PyCE8n3DO5B3pIJ8GhQuWm2iZ2Mq
 aIMNcIFL
X-Authority-Analysis: v=2.4 cv=d/31yQjE c=1 sm=1 tr=0 ts=689c3049 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=UVT5Uxx9rTNGLfuASP4A:9
 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-GUID: M9yE0bCBJ46ZT8PFF3BKDB_gpOXpaHS9
X-Proofpoint-ORIG-GUID: M9yE0bCBJ46ZT8PFF3BKDB_gpOXpaHS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120224
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

To provide support for powerpc platforms, provide an addr parameter to
the __page_table_check_ptes_set() and page_table_check_ptes_set() routines.
This parameter is needed on some powerpc platforms which do not encode whether
a mapping is for user or kernel in the pte. On such platforms, this can be
inferred from the addr parameter.

[ajd@linux.ibm.com: rebase on arm64 + riscv changes, update commit message]
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v15: rebase, amend commit message
---
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/riscv/include/asm/pgtable.h |  2 +-
 include/linux/page_table_check.h | 12 +++++++-----
 include/linux/pgtable.h          |  2 +-
 mm/page_table_check.c            |  4 ++--
 5 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 9fe3af8b4cad..06ea6a4f300b 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -706,7 +706,7 @@ static inline void __set_ptes_anysz(struct mm_struct *mm, unsigned long addr,
 
 	switch (pgsize) {
 	case PAGE_SIZE:
-		page_table_check_ptes_set(mm, ptep, pte, nr);
+		page_table_check_ptes_set(mm, addr, ptep, pte, nr);
 		break;
 	case PMD_SIZE:
 		page_table_check_pmds_set(mm, addr, (pmd_t *)ptep,
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 6e8c3d19f96a..2484c0788012 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -560,7 +560,7 @@ static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_t *ptep, pte_t pteval, unsigned int nr)
 {
-	page_table_check_ptes_set(mm, ptep, pteval, nr);
+	page_table_check_ptes_set(mm, addr, ptep, pteval, nr);
 
 	for (;;) {
 		__set_pte_at(mm, ptep, pteval);
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index cf7c28d8d468..66e109238416 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -17,8 +17,8 @@ void __page_table_check_zero(struct page *page, unsigned int order);
 void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte);
 void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
 void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
-void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
-		unsigned int nr);
+void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
+		pte_t *ptep, pte_t pte, unsigned int nr);
 void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
 		pmd_t *pmdp, pmd_t pmd, unsigned int nr);
 void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
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
 
 static inline void page_table_check_pmds_set(struct mm_struct *mm,
@@ -127,7 +128,8 @@ static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
 }
 
 static inline void page_table_check_ptes_set(struct mm_struct *mm,
-		pte_t *ptep, pte_t pte, unsigned int nr)
+					     unsigned long addr, pte_t *ptep,
+					     pte_t pte, unsigned int nr)
 {
 }
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 4c035637eeb7..8aab3fa19c85 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -289,7 +289,7 @@ static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_t *ptep, pte_t pte, unsigned int nr)
 {
-	page_table_check_ptes_set(mm, ptep, pte, nr);
+	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
 
 	for (;;) {
 		set_pte(ptep, pte);
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 09258f2ad93f..0957767a2940 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -193,8 +193,8 @@ static inline void page_table_check_pte_flags(pte_t pte)
 		WARN_ON_ONCE(swap_cached_writable(pte_to_swp_entry(pte)));
 }
 
-void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
-		unsigned int nr)
+void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
+				 pte_t *ptep, pte_t pte, unsigned int nr)
 {
 	unsigned int i;
 
-- 
2.50.1


