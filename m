Return-Path: <linuxppc-dev+bounces-9699-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6501DAE7746
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 08:40:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRscx5zY1z309v;
	Wed, 25 Jun 2025 16:40:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750833601;
	cv=none; b=m6rAsXmXT1Y+hesIKa4+UADvI3bXSHbxvTdGA9ddeitIRbQ2fahSHYyM6PuAG2/8DY7HDt94mRZnOsE8d8hfIjita1YHHW9nyrumkCb8K5/e+Irqd2qP0bO2/oxf1dRfV9ptgCzYppFDTP/5/Fdj8ZZdTY9WPDl0pBUxmMi1k3vDYkhqX8AVaIURG+BEwiuj7+Xrx+sHGCJM7bwIlPo+CZjje2J8wC7S8/iKGS6kRpy8XsAo/6qAG+YqxLHfl9kUZCpDlxK8zsp5XA0WwxJWHPtt7GLhU9G5PPcuYd2i/4/OrwYOL+bNlgxke/yPjOou68hqS91yNlm4KNj/mBiqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750833601; c=relaxed/relaxed;
	bh=y0uGGjTwvQMXqwA8bHmeHWGWvFDAhSVWPCqT+UWRp/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AWJCqHaESLFfuqrDUqR4EVJ8Y4EH3e8PXD0fz4XY0nhAROqJoFFy8dDbqZUfyJLvubZrgkYpNoXvHvnX7tLBZGq6d6dwFHvQPMkI5U38lA1b4CN4O/d67YMiIc4kgNXb8Sn1NWeUKxoHqQzY613lxVw2CKrqCqwy1QDfz8tIdfRL9wxd4KkNVHSPlLpAzOB1mpSXj2FI6MjoT0uiz6jQDJm6gQ0NS3hObg7x0A3AZC71FDLYIx4C5I/LpuaRiycKxk4wXwobftnR4KG3Nyu5jHTTWcnm/4i6RPYH+OmAVv9oQWouXHLeNig3yHtpfBdiAK+17ryCAkJ1meuUyQyXqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZVTsY4iu; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZVTsY4iu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRscx07txz308P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 16:40:00 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P6KIFC027197;
	Wed, 25 Jun 2025 06:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=y0uGGjTwvQMXqwA8b
	HmeHWGWvFDAhSVWPCqT+UWRp/M=; b=ZVTsY4iuseNAEkMz5aUAtf20YjK87OvHJ
	pgiY16o8tHB6B3VQm34YNet81excWdAZN0ARDY9xDvouCYKksesrqL995PempcPG
	vMZCS2AFNTNt26GaHOxjsWsd4Jfu0bsZftDu5NR4FsuDeTareXKit3lSU7Hl9QsL
	eiRZEjHwBn8IvJXAPOxGiUYg6DYAPeW3YMnpwTJLx0213bzh44e53EpHrdLz0X5J
	zZq5oGQQ3nr4VO6znGbhwWYqOWM9dPaB62lEsSGkKH/M6hfJ+f9mhunL3YTDD0aB
	L7xO0S71Cq91L++yG2hhM2Ko7Z2Pp2ZMtwBD7B0qSoZPZID7d5VWw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5twg89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 06:39:49 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P65rBf006329;
	Wed, 25 Jun 2025 06:39:48 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e82p8012-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 06:39:48 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55P6dlxV47251908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 06:39:47 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A9A058932;
	Wed, 25 Jun 2025 06:39:40 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F152558913;
	Wed, 25 Jun 2025 06:39:24 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.18.35])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 06:39:24 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, pasha.tatashin@soleen.com,
        akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu, mingo@kernel.org
