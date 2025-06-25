Return-Path: <linuxppc-dev+bounces-9695-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C12AE773C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 08:39:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRsc51jb8z2yPS;
	Wed, 25 Jun 2025 16:39:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750833557;
	cv=none; b=XmtKUOE+f11Gif86I3wKeW4fvCrEj8/ayqRhBx40rHX1LMZvrqWASgDOnO9GTDojtOCjzGxYit6wypob30Q6kVXhFYoOXggAphxPAchPU3lgQmBOVffw2bax77LJxzkdlJH4mRMMBkW2ew6zq4Fdm6BCZ0FxzXRtg859BitusbnuQUNj2CiyU32aDfVG0nDfGho+IP6cbucheAaluEGAVMNRpwftRak0bwNDiv0tWazUKF/IuLYuEbRPKAKB/vaXU7JQ6xx1N81bfJMxFHwu5KXBvvrAPZn/NdNg1Fw3tjt5qRmDfOCO5EsiesEM+IMAUg9iKO+bHDqwA0pIIktkaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750833557; c=relaxed/relaxed;
	bh=38JUqnmMvQ5EuRM069Y/fd06J//BHQwkg7HugjQcG2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmkSE8HKJu1ImSx0LAmrkxg+469EkRP8YZtE4OLBi9HtTujuoqA6RGAwDV2lKPWr+lO193ik5SQiNs4+Qz5fc60tR2VG7K51e7gJHxQHX7one1MHgrc95VZyqvdQWsgIbl0xN+Cw2MU+T7VdKIcy8Ypv6BErSYShsMfn57it0qKMQ1lcLNH0dU/3CzpKvYJL9P8Db+CY0rSEvTt2mdFKhFKN7n4hQq276ExDT4mO9X2udDC4ZIXbQvak+hlCeMF/2gLBQY/xVTerj8MN4nJepZguKbwmfpWqu1TmiDpLmA0QYsNHei3+4FgUPTKDSm395uuCABh3DmxLoZVLHVvXXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pYYiZ1MD; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pYYiZ1MD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRsc42s8mz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 16:39:16 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P2O5Zt008193;
	Wed, 25 Jun 2025 06:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=38JUqnmMvQ5EuRM06
	9Y/fd06J//BHQwkg7HugjQcG2I=; b=pYYiZ1MDMq/9NG1mbqLUAZ7E9B8k2x46/
	EYXBq3xhKLKvhf3TAlQxMinoXLWyG4JiFG+ZscZGtH8RdPg6OXJpPIAqqpJhCuqy
	Gn3zHsX+s4Es0h26syAF/AuanmXg3i0mdQLbvh+d6OmVG04Lss8YKvpDdr3wRPlo
	ZYrmpErmgZgTfknYVmGMmCIxiwSId6djPskEQh3DhQ6urdNkLDRPpI+4mGVoQdnp
	2CudTe0lCSCWxGF8v5TSl4PTgETspvgibWQ1RgS3qxV8jrPUea/8nRLMYq8gYvwk
	hJITJepDZ0eqDddWVTFXKQRS/XpnhRhOpFE4fWbf2QOuaaJJNdLTA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5twg3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 06:39:03 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P32mdp003989;
	Wed, 25 Jun 2025 06:39:02 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e99kqq4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 06:39:02 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55P6d19o26870340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 06:39:02 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B178B588F2;
	Wed, 25 Jun 2025 06:39:01 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 093DA588E2;
	Wed, 25 Jun 2025 06:38:57 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.18.35])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 06:38:51 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, pasha.tatashin@soleen.com,
        akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu, mingo@kernel.org
Subject: [PATCH v15 06/13] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pud_clear()
Date: Wed, 25 Jun 2025 16:37:46 +1000
Message-ID: <20250625063753.77511-7-ajd@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: Z47N1cbQhimo-l2AzNSEI6V8jfUK-36n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA0NSBTYWx0ZWRfX5aJ1GyCyt+lF RNkSPUbQAiFCg2w9HFwZ5wnxrZBEiDB324ljkSwuZE0PRfCiUY/GGBiiyH96909WjzSdwylTxrt 2mBtYPLlhRZgyXo0yWqmx9Nzb3hBvDmKn7XJaLlFIvwmRlsciigeO/dKefMvl842D8uVxg6ITlW
 bv9XUKhVFLmihfIGOAirKO9H6IksjWFEVbREh4YIseKDnYGUtN2692uDui3PW+jopomfpP7syed z9GqcqQTtP3U5dOSKo5XsdLB3wDmPGRapnJfLpuvph+nsOa8013fUGkNuSNl9Liu2iDTXljHweI 0+NvTFNh3iEFdkGwMUqUcI632Dc023XL0CUz9ECN8Y0Bv0LGiRQJ7fv2svvL/C0bGrwj7LsIn7z
 +qSBD8bpE9cPw0AIMeXo5kS3zcFX33mYIZ+r3HqaZtc035AOTdwOOAvDVsIN7vegF6BqV1G9
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=685b9987 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=VwQbUJbxAAAA:8 a=ocrGMPNeQj1hKc7Dx3AA:9 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-GUID: Z47N1cbQhimo-l2AzNSEI6V8jfUK-36n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=916 impostorscore=0
 clxscore=1011 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250045
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
---
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/x86/include/asm/pgtable.h   |  2 +-
 include/linux/page_table_check.h | 11 +++++++----
 include/linux/pgtable.h          |  2 +-
 mm/page_table_check.c            |  5 +++--
 5 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 383c01f9cae9..72ccbd810b13 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1398,7 +1398,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
 		break;
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SIZE:
-		page_table_check_pud_clear(mm, pte_pud(pte));
+		page_table_check_pud_clear(mm, address, pte_pud(pte));
 		break;
 #endif
 	default:
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 995ca7e6e0e9..4d6da32e77a6 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1376,7 +1376,7 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 {
 	pud_t pud = native_pudp_get_and_clear(pudp);
 
-	page_table_check_pud_clear(mm, pud);
+	page_table_check_pud_clear(mm, addr, pud);
 
 	return pud;
 }
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 66e109238416..808cc3a48c28 100644
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
index d06b5fec9540..765451864de3 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -650,7 +650,7 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 	pud_t pud = *pudp;
 
 	pud_clear(pudp);
-	page_table_check_pud_clear(mm, pud);
+	page_table_check_pud_clear(mm, address, pud);
 
 	return pud;
 }
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 0957767a2940..bd1242087a35 100644
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
@@ -246,7 +247,7 @@ void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
 		return;
 
 	for (i = 0; i < nr; i++)
-		__page_table_check_pud_clear(mm, *(pudp + i));
+		__page_table_check_pud_clear(mm, addr + PUD_SIZE * i, *(pudp + i));
 	if (pud_user_accessible_page(pud))
 		page_table_check_set(pud_pfn(pud), stride * nr, pud_write(pud));
 }
-- 
2.49.0


