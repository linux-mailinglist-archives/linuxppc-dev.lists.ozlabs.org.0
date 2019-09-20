Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B51B9825
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 21:55:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZkwQ4Z2hzDr40
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 05:55:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zkqx33YWzF10g
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 05:51:41 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8KJm141039068; Fri, 20 Sep 2019 15:51:22 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v50uetuk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 15:51:22 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8KJnH6A042230;
 Fri, 20 Sep 2019 15:51:22 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v50uetujg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 15:51:21 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8KJoHqe015546;
 Fri, 20 Sep 2019 19:51:20 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 2v3vbu8p2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 19:51:20 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8KJpJPZ54788488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Sep 2019 19:51:19 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EE4278060;
 Fri, 20 Sep 2019 19:51:19 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 931697805E;
 Fri, 20 Sep 2019 19:51:14 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.18.235.184])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 20 Sep 2019 19:51:14 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/11] powerpc/mm: Adds counting method to monitor lockless
 pgtable walks
Date: Fri, 20 Sep 2019 16:50:37 -0300
Message-Id: <20190920195047.7703-2-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190920195047.7703-1-leonardo@linux.ibm.com>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909200161
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
Cc: Keith Busch <keith.busch@intel.com>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's necessary to monitor lockless pagetable walks, in order to avoid doing
THP splitting/collapsing during them.

Some methods rely on local_irq_{save,restore}, but that can be slow on
cases with a lot of cpus are used for the process.

In order to speedup some cases, I propose a refcount-based approach, that
counts the number of lockless pagetable	walks happening on the process.

This method does not exclude the current irq-oriented method. It works as a
complement to skip unnecessary waiting.

start_lockless_pgtbl_walk(mm)
	Insert before starting any lockless pgtable walk
end_lockless_pgtbl_walk(mm)
	Insert after the end of any lockless pgtable walk
	(Mostly after the ptep is last used)
running_lockless_pgtbl_walk(mm)
	Returns the number of lockless pgtable walks running

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h |  3 +++
 arch/powerpc/mm/book3s64/mmu_context.c   |  1 +
 arch/powerpc/mm/book3s64/pgtable.c       | 17 +++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 23b83d3593e2..13b006e7dde4 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -116,6 +116,9 @@ typedef struct {
 	/* Number of users of the external (Nest) MMU */
 	atomic_t copros;
 
+	/* Number of running instances of lockless pagetable walk*/
+	atomic_t lockless_pgtbl_walk_count;
+
 	struct hash_mm_context *hash_context;
 
 	unsigned long vdso_base;
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index 2d0cb5ba9a47..3dd01c0ca5be 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -200,6 +200,7 @@ int init_new_context(struct task_struct *tsk, struct mm_struct *mm)
 #endif
 	atomic_set(&mm->context.active_cpus, 0);
 	atomic_set(&mm->context.copros, 0);
+	atomic_set(&mm->context.lockless_pgtbl_walk_count, 0);
 
 	return 0;
 }
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 7d0e0d0d22c4..13239b17a22c 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -98,6 +98,23 @@ void serialize_against_pte_lookup(struct mm_struct *mm)
 	smp_call_function_many(mm_cpumask(mm), do_nothing, NULL, 1);
 }
 
+void start_lockless_pgtbl_walk(struct mm_struct *mm)
+{
+	atomic_inc(&mm->context.lockless_pgtbl_walk_count);
+}
+EXPORT_SYMBOL(start_lockless_pgtbl_walk);
+
+void end_lockless_pgtbl_walk(struct mm_struct *mm)
+{
+	atomic_dec(&mm->context.lockless_pgtbl_walk_count);
+}
+EXPORT_SYMBOL(end_lockless_pgtbl_walk);
+
+int running_lockless_pgtbl_walk(struct mm_struct *mm)
+{
+	return atomic_read(&mm->context.lockless_pgtbl_walk_count);
+}
+
 /*
  * We use this to invalidate a pmdp entry before switching from a
  * hugepte to regular pmd entry.
-- 
2.20.1

