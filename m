Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E64446239
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 11:34:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlxhc6c1Nz3dfB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:34:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.54.81;
 helo=smtpout3.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 361 seconds by postgrey-1.36 at boromir;
 Fri, 05 Nov 2021 21:32:48 AEDT
Received: from smtpout3.mo529.mail-out.ovh.net
 (smtpout3.mo529.mail-out.ovh.net [46.105.54.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlxfS0XJ1z3c7K
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 21:32:47 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 92413C9A1571;
 Fri,  5 Nov 2021 11:26:41 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 11:26:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0034f3c7ac2-6295-4ef8-b283-d10c608b965a,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 06/11] powerpc/xive: Rename the 'cpus' debugfs file to 'ipis'
Date: Fri, 5 Nov 2021 11:26:31 +0100
Message-ID: <20211105102636.1016378-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105102636.1016378-1-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f7e6f8c0-5cdf-4e07-a815-43ecea38990c
X-Ovh-Tracer-Id: 495677435290291165
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeigdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

and remove the EQ entries output which is not very useful since only
the next two events of the queue are taken into account. We will
improve the dump of the EQ in the next patches.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 0b34ad5748ee..c5167f284da5 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1704,11 +1704,11 @@ static int __init xive_off(char *arg)
 __setup("xive=off", xive_off);
 
 #ifdef CONFIG_DEBUG_FS
-static void xive_debug_show_cpu(struct seq_file *m, int cpu)
+static void xive_debug_show_ipi(struct seq_file *m, int cpu)
 {
 	struct xive_cpu *xc = per_cpu(xive_cpu, cpu);
 
-	seq_printf(m, "CPU %d:", cpu);
+	seq_printf(m, "CPU %d: ", cpu);
 	if (xc) {
 		seq_printf(m, "pp=%02x CPPR=%02x ", xc->pending_prio, xc->cppr);
 
@@ -1720,19 +1720,6 @@ static void xive_debug_show_cpu(struct seq_file *m, int cpu)
 			seq_printf(m, "IPI=0x%08x %s", xc->hw_ipi, buffer);
 		}
 #endif
-		{
-			struct xive_q *q = &xc->queue[xive_irq_priority];
-			u32 i0, i1, idx;
-
-			if (q->qpage) {
-				idx = q->idx;
-				i0 = be32_to_cpup(q->qpage + idx);
-				idx = (idx + 1) & q->msk;
-				i1 = be32_to_cpup(q->qpage + idx);
-				seq_printf(m, "EQ idx=%d T=%d %08x %08x ...",
-					   q->idx, q->toggle, i0, i1);
-			}
-		}
 	}
 	seq_puts(m, "\n");
 }
@@ -1775,7 +1762,7 @@ static int xive_irq_debug_show(struct seq_file *m, void *private)
 }
 DEFINE_SHOW_ATTRIBUTE(xive_irq_debug);
 
-static int xive_cpu_debug_show(struct seq_file *m, void *private)
+static int xive_ipi_debug_show(struct seq_file *m, void *private)
 {
 	int cpu;
 
@@ -1783,10 +1770,10 @@ static int xive_cpu_debug_show(struct seq_file *m, void *private)
 		xive_ops->debug_show(m, private);
 
 	for_each_possible_cpu(cpu)
-		xive_debug_show_cpu(m, cpu);
+		xive_debug_show_ipi(m, cpu);
 	return 0;
 }
-DEFINE_SHOW_ATTRIBUTE(xive_cpu_debug);
+DEFINE_SHOW_ATTRIBUTE(xive_ipi_debug);
 
 static void xive_core_debugfs_create(void)
 {
@@ -1796,8 +1783,8 @@ static void xive_core_debugfs_create(void)
 	if (IS_ERR(xive_dir))
 		return;
 
-	debugfs_create_file("cpus", 0400, xive_dir,
-			    NULL, &xive_cpu_debug_fops);
+	debugfs_create_file("ipis", 0400, xive_dir,
+			    NULL, &xive_ipi_debug_fops);
 	debugfs_create_file("interrupts", 0400, xive_dir,
 			    NULL, &xive_irq_debug_fops);
 }
-- 
2.31.1

