Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ACA17C2CC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 17:20:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YtBJ5VCjzDr6w
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 03:20:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.107.143;
 helo=1.mo177.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 1.mo177.mail-out.ovh.net (1.mo177.mail-out.ovh.net
 [178.33.107.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Yt8d3yxfzDr2d
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 03:18:38 +1100 (AEDT)
Received: from player758.ha.ovh.net (unknown [10.108.57.140])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id E54B012779C
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 16:02:10 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 5EF95102B504B;
 Fri,  6 Mar 2020 15:02:06 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 4/4] powerpc/xive: Add a debugfs file to dump internal XIVE
 state
Date: Fri,  6 Mar 2020 16:01:43 +0100
Message-Id: <20200306150143.5551-5-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200306150143.5551-1-clg@kaod.org>
References: <20200306150143.5551-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7345933945286200241
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudduvddgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As does XMON, the debugfs file /sys/kernel/debug/powerpc/xive exposes
the XIVE internal state of the machine CPUs and interrupts. Available
on the PowerNV and sPAPR platforms.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/xive-internal.h |   2 +
 arch/powerpc/sysdev/xive/common.c        | 105 +++++++++++++++++++++++
 arch/powerpc/sysdev/xive/native.c        |   3 +
 arch/powerpc/sysdev/xive/spapr.c         |  19 ++++
 4 files changed, 129 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysdev/xive/xive-internal.h
index 382980f4de2d..b7b901da2168 100644
--- a/arch/powerpc/sysdev/xive/xive-internal.h
+++ b/arch/powerpc/sysdev/xive/xive-internal.h
@@ -57,12 +57,14 @@ struct xive_ops {
 	int	(*get_ipi)(unsigned int cpu, struct xive_cpu *xc);
 	void	(*put_ipi)(unsigned int cpu, struct xive_cpu *xc);
 #endif
+	int	(*debug_show)(struct seq_file *m, void *private);
 	const char *name;
 };
 
 bool xive_core_init(const struct xive_ops *ops, void __iomem *area, u32 offset,
 		    u8 max_prio);
 __be32 *xive_queue_page_alloc(unsigned int cpu, u32 queue_shift);
+int xive_core_debug_init(void);
 
 static inline u32 xive_alloc_order(u32 queue_shift)
 {
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index c865ae554605..e192077481a1 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -20,6 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/msi.h>
 
+#include <asm/debugfs.h>
 #include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/smp.h>
@@ -1558,3 +1559,107 @@ static int __init xive_off(char *arg)
 	return 0;
 }
 __setup("xive=off", xive_off);
+
+void xive_debug_show_cpu(struct seq_file *m, int cpu)
+{
+	struct xive_cpu *xc = per_cpu(xive_cpu, cpu);
+
+	seq_printf(m, "CPU %d:", cpu);
+	if (xc) {
+		seq_printf(m, "pp=%02x CPPR=%02x ", xc->pending_prio, xc->cppr);
+
+#ifdef CONFIG_SMP
+		{
+			u64 val = xive_esb_read(&xc->ipi_data, XIVE_ESB_GET);
+
+			seq_printf(m, "IPI=0x%08x PQ=%c%c ", xc->hw_ipi,
+				   val & XIVE_ESB_VAL_P ? 'P' : '-',
+				   val & XIVE_ESB_VAL_Q ? 'Q' : '-');
+		}
+#endif
+		{
+			struct xive_q *q = &xc->queue[xive_irq_priority];
+			u32 i0, i1, idx;
+
+			if (q->qpage) {
+				idx = q->idx;
+				i0 = be32_to_cpup(q->qpage + idx);
+				idx = (idx + 1) & q->msk;
+				i1 = be32_to_cpup(q->qpage + idx);
+				seq_printf(m, "EQ idx=%d T=%d %08x %08x ...",
+					   q->idx, q->toggle, i0, i1);
+			}
+		}
+	}
+	seq_puts(m, "\n");
+}
+
+void xive_debug_show_irq(struct seq_file *m, u32 hw_irq, struct irq_data *d)
+{
+	struct irq_chip *chip = irq_data_get_irq_chip(d);
+	int rc;
+	u32 target;
+	u8 prio;
+	u32 lirq;
+
+	if (!is_xive_irq(chip))
+		return;
+
+	rc = xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
+	if (rc) {
+		seq_printf(m, "IRQ 0x%08x : no config rc=%d\n", hw_irq, rc);
+		return;
+	}
+
+	seq_printf(m, "IRQ 0x%08x : target=0x%x prio=%02x lirq=0x%x ",
+		   hw_irq, target, prio, lirq);
+
+	if (d) {
+		struct xive_irq_data *xd = irq_data_get_irq_handler_data(d);
+		u64 val = xive_esb_read(xd, XIVE_ESB_GET);
+
+		seq_printf(m, "flags=%c%c%c PQ=%c%c",
+			   xd->flags & XIVE_IRQ_FLAG_STORE_EOI ? 'S' : ' ',
+			   xd->flags & XIVE_IRQ_FLAG_LSI ? 'L' : ' ',
+			   xd->flags & XIVE_IRQ_FLAG_H_INT_ESB ? 'H' : ' ',
+			   val & XIVE_ESB_VAL_P ? 'P' : '-',
+			   val & XIVE_ESB_VAL_Q ? 'Q' : '-');
+	}
+	seq_puts(m, "\n");
+}
+
+static int xive_core_debug_show(struct seq_file *m, void *private)
+{
+	unsigned int i;
+	struct irq_desc *desc;
+	int cpu;
+
+	if (xive_ops->debug_show)
+		xive_ops->debug_show(m, private);
+
+	for_each_possible_cpu(cpu)
+		xive_debug_show_cpu(m, cpu);
+
+	for_each_irq_desc(i, desc) {
+		struct irq_data *d = irq_desc_get_irq_data(desc);
+		unsigned int hw_irq;
+
+		if (!d)
+			continue;
+
+		hw_irq = (unsigned int)irqd_to_hwirq(d);
+
+		/* IPIs are special (HW number 0) */
+		if (hw_irq)
+			xive_debug_show_irq(m, hw_irq, d);
+	}
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(xive_core_debug);
+
+int xive_core_debug_init(void)
+{
+	debugfs_create_file("xive", 0444, powerpc_debugfs_root,
+			    NULL, &xive_core_debug_fops);
+	return 0;
+}
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 50e1a8e02497..5218fdc4b29a 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -19,6 +19,7 @@
 #include <linux/cpumask.h>
 #include <linux/mm.h>
 
+#include <asm/machdep.h>
 #include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/smp.h>
@@ -850,3 +851,5 @@ int xive_native_get_vp_state(u32 vp_id, u64 *out_state)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xive_native_get_vp_state);
+
+machine_arch_initcall(powernv, xive_core_debug_init);
diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 3f15615712b5..7ab5c6780997 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/libfdt.h>
 
+#include <asm/machdep.h>
 #include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/smp.h>
@@ -645,6 +646,21 @@ static void xive_spapr_sync_source(u32 hw_irq)
 	plpar_int_sync(0, hw_irq);
 }
 
