Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEEC35502D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 11:38:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF2Wf2g6nz3cP8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 19:38:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF2Tm3WPBz301g
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 19:36:28 +1000 (AEST)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 46F00613CB;
 Tue,  6 Apr 2021 09:36:26 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lTi8G-005owA-G8; Tue, 06 Apr 2021 10:36:24 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org
Subject: [PATCH 4/9] sh: intc: Drop the use of irq_create_identity_mapping()
Date: Tue,  6 Apr 2021 10:35:52 +0100
Message-Id: <20210406093557.1073423-5-maz@kernel.org>
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

Instead of playing games with using irq_create_identity_mapping()
and irq_domain_associate(), drop the use of the former and only
use the latter, together with the allocation of the irq_desc
as needed.

It doesn't make the code less awful, but at least the intent
is clearer.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/sh/intc/core.c | 50 ++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 29 deletions(-)

diff --git a/drivers/sh/intc/core.c b/drivers/sh/intc/core.c
index a14684ffe4c1..6c57ee1ce6c4 100644
--- a/drivers/sh/intc/core.c
+++ b/drivers/sh/intc/core.c
@@ -179,6 +179,23 @@ static unsigned int __init save_reg(struct intc_desc_int *d,
 	return 0;
 }
 
+static bool __init intc_map(struct irq_domain *domain, int irq)
+{
+	int res;
+
+	if (!irq_to_desc(irq) && irq_alloc_desc_at(irq, NUMA_NO_NODE) != irq) {
+		pr_err("uname to allocate IRQ %d\n", irq);
+		return false;
+	}
+
+	if (irq_domain_associate(domain, irq, irq)) {
+		pr_err("domain association failure\n");
+		return false;
+	}
+
+	return true;
+}
+
 int __init register_intc_controller(struct intc_desc *desc)
 {
 	unsigned int i, k, smp;
@@ -316,19 +333,8 @@ int __init register_intc_controller(struct intc_desc *desc)
 		if (!vect->enum_id)
 			continue;
 
-		res = irq_create_identity_mapping(d->domain, irq);
-		if (unlikely(res)) {
-			if (res == -EEXIST) {
-				res = irq_domain_associate(d->domain, irq, irq);
-				if (unlikely(res)) {
-					pr_err("domain association failure\n");
-					continue;
-				}
-			} else {
-				pr_err("can't identity map IRQ %d\n", irq);
-				continue;
-			}
-		}
+		if (!intc_map(d->domain, irq))
+			continue;
 
 		intc_irq_xlate_set(irq, vect->enum_id, d);
 		intc_register_irq(desc, d, vect->enum_id, irq);
@@ -345,22 +351,8 @@ int __init register_intc_controller(struct intc_desc *desc)
 			 * IRQ support, each vector still needs to have
 			 * its own backing irq_desc.
 			 */
-			res = irq_create_identity_mapping(d->domain, irq2);
-			if (unlikely(res)) {
-				if (res == -EEXIST) {
-					res = irq_domain_associate(d->domain,
-								   irq2, irq2);
-					if (unlikely(res)) {
-						pr_err("domain association "
-						       "failure\n");
-						continue;
-					}
-				} else {
-					pr_err("can't identity map IRQ %d\n",
-					       irq);
-					continue;
-				}
-			}
+			if (!intc_map(d->domain, irq2))
+				continue;
 
 			vect2->enum_id = 0;
 
-- 
2.29.2

