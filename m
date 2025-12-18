Return-Path: <linuxppc-dev+bounces-14874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D01CCCEE7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 18:11:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXHHZ4Tytz2yY1;
	Fri, 19 Dec 2025 04:10:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766077850;
	cv=none; b=DzRCrzBDMf2kG9biQnfPKYeKkNhpX5CZ2DxV9cGmJWTLDIRhSSrNKW6WkaC7l8ksjTjZBBGzSqAXyvxSTC9CpJ/2Gf/XEZsnAhzNKgumUbAIH+cBR3Gqwcp5jwbzwzV++JEVmoNz0U3m+dZzc2xX4+apIKCC9OREw1AuhzhgVBfNshCYrppJCKjgx2OICfELxalkQR9kkGU0VhyWgNhI7mc/eZsxJriL+hn5ceUxvN24jN/KGCXXIbBDvZgjZ099+QG+zfRnSVCUxCvnaIf46kApOAj/VLxIGUqAmfkC0NP6lqA4EwXp5vo/mVIYY7v6hS1iNWZe3v96ve2zSSyqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766077850; c=relaxed/relaxed;
	bh=zZ67xPxaTbTtsO9cvIF/qxKW++iMaXTkBtrOc/gvbuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DCri3B83eAsTIGUb2SqMcpaoe/+l0KcH8CjOcRrl2WP8hPigWHDI6Lz/e1kNXtSSN9MAhbSlNR0mhWkO/CFIZbyXm/nYk7tJkSkRrXKz1BWEFGkKROFgDbQUwnb6AxqnoXnqVLKyMlFuXWpPTLmgHIKTYOLrWeZbDjYrIKecF1WyyhYtNrJZbMBDUe3w65S5zYM+Zy4ERYOeTTFTJmR+8YFved74CjPvgxY8fbdQy5exOEx4BjwoNxLBD+c7/6AFAt90PwNSioj/qYe5k8nGiRmhAGU2u7Ou5jwFfg6IkmlPMQvDRf7jejq120zbZ6gKnwHxW6/+NjcHtf/8tzkvqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GuIiUAaC; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GuIiUAaC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXHHY6GXVz2ySY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 04:10:49 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BI8GDZw004426;
	Thu, 18 Dec 2025 17:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zZ67xP
	xaTbTtsO9cvIF/qxKW++iMaXTkBtrOc/gvbuY=; b=GuIiUAaCapbAfv+X66e8yR
	oXk20sWt48fjxOw851qbQm0bM0cBJv42ko7vIcm4W6dNGSfDOwtgPJug6UjurOqn
	jQo1gzg8Zs/NpsEbDEoSGLb5C03X2ij0oKYENnaI6qc9925R0nr9EebotrvJoXYn
	e87SF+KGVN12zgX+qB8Jkrbm0pquAFRUd0tYFHxW1ojv3Eu6WEUo5qkTIJ0xq4b9
	SusDVwxCqigv7Fvy+sYaov4s7qJqa7c/kd7791UTd2IR9rMSVghVGTQRSBQyUOhd
	yquWMaKJSwSjnHA9q/Z438oJfgdzrAk8kJ1VA1qBJAC55/OqBGcuNdiJ3wgo2tCQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0ytvkv98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 17:10:39 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BIH72MH027214;
	Thu, 18 Dec 2025 17:10:38 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0ytvkv93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 17:10:38 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIEBi43002856;
	Thu, 18 Dec 2025 17:10:37 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kfnhhtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 17:10:37 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BIHAZ5l29819634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 17:10:36 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB7825803F;
	Thu, 18 Dec 2025 17:10:35 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CD2E58056;
	Thu, 18 Dec 2025 17:10:29 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.16.51])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Dec 2025 17:10:28 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 19 Dec 2025 04:09:38 +1100
Subject: [PATCH v18 06/12] mm/page_table_check: Reinstate address parameter
 in [__]page_table_check_pud_clear()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-pgtable_check_v18rebase-v18-6-755bc151a50b@linux.ibm.com>
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
In-Reply-To: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
To: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>,
        Christophe Leroy <chleroy@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org,
        Nicholas Miehlbradt <nicholas@linux.ibm.com>,
        Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
        Andrew Donnellan <andrew+kernel@donnellan.id.au>,
        Srish Srinivasan <ssrish@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX2GdI2OfOk0nr
 +YY0AKjbMkEYpENB1vBNlm2TewxLvp9S9NrlIkzUUfqEnD+aIYoseigjCqhWmZFcwTxrl8+VxnS
 Fs7PGC2HvcwtUOK/n2+MJRqbPjBSb/MPazPXnl44xNqdTm/7dYwwpwxoJzJtnB7T+vohxDQQK4s
 8PwB4aMC25jW+a+yQqTwNOChNhqDfo38LSuHOKOwSA0myy9gnx8RQl6Bw5AfOs2TGXV717EQPA5
 JxTcv+MBkHqh//c1/XrhVCxf3FswW3tgmHqC/pH8FyPZl5c8q6W/L8QZbJLkuQdJYXXmuECUA/h
 YMD4DimLWiaPsrdALyuyEDDxyfXVcJ6DmktrgVVB5mr4YWxZ1qftUfdMsYQ8VqipZtc3bzv3arf
 nv/BC33OQxx90d4rkgV8kP6UQEuhIQ==
