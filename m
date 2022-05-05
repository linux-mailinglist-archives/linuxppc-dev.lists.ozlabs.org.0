Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F27451CD53
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:02:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvW2z0S3wz3dtX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:02:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R9JoV6Df;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=R9JoV6Df; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVz84zMPz3bqR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795140; x=1683331140;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=D+sZP1VTaO2AD2PX2fNF30e9SIwhyViy7LM9jGqhP5M=;
 b=R9JoV6DfH537GA3LlHfpHDqB0RavRnyJpUZNiiZa56qlw02bV5eMNv1X
 5EFqAiZLw76BdJjTxxgezygxhjXaE7K7AsvS8y3kV5UEh5GV95NIQyccR
 KwJv/AaGFWkiFBuBB6FhD4OZABr9/m5jrtZuXdIYURvzLyQpUyQs8+THn
 F09f3n1SSTI/9dHPu+zzhH/9lilQP3+H6EXR6azbBiu4G1om972tzp6HH
 lgvWroLtyWc35x5VLsuY42rb8g1VTt1DE2AY1tL7+0FOFyfR7Iylk9bXJ
 NnzYQya9OqjzXwli3/1uGb7dxmuvlI+Va1loja5zKH72mUbDz1/XlIQxc Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437295"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437295"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914338"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:45 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 05/29] x86/apic/vector: Do not allocate vectors for NMIs
Date: Thu,  5 May 2022 16:59:44 -0700
Message-Id: <20220506000008.30892-6-ricardo.neri-calderon@linux.intel.com>
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

Vectors are meaningless when allocating IRQs with NMI as the delivery mode.
In such case, skip the reservation of IRQ vectors. Do it in the lowest-
level functions where the actual IRQ reservation takes place.

Since NMIs target specific CPUs, keep the functionality to find the best
CPU.

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
 arch/x86/kernel/apic/vector.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
index 838e220e8860..11f881f45cec 100644
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -245,11 +245,20 @@ assign_vector_locked(struct irq_data *irqd, const struct cpumask *dest)
 	if (apicd->move_in_progress || !hlist_unhashed(&apicd->clist))
 		return -EBUSY;
 
+	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI) {
+		cpu = irq_matrix_find_best_cpu(vector_matrix, dest);
+		apicd->cpu = cpu;
+		vector = 0;
+		goto no_vector;
+	}
+
 	vector = irq_matrix_alloc(vector_matrix, dest, resvd, &cpu);
 	trace_vector_alloc(irqd->irq, vector, resvd, vector);
 	if (vector < 0)
 		return vector;
 	apic_update_vector(irqd, vector, cpu);
+
+no_vector:
 	apic_update_irq_cfg(irqd, vector, cpu);
 
 	return 0;
@@ -321,12 +330,22 @@ assign_managed_vector(struct irq_data *irqd, const struct cpumask *dest)
 	/* set_affinity might call here for nothing */
 	if (apicd->vector && cpumask_test_cpu(apicd->cpu, vector_searchmask))
 		return 0;
+
+	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI) {
+		cpu = irq_matrix_find_best_cpu_managed(vector_matrix, dest);
+		apicd->cpu = cpu;
+		vector = 0;
+		goto no_vector;
+	}
+
 	vector = irq_matrix_alloc_managed(vector_matrix, vector_searchmask,
 					  &cpu);
 	trace_vector_alloc_managed(irqd->irq, vector, vector);
 	if (vector < 0)
 		return vector;
 	apic_update_vector(irqd, vector, cpu);
+
+no_vector:
 	apic_update_irq_cfg(irqd, vector, cpu);
 	return 0;
 }
@@ -376,6 +395,10 @@ static void x86_vector_deactivate(struct irq_domain *dom, struct irq_data *irqd)
 	if (apicd->has_reserved)
 		return;
 
+	/* NMI IRQs do not have associated vectors; nothing to do. */
+	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI)
+		return;
+
 	raw_spin_lock_irqsave(&vector_lock, flags);
 	clear_irq_vector(irqd);
 	if (apicd->can_reserve)
@@ -472,6 +495,10 @@ static void vector_free_reserved_and_managed(struct irq_data *irqd)
 	trace_vector_teardown(irqd->irq, apicd->is_managed,
 			      apicd->has_reserved);
 
+	/* NMI IRQs do not have associated vectors; nothing to do. */
+	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI)
+		return;
+
 	if (apicd->has_reserved)
 		irq_matrix_remove_reserved(vector_matrix);
 	if (apicd->is_managed)
-- 
2.17.1

