Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0D58A0A3C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 09:42:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=J6PF6lua;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFWr24xZyz3vbv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 17:42:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=J6PF6lua;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFWqK0xbMz3dX4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 17:41:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1712821304; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=1Yk1v6VvPiEnbDOY+PB+zFpQw+u5pkfdB+PFPeSVsXk=;
	b=J6PF6lua0lHVGY9xbtTxn/VuQWPGmILotId2A2DwIzEd4MQG8CNr3q8FOnEQimwcJhtQ/WFzuvhJsW/xCIM46hJefxT5Ke7vsVvx45bxr+me3py6MHjf43R3mzAkZK0izFcczCuKHLlCwCXUnxCVMOo/e55jXk/GMu8hXzG+bN4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R241e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0W4KbQ8p_1712821299;
Received: from localhost.localdomain(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W4KbQ8p_1712821299)
          by smtp.aliyun-inc.com;
          Thu, 11 Apr 2024 15:41:42 +0800
From: Bitao Hu <yaoma@linux.alibaba.com>
To: dianders@chromium.org,
	tglx@linutronix.de,
	liusong@linux.alibaba.com,
	akpm@linux-foundation.org,
	pmladek@suse.com,
	kernelfans@gmail.com,
	deller@gmx.de,
	npiggin@gmail.com,
	tsbogend@alpha.franken.de,
	James.Bottomley@HansenPartnership.com,
	jan.kiszka@siemens.com
Subject: [PATCHv13 1/5] genirq: Convert kstat_irqs to a struct
Date: Thu, 11 Apr 2024 15:41:30 +0800
Message-Id: <20240411074134.30922-2-yaoma@linux.alibaba.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20240411074134.30922-1-yaoma@linux.alibaba.com>
References: <20240411074134.30922-1-yaoma@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: yaoma@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The irq_desc::kstat_irqs member is a per-CPU variable of type int, and
it is only capable of counting. The snapshot mechanism for interrupt
statistics will be added soon, which requires an additional variable to
store snapshot. To facilitate expansion, convert kstat_irqs here to
a struct containing only the count.

Originally-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
---
 arch/mips/dec/setup.c                |  2 +-
 arch/parisc/kernel/smp.c             |  2 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c |  2 +-
 include/linux/irqdesc.h              | 12 ++++++++++--
 kernel/irq/internals.h               |  2 +-
 kernel/irq/irqdesc.c                 |  9 ++++-----
 kernel/irq/proc.c                    |  5 ++---
 scripts/gdb/linux/interrupts.py      |  6 +++---
 8 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/mips/dec/setup.c b/arch/mips/dec/setup.c
index 6c3704f51d0d..87f0a1436bf9 100644
--- a/arch/mips/dec/setup.c
+++ b/arch/mips/dec/setup.c
@@ -756,7 +756,7 @@ void __init arch_init_irq(void)
 				NULL))
 			pr_err("Failed to register fpu interrupt\n");
 		desc_fpu = irq_to_desc(irq_fpu);
