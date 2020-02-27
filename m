Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 600E917114B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 08:13:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SkRc4N4FzDqjg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:13:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Sk4S6l9ZzDqXG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:57:12 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01R6t8As069383; Thu, 27 Feb 2020 01:57:07 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydxensq5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:57:07 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01R6tYah070195;
 Thu, 27 Feb 2020 01:57:07 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydxensq50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:57:06 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01R6ukZ6006461;
 Thu, 27 Feb 2020 06:57:05 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 2ydcmku8p8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 06:57:05 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01R6v5lP12518122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 06:57:05 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6588F28059;
 Thu, 27 Feb 2020 06:57:05 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27A3F2805A;
 Thu, 27 Feb 2020 06:57:03 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.204.201.20])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 06:57:02 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au,
 kirill@shutemov.name
Subject: [RFC PATCH 08/21] powerpc/perf/callchain: Use __get_user_pages_fast
 in read_user_stack_slow
Date: Thu, 27 Feb 2020 12:26:07 +0530
Message-Id: <20200227065620.50804-9-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227065620.50804-1-aneesh.kumar@linux.ibm.com>
References: <20200227065620.50804-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_01:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002270054
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

read_user_stack_slow is called with interrupts soft disabled and it copies contents
from the page which we find mapped to a specific address. To convert
userspace address to pfn, the kernel now uses lockless page table walk.

The kernel needs to make sure the pfn value read remains stable and is not released
and reused for another process while the contents are read from the page. This
can only be achieved by holding a page reference.

One of the first approaches I tried was to check the pte value after the kernel
copies the contents from the page. But as shown below we can still get it wrong

CPU0                           CPU1
pte = READ_ONCE(*ptep);
                               pte_clear(pte);
                               put_page(page);
                               page = alloc_page();
                               memcpy(page_address(page), "secret password", nr);
memcpy(buf, kaddr + offset, nb);
                               put_page(page);
                               handle_mm_fault()
                               page = alloc_page();
                               set_pte(pte, page);
if (pte_val(pte) != pte_val(*ptep))

Hence switch to __get_user_pages_fast.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/perf/callchain.c | 53 ++++++++++++++---------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index cbc251981209..7b7b3ff53180 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -107,46 +107,35 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
  * On 64-bit we don't want to invoke hash_page on user addresses from
  * interrupt context, so if the access faults, we read the page tables
  * to find which page (if any) is mapped and access it directly.
+
+ * This should get called only if the PMU interrupt occurred while
+ * interrupts are soft-disabled, and there is no MMU hash table entry
+ * for the page . In this case we will get an -EFAULT return from
+ * __get_user_inatomic even if there is a valid Linux PTE for the page,
+ * since hash_page isn't reentrant.  Thus we have code here to read the
+ * Linux PTE and access the page via the kernel linear mapping.
  */
 static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
 {
-	int ret = -EFAULT;
-	pgd_t *pgdir;
-	pte_t *ptep, pte;
-	unsigned shift;
+
 	unsigned long addr = (unsigned long) ptr;
 	unsigned long offset;
-	unsigned long pfn, flags;
+	struct page *page;
+	int nrpages;
 	void *kaddr;
 
-	pgdir = current->mm->pgd;
-	if (!pgdir)
-		return -EFAULT;
+	nrpages = __get_user_pages_fast(addr, 1, 1, &page);
+	if (nrpages == 1) {
+		kaddr = page_address(page);
 
-	local_irq_save(flags);
-	ptep = find_current_mm_pte(pgdir, addr, NULL, &shift);
-	if (!ptep)
-		goto err_out;
-	if (!shift)
-		shift = PAGE_SHIFT;
-
-	/* align address to page boundary */
-	offset = addr & ((1UL << shift) - 1);
-
-	pte = READ_ONCE(*ptep);
-	if (!pte_present(pte) || !pte_user(pte))
-		goto err_out;
-	pfn = pte_pfn(pte);
-	if (!page_is_ram(pfn))
-		goto err_out;
-
-	/* no highmem to worry about here */
-	kaddr = pfn_to_kaddr(pfn);
-	memcpy(buf, kaddr + offset, nb);
-	ret = 0;
-err_out:
-	local_irq_restore(flags);
-	return ret;
+		/* align address to page boundary */
+		offset = addr & ~PAGE_MASK;
+
+		memcpy(buf, kaddr + offset, nb);
+		put_page(page);
+		return 0;
+	}
+	return -EFAULT;
 }
 
 static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
-- 
2.24.1

