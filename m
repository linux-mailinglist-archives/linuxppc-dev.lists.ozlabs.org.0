Return-Path: <linuxppc-dev+bounces-10916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2637AB2416D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 08:27:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1z1r0B9Pz30W1;
	Wed, 13 Aug 2025 16:27:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755066447;
	cv=none; b=hY5OyFIgx8V/p7pBmIVtJkfswTbDdznsolYt3AvJDsdlYsyVufTLcSvrwiUyAWFQG9q/PvfwXbTI28DRffXMHBl9wcauIuqRRmc8IfiouUlxsC6mPpYZpMRjmBdht8U03UkOeAYi5k10w4VSwyTvDmxtUczMg5IhJiD0cwLZgccAYmZL7puGe0RJCjxuSMNkenKWcvcELciWW7iUc51YnemybetE/BCCLKeoDvULV+ndVPYGHSkigkNIU/Rf/WTVKe6R3LvfuIdWAAVI0vjkwDZ/zi3oWl3KoyTAJxnFzakAodYKD09hmiTw8Zas80xJ5ZizW9+ivplG+bm8SIci6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755066447; c=relaxed/relaxed;
	bh=4/Ctvw1o/hFQJBWWTXNgAbNPCkcs2kP/YXaYRhFGjCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MhCWh9cFd0xGH+PzNnCiFz3LQBkQQljJNi1PIJ36pc0AASS4lgD497nOCWumtbeMnMAzNRguoPDVOVA19fdGgEgHFTS8rPB+r82b7niebjYPNWQQiGAhBj4Yhykj7gAAweplP/ZYl5nCb71JCJ+sl48bIX51vr89/217A60NfjhAa7fvi+sIAINSr42KN62zmLbEaVobG7ZpBrbDN03KPpjhg202JnLyUjDLr/+5Q7+bbXC7pssCbfoCLR11DLQtr2arB/1X1d+9kNUmlpZYf8m5WQITkRfTiJ4VnaoCWZVnb+OXY23LfAdKpQpVf2SZO+C1RId4nLZfyhJfClRrMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EHCPAT1f; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EHCPAT1f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1z1q1YmWz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 16:27:27 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CNQEdw029457;
	Wed, 13 Aug 2025 06:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=4/Ctvw1o/hFQJBWWT
	XNgAbNPCkcs2kP/YXaYRhFGjCA=; b=EHCPAT1f2fauwPtx/6zrJJMyUp0eIk2Y7
	hDQfBazzR0GwVvKBWmScRNueXvD9ynudxoLhPhCsWYaviLXRR4BmAXWwtWCQya4j
	7GUqQEVZ9NuWoKU7KZ2tvaVOuhAUWcO8p6eqn+B5E4fn5tufgQWPULlMsI6rQZAg
	y0nou+fOvRmjzpR4Ox+EZA4L4ptsYPdwFWv8kz9c0CaN3q63Cz3x5+PbbRz2MX/z
	ku/7CRXwcex6OlmIxkzs9h/OShkYCujhuTgidYprSEBMupUaHj8dX+SG30FhUn6/
	4SBx9+tp0s/ucZ/DjuLGEm46PIf0hCQCHxp2hONdWEOmG0cnm+eAA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dwudax2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 06:27:15 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D2Cmmm026282;
	Wed, 13 Aug 2025 06:27:14 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48eh21655h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 06:27:13 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57D6RCjh60490068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Aug 2025 06:27:12 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A4475805C;
	Wed, 13 Aug 2025 06:27:12 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AA4558059;
	Wed, 13 Aug 2025 06:27:06 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.10.70])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Aug 2025 06:27:06 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        Rohan McLure <rmclure@linux.ibm.com>, Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v16 04/13] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pmd[s]_set()
Date: Wed, 13 Aug 2025 16:26:05 +1000
Message-ID: <20250813062614.51759-5-ajd@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfX33uH2V/03q65
 WN1QqKQKPu+t/sNLO9adq6bh7J0+vOcFEjkPlxjNF7M7tg+moTlBMpS/c6j9AgpvgXUZ2MYtBIa
 GtFekt00DU+cohrUnti/7P5wmWPKnf75PmWN6ycJXo11JjLgJfvyvuKs/F0K+PXMgzFcTjebPdA
 5OqZpbwdlm8QhqyfRUahZcLCR7p4v6EmHoa3xnCixBaMM+Ji/JPDY34KQoxO1S6gNftzLTXfStr
 intARyZ3giZtscaglPA26hARl0XSFBdjwhiBZfXaF32KPpXgJLy7fBvhsJxHWdQN+Pqb/gSSAB4
 HYrf7sYrN8xaITkfpUvuz51i2leyAGqJnNpkyxwMHzhP4HHMaOjAN13K+mI0n5lZ3gDzwZIFD92
 QHXPggVK
X-Authority-Analysis: v=2.4 cv=d/31yQjE c=1 sm=1 tr=0 ts=689c3043 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=VwQbUJbxAAAA:8
 a=-IAaNFHw-wEKn7DCNmAA:9 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-GUID: ArK2hxIBNAN1bo7D-2Vwi9D3z4rGNP9E
