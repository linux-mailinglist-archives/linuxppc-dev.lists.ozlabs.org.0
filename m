Return-Path: <linuxppc-dev+bounces-9724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4E8AE7895
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:32:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtn66g7kz30LS;
	Wed, 25 Jun 2025 17:32:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750836730;
	cv=none; b=mgobNTvMb7FCjMdVk/AO+m0q8ljMLCv1C24tXHypj38WVL3h2kvTHEAGXZOpGBkhW4HaWye/MmNDJa+NM3dtpqAv+oezcBQI2TI0YhD8UdkOgT10OC2jjiyDovrrHm4G81YiPnBO8hGuGS+VOAVLQsR5BMpRdGnj9eMP4HX+7R6NhCvlD9la1bCDxP0qdRHCX18W1tUGVWOWuu0gXnlra5MrftXG5G0QwOQEFG/PvTunpwUCU/YuPLq02YnOK50Y7T43d8dCz/vCSXvVxnq/kGlYUG0fMR9Hi+F4xL301dxHSuqh+KJiU2v25K7rUqdUstWuN2m4a3LGcHuAlkEdDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750836730; c=relaxed/relaxed;
	bh=9icWE54ZZvoBrR2+iMmHOG9ssjBLNS3XxfzoQW4bVLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ddf6TCzvebg6eMdi3m+PtqgVHovz29lDCZHjI42AfKFRlWpGWenytFwyHCAqOtxr2Nj2gVy05bxHeJULX79O1HZ+2mHVpn3GHlyKTG3DSFypCJdyo3NEmiPQE2PiJ656xvCf9R2ELJsot+ghUW//VNOumFGqWfHRfGGlPla3inzhXKYltmVG4BVejPWW4JBaGvfAsN52f5A4r+Sy6b763pUNZYie8yFq9sgzvGrcot8cRm5iYRj6BNWlFCWl+JW3JN5ODKSsWw6rGpEclmQGoFnNFFIn/Bg00V0mi+ESDUM+Y0a5PneUDhAPF2Fq+39B48Hq5oiI3/rYdSmNOViLsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bnsJKzSr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bnsJKzSr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtn60pFqz309v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:32:09 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OKO8Ca021411;
	Wed, 25 Jun 2025 07:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9icWE54ZZvoBrR2+i
	MmHOG9ssjBLNS3XxfzoQW4bVLQ=; b=bnsJKzSr88cV/y+Bs4SzrZSFQTJRK+kUm
	hmPx3rC8qjgcTQZFrwczY/qs6+WzPSqOB9hic0EaoO7H8/+q9WJkzTk4B5Le6zQs
	WDvgAhQZf8oXwG6bD/PuiRn54KQMIXBZfoFPwICbilbHjUEHB9EbLFmrJ9QLgYqa
	BPlRwlN5Ih6XLbHg7DiElp0tBXanWz+M+E0WmCgdBCsecW7JmiTcGWbLqe6ptadR
	9mxpiXE71afSFonJkEsdcietqrepROyJfTgZCXAAJ2nDTaEaE1FOFoNycXCnRM4n
	4RWq8C4BhRucLr7c9Tp8FZ8BpSMoYd8g6wxEmyLUX/aodJR+MbUDw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5twsns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 07:31:58 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P68PWH006408;
	Wed, 25 Jun 2025 07:31:57 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e82p87b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 07:31:57 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55P7VulY20316848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 07:31:56 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FEA65884B;
	Wed, 25 Jun 2025 06:38:29 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C7B85886C;
	Wed, 25 Jun 2025 06:38:15 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.18.35])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 06:38:14 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, pasha.tatashin@soleen.com,
        akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu, mingo@kernel.org
