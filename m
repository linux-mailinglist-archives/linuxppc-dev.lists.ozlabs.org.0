Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6B139B46
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 22:13:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xRCc2LQczDqNR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 08:13:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xR9b2PMVzDqM0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 08:12:02 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DKwmwd107690; Mon, 13 Jan 2020 16:11:51 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvqmkjng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 16:11:51 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00DKwnvY107786;
 Mon, 13 Jan 2020 16:11:51 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvqmkjmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 16:11:51 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00DL95qS004178;
 Mon, 13 Jan 2020 21:11:49 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 2xf755de28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 21:11:49 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00DLBncG38601168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2020 21:11:49 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 474CFAC059;
 Mon, 13 Jan 2020 21:11:49 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04584AC05E;
 Mon, 13 Jan 2020 21:11:46 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.18.235.137])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jan 2020 21:11:46 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Andrew Morton <akpm@linux-foundation.org>, Qian Cai <cai@lca.pw>,
 Reza Arbab <arbab@linux.ibm.com>, Leonardo Bras <leonardo@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Russell Currey <ruscur@russell.cc>, Mike Rapoport <rppt@linux.ibm.com>
Subject: [RFC PATCH 1/1] powerpc/pgtable: Skip serialize_against_pte_lookup()
 when unmapping
Date: Mon, 13 Jan 2020 18:11:26 -0300
Message-Id: <20200113211126.39270-1-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_07:2020-01-13,
 2020-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 mlxlogscore=999
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001130169
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a process (qemu) with a lot of CPUs (128) try to munmap() a large
chunk of memory (496GB) mapped with THP, it takes an average of 275
seconds, which can cause a lot of problems to the load (in qemu case,
the guest will lock for this time).

Trying to find the source of this bug, I found out most of this time is
spent on serialize_against_pte_lookup(). This function will take a lot
of time in smp_call_function_many() if there is more than a couple CPUs
running the user process. Since it has to happen to all THP mapped, it
will take a very long time for large amounts of memory.

By the docs, serialize_against_pte_lookup() is needed in order to avoid
pmd_t to pte_t casting inside find_current_mm_pte(), or any lockless
pagetable walk, to happen concurrently with THP splitting/collapsing.

In this case, as the page is being munmapped, there is no need to call
serialize_against_pte_lookup(), given it will not be used after or
during munmap.

This patch does so by adding option to skip serializing on
radix__pmdp_huge_get_and_clear(). This option is used by the proxy
__pmdp_huge_get_and_clear(), that is called with 'unmap == true' on
an (new) arch version of pmdp_huge_get_and_clear_full(), and with
'unmap == false' on pmdp_huge_get_and_clear(), that is used on
generic code.

pmdp_huge_get_and_clear_full() is only called in zap_huge_pmd(), so
it's safe to assume it will always be called on memory that will be
unmapped.

On my workload (qemu: 128vcpus + 500GB), I could see munmap's time
reduction from 275 seconds to 39ms.

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 25 +++++++++++++++++---
 arch/powerpc/include/asm/book3s/64/radix.h   |  3 ++-
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  6 +++--
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index b01624e5c467..5e3e7c48624a 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1243,14 +1243,21 @@ extern int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 				     unsigned long address, pmd_t *pmdp);
 
 #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR
-static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
-					    unsigned long addr, pmd_t *pmdp)
+static inline pmd_t __pmdp_huge_get_and_clear(struct mm_struct *mm,
+					      unsigned long addr, pmd_t *pmdp,
+					      bool unmap)
 {
 	if (radix_enabled())
-		return radix__pmdp_huge_get_and_clear(mm, addr, pmdp);
+		return radix__pmdp_huge_get_and_clear(mm, addr, pmdp, !unmap);
 	return hash__pmdp_huge_get_and_clear(mm, addr, pmdp);
 }
 
+static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
+					    unsigned long addr, pmd_t *pmdp)
+{
+	return __pmdp_huge_get_and_clear(mm, addr, pmdp, false);
+}
+
 static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 					unsigned long address, pmd_t *pmdp)
 {
@@ -1337,6 +1344,18 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *, unsigned long, pte_t *);
 void ptep_modify_prot_commit(struct vm_area_struct *, unsigned long,
 			     pte_t *, pte_t, pte_t);
 
+#define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
+static inline pmd_t pmdp_huge_get_and_clear_full(struct mm_struct *mm,
+						 unsigned long address,
+						 pmd_t *pmdp,
+						 int full)
+{
+	/*
+	 * Called only on unmapping
+	 */
+	return __pmdp_huge_get_and_clear(mm, address, pmdp, true);
+}
+
 /*
  * Returns true for a R -> RW upgrade of pte
  */
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index d97db3ad9aae..148874aa5260 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -253,7 +253,8 @@ extern void radix__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 					pgtable_t pgtable);
 extern pgtable_t radix__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
 extern pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
-				      unsigned long addr, pmd_t *pmdp);
+					    unsigned long addr, pmd_t *pmdp,
+					    bool serialize);
 static inline int radix__has_transparent_hugepage(void)
 {
 	/* For radix 2M at PMD level means thp */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 974109bb85db..eac8409cd316 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1007,7 +1007,8 @@ pgtable_t radix__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
 }
 
 pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
-				     unsigned long addr, pmd_t *pmdp)
+				     unsigned long addr, pmd_t *pmdp,
+				     bool serialize)
 {
 	pmd_t old_pmd;
 	unsigned long old;
@@ -1024,7 +1025,8 @@ pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
 	 * different code paths. So make sure we wait for the parallel
 	 * find_current_mm_pte to finish.
 	 */
-	serialize_against_pte_lookup(mm);
+	if (serialize)
+		serialize_against_pte_lookup(mm);
 	return old_pmd;
 }
 
-- 
2.24.1

