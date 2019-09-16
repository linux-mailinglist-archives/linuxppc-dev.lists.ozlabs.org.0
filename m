Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F7AB428E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 22:58:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XJVF72TfzF3Z1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 06:57:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XJS91w5GzF39B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 06:56:05 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8GKlsMD078585; Mon, 16 Sep 2019 16:55:48 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v2hkb8h1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Sep 2019 16:55:48 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8GKmUgH079756;
 Mon, 16 Sep 2019 16:55:47 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v2hkb8h15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Sep 2019 16:55:47 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8GKoLAS025156;
 Mon, 16 Sep 2019 20:55:46 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 2v0t9ak6f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Sep 2019 20:55:46 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8GKtjxO48103824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Sep 2019 20:55:45 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DFA9AC05F;
 Mon, 16 Sep 2019 20:55:45 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39B3DAC059;
 Mon, 16 Sep 2019 20:55:42 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.18.235.45])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 16 Sep 2019 20:55:42 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] powerpc: mm: Check if serialize_against_pte_lookup()
 really needs to run
Date: Mon, 16 Sep 2019 17:55:27 -0300
Message-Id: <20190916205527.1859-1-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909160204
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
Cc: Christoph Lameter <cl@linux.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Jann Horn <jannh@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Paul Mackerras <paulus@samba.org>, "Tobin C. Harding" <tobin@kernel.org>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Souptick Joarder <jrdr.linux@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a process (qemu) with a lot of CPUs (128) try to munmap() a large chunk
of memory (496GB) mapped with THP, it takes an average of 275 seconds,
which can cause a lot of problems to the load (in qemu case, the guest
will lock for this time).

Trying to find the source of this bug, I found out most of this time is
spent on serialize_against_pte_lookup(). This function will take a lot of
time in smp_call_function_many() if there is more than a couple CPUs
running the user process. Since it has to happen to all THP mapped, it will
take a very long time for large amounts of memory.

By the docs, serialize_against_pte_lookup() is needed in order to avoid
pmd_t to pte_t casting inside find_current_mm_pte() to happen concurrently
with the next part of the functions it's called in.
It does so by calling a do_nothing() on each CPU in mm->cpu_bitmap[];

So, by what I could understand, if there is no find_current_mm_pte()
running, there is no need to call serialize_against_pte_lookup().

So, to avoid the cost of running serialize_against_pte_lookup(), I propose
a counter that keeps track of how many find_current_mm_pte() are currently
running, and if there is none, just skip smp_call_function_many().

On my workload (qemu), I could see munmap's time reduction from 275 seconds
to 418ms.

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>

---
I need more experienced people's help in order to understand if this is
really a valid improvement, and if mm_struct is the best place to put such
counter.

Thanks!
---
 arch/powerpc/include/asm/pte-walk.h | 3 +++
 arch/powerpc/mm/book3s64/pgtable.c  | 2 ++
 include/linux/mm_types.h            | 1 +
 3 files changed, 6 insertions(+)

diff --git a/arch/powerpc/include/asm/pte-walk.h b/arch/powerpc/include/asm/pte-walk.h
index 33fa5dd8ee6a..3b82cb3bd563 100644
--- a/arch/powerpc/include/asm/pte-walk.h
+++ b/arch/powerpc/include/asm/pte-walk.h
@@ -40,6 +40,8 @@ static inline pte_t *find_current_mm_pte(pgd_t *pgdir, unsigned long ea,
 {
 	pte_t *pte;
 
+	atomic64_inc(&current->mm->lockless_ptlookup_count);
+
 	VM_WARN(!arch_irqs_disabled(), "%s called with irq enabled\n", __func__);
 	VM_WARN(pgdir != current->mm->pgd,
 		"%s lock less page table lookup called on wrong mm\n", __func__);
@@ -53,6 +55,7 @@ static inline pte_t *find_current_mm_pte(pgd_t *pgdir, unsigned long ea,
 	if (hshift)
 		WARN_ON(*hshift);
 #endif
+	atomic64_dec(&current->mm->lockless_ptlookup_count);
 	return pte;
 }
 
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 7d0e0d0d22c4..8f6fc2f80071 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -95,6 +95,8 @@ static void do_nothing(void *unused)
 void serialize_against_pte_lookup(struct mm_struct *mm)
 {
 	smp_mb();
+	if (atomic64_read(&mm->lockless_ptlookup_count) == 0)
+		return;
 	smp_call_function_many(mm_cpumask(mm), do_nothing, NULL, 1);
 }
 
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6a7a1083b6fb..97fb2545e967 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -518,6 +518,7 @@ struct mm_struct {
 #endif
 	} __randomize_layout;
 
+	atomic64_t lockless_ptlookup_count;
 	/*
 	 * The mm_cpumask needs to be at the end of mm_struct, because it
 	 * is dynamically sized based on nr_cpu_ids.
-- 
2.20.1