X-Proofpoint-ORIG-GUID: zb8xkrJS4407DEIx0iB13m777aIHsqjH
X-Authority-Analysis: v=2.4 cv=QtRTHFyd c=1 sm=1 tr=0 ts=6944358f cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=VwQbUJbxAAAA:8 a=wZhGIaPSpsofiGV4ShsA:9
 a=QEXdDO2ut3YA:10 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-GUID: ZcbySWh4w5lgKpugxWSci09tNfPsio4T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

This reverts commit 931c38e16499 ("mm/page_table_check: remove unused
parameter in [__]page_table_check_pud_clear").

Reinstate previously unused parameters for the purpose of supporting
powerpc platforms, as many do not encode user/kernel ownership of the
page in the pte, but instead in the address of the access.

[ajd@linux.ibm.com: rebase on arm64 changes]
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v15: rebase
v17: rebase, fix conflict with riscv patch
---
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/riscv/include/asm/pgtable.h |  2 +-
 arch/x86/include/asm/pgtable.h   |  2 +-
 include/linux/page_table_check.h | 11 +++++++----
 include/linux/pgtable.h          |  2 +-
 mm/page_table_check.c            |  5 +++--
 6 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d1dd0266bb0c946442df88594cc39e958185af0a..595405e6bfc736f2824a9c2e8784351f15ad0571 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1349,7 +1349,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
 		break;
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SIZE:
-		page_table_check_pud_clear(mm, pte_pud(pte));
+		page_table_check_pud_clear(mm, address, pte_pud(pte));
 		break;
 #endif
 	default:
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 89abba40e3e426c00e6964bdf135042777319588..841494ef46ee6ae1410f420dc7d0a99c4e1958cf 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1093,7 +1093,7 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 	pud_clear(pudp);
 #endif
 
-	page_table_check_pud_clear(mm, pud);
+	page_table_check_pud_clear(mm, address, pud);
 
 	return pud;
 }
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 7fd876f8d828ea70def7adc51cc17e70d3046e35..3eb36a36058face6aba92efe3eed7214752e751f 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1330,7 +1330,7 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 {
 	pud_t pud = native_pudp_get_and_clear(pudp);
 
-	page_table_check_pud_clear(mm, pud);
+	page_table_check_pud_clear(mm, addr, pud);
 
 	return pud;
 }
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 66e10923841691a59620da8d17f7bb7b09e6a6d3..808cc3a48c28fcf988ba2c50031fa4f317496582 100644
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
 void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
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
@@ -123,7 +125,8 @@ static inline void page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
 {
 }
 
-static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
+static inline void page_table_check_pud_clear(struct mm_struct *mm,
+					      unsigned long addr, pud_t pud)
 {
 }
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 496873f44f67b73fc32940c956fd5265b748faad..ed3c28ebeb35b766418abdefa5cc6604c0533479 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -801,7 +801,7 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 	pud_t pud = *pudp;
 
 	pud_clear(pudp);
-	page_table_check_pud_clear(mm, pud);
+	page_table_check_pud_clear(mm, address, pud);
 
 	return pud;
 }
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 2871d9c453682ba922b2fcf532cb6a7d867ad952..2295bc9368ab9cc827ee671ff9abf18a6b738172 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -167,7 +167,8 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd)
 }
 EXPORT_SYMBOL(__page_table_check_pmd_clear);
 
-void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
+void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
+				  pud_t pud)
 {
 	if (&init_mm == mm)
 		return;
@@ -253,7 +254,7 @@ void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
 		return;
 
 	for (i = 0; i < nr; i++)
-		__page_table_check_pud_clear(mm, *(pudp + i));
+		__page_table_check_pud_clear(mm, addr + PUD_SIZE * i, *(pudp + i));
 	if (pud_user_accessible_page(pud))
 		page_table_check_set(pud_pfn(pud), stride * nr, pud_write(pud));
 }

-- 
2.52.0