X-Proofpoint-ORIG-GUID: ArK2hxIBNAN1bo7D-2Vwi9D3z4rGNP9E
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

This reverts commit a3b837130b58 ("mm/page_table_check: remove unused
parameter in [__]page_table_check_pmd_set").

Reinstate previously unused parameters for the purpose of supporting
powerpc platforms, as many do not encode user/kernel ownership of the
page in the pte, but instead in the address of the access.

Apply this to __page_table_check_pmds_set(), page_table_check_pmd_set(), and
the page_table_check_pmd_set() wrapper macro.

[ajd@linux.ibm.com: rebase on arm64 + riscv changes, update commit message]
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v13: remove inaccurate comment on riscv in the commit message
v14: rebase
v15: rebase, amend commit message
---
 arch/arm64/include/asm/pgtable.h |  5 +++--
 arch/riscv/include/asm/pgtable.h |  4 ++--
 arch/x86/include/asm/pgtable.h   |  4 ++--
 include/linux/page_table_check.h | 12 ++++++------
 mm/page_table_check.c            |  4 ++--
 5 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 8070b653c409..9fe3af8b4cad 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -709,7 +709,8 @@ static inline void __set_ptes_anysz(struct mm_struct *mm, unsigned long addr,
 		page_table_check_ptes_set(mm, ptep, pte, nr);
 		break;
 	case PMD_SIZE:
-		page_table_check_pmds_set(mm, (pmd_t *)ptep, pte_pmd(pte), nr);
+		page_table_check_pmds_set(mm, addr, (pmd_t *)ptep,
+					  pte_pmd(pte), nr);
 		break;
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SIZE:
@@ -1514,7 +1515,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
+	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	return __pmd(xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
 }
 #endif
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 3ed0f5e4879d..6e8c3d19f96a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -805,7 +805,7 @@ static inline pud_t pud_mkspecial(pud_t pud)
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 				pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(mm, pmdp, pmd);
+	page_table_check_pmd_set(mm, addr, pmdp, pmd);
 	return __set_pte_at(mm, (pte_t *)pmdp, pmd_pte(pmd));
 }
 
@@ -876,7 +876,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 				unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
+	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
 }
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 0603793acb3a..8ee301b16b50 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1213,7 +1213,7 @@ static inline pud_t native_local_pudp_get_and_clear(pud_t *pudp)
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 			      pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(mm, pmdp, pmd);
+	page_table_check_pmd_set(mm, addr, pmdp, pmd);
 	set_pmd(pmdp, pmd);
 }
 
@@ -1356,7 +1356,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
+	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	if (IS_ENABLED(CONFIG_SMP)) {
 		return xchg(pmdp, pmd);
 	} else {
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 0bf18b884a12..cf7c28d8d468 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -19,8 +19,8 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
 void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
 void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
 		unsigned int nr);
-void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
-		unsigned int nr);
+void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
+		pmd_t *pmdp, pmd_t pmd, unsigned int nr);
 void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
 		pud_t *pudp, pud_t pud, unsigned int nr);
 void __page_table_check_pte_clear_range(struct mm_struct *mm,
@@ -77,12 +77,12 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
 }
 
 static inline void page_table_check_pmds_set(struct mm_struct *mm,
-		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
+		unsigned long addr, pmd_t *pmdp, pmd_t pmd, unsigned int nr)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_pmds_set(mm, pmdp, pmd, nr);
+	__page_table_check_pmds_set(mm, addr, pmdp, pmd, nr);
 }
 
 static inline void page_table_check_puds_set(struct mm_struct *mm,
@@ -132,7 +132,7 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
 }
 
 static inline void page_table_check_pmds_set(struct mm_struct *mm,
-		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
+		unsigned long addr, pmd_t *pmdp, pmd_t pmd, unsigned int nr)
 {
 }
 
@@ -149,7 +149,7 @@ static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
 
 #endif /* CONFIG_PAGE_TABLE_CHECK */
 
-#define page_table_check_pmd_set(mm, pmdp, pmd)	page_table_check_pmds_set(mm, pmdp, pmd, 1)
+#define page_table_check_pmd_set(mm, addr, pmdp, pmd)	page_table_check_pmds_set(mm, addr, pmdp, pmd, 1)
 #define page_table_check_pud_set(mm, addr, pudp, pud)	page_table_check_puds_set(mm, addr, pudp, pud, 1)
 
 #endif /* __LINUX_PAGE_TABLE_CHECK_H */
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 3c39e4375886..09258f2ad93f 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -218,8 +218,8 @@ static inline void page_table_check_pmd_flags(pmd_t pmd)
 		WARN_ON_ONCE(swap_cached_writable(pmd_to_swp_entry(pmd)));
 }
 
-void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
-		unsigned int nr)
+void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
+		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
 {
 	unsigned long stride = PMD_SIZE >> PAGE_SHIFT;
 	unsigned int i;
-- 
2.50.1


