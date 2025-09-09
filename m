Return-Path: <linuxppc-dev+bounces-11928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CFDB4A723
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 11:15:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLdSn2rLKz3cjt;
	Tue,  9 Sep 2025 19:15:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757409305;
	cv=none; b=E+ydlvxGnhVA3ZKwwIeQyKvcY2qS5oeHhC283BddliOU/w4IxZ/hY0f+SBv9U4290UgzOdvoCdZsgsSRvIW4UDftF+Dfc4yaAsAPta2WgZiS65/ECt5dXmimXvmYtcRCPHFKeQeAc3cB2XJFyOZw3iGt/zIQhkoDR3vlQNoy8Z83XlD2v+iPoYxSjpd0mHrZII8H7e/f3xrLp0RmVsBCCTYXbzsUsi+ipQVOgqLhoy3jTK9pD8scFwwQhjS1XIMFtAfdf6JsPCVZHh8VbJrIVccHRYlHOtIJA8y+o+LBNPDpeHDl1SaykPM1vDOaV0bmEZIUBDjku9sNBjI1D8QU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757409305; c=relaxed/relaxed;
	bh=jL7RaeclpRlp1A4tGNbjlrpgr9PHwah8vqyc6YCKlCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kA2TedccpYHZQ5isWlpW3W22mepLsZG2MyGXE0lkwrXo0OYq+Z2iCYoRGyCEx6Ud8EiNzyEulRRVgY4HuYlq/QtEYDsaLUKNaXSGsxLijqq8TAED2ZUc8JTAox3dQLamB4Fw1dUhDgtl5ewK+BU4EhMMDvhnFnySrlpN3NQz/wpmpzXJKqxzwZgQ4k/WsQ3Xh3o5KzdT8n/kRa+hWvNYcKv5/Y3BRKbbKFI8dIQ0d5Ge7d/rFO41jkQ+egKZ0C0zGcvZzV7L/eXgOh+9xVTJ1fzrWCmzrU+4syleYMc5n+5hWaj4LYK7ds0/kbY7h/ZHRJ7jOQhph7uAR0PkHffTpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NX2/prs4; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NX2/prs4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLdSm40yvz3cjf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 19:15:04 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5897fb06024507;
	Tue, 9 Sep 2025 09:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=jL7RaeclpRlp1A4tG
	Nbjlrpgr9PHwah8vqyc6YCKlCo=; b=NX2/prs4Xvpyv2FWgu1wOEyH2z2ooPYoW
	ToezW8J4cLSQ1a14go9Obv0WvEnXFh/WZ5Pui06wGCn8YMeVXlYshKzvU5QuVfh9
	3LrjmOqiIYh+30NS1CBncAMeEx7gQSNXn4MauAHmF7OvIS+PJF9EA2+k7pVSfxJX
	Q17zQnRhmijHDE8ZNfgkeoHY5D6jRuVDxeq7Hwq/aDti/LXK0JZj4oycFbOuSkLh
	p4Yk7zsKRZ12+zCMNKdBomEObyMSrTbQYEWYUB5pzmlI5lg2k9FcJ1iTdfDuVtnl
	qS+JI1KIYTGCa6G7WQXAok1rAdOWSRpIuum1Qs8x49qDWW7h0S+9w==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acqxn6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 09:14:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5896jdRc010605;
	Tue, 9 Sep 2025 09:14:52 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910smt9kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 09:14:52 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5899EpXe21103268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 09:14:51 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EAF258043;
	Tue,  9 Sep 2025 09:14:51 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9BAE58055;
	Tue,  9 Sep 2025 09:14:46 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.2.198])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 09:14:46 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        alexghiti@rivosinc.com
Subject: [PATCH v17 05/12] mm/page_table_check: Provide addr parameter to page_table_check_ptes_set()
Date: Tue,  9 Sep 2025 19:13:28 +1000
Message-ID: <20250909091335.183439-6-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909091335.183439-1-ajd@linux.ibm.com>
References: <20250909091335.183439-1-ajd@linux.ibm.com>
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
X-Proofpoint-GUID: uCQOFUQjBvrOpyONrMmQQ4TAF6bz24UD
X-Authority-Analysis: v=2.4 cv=Mp1S63ae c=1 sm=1 tr=0 ts=68bff00d cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=h0uksLzaAAAA:8
 a=UVT5Uxx9rTNGLfuASP4A:9 a=gpc5p9EgBqZVLdJeV_V1:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-ORIG-GUID: uCQOFUQjBvrOpyONrMmQQ4TAF6bz24UD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXxvNB7D6bUmoG
 A3Q4yiWb3FrEoNw9/6pXRSrIvYdWycajS8HuZlois6ZIdVt/Zo9PFs8hdgY5HxXxHKfjMkgS3n7
 JuegerxW/khXm0OgUwrwoZFQgR4rxx2rtDyvSNgEGoyIjUk+3+76enrzR63FE3PRQb4Z1fsHV4X
 dPZLMTxgIUt80e9GpAKKZkvaXFCoEJRPpCPEX6AnCk3mPIjgo0VBAc02HpXCi2GNVEuBZpxA8SJ
 8Ao/6dsHwqdNZiVRv+/dZxOkNUvLCVfI7Sz24aZXCiPXRD5UskzM6YMN6H4rhiT6JkEHVb8KIcK
 hBWtGyGCscNw7Y6pS5P7z6jznc7ytmZJadq28EGKT4CNSIPZHDF79kLR06ZCWjA8hIMO/jCCEdT
 2u7ZaBVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060000
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
Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv
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
index 98e56d4ff840..bef95776504d 100644
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
index 94249e671a7e..a422fdf31ffb 100644
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
2.51.0


