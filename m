Return-Path: <linuxppc-dev+bounces-6088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A03A310EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 17:14:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ysmjz3L1nz307C;
	Wed, 12 Feb 2025 03:14:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739290487;
	cv=none; b=QFPgRzFYUnE3qu64u9fFpUbgoYL3GvM06+dKRuzTSFbeIqOFFC6nWzk5euImpw0PRpgUVX73omr2fVQTrYMjjkHWuSrADi6HX1AibUAHrCW2bcg3yVWhwdWU6YOOHv1kuqUdTqkNn/dNBYgzSSK20aZYgRscqefZPWq+oLKswvAm8BEUGXwq9JaUJHeUGzuU+jktwnlL8s/XeSzMWgd3p2Xr+q1h3bb0Z5eTN5DVLv2PnjyXhcviwVgXUS0SkwRRBaogmG2fZ+SirR+Xqv+MRfy6+v3anYKOulzw9r89tXBaq0uJxbzgDcZf2AjAbrmkcWO2pGHFNgaxshpZBflTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739290487; c=relaxed/relaxed;
	bh=uZG7yaQ4bZBn0z1b8C7/uIuy1qMqjNuKx2nlIDWDzI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+tjnWRdf6oxZLQPcM2mRPgtLpEHr+DGHCoQ0eD7lynf45WaBV4FaK0UK45syb9F9aNux/ooLtcbUakVupA6hZ6qa7wfFrFHwt4I9ct7oyx5LQHhLutmo0s4iAAYL8IO4Q7VTciw2+J5t8HBaQsdBxH0Tjsfje2LqfnLSHrC2f53SOlFTXIDxBFDTwPf9FsG4hJzgAbgYXEaWPEl9NhAWuQoSey+Dm4zxfyoyeYf0Zo5HZMZ0cjvURe0TeaBNyemgQ+EJwhwHEPx2djECGi8RrHKZTNfJWc1amW+QM5v+25AFhUKV1w46M+F64y/CIOgkQ+k2Kqqo7RK2+Crq7PeMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mr2lydJA; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mr2lydJA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ysmjy3y4Mz306d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 03:14:46 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B5OSTX027206;
	Tue, 11 Feb 2025 16:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=uZG7yaQ4bZBn0z1b8
	C7/uIuy1qMqjNuKx2nlIDWDzI4=; b=mr2lydJAqkve28q4/0oCboUp/WD8Ywl1W
	ZceOxD0kFJJDvXos/977TT9JWmJzl2DVYZQFQrZ0Bbha6uyXD18tCTI7L4QdwETZ
	aOUYrP9uOy/ND/jZ+XUm0JgG2+GGNkWxga8MTZ1PQQ8D64DrNk6kFfMgeFMkPDb9
	CrvfcgfSMCbcp4WdWGHfiXgzkr/C4qbFBbLYd7Uh0g26qqGpuB/Pfbm9haAuOgrY
	CDdIq4wcDBCd9mW22BMyOM1qGL8MxYLnD4XKUnR0sbmK5NpQkh+XHe1wkDfyhIeU
	KUp5pn6QBUxmAHBCCJLbhq5PTK7zhtf8LF+UYoy4IHi26wmb8g2tg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44r0c9aw17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:14:36 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51BCsjnj000914;
	Tue, 11 Feb 2025 16:14:35 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pjkn43gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:14:35 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51BGEXgw58327362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 16:14:33 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C3B82004B;
	Tue, 11 Feb 2025 16:14:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73A9C20043;
	Tue, 11 Feb 2025 16:14:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Feb 2025 16:14:32 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.150.7.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2BA686013D;
	Wed, 12 Feb 2025 03:14:27 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me
Subject: [PATCH v13 01/11] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pud_set()
Date: Wed, 12 Feb 2025 03:13:54 +1100
Message-ID: <20250211161404.850215-2-ajd@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: Td-AQtqu0Ne9Ra4i8CxIxImgWQGK1w1V
X-Proofpoint-GUID: Td-AQtqu0Ne9Ra4i8CxIxImgWQGK1w1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=955
 spamscore=0 mlxscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

This reverts commit 6d144436d954 ("mm/page_table_check: remove unused
parameter in [__]page_table_check_pud_set").

Reinstate previously unused parameters for the purpose of supporting
powerpc platforms, as many do not encode user/kernel ownership of the
page in the pte, but instead in the address of the access.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[ajd: rebase on riscv changes, remove riscv commit message comment]
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v13: remove inaccurate comment on riscv in the commit message
---
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/riscv/include/asm/pgtable.h |  2 +-
 arch/x86/include/asm/pgtable.h   |  2 +-
 include/linux/page_table_check.h | 11 +++++++----
 mm/page_table_check.c            |  3 ++-
 5 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0b2a2ad1b9e8..f77bbaf3cf7c 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -661,7 +661,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 			      pud_t *pudp, pud_t pud)
 {
-	page_table_check_pud_set(mm, pudp, pud);
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	return __set_pte_at(mm, addr, (pte_t *)pudp, pud_pte(pud),
 						PUD_SIZE >> PAGE_SHIFT);
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 050fdc49b5ad..1a9f1091bd5c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -778,7 +778,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 				pud_t *pudp, pud_t pud)
 {
-	page_table_check_pud_set(mm, pudp, pud);
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	return __set_pte_at(mm, (pte_t *)pudp, pud_pte(pud));
 }
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 593f10aabd45..e53674bb3814 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1287,7 +1287,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 			      pud_t *pudp, pud_t pud)
 {
-	page_table_check_pud_set(mm, pudp, pud);
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	native_set_pud(pudp, pud);
 }
 
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 6722941c7cb8..d188428512f5 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -20,7 +20,8 @@ void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
 void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
 		unsigned int nr);
 void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd);
-void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud);
+void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
+				pud_t *pudp, pud_t pud);
 void __page_table_check_pte_clear_range(struct mm_struct *mm,
 					unsigned long addr,
 					pmd_t pmd);
@@ -83,13 +84,14 @@ static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
 	__page_table_check_pmd_set(mm, pmdp, pmd);
 }
 
-static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
+static inline void page_table_check_pud_set(struct mm_struct *mm,
+					    unsigned long addr, pud_t *pudp,
 					    pud_t pud)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_pud_set(mm, pudp, pud);
+	__page_table_check_pud_set(mm, addr, pudp, pud);
 }
 
 static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
@@ -134,7 +136,8 @@ static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
 {
 }
 
-static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
+static inline void page_table_check_pud_set(struct mm_struct *mm,
+					    unsigned long addr, pud_t *pudp,
 					    pud_t pud)
 {
 }
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 509c6ef8de40..f14fef81c61d 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -249,7 +249,8 @@ void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd)
 }
 EXPORT_SYMBOL(__page_table_check_pmd_set);
 
-void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud)
+void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
+				pud_t *pudp, pud_t pud)
 {
 	if (&init_mm == mm)
 		return;
-- 
2.48.1


