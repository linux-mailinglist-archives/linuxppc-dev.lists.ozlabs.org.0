Return-Path: <linuxppc-dev+bounces-9722-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A6EAE7891
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:32:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtmt1LvNz2xRq;
	Wed, 25 Jun 2025 17:31:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750836718;
	cv=none; b=CEFEXDylbljyWWUtZkTBGNQoDGMQFXhwIdneoBmoXFk1YZms63+mO0xLOdLH01tQHXpIamAIqQJNaLuSpekl1jjabL5C/mveYdgunuONIVSJYD1SXUYtJHsQqQ561k5jVsr3zawrbrz/nyhRTv6psGuoi2bUpiGmVcYCLDH05uC/U4thpkHQVNOpEc+ffX5S8/mG/EiawrWawWY2BzbA8l7fkTwMyvAy+312Cs1hm3+42YrXzkORy+Nnaw2dRH7BYBl1cJoWLlXcPcRscx2jJqjZ+IA7bw5yPqHLJZGZ9Ycyme8L5+80rFbRkgK8LvnfEAwm9iv9b6+YbYSPztCVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750836718; c=relaxed/relaxed;
	bh=OXDZ4ByVvnIRVW3kj9LlmaLCt9JDdt/Rz9CPd/Hbm3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fncl3NbPKCogBLL+elS4S8pSraR7lxAnDxYcYPuX+OZ/TdvgFXaTh+Bv7MtmuI2pxGVqW7LlV7sac6kMQxkw5W6v5DCI93DomQa8AT9xrVvG6bfvkXPQX5005JzeCO/Crl3c2K/oKtvsDfLo/gi8eaFIlmaBULOoblgrIza+zhSxqNo+yOzFa+ks79oTSVWpuv5ur6q+UU7A3u7Uw/7JuZBdnvANXN4mQOffxUejGMLV/1Qm83Mog8l0loZIe/0obwdL0k4Pb1/Pigxnyk0Mfu7/hbJX6aD4Sa5FXggkdnJuWPW6UepKwASMs7u9M2B6E67IMqgCRiDQuLeNL5o8NA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o0tnC0dk; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o0tnC0dk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtms2TjWz30Ff
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:31:57 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OLI1hV011590;
	Wed, 25 Jun 2025 07:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=OXDZ4ByVvnIRVW3kj
	9LlmaLCt9JDdt/Rz9CPd/Hbm3s=; b=o0tnC0dkfppQyUqIr2D/QQ0iTkmObOOaq
	l5O4aOJoXeL+Pbulj5RHh/B9EKTDExtNT3AzLL2hk0ESxLHZJfJTfTq9dWey2CiR
	onT6IdYq8R528t/faIBg4LyjcwbOM5mQeyqgUWVMA9p4dsoo3CH4RFEu3D/CruaV
	edaNQRXpILWCsunwedf7jQC2Yq+tykqQ0fvLlcuYWsgypH+8blcDpXsvfeSuyxDO
	ScLPuJwEIqrPXeNFYmVtR9fgBLrYvgLXn3+BadAYypB6yWnoHuNF5BnYDt2VM7f+
	M1iZnG9BNjByOclZ17RWoVt7qpfsJebGhERVeXIpEQhYll3Ruk98w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jdt71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 07:31:39 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7GpDx014769;
	Wed, 25 Jun 2025 07:31:38 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e9s2fu8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 07:31:38 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55P7Vbeb6095574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 07:31:38 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55E725885F;
	Wed, 25 Jun 2025 06:38:29 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAE2C5888E;
	Wed, 25 Jun 2025 06:38:20 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.18.35])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 06:38:20 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, pasha.tatashin@soleen.com,
        akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu, mingo@kernel.org
Subject: [PATCH v15 03/13] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pud[s]_set()
Date: Wed, 25 Jun 2025 16:37:43 +1000
Message-ID: <20250625063753.77511-4-ajd@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1MyBTYWx0ZWRfX5zMZBWlCcEWF g1a2Lf3dT1CtpMHFogl939z8Zyq+OvtoMI2EnphshKvJgfc/VDJ44qQqOzqDsu6bM9oxBJlHoQu VWpnXterh+klDbtJpp2hlZ3UwfRq898p/eGNoZjDB85eULCxl4zPj09ux1vk/HXOB1WwGlbDZHD
 YFdqKW6/vb2ZQVTvxgfEre2p5NJZTLqs1nq0rZrycboN0lEfIYyzZDuU7z9/u3EJwufexkFt5uv lLL4e94ESv01WLuYdDahLat1phB0CGAXgNQKdsEnu7kVNLmn4ey4WS1grDsgs10wVtysuBQWY9u Juq8VSIl1wQQFBUzlCEBYWp9j3FN1KkjsTroN9YD2GV94M5H4WE2qHuAfNpnik8U+dc7O2SGho8
 bJ2qQT0z1mqFr+UsYGYUNEr5cE4kPy82gkoO09VSEIH1SkwzbQyA+3EJkPnSfsHfam4MaZz0
X-Proofpoint-GUID: ZhhPFWc21eie0_ktZSMq0k3XygmstjGh
X-Proofpoint-ORIG-GUID: ZhhPFWc21eie0_ktZSMq0k3XygmstjGh
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=685ba5db cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=VwQbUJbxAAAA:8 a=3Toew5EgkJ5X0DR0WCAA:9 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250053
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

