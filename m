Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBCAAE61E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 10:58:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SJpH1Tw2zDqvd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 18:57:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.251.49; helo=2.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 2.mo173.mail-out.ovh.net (2.mo173.mail-out.ovh.net
 [178.33.251.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SJkq4mcvzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 18:54:58 +1000 (AEST)
Received: from player694.ha.ovh.net (unknown [10.108.57.183])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id CCED9118ED0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 10:19:18 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player694.ha.ovh.net (Postfix) with ESMTPSA id 5CF3098EF5A5;
 Tue, 10 Sep 2019 08:19:15 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] powerpc/xmon: Fix output of XIVE IPI
Date: Tue, 10 Sep 2019 10:18:50 +0200
Message-Id: <20190910081850.26038-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910081850.26038-1-clg@kaod.org>
References: <20190910081850.26038-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6667016301829917617
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudekkedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
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
Cc: linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When dumping the XIVE state of an CPU IPI, xmon does not check if the
CPU is started or not which can cause an error. Add a check for that
and change the output to be on one line just as the XIVE interrupts of
the machine.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 85a27ec49d34..20f45b8a52ab 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -237,25 +237,30 @@ static notrace void xive_dump_eq(const char *name, struct xive_q *q)
 	i0 = be32_to_cpup(q->qpage + idx);
 	idx = (idx + 1) & q->msk;
 	i1 = be32_to_cpup(q->qpage + idx);
-	xmon_printf("  %s Q T=%d %08x %08x ...\n", name,
-		    q->toggle, i0, i1);
+	xmon_printf("%s idx=%d T=%d %08x %08x ...", name,
+		     q->idx, q->toggle, i0, i1);
 }
 
 notrace void xmon_xive_do_dump(int cpu)
 {
 	struct xive_cpu *xc = per_cpu(xive_cpu, cpu);
 
-	xmon_printf("XIVE state for CPU %d:\n", cpu);
-	xmon_printf("  pp=%02x cppr=%02x\n", xc->pending_prio, xc->cppr);
-	xive_dump_eq("IRQ", &xc->queue[xive_irq_priority]);
+	xmon_printf("CPU %d:", cpu);
+	if (xc) {
+		xmon_printf("pp=%02x CPPR=%02x ", xc->pending_prio, xc->cppr);
+
 #ifdef CONFIG_SMP
-	{
-		u64 val = xive_esb_read(&xc->ipi_data, XIVE_ESB_GET);
-		xmon_printf("  IPI state: %x:%c%c\n", xc->hw_ipi,
-			val & XIVE_ESB_VAL_P ? 'P' : 'p',
-			val & XIVE_ESB_VAL_Q ? 'Q' : 'q');
-	}
+		{
+			u64 val = xive_esb_read(&xc->ipi_data, XIVE_ESB_GET);
+
+			xmon_printf("IPI=0x%08x PQ=%c%c ", xc->hw_ipi,
+				    val & XIVE_ESB_VAL_P ? 'P' : '-',
+				    val & XIVE_ESB_VAL_Q ? 'Q' : '-');
+		}
 #endif
+		xive_dump_eq("EQ", &xc->queue[xive_irq_priority]);
+	}
+	xmon_printf("\n");
 }
 
 int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d)
-- 
2.21.0

