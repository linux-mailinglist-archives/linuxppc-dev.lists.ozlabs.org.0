Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C8C35501B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 11:37:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF2VS2PXnz3bwk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 19:37:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF2Tl6GcLz3036
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 19:36:27 +1000 (AEST)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A0EE7613C2;
 Tue,  6 Apr 2021 09:36:25 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lTi8F-005owA-TP; Tue, 06 Apr 2021 10:36:24 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org
Subject: [PATCH 3/9] irqchip/jcore-aic: Kill use of
 irq_create_strict_mappings()
Date: Tue,  6 Apr 2021 10:35:51 +0100
Message-Id: <20210406093557.1073423-4-maz@kernel.org>
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

irq_create_strict_mappings() is a poor way to allow the use of
a linear IRQ domain as a legacy one. Let's be upfront about it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-jcore-aic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-jcore-aic.c b/drivers/irqchip/irq-jcore-aic.c
index 033bccb41455..5f47d8ee4ae3 100644
--- a/drivers/irqchip/irq-jcore-aic.c
+++ b/drivers/irqchip/irq-jcore-aic.c
@@ -100,11 +100,11 @@ static int __init aic_irq_of_init(struct device_node *node,
 	jcore_aic.irq_unmask = noop;
 	jcore_aic.name = "AIC";
 
-	domain = irq_domain_add_linear(node, dom_sz, &jcore_aic_irqdomain_ops,
+	domain = irq_domain_add_legacy(node, dom_sz - min_irq, min_irq, min_irq,
+				       &jcore_aic_irqdomain_ops,
 				       &jcore_aic);
 	if (!domain)
 		return -ENOMEM;
-	irq_create_strict_mappings(domain, min_irq, min_irq, dom_sz - min_irq);
 
 	return 0;
 }
-- 
2.29.2