-		fpu_kstat_irq = this_cpu_ptr(desc_fpu->kstat_irqs);
+		fpu_kstat_irq = this_cpu_ptr(&desc_fpu->kstat_irqs->cnt);
 	}
 	if (dec_interrupt[DEC_IRQ_CASCADE] >= 0) {
 		if (request_irq(dec_interrupt[DEC_IRQ_CASCADE], no_action,
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 444154271f23..800eb64e91ad 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -344,7 +344,7 @@ static int smp_boot_one_cpu(int cpuid, struct task_struct *idle)
 		struct irq_desc *desc = irq_to_desc(i);
 
 		if (desc && desc->kstat_irqs)
-			*per_cpu_ptr(desc->kstat_irqs, cpuid) = 0;
+			*per_cpu_ptr(desc->kstat_irqs, cpuid) = (struct irqstat) { };
 	}
 #endif
 
diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c b/arch/powerpc/kvm/book3s_hv_rm_xics.c
index e42984878503..f2636414d82a 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
@@ -837,7 +837,7 @@ static inline void this_cpu_inc_rm(unsigned int __percpu *addr)
  */
 static void kvmppc_rm_handle_irq_desc(struct irq_desc *desc)
 {
-	this_cpu_inc_rm(desc->kstat_irqs);
+	this_cpu_inc_rm(&desc->kstat_irqs->cnt);
 	__this_cpu_inc(kstat.irqs_sum);
 }
 
diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index d9451d456a73..c28612674acb 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -17,6 +17,14 @@ struct irq_desc;
 struct irq_domain;
 struct pt_regs;
 
+/**
+ * struct irqstat - interrupt statistics
+ * @cnt:	real-time interrupt count
+ */
+struct irqstat {
+	unsigned int	cnt;
+};
+
 /**
  * struct irq_desc - interrupt descriptor
  * @irq_common_data:	per irq and chip data passed down to chip functions
@@ -55,7 +63,7 @@ struct pt_regs;
 struct irq_desc {
 	struct irq_common_data	irq_common_data;
 	struct irq_data		irq_data;
-	unsigned int __percpu	*kstat_irqs;
+	struct irqstat __percpu	*kstat_irqs;
 	irq_flow_handler_t	handle_irq;
 	struct irqaction	*action;	/* IRQ action list */
 	unsigned int		status_use_accessors;
@@ -119,7 +127,7 @@ extern struct irq_desc irq_desc[NR_IRQS];
 static inline unsigned int irq_desc_kstat_cpu(struct irq_desc *desc,
 					      unsigned int cpu)
 {
-	return desc->kstat_irqs ? *per_cpu_ptr(desc->kstat_irqs, cpu) : 0;
+	return desc->kstat_irqs ? per_cpu(desc->kstat_irqs->cnt, cpu) : 0;
 }
 
 static inline struct irq_desc *irq_data_to_desc(struct irq_data *data)
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index bcc7f21db9ee..1d92532c2aae 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -258,7 +258,7 @@ static inline void irq_state_set_masked(struct irq_desc *desc)
 
 static inline void __kstat_incr_irqs_this_cpu(struct irq_desc *desc)
 {
-	__this_cpu_inc(*desc->kstat_irqs);
+	__this_cpu_inc(desc->kstat_irqs->cnt);
 	__this_cpu_inc(kstat.irqs_sum);
 }
 
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 4c6b32318ce3..b59b79200ad7 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -134,7 +134,7 @@ static void desc_set_defaults(unsigned int irq, struct irq_desc *desc, int node,
 	desc->name = NULL;
 	desc->owner = owner;
 	for_each_possible_cpu(cpu)
-		*per_cpu_ptr(desc->kstat_irqs, cpu) = 0;
+		*per_cpu_ptr(desc->kstat_irqs, cpu) = (struct irqstat) { };
 	desc_smp_init(desc, node, affinity);
 }
 
@@ -186,7 +186,7 @@ static int init_desc(struct irq_desc *desc, int irq, int node,
 		     const struct cpumask *affinity,
 		     struct module *owner)
 {
-	desc->kstat_irqs = alloc_percpu(unsigned int);
+	desc->kstat_irqs = alloc_percpu(struct irqstat);
 	if (!desc->kstat_irqs)
 		return -ENOMEM;
 
@@ -968,8 +968,7 @@ unsigned int kstat_irqs_cpu(unsigned int irq, int cpu)
 {
 	struct irq_desc *desc = irq_to_desc(irq);
 
-	return desc && desc->kstat_irqs ?
-			*per_cpu_ptr(desc->kstat_irqs, cpu) : 0;
+	return desc && desc->kstat_irqs ? per_cpu(desc->kstat_irqs->cnt, cpu) : 0;
 }
 
 static bool irq_is_nmi(struct irq_desc *desc)
@@ -991,7 +990,7 @@ static unsigned int kstat_irqs(unsigned int irq)
 		return data_race(desc->tot_count);
 
 	for_each_possible_cpu(cpu)
-		sum += data_race(*per_cpu_ptr(desc->kstat_irqs, cpu));
+		sum += data_race(per_cpu(desc->kstat_irqs->cnt, cpu));
 	return sum;
 }
 
diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 623b8136e9af..6954e0a02047 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -490,7 +490,7 @@ int show_interrupts(struct seq_file *p, void *v)
 
 	if (desc->kstat_irqs) {
 		for_each_online_cpu(j)
-			any_count |= data_race(*per_cpu_ptr(desc->kstat_irqs, j));
+			any_count |= data_race(per_cpu(desc->kstat_irqs->cnt, j));
 	}
 
 	if ((!desc->action || irq_desc_is_chained(desc)) && !any_count)
@@ -498,8 +498,7 @@ int show_interrupts(struct seq_file *p, void *v)
 
 	seq_printf(p, "%*d: ", prec, i);
 	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", desc->kstat_irqs ?
-					*per_cpu_ptr(desc->kstat_irqs, j) : 0);
+		seq_printf(p, "%10u ", desc->kstat_irqs ? per_cpu(desc->kstat_irqs->cnt, j) : 0);
 
 	raw_spin_lock_irqsave(&desc->lock, flags);
 	if (desc->irq_data.chip) {
diff --git a/scripts/gdb/linux/interrupts.py b/scripts/gdb/linux/interrupts.py
index 66ae5c7690cf..616a5f26377a 100644
--- a/scripts/gdb/linux/interrupts.py
+++ b/scripts/gdb/linux/interrupts.py
@@ -37,7 +37,7 @@ def show_irq_desc(prec, irq):
     any_count = 0
     if desc['kstat_irqs']:
         for cpu in cpus.each_online_cpu():
-            any_count += cpus.per_cpu(desc['kstat_irqs'], cpu)
+            any_count += cpus.per_cpu(desc['kstat_irqs'], cpu)['cnt']
 
     if (desc['action'] == 0 or irq_desc_is_chained(desc)) and any_count == 0:
         return text;
@@ -45,7 +45,7 @@ def show_irq_desc(prec, irq):
     text += "%*d: " % (prec, irq)
     for cpu in cpus.each_online_cpu():
         if desc['kstat_irqs']:
-            count = cpus.per_cpu(desc['kstat_irqs'], cpu)
+            count = cpus.per_cpu(desc['kstat_irqs'], cpu)['cnt']
         else:
             count = 0
         text += "%10u" % (count)
@@ -177,7 +177,7 @@ def arm_common_show_interrupts(prec):
         if desc == 0:
             continue
         for cpu in cpus.each_online_cpu():
-            text += "%10u" % (cpus.per_cpu(desc['kstat_irqs'], cpu))
+            text += "%10u" % (cpus.per_cpu(desc['kstat_irqs'], cpu)['cnt'])
         text += "      %s" % (ipi_types[ipi].string())
         text += "\n"
     return text
-- 
2.37.1 (Apple Git-137.1)

