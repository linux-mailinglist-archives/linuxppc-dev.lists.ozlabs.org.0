Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05016269775
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 23:12:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqzZc6ygwzDqQx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 07:12:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqzXW01k4zDqQF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 07:10:18 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.145])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0E32B5B1318F;
 Mon, 14 Sep 2020 23:10:15 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 14 Sep
 2020 23:10:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0069d2b711e-b9c5-4053-b857-495bc219fef8,
 D669A8CAADBA69FE96853FFB68FF36F34E8DD5E5) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 4/7] powerpc/xive: Make debug routines static
Date: Mon, 14 Sep 2020 23:10:04 +0200
Message-ID: <20200914211007.2285999-5-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200914211007.2285999-1-clg@kaod.org>
References: <20200914211007.2285999-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: aacfb2f9-5e91-48d9-806e-dfaf43ba92fb
X-Ovh-Tracer-Id: 15867870337874824099
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudeiiedgudeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes a compile error with W=1.

CC      arch/powerpc/sysdev/xive/common.o
../arch/powerpc/sysdev/xive/common.c:1568:6: error: no previous prototype for ‘xive_debug_show_cpu’ [-Werror=missing-prototypes]
 void xive_debug_show_cpu(struct seq_file *m, int cpu)
      ^~~~~~~~~~~~~~~~~~~
../arch/powerpc/sysdev/xive/common.c:1602:6: error: no previous prototype for ‘xive_debug_show_irq’ [-Werror=missing-prototypes]
 void xive_debug_show_irq(struct seq_file *m, u32 hw_irq, struct irq_data *d)
      ^~~~~~~~~~~~~~~~~~~

Fixes: 930914b7d528 ("powerpc/xive: Add a debugfs file to dump internal XIVE state")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/sysdev/xive/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index f591be9f01f4..a80440af491a 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1565,7 +1565,7 @@ static int __init xive_off(char *arg)
 }
 __setup("xive=off", xive_off);
 
-void xive_debug_show_cpu(struct seq_file *m, int cpu)
+static void xive_debug_show_cpu(struct seq_file *m, int cpu)
 {
 	struct xive_cpu *xc = per_cpu(xive_cpu, cpu);
 
@@ -1599,7 +1599,7 @@ void xive_debug_show_cpu(struct seq_file *m, int cpu)
 	seq_puts(m, "\n");
 }
 
-void xive_debug_show_irq(struct seq_file *m, u32 hw_irq, struct irq_data *d)
+static void xive_debug_show_irq(struct seq_file *m, u32 hw_irq, struct irq_data *d)
 {
 	struct irq_chip *chip = irq_data_get_irq_chip(d);
 	int rc;
-- 
2.25.4

