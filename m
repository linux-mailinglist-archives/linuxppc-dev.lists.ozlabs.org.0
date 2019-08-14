Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6F58D80C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 18:27:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467w3B1VMpzDq9V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 02:27:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.43.173; helo=6.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1799 seconds by postgrey-1.36 at bilbo;
 Thu, 15 Aug 2019 02:23:53 AEST
Received: from 6.mo3.mail-out.ovh.net (6.mo3.mail-out.ovh.net [188.165.43.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467vzF2lQ7zDqsK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 02:23:52 +1000 (AEST)
Received: from player770.ha.ovh.net (unknown [10.109.159.123])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 4F365223473
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:48:24 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id CECC78DDB6B2;
 Wed, 14 Aug 2019 15:48:17 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/3] powerpc/xmon: Add a dump of all XIVE interrupts
Date: Wed, 14 Aug 2019 17:47:54 +0200
Message-Id: <20190814154754.23682-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814154754.23682-1-clg@kaod.org>
References: <20190814154754.23682-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3262857933774490545
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddvledgfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Modify the xmon 'dxi' command to query all interrupts if no IRQ number
is specified.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/xmon/xmon.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 4ea53e05053f..dc9832e06256 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2584,6 +2584,25 @@ static void dump_one_xive_irq(u32 num)
 		    num, target, prio, lirq, rc);
 }
 
+static void dump_all_xive_irq(void)
+{
+	unsigned int i;
+	struct irq_desc *desc;
+
+	for_each_irq_desc(i, desc) {
+		struct irq_data *d = irq_desc_get_irq_data(desc);
+		unsigned int hwirq;
+
+		if (!d)
+			continue;
+
+		hwirq = (unsigned int)irqd_to_hwirq(d);
+		/* IPIs are special (HW number 0) */
+		if (hwirq)
+			dump_one_xive_irq(hwirq);
+	}
+}
+
 static void dump_xives(void)
 {
 	unsigned long num;
@@ -2601,6 +2620,8 @@ static void dump_xives(void)
 	} else if (c == 'i') {
 		if (scanhex(&num))
 			dump_one_xive_irq(num);
+		else
+			dump_all_xive_irq();
 		return;
 	}
 
-- 
2.21.0