+static int xive_spapr_debug_show(struct seq_file *m, void *private)
+{
+	struct xive_irq_bitmap *xibm;
+	char *buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
+
+	list_for_each_entry(xibm, &xive_irq_bitmaps, list) {
+		memset(buf, 0, PAGE_SIZE);
+		bitmap_print_to_pagebuf(true, buf, xibm->bitmap, xibm->count);
+		seq_printf(m, "bitmap #%d: %s", xibm->count, buf);
+	}
+	kfree(buf);
+
+	return 0;
+}
+
 static const struct xive_ops xive_spapr_ops = {
 	.populate_irq_data	= xive_spapr_populate_irq_data,
 	.configure_irq		= xive_spapr_configure_irq,
@@ -662,6 +678,7 @@ static const struct xive_ops xive_spapr_ops = {
 #ifdef CONFIG_SMP
 	.get_ipi		= xive_spapr_get_ipi,
 	.put_ipi		= xive_spapr_put_ipi,
+	.debug_show		= xive_spapr_debug_show,
 #endif /* CONFIG_SMP */
 	.name			= "spapr",
 };
@@ -839,3 +856,5 @@ bool __init xive_spapr_init(void)
 	pr_info("Using %dkB queues\n", 1 << (xive_queue_shift - 10));
 	return true;
 }
+
+machine_arch_initcall(pseries, xive_core_debug_init);
-- 
2.21.1