Subject: [PATCH v15 02/13] arm64/mm: Add addr parameter to __ptep_get_and_clear_anysz()
Date: Wed, 25 Jun 2025 16:37:42 +1000
Message-ID: <20250625063753.77511-3-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625063753.77511-1-ajd@linux.ibm.com>
References: <20250625063753.77511-1-ajd@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: ERvA2OObeogm-T28-OBTZ7tVkYis0lf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1MyBTYWx0ZWRfXzTgFKnfmD4gT YNsx9/KW1PwZoSgOagNwdlypnuJsUxSDQceN6XFzAxZ9PSsFF6Z//hTUmVDyFsIqeNc/UF6O3dm G2lFEHtIcldXDOuJ7MPWFpW1xVb33SD5Um5NOlnEYQSXU+NAy02qgUvq8P7LqfQom5VKyVaYqKD
 viE0ytqAz6OWHQdzFQUocDAhdEhOl1qmvfrsYjLbDzz/1su9i547CGTD+4KDIkDeXVIg4lDyTYC hRtjF34rPNfdNkwo7cI7MLbAh4+MUL90JZ47TtdZEuzISH4UBZgJn5ZhgNWvxUZnRuUfz7Xqke6 lPH+/f/zU+p7VAZ+59dMFdu92UFmRGhht82uZhHSjOd+nCuGjJ+1ZNEQsv8yud07M4irk1amG4a
 DvbUPgQtjYUq5W7+hVUcDHWuQEVOMxBsLPaVEoUATDP4h1d4Wr4A6ngyF+xb4pS8S9TThZwo
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=685ba5ee cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=4PT1ayd0SIKHQ98-h3UA:9
X-Proofpoint-GUID: ERvA2OObeogm-T28-OBTZ7tVkYis0lf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=766 impostorscore=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250053
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

To provide support for page table check on powerpc, we need to reinstate the
address parameter in several functions, including
page_table_check_{pte,pmd,pud}_clear().

In preparation for this, add the addr parameter to arm64's
__ptep_get_and_clear_anysz() and change its callsites accordingly. While this
parameter won't (at present) be used on arm64, this will keep the usage of
the page table check interfaces consistent.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v15: new patch
---
 arch/arm64/include/asm/pgtable.h | 5 +++--
 arch/arm64/mm/hugetlbpage.c      | 7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index acbcb5e883ce..75572a08c012 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1381,6 +1381,7 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
 
 static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
+					       unsigned long address,
 					       pte_t *ptep,
 					       unsigned long pgsize)
 {
@@ -1408,7 +1409,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
 static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long address, pte_t *ptep)
 {
-	return __ptep_get_and_clear_anysz(mm, ptep, PAGE_SIZE);
+	return __ptep_get_and_clear_anysz(mm, address, ptep, PAGE_SIZE);
 }
 
 static inline void __clear_full_ptes(struct mm_struct *mm, unsigned long addr,
@@ -1447,7 +1448,7 @@ static inline pte_t __get_and_clear_full_ptes(struct mm_struct *mm,
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 					    unsigned long address, pmd_t *pmdp)
 {
-	return pte_pmd(__ptep_get_and_clear_anysz(mm, (pte_t *)pmdp, PMD_SIZE));
+	return pte_pmd(__ptep_get_and_clear_anysz(mm, address, (pte_t *)pmdp, PMD_SIZE));
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 1003b5020752..bcc28031eb7a 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -159,11 +159,12 @@ static pte_t get_clear_contig(struct mm_struct *mm,
 	pte_t pte, tmp_pte;
 	bool present;
 
-	pte = __ptep_get_and_clear_anysz(mm, ptep, pgsize);
+	pte = __ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
 	present = pte_present(pte);
 	while (--ncontig) {
 		ptep++;
-		tmp_pte = __ptep_get_and_clear_anysz(mm, ptep, pgsize);
+		addr += pgsize;
+		tmp_pte = __ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
 		if (present) {
 			if (pte_dirty(tmp_pte))
 				pte = pte_mkdirty(pte);
@@ -207,7 +208,7 @@ static void clear_flush(struct mm_struct *mm,
 	unsigned long i, saddr = addr;
 
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		__ptep_get_and_clear_anysz(mm, ptep, pgsize);
+		__ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
 
 	if (mm == &init_mm)
 		flush_tlb_kernel_range(saddr, addr);
-- 
2.49.0


