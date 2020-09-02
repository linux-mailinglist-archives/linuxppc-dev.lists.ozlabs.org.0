Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E45425AA80
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 13:47:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhMcB1fZhzDqF1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 21:47:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fQTHAORU; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhMWF1KDkzDqqY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 21:42:48 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 082BWEau123237; Wed, 2 Sep 2020 07:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fnHs+ObetPyH/R67d3Le4srwaclpFjagskg9RFe+pUA=;
 b=fQTHAORUxrknejI4cUpsR8huoOw/C4oGHnYYzJo6S++HGkZLHHE3l5bMDxyp0HDsP6Ho
 2V5d0Re5Er90k48k6DNl6Oid7N9wqcaxc+PqvKykxJEA7pk9P+XOIci+FZ3AMKPQnFfl
 Wpe9up3QGqgtGSAKTABcWmacxH3Hrs+HOZrHPVsolM88kLirHVj5/krZQ4bq0NGvMggJ
 DGPRFdqOTAb4GIG/k5O/80XSvXRikkzW4w/bMXSQ3TJ5RchKwZhVpGsKkCuxlr8CR5rN
 66YpYuJ53IPdCwmLjSX2mGwDiLhs3ucO62cc8xg39UqAb5GlnO0osz4iNvCXSw6JgYkG 2Q== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33aa5fs3ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 07:42:40 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 082BbKd7013654;
 Wed, 2 Sep 2020 11:42:39 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 337en97fhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 11:42:39 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 082BgdrI55771462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 11:42:39 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5E53B205F;
 Wed,  2 Sep 2020 11:42:38 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFD92B2066;
 Wed,  2 Sep 2020 11:42:36 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.61.124])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 11:42:36 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v4 02/13] powerpc/mm: Move setting pte specific flags to
 pfn_pte
Date: Wed,  2 Sep 2020 17:12:11 +0530
Message-Id: <20200902114222.181353-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_03:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=622
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009020105
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc used to set the pte specific flags in set_pte_at(). This is
different from other architectures. To be consistent with other
architecture update pfn_pte to set _PAGE_PTE on ppc64. Also, drop now
unused pte_mkpte.

We add a VM_WARN_ON() to catch the usage of calling set_pte_at()
without setting _PAGE_PTE bit. We will remove that after a few releases.

With respect to huge pmd entries, pmd_mkhuge() takes care of adding the
_PAGE_PTE bit.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 15 +++++++++------
 arch/powerpc/include/asm/nohash/pgtable.h    |  5 -----
 arch/powerpc/mm/pgtable.c                    |  5 -----
 3 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 079211968987..2382fd516f6b 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -619,7 +619,7 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t pgprot)
 	VM_BUG_ON(pfn >> (64 - PAGE_SHIFT));
 	VM_BUG_ON((pfn << PAGE_SHIFT) & ~PTE_RPN_MASK);
 
-	return __pte(((pte_basic_t)pfn << PAGE_SHIFT) | pgprot_val(pgprot));
+	return __pte(((pte_basic_t)pfn << PAGE_SHIFT) | pgprot_val(pgprot) | _PAGE_PTE);
 }
 
 static inline unsigned long pte_pfn(pte_t pte)
@@ -655,11 +655,6 @@ static inline pte_t pte_mkexec(pte_t pte)
 	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_EXEC));
 }
 
-static inline pte_t pte_mkpte(pte_t pte)
-{
-	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_PTE));
-}
-
 static inline pte_t pte_mkwrite(pte_t pte)
 {
 	/*
@@ -823,6 +818,14 @@ static inline int pte_none(pte_t pte)
 static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, pte_t pte, int percpu)
 {
+
+	VM_WARN_ON(!(pte_raw(pte) & cpu_to_be64(_PAGE_PTE)));
+	/*
+	 * Keep the _PAGE_PTE added till we are sure we handle _PAGE_PTE
+	 * in all the callers.
+	 */
+	 pte = __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_PTE));
+
 	if (radix_enabled())
 		return radix__set_pte_at(mm, addr, ptep, pte, percpu);
 	return hash__set_pte_at(mm, addr, ptep, pte, percpu);
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 4b7c3472eab1..6277e7596ae5 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -140,11 +140,6 @@ static inline pte_t pte_mkold(pte_t pte)
 	return __pte(pte_val(pte) & ~_PAGE_ACCESSED);
 }
 
-static inline pte_t pte_mkpte(pte_t pte)
-{
-	return pte;
-}
-
 static inline pte_t pte_mkspecial(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_SPECIAL);
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 9c0547d77af3..ab57b07ef39a 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -184,9 +184,6 @@ void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 	 */
 	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
 
-	/* Add the pte bit when trying to set a pte */
-	pte = pte_mkpte(pte);
-
 	/* Note: mm->context.id might not yet have been assigned as
 	 * this context might not have been activated yet when this
 	 * is called.
@@ -275,8 +272,6 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_
 	 */
 	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
 
-	pte = pte_mkpte(pte);
-
 	pte = set_pte_filter(pte);
 
 	val = pte_val(pte);
-- 
2.26.2

