Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDD4355039
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 11:39:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF2Y372zgz3c3J
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 19:39:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF2Tp2jsjz30CF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 19:36:30 +1000 (AEST)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DB06613D5;
 Tue,  6 Apr 2021 09:36:28 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lTi8I-005owA-P4; Tue, 06 Apr 2021 10:36:27 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org
Subject: [PATCH 8/9] powerpc: Convert irq_domain_add_legacy_isa use to
 irq_domain_add_legacy
Date: Tue,  6 Apr 2021 10:35:56 +0100
Message-Id: <20210406093557.1073423-9-maz@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210406093557.1073423-1-maz@kernel.org>
References: <20210406093557.1073423-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, daniel@zonque.org,
 robert.jarzmik@free.fr, haojian.zhuang@gmail.com, ysato@users.sourceforge.jp,
 dalias@libc.org, tsbogend@alpha.franken.de, mpe@ellerman.id.au,
 tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

irq_domain_add_legacy_isa is a pain. It only exists for the benefit of
two PPC-specific drivers, and creates an ugly dependency between asm/irq.h
and linux/irqdomain.h

Instead, let's convert these two drivers to irq_domain_add_legacy(),
stop using NUM_ISA_INTERRUPTS by directly setting NR_IRQS_LEGACY.

The dependency cannot be broken yet as there is a lot of PPC-related
code that depends on it, but that's the first step towards it.

A followup patch will remove irq_domain_add_legacy_isa.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/powerpc/include/asm/irq.h         | 4 ++--
 arch/powerpc/platforms/ps3/interrupt.c | 4 ++--
 arch/powerpc/sysdev/i8259.c            | 3 ++-
 arch/powerpc/sysdev/mpic.c             | 2 +-
 arch/powerpc/sysdev/tsi108_pci.c       | 3 ++-
 arch/powerpc/sysdev/xics/xics-common.c | 2 +-
 6 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index f3f264e441a7..aeb209144c68 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -23,8 +23,8 @@ extern atomic_t ppc_n_lost_interrupts;
 /* Total number of virq in the platform */
 #define NR_IRQS		CONFIG_NR_IRQS
 
-/* Same thing, used by the generic IRQ code */
-#define NR_IRQS_LEGACY		NUM_ISA_INTERRUPTS
+/* Number of irqs reserved for a legacy isa controller */
+#define NR_IRQS_LEGACY		16
 
 extern irq_hw_number_t virq_to_hw(unsigned int virq);
 
diff --git a/arch/powerpc/platforms/ps3/interrupt.c b/arch/powerpc/platforms/ps3/interrupt.c
index 78f2339ed5cb..93e367a00452 100644
--- a/arch/powerpc/platforms/ps3/interrupt.c
+++ b/arch/powerpc/platforms/ps3/interrupt.c
@@ -45,7 +45,7 @@
  * implementation equates HV plug value to Linux virq value, constrains each
  * interrupt to have a system wide unique plug number, and limits the range
  * of the plug values to map into the first dword of the bitmaps.  This
- * gives a usable range of plug values of  {NUM_ISA_INTERRUPTS..63}.  Note
+ * gives a usable range of plug values of  {NR_IRQS_LEGACY..63}.  Note
  * that there is no constraint on how many in this set an individual thread
  * can acquire.
  *
@@ -721,7 +721,7 @@ static unsigned int ps3_get_irq(void)
 	}
 
 #if defined(DEBUG)
-	if (unlikely(plug < NUM_ISA_INTERRUPTS || plug > PS3_PLUG_MAX)) {
+	if (unlikely(plug < NR_IRQS_LEGACY || plug > PS3_PLUG_MAX)) {
 		dump_bmp(&per_cpu(ps3_private, 0));
 		dump_bmp(&per_cpu(ps3_private, 1));
 		BUG();
diff --git a/arch/powerpc/sysdev/i8259.c b/arch/powerpc/sysdev/i8259.c
index c1d76c344351..dc1a151c63d7 100644
--- a/arch/powerpc/sysdev/i8259.c
+++ b/arch/powerpc/sysdev/i8259.c
@@ -260,7 +260,8 @@ void i8259_init(struct device_node *node, unsigned long intack_addr)
 	raw_spin_unlock_irqrestore(&i8259_lock, flags);
 
 	/* create a legacy host */
-	i8259_host = irq_domain_add_legacy_isa(node, &i8259_host_ops, NULL);
+	i8259_host = irq_domain_add_legacy(node, NR_IRQS_LEGACY, 0, 0,
+					   &i8259_host_ops, NULL);
 	if (i8259_host == NULL) {
 		printk(KERN_ERR "i8259: failed to allocate irq host !\n");
 		return;
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index b0426f28946a..995fb2ada507 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -602,7 +602,7 @@ static void __init mpic_scan_ht_pics(struct mpic *mpic)
 /* Find an mpic associated with a given linux interrupt */
 static struct mpic *mpic_find(unsigned int irq)
 {
-	if (irq < NUM_ISA_INTERRUPTS)
+	if (irq < NR_IRQS_LEGACY)
 		return NULL;
 
 	return irq_get_chip_data(irq);
diff --git a/arch/powerpc/sysdev/tsi108_pci.c b/arch/powerpc/sysdev/tsi108_pci.c
index 49f9541954f8..042bb38fa5c2 100644
--- a/arch/powerpc/sysdev/tsi108_pci.c
+++ b/arch/powerpc/sysdev/tsi108_pci.c
@@ -404,7 +404,8 @@ void __init tsi108_pci_int_init(struct device_node *node)
 {
 	DBG("Tsi108_pci_int_init: initializing PCI interrupts\n");
 
-	pci_irq_host = irq_domain_add_legacy_isa(node, &pci_irq_domain_ops, NULL);
+	pci_irq_host = irq_domain_add_legacy(node, NR_IRQS_LEGACY, 0, 0,
+					     &pci_irq_domain_ops, NULL);
 	if (pci_irq_host == NULL) {
 		printk(KERN_ERR "pci_irq_host: failed to allocate irq domain!\n");
 		return;
diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev/xics/xics-common.c
index 7e4305c01bac..fdf8db4444b6 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -201,7 +201,7 @@ void xics_migrate_irqs_away(void)
 		struct ics *ics;
 
 		/* We can't set affinity on ISA interrupts */
-		if (virq < NUM_ISA_INTERRUPTS)
+		if (virq < NR_IRQS_LEGACY)
 			continue;
 		/* We only need to migrate enabled IRQS */
 		if (!desc->action)
-- 
2.29.2

