Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD70355037
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 11:39:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF2Xh4CFhz3dGY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 19:39:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF2Tn4Jtsz309p
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 19:36:29 +1000 (AEST)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D26C6613CD;
 Tue,  6 Apr 2021 09:36:26 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lTi8H-005owA-2H; Tue, 06 Apr 2021 10:36:25 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org
Subject: [PATCH 5/9] irqdomain: Kill
 irq_create_strict_mappings()/irq_create_identity_mapping()
Date: Tue,  6 Apr 2021 10:35:53 +0100
Message-Id: <20210406093557.1073423-6-maz@kernel.org>
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

No user of these APIs are left, remove them.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irqdomain.h |  9 ---------
 kernel/irq/irqdomain.c    | 35 -----------------------------------
 2 files changed, 44 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index b9600f24878a..3997ed9e4d7d 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -411,15 +411,6 @@ static inline unsigned int irq_linear_revmap(struct irq_domain *domain,
 }
 
 extern unsigned int irq_create_direct_mapping(struct irq_domain *host);
-extern int irq_create_strict_mappings(struct irq_domain *domain,
-				      unsigned int irq_base,
-				      irq_hw_number_t hwirq_base, int count);
-
-static inline int irq_create_identity_mapping(struct irq_domain *host,
-					      irq_hw_number_t hwirq)
-{
-	return irq_create_strict_mappings(host, hwirq, hwirq, 1);
-}
 
 extern const struct irq_domain_ops irq_domain_simple_ops;
 
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index dfa716305ea9..0ba761e6b0a8 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -703,41 +703,6 @@ unsigned int irq_create_mapping_affinity(struct irq_domain *domain,
 }
 EXPORT_SYMBOL_GPL(irq_create_mapping_affinity);
 
-/**
- * irq_create_strict_mappings() - Map a range of hw irqs to fixed linux irqs
- * @domain: domain owning the interrupt range
- * @irq_base: beginning of linux IRQ range
- * @hwirq_base: beginning of hardware IRQ range
- * @count: Number of interrupts to map
- *
- * This routine is used for allocating and mapping a range of hardware
- * irqs to linux irqs where the linux irq numbers are at pre-defined
- * locations. For use by controllers that already have static mappings
- * to insert in to the domain.
- *
- * Non-linear users can use irq_create_identity_mapping() for IRQ-at-a-time
- * domain insertion.
- *
- * 0 is returned upon success, while any failure to establish a static
- * mapping is treated as an error.
- */
-int irq_create_strict_mappings(struct irq_domain *domain, unsigned int irq_base,
-			       irq_hw_number_t hwirq_base, int count)
-{
-	struct device_node *of_node;
-	int ret;
-
-	of_node = irq_domain_get_of_node(domain);
-	ret = irq_alloc_descs(irq_base, irq_base, count,
-			      of_node_to_nid(of_node));
-	if (unlikely(ret < 0))
-		return ret;
-
-	irq_domain_associate_many(domain, irq_base, hwirq_base, count);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(irq_create_strict_mappings);
-
 static int irq_domain_translate(struct irq_domain *d,
 				struct irq_fwspec *fwspec,
 				irq_hw_number_t *hwirq, unsigned int *type)
-- 
2.29.2

