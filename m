Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 645912652D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 23:25:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnX3H2ZS8zDqc6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:24:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnWYx2QlGzDqgp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 07:02:59 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.7])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 161CB603F5FA;
 Thu, 10 Sep 2020 23:02:55 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Sep
 2020 23:02:54 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00553b5bfe6-4c69-4ba2-bc6e-b8c6f20685bb,
 8FE11AEDAF16247B821E16C08928A26F58BE1972) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 4/7] powerpc/xive: Fix W=1 compile warning
Date: Thu, 10 Sep 2020 23:02:47 +0200
Message-ID: <20200910210250.1962595-5-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200910210250.1962595-1-clg@kaod.org>
References: <20200910210250.1962595-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5c6e7a1e-25de-4dc2-920c-ef52497d9875
X-Ovh-Tracer-Id: 10699989768436681693
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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

CC      arch/powerpc/sysdev/xive/common.o
../arch/powerpc/sysdev/xive/common.c:1568:6: error: no previous prototype for ‘xive_debug_show_cpu’ [-Werror=missing-prototypes]
 void xive_debug_show_cpu(struct seq_file *m, int cpu)
      ^~~~~~~~~~~~~~~~~~~
../arch/powerpc/sysdev/xive/common.c:1602:6: error: no previous prototype for ‘xive_debug_show_irq’ [-Werror=missing-prototypes]
 void xive_debug_show_irq(struct seq_file *m, u32 hw_irq, struct irq_data *d)
      ^~~~~~~~~~~~~~~~~~~

Signed-off-by: Cédric Le Goater <clg@kaod.org>
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

