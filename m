Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CACAC965B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 03:43:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kG4F2xXWzDqDB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 11:43:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kFtk5TsTzDqV7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 11:35:10 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x931WaSQ155162; Wed, 2 Oct 2019 21:34:08 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vd2vm6gk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Oct 2019 21:34:07 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x931WcI2155383;
 Wed, 2 Oct 2019 21:34:07 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vd2vm6ghr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Oct 2019 21:34:07 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x931RCvj027815;
 Thu, 3 Oct 2019 01:34:05 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 2v9y58ggbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 01:34:05 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x931Y3CZ39059904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Oct 2019 01:34:04 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D380E7805C;
 Thu,  3 Oct 2019 01:34:03 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A41C7805E;
 Thu,  3 Oct 2019 01:33:51 +0000 (GMT)
Received: from LeoBras.ibmuc.com (unknown [9.85.174.224])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Oct 2019 01:33:51 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v5 01/11] asm-generic/pgtable: Adds generic functions to
 monitor lockless pgtable walks
Date: Wed,  2 Oct 2019 22:33:15 -0300
Message-Id: <20191003013325.2614-2-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191003013325.2614-1-leonardo@linux.ibm.com>
References: <20191003013325.2614-1-leonardo@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=667 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910030012
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
Cc: Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 "Dmitry V. Levin" <ldv@altlinux.org>, Keith Busch <keith.busch@intel.com>,
 Paul Mackerras <paulus@samba.org>, Christoph Lameter <cl@linux.com>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>,
 Andrea Arcangeli <aarcange@redhat.com>, Santosh Sivaraj <santosh@fossix.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Allison Randal <allison@lohutok.net>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Ralph Campbell <rcampbell@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Jesper Dangaard Brouer <brouer@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Dan Williams <dan.j.williams@intel.com>, Reza Arbab <arbab@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Roman Gushchin <guro@fb.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's necessary to monitor lockless pagetable walks, in order to avoid doing
THP splitting/collapsing during them.

Some methods rely on irq enable/disable, but that can be slow on
cases with a lot of cpus are used for the process, given all these cpus
have to run a IPI.

In order to speedup some cases, I propose a refcount-based approach,
that counts the number of lockless pagetable walks happening on the
process. If this count is zero, it skips the irq-oriented method.

Given that there are lockless pagetable walks on generic code, it's
necessary to create documented generic functions that may be enough for
most archs and but let open to arch-specific implemenations.

This method does not exclude the current irq-oriented method. It works as a
complement to skip unnecessary waiting.

begin_lockless_pgtbl_walk(mm)
        Insert before starting any lockless pgtable walk
end_lockless_pgtbl_walk(mm)
        Insert after the end of any lockless pgtable walk
        (Mostly after the ptep is last used)
running_lockless_pgtbl_walk(mm)
        Returns the number of lockless pgtable walks running

While there is no config option, the method is disabled and these functions
are only doing what was already needed to lockless pagetable walks
(disabling interrupt). A memory barrier was also added just to make sure
there is no speculative read outside the interrupt disabled area.

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
---
 include/asm-generic/pgtable.h | 58 +++++++++++++++++++++++++++++++++++
 include/linux/mm_types.h      | 11 +++++++
 kernel/fork.c                 |  3 ++
 3 files changed, 72 insertions(+)

diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
index 818691846c90..3043ea9812d5 100644
--- a/include/asm-generic/pgtable.h
+++ b/include/asm-generic/pgtable.h
@@ -1171,6 +1171,64 @@ static inline bool arch_has_pfn_modify_check(void)
 #endif
 #endif
 
+#ifndef __HAVE_ARCH_LOCKLESS_PGTBL_WALK_CONTROL
+static inline unsigned long begin_lockless_pgtbl_walk(struct mm_struct *mm)
+{
+	unsigned long irq_mask;
+
+	if (IS_ENABLED(CONFIG_LOCKLESS_PAGE_TABLE_WALK_TRACKING))
+		atomic_inc(&mm->lockless_pgtbl_walkers);
+
+	/*
+	 * Interrupts must be disabled during the lockless page table walk.
+	 * That's because the deleting or splitting involves flushing TLBs,
+	 * which in turn issues interrupts, that will block when disabled.
+	 */
+	local_irq_save(irq_mask);
+
+	/*
+	 * This memory barrier pairs with any code that is either trying to
+	 * delete page tables, or split huge pages. Without this barrier,
+	 * the page tables could be read speculatively outside of interrupt
+	 * disabling.
+	 */
+	smp_mb();
+
+	return irq_mask;
+}
+
+static inline void end_lockless_pgtbl_walk(struct mm_struct *mm,
+					   unsigned long irq_mask)
+{
+	/*
+	 * This memory barrier pairs with any code that is either trying to
+	 * delete page tables, or split huge pages. Without this barrier,
+	 * the page tables could be read speculatively outside of interrupt
+	 * disabling.
+	 */
+	smp_mb();
+
+	/*
+	 * Interrupts must be disabled during the lockless page table walk.
+	 * That's because the deleting or splitting involves flushing TLBs,
+	 * which in turn issues interrupts, that will block when disabled.
+	 */
+	local_irq_restore(irq_mask);
+
+	if (IS_ENABLED(CONFIG_LOCKLESS_PAGE_TABLE_WALK_TRACKING))
+		atomic_dec(&mm->lockless_pgtbl_walkers);
+}
+
+static inline int running_lockless_pgtbl_walk(struct mm_struct *mm)
+{
+	if (IS_ENABLED(CONFIG_LOCKLESS_PAGE_TABLE_WALK_TRACKING))
+		return atomic_read(&mm->lockless_pgtbl_walkers);
+
+	/* If disabled, must return > 0, so it falls back to sync method */
+	return 1;
+}
+#endif
+
 /*
  * On some architectures it depends on the mm if the p4d/pud or pmd
  * layer of the page table hierarchy is folded or not.
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 2222fa795284..277462f0b4fd 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -521,6 +521,17 @@ struct mm_struct {
 		struct work_struct async_put_work;
 	} __randomize_layout;
 
+#ifdef CONFIG_LOCKLESS_PAGE_TABLE_WALK_TRACKING
+	/*
+	 * Number of callers who are doing a lockless walk of the
+	 * page tables. Typically arches might enable this in order to
+	 * help optimize performance, by possibly avoiding expensive
+	 * IPIs at the wrong times.
+	 */
+	atomic_t lockless_pgtbl_walkers;
+
+#endif
+
 	/*
 	 * The mm_cpumask needs to be at the end of mm_struct, because it
 	 * is dynamically sized based on nr_cpu_ids.
diff --git a/kernel/fork.c b/kernel/fork.c
index f9572f416126..2cbca867f5a5 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1029,6 +1029,9 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
 #endif
 	mm_init_uprobes_state(mm);
 
+#ifdef CONFIG_LOCKLESS_PAGE_TABLE_WALK_TRACKING
+	atomic_set(&mm->lockless_pgtbl_walkers, 0);
+#endif
 	if (current->mm) {
 		mm->flags = current->mm->flags & MMF_INIT_MASK;
 		mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
-- 
2.20.1

