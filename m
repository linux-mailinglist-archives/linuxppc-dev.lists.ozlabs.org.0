Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A53518AB8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 05:05:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jYGg2hXLzDr6v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 15:05:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jY4T5mPMzDr6V
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 14:56:41 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J3eocc110307; Wed, 18 Mar 2020 23:56:33 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yuxx12rpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 23:56:33 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02J3fLR8110886;
 Wed, 18 Mar 2020 23:56:32 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yuxx12rpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 23:56:32 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02J3n2J9031043;
 Thu, 19 Mar 2020 03:56:31 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 2yrpw6wns2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 03:56:30 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02J3uU2Q48824670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 03:56:30 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20FBF11206D;
 Thu, 19 Mar 2020 03:56:30 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7F1511206B;
 Thu, 19 Mar 2020 03:56:26 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.34.213])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 03:56:26 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: [PATCH v2 03/22] powerpc/mm/hash64: use _PAGE_PTE when checking for
 pte_present
Date: Thu, 19 Mar 2020 09:25:50 +0530
Message-Id: <20200319035609.158654-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200319035609.158654-1-aneesh.kumar@linux.ibm.com>
References: <20200319035609.158654-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_10:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003190015
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
Cc: leonardo@linux.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 npiggin@gmail.com, kirill@shutemov.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This makes the pte_present check stricter by checking for additional _PAGE_PTE
bit. A level 1 pte pointer (THP pte) can be switched to a pointer to level 0 pte
page table page by following two operations.

1) THP split.
2) madvise(MADV_DONTNEED) in parallel to page fault.

A lockless page table walk need to make sure we can handle such changes
gracefully.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 15 ++++++++++-----
 arch/powerpc/mm/book3s64/hash_utils.c        | 11 +++++++++--
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 201a69e6a355..89eb7b350df8 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -553,6 +553,12 @@ static inline pte_t pte_clear_savedwrite(pte_t pte)
 }
 #endif /* CONFIG_NUMA_BALANCING */
 
+static inline bool pte_hw_valid(pte_t pte)
+{
+	return (pte_raw(pte) & cpu_to_be64(_PAGE_PRESENT | _PAGE_PTE)) ==
+		cpu_to_be64(_PAGE_PRESENT | _PAGE_PTE);
+}
+
 static inline int pte_present(pte_t pte)
 {
 	/*
@@ -561,12 +567,11 @@ static inline int pte_present(pte_t pte)
 	 * invalid during ptep_set_access_flags. Hence we look for _PAGE_INVALID
 	 * if we find _PAGE_PRESENT cleared.
 	 */
-	return !!(pte_raw(pte) & cpu_to_be64(_PAGE_PRESENT | _PAGE_INVALID));
-}
 
-static inline bool pte_hw_valid(pte_t pte)
-{
-	return !!(pte_raw(pte) & cpu_to_be64(_PAGE_PRESENT));
+	if (pte_hw_valid(pte))
+		return true;
+	return (pte_raw(pte) & cpu_to_be64(_PAGE_INVALID | _PAGE_PTE)) ==
+		cpu_to_be64(_PAGE_INVALID | _PAGE_PTE);
 }
 
 #ifdef CONFIG_PPC_MEM_KEYS
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 8530ddbba56f..e2a7873c7760 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1349,8 +1349,15 @@ int hash_page_mm(struct mm_struct *mm, unsigned long ea,
 		goto bail;
 	}
 
-	/* Add _PAGE_PRESENT to the required access perm */
-	access |= _PAGE_PRESENT;
+	/*
+	 * Add _PAGE_PRESENT to the required access perm. If there are parallel
+	 * updates to the pte that can possibly clear _PAGE_PTE, catch that too.
+	 *
+	 * We can safely use the return pte address in rest of the function
+	 * because we do set H_PAGE_BUSY which prevents further updates to pte
+	 * from generic code.
+	 */
+	access |= _PAGE_PRESENT | _PAGE_PTE;
 
 	/*
 	 * Pre-check access permissions (will be re-checked atomically
-- 
2.24.1

