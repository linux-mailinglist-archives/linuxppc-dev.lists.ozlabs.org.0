Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B87796A77DA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:43:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrQW3vQ7z3fQx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:43:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oBftd8+E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oBftd8+E;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJX6Rqgz3c41
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713885; x=1709249885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=elKTscyLR7FY5NmvjkmQhnEbe/r3S/2u7x+nfhQMrvU=;
  b=oBftd8+EqHsO+4HzbaaW455zLifpLQb4QTdOTmOm+ysoEI5zGb9TwMkJ
   5ICkcNfCynJQKPecPZC7yb1QUmqGLUFz+bkb3x2n/WZslCmz0c1Gg6Jhh
   L+BKt+e6y6YVAX7zQu9iFB1F4Z8JiwoMO/RToprHNA1JPDnfIlHRcQAVN
   5jjHBPl6nPBfZDzvyrhli6FZhIQpBQZvgTR3p7uNErTlBru2VoRwOnxui
   gri3230/EYxcvd2muagPOeOzxqYKh7rmzhhbNJLTtHCx1sq7IrrzHfNCr
   Xwl0O9Y6EazM9kGNnZx1t/7wRj+q/KCC+jWtrGpABjmGU2prUoqdypiUs
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818691"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818691"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:37:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826798"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826798"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:56 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 04/24] x86/apic/vector: Implement a local APIC NMI controller
Date: Wed,  1 Mar 2023 15:47:33 -0800
Message-Id: <20230301234753.28582-5-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
References: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a separate local APIC NMI controller to handle NMIs apart from the
regular APIC management.

This controller will be used to handle the NMI vector of the HPET NMI
watchdog.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v6:
 * Reworked patch "x86/apic/vector: Implement support for NMI delivery
   mode" into a separate local APIC NMI controller. (Thomas)

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
 arch/x86/kernel/apic/vector.c | 57 +++++++++++++++++++++++++++++++++++
 include/linux/irq.h           |  5 +++
 2 files changed, 62 insertions(+)

diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
index 633b442c8f84..a4cf041427cb 100644
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -42,6 +42,7 @@ EXPORT_SYMBOL_GPL(x86_vector_domain);
 static DEFINE_RAW_SPINLOCK(vector_lock);
 static cpumask_var_t vector_searchmask;
 static struct irq_chip lapic_controller;
+static struct irq_chip lapic_nmi_controller;
 static struct irq_matrix *vector_matrix;
 #ifdef CONFIG_SMP
 static DEFINE_PER_CPU(struct hlist_head, cleanup_list);
@@ -451,6 +452,10 @@ static int x86_vector_activate(struct irq_domain *dom, struct irq_data *irqd,
 	trace_vector_activate(irqd->irq, apicd->is_managed,
 			      apicd->can_reserve, reserve);
 
+	/* NMI has a fixed vector. No vector management required */
+	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI)
+		return 0;
+
 	raw_spin_lock_irqsave(&vector_lock, flags);
 	if (!apicd->can_reserve && !apicd->is_managed)
 		assign_irq_vector_any_locked(irqd);
@@ -472,6 +477,10 @@ static void vector_free_reserved_and_managed(struct irq_data *irqd)
 	trace_vector_teardown(irqd->irq, apicd->is_managed,
 			      apicd->has_reserved);
 
+	/* NMI has a fixed vector. No vector management required */
+	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI)
+		return;
+
 	if (apicd->has_reserved)
 		irq_matrix_remove_reserved(vector_matrix);
 	if (apicd->is_managed)
@@ -539,6 +548,10 @@ static int x86_vector_alloc_irqs(struct irq_domain *domain, unsigned int virq,
 	if (disable_apic)
 		return -ENXIO;
 
+	/* Only one IRQ per NMI */
+	if ((info->flags & X86_IRQ_ALLOC_AS_NMI) && nr_irqs != 1)
+		return -EINVAL;
+
 	/*
 	 * Catch any attempt to touch the cascade interrupt on a PIC
 	 * equipped system.
@@ -573,6 +586,25 @@ static int x86_vector_alloc_irqs(struct irq_domain *domain, unsigned int virq,
 		/* Don't invoke affinity setter on deactivated interrupts */
 		irqd_set_affinity_on_activate(irqd);
 
+		if (info->flags & X86_IRQ_ALLOC_AS_NMI) {
+			/*
+			 * NMIs have a fixed vector and need their own
+			 * interrupt chip so nothing can end up in the
+			 * regular local APIC management code except the
+			 * MSI message composing callback.
+			 */
+			apicd->hw_irq_cfg.delivery_mode = APIC_DELIVERY_MODE_NMI;
+			irqd->chip = &lapic_nmi_controller;
+			/*
+			 * Exclude NMIs from balancing. This cannot work with
+			 * the regular affinity mechanisms. The local APIC NMI
+			 * controller provides a set_affinity() callback for the
+			 * intended HPET NMI watchdog use case.
+			 */
+			irqd_set_no_balance(irqd);
+			return 0;
+		}
+
 		/*
 		 * A delivery mode may be specified in the interrupt allocation
 		 * info. If not, use the delivery mode of the APIC.
@@ -872,8 +904,27 @@ static int apic_set_affinity(struct irq_data *irqd,
 	return err ? err : IRQ_SET_MASK_OK;
 }
 
+static int apic_nmi_set_affinity(struct irq_data *irqd,
+				 const struct cpumask *dest, bool force)
+{
+	struct apic_chip_data *apicd = apic_chip_data(irqd);
+	static struct cpumask tmp_mask;
+	int cpu;
+
+	cpumask_and(&tmp_mask, dest, cpu_online_mask);
+	if (cpumask_empty(&tmp_mask))
+		return -ENODEV;
+
+	cpu = cpumask_first(&tmp_mask);
+	apicd->hw_irq_cfg.dest_apicid = apic->calc_dest_apicid(cpu);
+	irq_data_update_effective_affinity(irqd, cpumask_of(cpu));
+
+	return IRQ_SET_MASK_OK;
+}
+
 #else
 # define apic_set_affinity	NULL
+# define apic_nmi_set_affinity	NULL
 #endif
 
 static int apic_retrigger_irq(struct irq_data *irqd)
@@ -914,6 +965,12 @@ static struct irq_chip lapic_controller = {
 	.irq_retrigger		= apic_retrigger_irq,
 };
 
+static struct irq_chip lapic_nmi_controller = {
+	.name			= "APIC-NMI",
+	.irq_set_affinity	= apic_nmi_set_affinity,
+	.irq_compose_msi_msg	= x86_vector_msi_compose_msg,
+};
+
 #ifdef CONFIG_SMP
 
 static void free_moved_vector(struct apic_chip_data *apicd)
diff --git a/include/linux/irq.h b/include/linux/irq.h
index b1b28affb32a..c8738b36e316 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -263,6 +263,11 @@ static inline bool irqd_is_per_cpu(struct irq_data *d)
 	return __irqd_to_state(d) & IRQD_PER_CPU;
 }
 
+static inline void irqd_set_no_balance(struct irq_data *d)
+{
+	__irqd_to_state(d) |= IRQD_NO_BALANCING;
+}
+
 static inline bool irqd_can_balance(struct irq_data *d)
 {
 	return !(__irqd_to_state(d) & (IRQD_PER_CPU | IRQD_NO_BALANCING));
-- 
2.25.1

