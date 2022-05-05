Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3659F51CD30
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 01:59:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvW0B0SJVz3cHF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 09:59:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HbSx5c4T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HbSx5c4T; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVz44QKsz2xC3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:58:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795136; x=1683331136;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=gFAa9l6D17AE+FwqBH16mNyyvqzE44nr84f76LNdCPk=;
 b=HbSx5c4TngVgHk+Qq33tuTfTueFQQmiS+khU7jlC/VGKfE/bzavYPwOk
 1EjBCBAU8L7Ho9I7zCa3JDqVL8KpG2qa71003ZIsQwSyM6wbNKk/QHjtX
 pFnNe3CUSVugsLSMGZideQFTf5ADYIgAhitCM68feS1GbywJF6PBWKYax
 HX0rq4OE93DPLEegmcIDi4g3unufi/mj3gOKVAt27xWXC4DRkoyFIeoEu
 CKTPh9KTOmssoOJQpj/649ha58ojh5mf+hsBNdXMvKECHHooosn7DgNoM
 MTrrU3WZTELzeLJDKT2f/lCHN/QytlD7XVgGjUaofvvdR7C1KejiwfjYE g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437281"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437281"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914319"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:44 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 01/29] irq/matrix: Expose functions to allocate the best
 CPU for new vectors
Date: Thu,  5 May 2022 16:59:40 -0700
Message-Id: <20220506000008.30892-2-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, Ricardo Neri <ricardo.neri@intel.com>,
 Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Certain types of interrupts, such as NMI, do not have an associated vector.
They, however, target specific CPUs. Thus, when assigning the destination
CPU, it is beneficial to select the one with the lowest number of vectors.
Prepend the functions matrix_find_best_cpu_managed() and
matrix_find_best_cpu_managed() with the irq_ prefix and expose them for
IRQ controllers to use when allocating and activating vector-less IRQs.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v5:
 * Introduced this patch.

Changes since v4:
 * N/A

Changes since v3:
 * N/A

Changes since v2:
 * N/A

Changes since v1:
 * N/A
---
 include/linux/irq.h |  4 ++++
 kernel/irq/matrix.c | 32 +++++++++++++++++++++++---------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index f92788ccdba2..9e674e73d295 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1223,6 +1223,10 @@ struct irq_matrix *irq_alloc_matrix(unsigned int matrix_bits,
 void irq_matrix_online(struct irq_matrix *m);
 void irq_matrix_offline(struct irq_matrix *m);
 void irq_matrix_assign_system(struct irq_matrix *m, unsigned int bit, bool replace);
+unsigned int irq_matrix_find_best_cpu(struct irq_matrix *m,
+				      const struct cpumask *msk);
+unsigned int irq_matrix_find_best_cpu_managed(struct irq_matrix *m,
+					      const struct cpumask *msk);
 int irq_matrix_reserve_managed(struct irq_matrix *m, const struct cpumask *msk);
 void irq_matrix_remove_managed(struct irq_matrix *m, const struct cpumask *msk);
 int irq_matrix_alloc_managed(struct irq_matrix *m, const struct cpumask *msk,
diff --git a/kernel/irq/matrix.c b/kernel/irq/matrix.c
index 1698e77645ac..810479f608f4 100644
--- a/kernel/irq/matrix.c
+++ b/kernel/irq/matrix.c
@@ -125,9 +125,16 @@ static unsigned int matrix_alloc_area(struct irq_matrix *m, struct cpumap *cm,
 	return area;
 }
 
-/* Find the best CPU which has the lowest vector allocation count */
-static unsigned int matrix_find_best_cpu(struct irq_matrix *m,
-					const struct cpumask *msk)
+/**
+ * irq_matrix_find_best_cpu() - Find the best CPU for an IRQ
+ * @m:		Matrix pointer
+ * @msk:	On which CPUs the search will be performed
+ *
+ * Find the best CPU which has the lowest vector allocation count
+ * Returns: The best CPU to use
+ */
+unsigned int irq_matrix_find_best_cpu(struct irq_matrix *m,
+				      const struct cpumask *msk)
 {
 	unsigned int cpu, best_cpu, maxavl = 0;
 	struct cpumap *cm;
@@ -146,9 +153,16 @@ static unsigned int matrix_find_best_cpu(struct irq_matrix *m,
 	return best_cpu;
 }
 
-/* Find the best CPU which has the lowest number of managed IRQs allocated */
-static unsigned int matrix_find_best_cpu_managed(struct irq_matrix *m,
-						const struct cpumask *msk)
+/**
+ * irq_matrix_find_best_cpu_managed() - Find the best CPU for a managed IRQ
+ * @m:		Matrix pointer
+ * @msk:	On which CPUs the search will be performed
+ *
+ * Find the best CPU which has the lowest number of managed IRQs allocated
+ * Returns: The best CPU to use
+ */
+unsigned int irq_matrix_find_best_cpu_managed(struct irq_matrix *m,
+					      const struct cpumask *msk)
 {
 	unsigned int cpu, best_cpu, allocated = UINT_MAX;
 	struct cpumap *cm;
@@ -292,7 +306,7 @@ int irq_matrix_alloc_managed(struct irq_matrix *m, const struct cpumask *msk,
 	if (cpumask_empty(msk))
 		return -EINVAL;
 
-	cpu = matrix_find_best_cpu_managed(m, msk);
+	cpu = irq_matrix_find_best_cpu_managed(m, msk);
 	if (cpu == UINT_MAX)
 		return -ENOSPC;
 
@@ -381,13 +395,13 @@ int irq_matrix_alloc(struct irq_matrix *m, const struct cpumask *msk,
 	struct cpumap *cm;
 
 	/*
-	 * Not required in theory, but matrix_find_best_cpu() uses
+	 * Not required in theory, but irq_matrix_find_best_cpu() uses
 	 * for_each_cpu() which ignores the cpumask on UP .
 	 */
 	if (cpumask_empty(msk))
 		return -EINVAL;
 
-	cpu = matrix_find_best_cpu(m, msk);
+	cpu = irq_matrix_find_best_cpu(m, msk);
 	if (cpu == UINT_MAX)
 		return -ENOSPC;
 
-- 
2.17.1

