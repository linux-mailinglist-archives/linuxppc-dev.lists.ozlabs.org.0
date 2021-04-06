Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3305355033
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 11:38:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF2XL2nZpz3c0k
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 19:38:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF2Tn4ZpMz309v
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 19:36:29 +1000 (AEST)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2BD9613D2;
 Tue,  6 Apr 2021 09:36:27 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lTi8I-005owA-6H; Tue, 06 Apr 2021 10:36:26 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org
Subject: [PATCH 7/9] irqdomain: Drop references to recusive irqdomain setup
Date: Tue,  6 Apr 2021 10:35:55 +0100
Message-Id: <20210406093557.1073423-8-maz@kernel.org>
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

It was never completely implemented, and was removed a long time
ago. Adjust the documentation to reflect this.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 kernel/irq/irqdomain.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 0ba761e6b0a8..89474aa88220 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1659,12 +1659,10 @@ void irq_domain_free_irqs(unsigned int virq, unsigned int nr_irqs)
 
 /**
  * irq_domain_alloc_irqs_parent - Allocate interrupts from parent domain
+ * @domain:	Domain below which interrupts must be allocated
  * @irq_base:	Base IRQ number
  * @nr_irqs:	Number of IRQs to allocate
  * @arg:	Allocation data (arch/domain specific)
- *
- * Check whether the domain has been setup recursive. If not allocate
- * through the parent domain.
  */
 int irq_domain_alloc_irqs_parent(struct irq_domain *domain,
 				 unsigned int irq_base, unsigned int nr_irqs,
@@ -1680,11 +1678,9 @@ EXPORT_SYMBOL_GPL(irq_domain_alloc_irqs_parent);
 
 /**
  * irq_domain_free_irqs_parent - Free interrupts from parent domain
+ * @domain:	Domain below which interrupts must be freed
  * @irq_base:	Base IRQ number
  * @nr_irqs:	Number of IRQs to free
- *
- * Check whether the domain has been setup recursive. If not free
- * through the parent domain.
  */
 void irq_domain_free_irqs_parent(struct irq_domain *domain,
 				 unsigned int irq_base, unsigned int nr_irqs)
-- 
2.29.2

