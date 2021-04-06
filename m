Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D057355027
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 11:37:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF2Vp4ZRRz3bdF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 19:37:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF2Tl5STJz2yxn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 19:36:27 +1000 (AEST)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 775D36124B;
 Tue,  6 Apr 2021 09:36:24 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lTi8E-005owA-Q8; Tue, 06 Apr 2021 10:36:22 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org
Subject: [PATCH 1/9] irqdomain: Reimplement irq_linear_revmap() with
 irq_find_mapping()
Date: Tue,  6 Apr 2021 10:35:49 +0100
Message-Id: <20210406093557.1073423-2-maz@kernel.org>
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

irq_linear_revmap() is supposed to be a fast path for domain
lookups, but it only exposes low-level details of the irqdomain
implementation, details which are better kept private.

The *overhead* between the two is only a function call and
a couple of tests, so it is likely that noone can show any
meaningful difference compared to the cost of taking an
interrupt.

Reimplement irq_linear_revmap() with irq_find_mapping()
in order to preserve source code compatibility, and
rename the internal field for a measure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irqdomain.h | 22 +++++++++-------------
 kernel/irq/irqdomain.c    |  6 +++---
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 33cacc8af26d..b9600f24878a 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -154,9 +154,9 @@ struct irq_domain_chip_generic;
  * Revmap data, used internally by irq_domain
  * @revmap_direct_max_irq: The largest hwirq that can be set for controllers that
  *                         support direct mapping
- * @revmap_size: Size of the linear map table @linear_revmap[]
+ * @revmap_size: Size of the linear map table @revmap[]
  * @revmap_tree: Radix map tree for hwirqs that don't fit in the linear map
- * @linear_revmap: Linear table of hwirq->virq reverse mappings
+ * @revmap: Linear table of hwirq->virq reverse mappings
  */
 struct irq_domain {
 	struct list_head link;
@@ -180,7 +180,7 @@ struct irq_domain {
 	unsigned int revmap_size;
 	struct radix_tree_root revmap_tree;
 	struct mutex revmap_tree_mutex;
-	unsigned int linear_revmap[];
+	unsigned int revmap[];
 };
 
 /* Irq domain flags */
@@ -396,24 +396,20 @@ static inline unsigned int irq_create_mapping(struct irq_domain *host,
 	return irq_create_mapping_affinity(host, hwirq, NULL);
 }
 
-
 /**
- * irq_linear_revmap() - Find a linux irq from a hw irq number.
+ * irq_find_mapping() - Find a linux irq from a hw irq number.
  * @domain: domain owning this hardware interrupt
  * @hwirq: hardware irq number in that domain space
- *
- * This is a fast path alternative to irq_find_mapping() that can be
- * called directly by irq controller code to save a handful of
- * instructions. It is always safe to call, but won't find irqs mapped
- * using the radix tree.
  */
+extern unsigned int irq_find_mapping(struct irq_domain *host,
+				     irq_hw_number_t hwirq);
+
 static inline unsigned int irq_linear_revmap(struct irq_domain *domain,
 					     irq_hw_number_t hwirq)
 {
-	return hwirq < domain->revmap_size ? domain->linear_revmap[hwirq] : 0;
+	return irq_find_mapping(domain, hwirq);
 }
-extern unsigned int irq_find_mapping(struct irq_domain *host,
-				     irq_hw_number_t hwirq);
+
 extern unsigned int irq_create_direct_mapping(struct irq_domain *host);
 extern int irq_create_strict_mappings(struct irq_domain *domain,
 				      unsigned int irq_base,
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index d10ab1d689d5..dfa716305ea9 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -486,7 +486,7 @@ static void irq_domain_clear_mapping(struct irq_domain *domain,
 				     irq_hw_number_t hwirq)
 {
 	if (hwirq < domain->revmap_size) {
-		domain->linear_revmap[hwirq] = 0;
+		domain->revmap[hwirq] = 0;
 	} else {
 		mutex_lock(&domain->revmap_tree_mutex);
 		radix_tree_delete(&domain->revmap_tree, hwirq);
@@ -499,7 +499,7 @@ static void irq_domain_set_mapping(struct irq_domain *domain,
 				   struct irq_data *irq_data)
 {
 	if (hwirq < domain->revmap_size) {
-		domain->linear_revmap[hwirq] = irq_data->irq;
+		domain->revmap[hwirq] = irq_data->irq;
 	} else {
 		mutex_lock(&domain->revmap_tree_mutex);
 		radix_tree_insert(&domain->revmap_tree, hwirq, irq_data);
@@ -920,7 +920,7 @@ unsigned int irq_find_mapping(struct irq_domain *domain,
 
 	/* Check if the hwirq is in the linear revmap. */
 	if (hwirq < domain->revmap_size)
-		return domain->linear_revmap[hwirq];
+		return domain->revmap[hwirq];
 
 	rcu_read_lock();
 	data = radix_tree_lookup(&domain->revmap_tree, hwirq);
-- 
2.29.2

