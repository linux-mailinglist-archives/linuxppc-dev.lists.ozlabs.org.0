Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31150697416
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 03:06:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGhJ973q8z3cMS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:06:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a2D0BHLn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a2D0BHLn;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGhG94bm5z3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 13:04:17 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31F0m9gl017109;
	Wed, 15 Feb 2023 02:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LXsu+HwsuZd1e/Ea1eex2PNu7KEdFywmjv7vuyX/Fww=;
 b=a2D0BHLnjyt8xGBkCeJbex/eCeE0My1lDnImxlTfTUvZYX8JU3Qm/tmX1TuszGd9r47S
 zF6xuqesk/H0C8NCcCLAsz47SdpOWa1oEh7hDP9PR1K1GrJuP9QSkpGAPnDctsaN53Dn
 eEqH7Eg750ZTvXzHfvt3OEE55oEQ9v5HlgvXQJfHwcK9FY2EqmIvxB+LB5IWjzWkzbcF
 epZA9mZuBXDttIGDVsmWxQbp8Hqvzi0OLesc8vYGW+AebLn7LsaWyu+wTF3oJWAfyI1e
 AtQlGbwB4faA26QkZHgO+FnlS5bT8FZ+EBnaCZiDaKU6URinJebuuqVsRmm//8Zx0oGq Wg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrn5uhksu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 02:04:09 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31E6RKqE007386;
	Wed, 15 Feb 2023 02:04:07 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3np29fbhby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 02:04:07 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31F244DQ46268766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Feb 2023 02:04:05 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4A3B2004B;
	Wed, 15 Feb 2023 02:04:04 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAFBE2004D;
	Wed, 15 Feb 2023 02:04:03 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Feb 2023 02:04:03 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 910456032C;
	Wed, 15 Feb 2023 13:04:01 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 1/7] powerpc: mm: Separate set_pte, set_pte_at for internal, external use
Date: Wed, 15 Feb 2023 13:01:49 +1100
Message-Id: <20230215020155.1969194-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230215020155.1969194-1-rmclure@linux.ibm.com>
References: <20230215020155.1969194-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: d6vivM0DrKX6xYmZ3felZdlYZJByn5BZ
X-Proofpoint-GUID: d6vivM0DrKX6xYmZ3felZdlYZJByn5BZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_17,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=593 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302150017
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Produce separate symbols for set_pte, which is to be used in
arch/powerpc for reassignment of pte's, and set_pte_at, used in generic
code.

The reason for this distinction is to support the Page Table Check
sanitiser. Having this distinction allows for set_pte_at to
instrumented, but set_pte not to be, permitting for uninstrumented
internal mappings. This distinction in names is also present in x86.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v6: new patch
v7: Remove extern, move set_pte args to be in a single line.
---
 arch/powerpc/include/asm/book3s/pgtable.h | 3 +--
 arch/powerpc/include/asm/nohash/pgtable.h | 3 +--
 arch/powerpc/include/asm/pgtable.h        | 1 +
 arch/powerpc/mm/pgtable.c                 | 3 +--
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/pgtable.h b/arch/powerpc/include/asm/book3s/pgtable.h
index d18b748ea3ae..1386ed705e66 100644
--- a/arch/powerpc/include/asm/book3s/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/pgtable.h
@@ -12,8 +12,7 @@
 /* Insert a PTE, top-level function is out of line. It uses an inline
  * low level function in the respective pgtable-* files
  */
-extern void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
-		       pte_t pte);
+void set_pte(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte);
 
 
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 69c3a050a3d8..f36dd2e2d591 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -154,8 +154,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 /* Insert a PTE, top-level function is out of line. It uses an inline
  * low level function in the respective pgtable-* files
  */
-extern void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
-		       pte_t pte);
+void set_pte(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte);
 
 /* This low level function performs the actual PTE insertion
  * Setting the PTE depends on the MMU type and other factors. It's
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 9972626ddaf6..17d30359d1f4 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -48,6 +48,7 @@ struct mm_struct;
 /* Keep these as a macros to avoid include dependency mess */
 #define pte_page(x)		pfn_to_page(pte_pfn(x))
 #define mk_pte(page, pgprot)	pfn_pte(page_to_pfn(page), (pgprot))
+#define set_pte_at  		set_pte
 /*
  * Select all bits except the pfn
  */
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index cb2dcdb18f8e..d7cce317cef8 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -187,8 +187,7 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
 /*
  * set_pte stores a linux PTE into the linux page table.
  */
-void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
-		pte_t pte)
+void set_pte(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte)
 {
 	/*
 	 * Make sure hardware valid bit is not set. We don't do
-- 
2.37.2

