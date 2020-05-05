Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F1D1C4F18
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 09:32:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GWdf5g1KzDq9S
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 17:32:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWK024RxzDqSl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 17:17:56 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04576uZT031117; Tue, 5 May 2020 03:17:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30sp8jgbcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:17:49 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04577QfT032261;
 Tue, 5 May 2020 03:17:48 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30sp8jgbc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:17:48 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0457FIRg017700;
 Tue, 5 May 2020 07:17:47 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 30s0g66tpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 07:17:47 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0457HkvF25821490
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 07:17:46 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1071BE053;
 Tue,  5 May 2020 07:17:46 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75C92BE05B;
 Tue,  5 May 2020 07:17:44 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.81.70])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 May 2020 07:17:44 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 03/22] powerpc/mm/hash64: use _PAGE_PTE when checking for
 pte_present
Date: Tue,  5 May 2020 12:47:10 +0530
Message-Id: <20200505071729.54912-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505071729.54912-1-aneesh.kumar@linux.ibm.com>
References: <20200505071729.54912-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_02:2020-05-04,
 2020-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005050053
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com
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
index 368b136517e0..03521a8b0292 100644
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
index e951e87a974d..525eac4ee2c2 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1350,8 +1350,15 @@ int hash_page_mm(struct mm_struct *mm, unsigned long ea,
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
2.26.2

