Return-Path: <linuxppc-dev+bounces-10921-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 685A4B24176
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 08:28:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1z2Q4Gvbz30TG;
	Wed, 13 Aug 2025 16:27:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755066478;
	cv=none; b=IhfHQfvLwKY3i2ev4NQWHFe129rZiwELVQAj0VImh8gLKrRPLNj/p0/J8F0B/gyCuZ8Zu+kyH/hztHV+0cjCF/f5xGFxqaguITT/rYCILyySKirnyHsIP1WqbBwyxGPQaiGHfct+mi5ltDOtgFvOrcCAf8UJ7hbUOgUy13ODpfvaDL+yFGpDh5zqtmGyrHR3dMDVdjMjDMdh9HmSGCc9IEiQXPMvgveLmxCkVJAXTRO005WHk0CKktskOvLManTuX0erU9+w2c9MtVoAzPBFlmZtDkkbcoEIqRQcbU3ATHqgTa0xvUlkS5V3zSWlCkvKHXCdqTvqWFLarNWo0NQLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755066478; c=relaxed/relaxed;
	bh=Tl76DWhCrhe+gEqy/FiQVWLsACjkyxtlbBkUhGGrG+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cKTt8ShtX8tc4WXY4onbW1F5DJCI0AgZjasnUTQxsMBCkub8ewf8S1BucxbyUbDgpTOER8YP7cLfuQ2wOgEWavUORwXFAJCCmmqnQHiFBZ213TXC9DDuNwcawhJnYmRKVUIPTNUSQJ1cQ4DV4wViTLJA7miY5DJfJ8xleroIzp9ma1g/WYrGNBPf+KWBqGK9n8FobwmOcTNkQ/ybIOcvtppgn+84oEAicL39sqfS/rV29TYG10ayt1YY8j4o/0YrK8zh0nxbOH7r/+Lq7lVSDCfQZU9+6YTjkDVVDmHfAaJFgxSNFMHECmdE/Fs1tE7UGIXbk+woXuQnxKjP2kvP7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oadUI7Ps; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oadUI7Ps;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1z2P6gkCz3bkT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 16:27:57 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CNlc3H014916;
	Wed, 13 Aug 2025 06:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Tl76DWhCrhe+gEqy/
	FiQVWLsACjkyxtlbBkUhGGrG+I=; b=oadUI7Ps81ze1PccDiUL4+T71m8G0t1H+
	lNdpeQv8Zw+kOPUtbQBBFI2VlXygHfU0ffSD2Fmhux+N3Dewuz/WtEWnp077itNe
	VzUIf3UmZdxKjBlWSlSVinjm5XtprsJ0UfOEp2IbKG6uHyclOpJRfmmsxE6UJ6Hk
	F/KcpiMJXnu/N0jwWUlOqpGY31VPReA6Egu/t2mSACj8FzG5CDyc5PcipjgEp+C0
	uuMq4Vf1TikFtWXkUGJ00C5k5xicbd5n/X9HW+EM9qr58u21xLJ5YFGu9eJyMJbR
	BMa3oStQMm5HkTtIvUlbpNI3O8CYqWhHTZQ8UlNy6HyqAXTSiDlpw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx2d2wsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 06:27:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D4NHRY017588;
	Wed, 13 Aug 2025 06:27:46 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48ekc3np78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 06:27:46 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57D6RjE010094078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Aug 2025 06:27:45 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AEB058060;
	Wed, 13 Aug 2025 06:27:45 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2903758067;
	Wed, 13 Aug 2025 06:27:39 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.10.70])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Aug 2025 06:27:38 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        Rohan McLure <rmclure@linux.ibm.com>, Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v16 09/13] mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
Date: Wed, 13 Aug 2025 16:26:10 +1000
Message-ID: <20250813062614.51759-10-ajd@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfX6VjcebAG7Uru
 CR4006vssriqK0wp/et5OpERT+4HtxH/E612TUOCJa1pFsSRWTRHzb7p4PVNHjRfdyT76JfrUsp
 2BTlwh+8JYEWPZUD7aFnGUDB03u5ZdBujhWJhIlIWXIOwPjIVl7eoo3mYJs+QnKRMWz9tCgmwgd
 8LW5153BsYeFcRkztNlvVaQEOvRFD4dIM7nBPMaKUjw7N/rdscCGAQN28hHcqbuCyZIZdNf6t39
 RmnjrLWi7kWawoqG9lx4+rTPX4OOjPd34aWt4trS6knjj3B42K0T8HxmcNyRPyxiDgSUdCHcIx5
 RYg+TuvVFqEJl6rEOz89GcnP1pp1PcS1mvwKA07OBjhXO7avnF56oHHP8mKDFbD2htsAkaQhfy8
 DqxLpPu8