This reverts commit 6d144436d954 ("mm/page_table_check: remove unused
parameter in [__]page_table_check_pud_set").

Reinstate previously unused parameters for the purpose of supporting
powerpc platforms, as many do not encode user/kernel ownership of the
page in the pte, but instead in the address of the access.

Apply this to __page_table_check_puds_set(), page_table_check_puds_set() and
the page_table_check_pud_set() wrapper macro.

[ajd@linux.ibm.com: rebase on riscv + arm64 changes, update commit message]
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v13: remove inaccurate comment on riscv in the commit message
v14: fix an x86 usage I missed (found by akpm)
v15: rebase, amend commit message
---
 arch/arm64/include/asm/pgtable.h |  3 ++-
 arch/riscv/include/asm/pgtable.h |  4 ++--
 arch/x86/include/asm/pgtable.h   |  4 ++--
 include/linux/page_table_check.h | 12 ++++++------
 mm/page_table_check.c            |  4 ++--
 5 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 75572a08c012..be463058207c 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -727,7 +727,8 @@ static inline void __set_ptes_anysz(struct mm_struct *mm, unsigned long addr,
 		break;
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SIZE:
-		page_table_check_puds_set(mm, (pud_t *)ptep, pte_pud(pte), nr);
+		page_table_check_puds_set(mm, addr, (pud_t *)ptep,
+					  pte_pud(pte), nr);
 		break;
 #endif
 	default:
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 438ce7df24c3..8142b7c48295 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -829,7 +829,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 				pud_t *pudp, pud_t pud)
 {
-	page_table_check_pud_set(mm, pudp, pud);
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	return __set_pte_at(mm, (pte_t *)pudp, pud_pte(pud));
 }
 
@@ -980,7 +980,7 @@ static inline void update_mmu_cache_pud(struct vm_area_struct *vma,
 static inline pud_t pudp_establish(struct vm_area_struct *vma,
 				   unsigned long address, pud_t *pudp, pud_t pud)
 {
-	page_table_check_pud_set(vma->vm_mm, pudp, pud);
+	page_table_check_pud_set(vma->vm_mm, address, pudp, pud);
 	return __pud(atomic_long_xchg((atomic_long_t *)pudp, pud_val(pud)));
 }
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 97954c936c54..ab10efb392d1 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1267,7 +1267,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 			      pud_t *pudp, pud_t pud)
 {
-	page_table_check_pud_set(mm, pudp, pud);
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	native_set_pud(pudp, pud);
 }
 
@@ -1418,7 +1418,7 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 static inline pud_t pudp_establish(struct vm_area_struct *vma,
 		unsigned long address, pud_t *pudp, pud_t pud)
 {
-	page_table_check_pud_set(vma->vm_mm, pudp, pud);
+	page_table_check_pud_set(vma->vm_mm, address, pudp, pud);
 	if (IS_ENABLED(CONFIG_SMP)) {
 		return xchg(pudp, pud);
 	} else {
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 289620d4aad3..0bf18b884a12 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -21,8 +21,8 @@ void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
 		unsigned int nr);
 void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
 		unsigned int nr);
-void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
-		unsigned int nr);
+void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
+		pud_t *pudp, pud_t pud, unsigned int nr);
 void __page_table_check_pte_clear_range(struct mm_struct *mm,
 					unsigned long addr,
 					pmd_t pmd);
@@ -86,12 +86,12 @@ static inline void page_table_check_pmds_set(struct mm_struct *mm,
 }
 
 static inline void page_table_check_puds_set(struct mm_struct *mm,
-		pud_t *pudp, pud_t pud, unsigned int nr)
+		unsigned long addr, pud_t *pudp, pud_t pud, unsigned int nr)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_puds_set(mm, pudp, pud, nr);
+	__page_table_check_puds_set(mm, addr, pudp, pud, nr);
 }
 
 static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
@@ -137,7 +137,7 @@ static inline void page_table_check_pmds_set(struct mm_struct *mm,
 }
 
 static inline void page_table_check_puds_set(struct mm_struct *mm,
-		pud_t *pudp, pud_t pud, unsigned int nr)
+		unsigned long addr, pud_t *pudp, pud_t pud, unsigned int nr)
 {
 }
 
@@ -150,6 +150,6 @@ static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
 #endif /* CONFIG_PAGE_TABLE_CHECK */
 
 #define page_table_check_pmd_set(mm, pmdp, pmd)	page_table_check_pmds_set(mm, pmdp, pmd, 1)
-#define page_table_check_pud_set(mm, pudp, pud)	page_table_check_puds_set(mm, pudp, pud, 1)
+#define page_table_check_pud_set(mm, addr, pudp, pud)	page_table_check_puds_set(mm, addr, pudp, pud, 1)
 
 #endif /* __LINUX_PAGE_TABLE_CHECK_H */
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 4eeca782b888..3c39e4375886 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -236,8 +236,8 @@ void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
 }
 EXPORT_SYMBOL(__page_table_check_pmds_set);
 
-void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
-		unsigned int nr)
+void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
+		pud_t *pudp, pud_t pud,	unsigned int nr)
 {
 	unsigned long stride = PUD_SIZE >> PAGE_SHIFT;
 	unsigned int i;
-- 
2.49.0