Subject: [PATCH v15 11/13] powerpc: mm: Implement *_user_accessible_page() for ptes
Date: Wed, 25 Jun 2025 16:37:51 +1000
Message-ID: <20250625063753.77511-12-ajd@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: o8pwN8EwYal227quZlaJ3Sf4w3pndpWK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA0NSBTYWx0ZWRfX/r2U2Vc/ajCp bxsk6+xpiyEKaboTL+EmY/t/cFJaZuaZichgUtjlkdAvasA29qP2hCPbFcI1lbO577y3aQem6KE 71z4G3FuhONrOr5KROK5VkunB2NBAYb5WBzFTfnTbJ2uUcwNpgAsFWz++yrgbPc4eSfantOty6e
 hTXJcsG2W4MBNRzZuGXgYWgiLit9rIPiuPccmbSQ/7Ppwb/7bPqvj9gXNyit86BC7NZLK/39yGW y1YO2Hky4EwTzlhpnMeMj6eISDXZdZZu1z+l3jKiMbu/cr0m8UrOQ2vQ8+I/+C2bev6ppY6EILf HlJ8LYFyUh0nkS3mXBAecPKECm3FPacnmng+Q/j52GBoYS3AK8DdkMMevf/0TKjw1D0TLNf0WA3
 JFp/KHCimzIj1NX/oSzyY9gfxMfUUJAU5wbgcEBFp84EeJbtrhGdEaC25cegM3OTd5Mutnpl
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=685b99b5 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=a65a1E2n8xkc5m_RgcEA:9 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-GUID: o8pwN8EwYal227quZlaJ3Sf4w3pndpWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=673 impostorscore=0
 clxscore=1011 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250045
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

Page table checking depends on architectures providing an
implementation of p{te,md,ud}_user_accessible_page. With
refactorisations made on powerpc/mm, the pte_access_permitted() and
similar methods verify whether a userland page is accessible with the
required permissions.

Since page table checking is the only user of
p{te,md,ud}_user_accessible_page(), implement these for all platforms,
using some of the same preliminary checks taken by pte_access_permitted()
on that platform.

Since commit 8e9bd41e4ce1 ("powerpc/nohash: Replace pte_user() by pte_read()")
pte_user() is no longer required to be present on all platforms as it
may be equivalent to or implied by pte_read(). Hence implementations of
pte_user_accessible_page() are specialised.

[ajd@linux.ibm.com: rebase and fix commit message]
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h |  5 +++++
 arch/powerpc/include/asm/book3s/64/pgtable.h | 17 +++++++++++++++++
 arch/powerpc/include/asm/nohash/pgtable.h    |  5 +++++
 arch/powerpc/include/asm/pgtable.h           |  8 ++++++++
 4 files changed, 35 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 92d21c6faf1e..b225967f85ea 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -437,6 +437,11 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 	return true;
 }
 
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
+{
+	return pte_present(pte) && !is_kernel_addr(addr);
+}
+
 /* Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
  *
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index a2ddcbb3fcb9..5de04302c6f4 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -540,6 +540,11 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 	return arch_pte_access_permitted(pte_val(pte), write, 0);
 }
 
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
+{
+	return pte_present(pte) && pte_user(pte);
+}
+
 /*
  * Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
@@ -1430,5 +1435,17 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
 	return false;
 }
 
+#define pmd_user_accessible_page pmd_user_accessible_page
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
+{
+	return pmd_leaf(pmd) && pte_user_accessible_page(pmd_pte(pmd), addr);
+}
+
+#define pud_user_accessible_page pud_user_accessible_page
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
+{
+	return pud_leaf(pud) && pte_user_accessible_page(pud_pte(pud), addr);
+}
+
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_PGTABLE_H_ */
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 7d6b9e5b286e..a8bc4f24beb1 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -243,6 +243,11 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 	return true;
 }
 
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
+{
+	return pte_present(pte) && !is_kernel_addr(addr);
+}
+
 /* Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
  *
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 0f73a9ade0ed..d0938e9c33fb 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -223,6 +223,14 @@ static inline int pud_pfn(pud_t pud)
 }
 #endif
 
+#ifndef pmd_user_accessible_page
+#define pmd_user_accessible_page(pmd, addr)	false
+#endif
+
+#ifndef pud_user_accessible_page
+#define pud_user_accessible_page(pud, addr)	false
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
-- 
2.49.0