X-Proofpoint-GUID: _Q7f-QLHv-jmsd3Fje1MDjmoHroH6EPb
X-Authority-Analysis: v=2.4 cv=C9zpyRP+ c=1 sm=1 tr=0 ts=689c3063 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=VwQbUJbxAAAA:8
 a=d4W435LUNj674h-W_cUA:9 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-ORIG-GUID: _Q7f-QLHv-jmsd3Fje1MDjmoHroH6EPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120224
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

On several powerpc platforms, a page table entry may not imply whether
the relevant mapping is for userspace or kernelspace. Instead, such
platforms infer this by the address which is being accessed.

Add an additional address argument to each of these routines in order to
provide support for page table check on powerpc.

[ajd@linux.ibm.com: rebase on arm64 changes]
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v15: rebase
---
 arch/arm64/include/asm/pgtable.h |  6 +++---
 arch/riscv/include/asm/pgtable.h |  6 +++---
 arch/x86/include/asm/pgtable.h   |  6 +++---
 mm/page_table_check.c            | 12 ++++++------
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 2203ebac81d9..254265e9a423 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1290,17 +1290,17 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
 #endif
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte)
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
 {
 	return pte_valid(pte) && (pte_user(pte) || pte_user_exec(pte));
 }
 
-static inline bool pmd_user_accessible_page(pmd_t pmd)
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
 {
 	return pmd_valid(pmd) && !pmd_table(pmd) && (pmd_user(pmd) || pmd_user_exec(pmd));
 }
 
-static inline bool pud_user_accessible_page(pud_t pud)
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 {
 	return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_exec(pud));
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d60e1604852d..f3dd94929d58 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -817,17 +817,17 @@ static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 }
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte)
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
 {
 	return pte_present(pte) && pte_user(pte);
 }
 
-static inline bool pmd_user_accessible_page(pmd_t pmd)
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
 {
 	return pmd_leaf(pmd) && pmd_user(pmd);
 }
 
-static inline bool pud_user_accessible_page(pud_t pud)
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 {
 	return pud_leaf(pud) && pud_user(pud);
 }
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 63350b76c0c6..b977cebb5f44 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1679,17 +1679,17 @@ static inline bool arch_has_hw_nonleaf_pmd_young(void)
 #endif
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte)
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
 {
 	return (pte_val(pte) & _PAGE_PRESENT) && (pte_val(pte) & _PAGE_USER);
 }
 
-static inline bool pmd_user_accessible_page(pmd_t pmd)
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
 {
 	return pmd_leaf(pmd) && (pmd_val(pmd) & _PAGE_PRESENT) && (pmd_val(pmd) & _PAGE_USER);
 }
 
-static inline bool pud_user_accessible_page(pud_t pud)
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 {
 	return pud_leaf(pud) && (pud_val(pud) & _PAGE_PRESENT) && (pud_val(pud) & _PAGE_USER);
 }
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 1c33439b9c0b..abc2232ceb39 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -151,7 +151,7 @@ void __page_table_check_pte_clear(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	if (pte_user_accessible_page(pte)) {
+	if (pte_user_accessible_page(pte, addr)) {
 		page_table_check_clear(pte_pfn(pte), PAGE_SIZE >> PAGE_SHIFT);
 	}
 }
@@ -163,7 +163,7 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	if (pmd_user_accessible_page(pmd)) {
+	if (pmd_user_accessible_page(pmd, addr)) {
 		page_table_check_clear(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT);
 	}
 }
@@ -175,7 +175,7 @@ void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	if (pud_user_accessible_page(pud)) {
+	if (pud_user_accessible_page(pud, addr)) {
 		page_table_check_clear(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT);
 	}
 }
@@ -208,7 +208,7 @@ void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
 
 	for (i = 0; i < nr; i++)
 		__page_table_check_pte_clear(mm, addr + PAGE_SIZE * i, ptep_get(ptep + i));
-	if (pte_user_accessible_page(pte))
+	if (pte_user_accessible_page(pte, addr))
 		page_table_check_set(pte_pfn(pte), nr, pte_write(pte));
 }
 EXPORT_SYMBOL(__page_table_check_ptes_set);
@@ -234,7 +234,7 @@ void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
 
 	for (i = 0; i < nr; i++)
 		__page_table_check_pmd_clear(mm, addr + PMD_SIZE * i, *(pmdp + i));
-	if (pmd_user_accessible_page(pmd))
+	if (pmd_user_accessible_page(pmd, addr))
 		page_table_check_set(pmd_pfn(pmd), stride * nr, pmd_write(pmd));
 }
 EXPORT_SYMBOL(__page_table_check_pmds_set);
@@ -250,7 +250,7 @@ void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
 
 	for (i = 0; i < nr; i++)
 		__page_table_check_pud_clear(mm, addr + PUD_SIZE * i, *(pudp + i));
-	if (pud_user_accessible_page(pud))
+	if (pud_user_accessible_page(pud, addr))
 		page_table_check_set(pud_pfn(pud), stride * nr, pud_write(pud));
 }
 EXPORT_SYMBOL(__page_table_check_puds_set);
-- 
2.50.1


