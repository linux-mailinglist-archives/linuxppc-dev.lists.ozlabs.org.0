Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84184446256
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 11:43:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlxvG2tH2z3cQP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:43:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout2.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout2.mo529.mail-out.ovh.net
 (smtpout2.mo529.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlxtL0THyz2xDC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 21:43:05 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id AAAF7C9A1572;
 Fri,  5 Nov 2021 11:26:41 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 11:26:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003ece9bd96-cefe-4018-8c6f-65ff27458f5b,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 07/11] powerpc/xive: Add a debugfs file to dump EQs
Date: Fri, 5 Nov 2021 11:26:32 +0100
Message-ID: <20211105102636.1016378-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105102636.1016378-1-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 83a122aa-690c-43c6-a1f2-5c85f9bcb2ab
X-Ovh-Tracer-Id: 495677437099674589
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

The XIVE driver under Linux uses a single interrupt priority and only
one event queue is configured per CPU. Expose the contents under
a 'xive/eqs/cpuX' debugfs file.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index c5167f284da5..75c683ffae7e 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1775,9 +1775,40 @@ static int xive_ipi_debug_show(struct seq_file *m, void *private)
 }
 DEFINE_SHOW_ATTRIBUTE(xive_ipi_debug);
 
+static void xive_eq_debug_show_one(struct seq_file *m, struct xive_q *q, u8 prio)
+{
+	int i;
+
+	seq_printf(m, "EQ%d idx=%d T=%d\n", prio, q->idx, q->toggle);
+	if (q->qpage) {
+		for (i = 0; i < q->msk + 1; i++) {
+			if (!(i % 8))
+				seq_printf(m, "%05d ", i);
+			seq_printf(m, "%08x%s", be32_to_cpup(q->qpage + i),
+				   (i + 1) % 8 ? " " : "\n");
+		}
+	}
+	seq_puts(m, "\n");
+}
+
+static int xive_eq_debug_show(struct seq_file *m, void *private)
+{
+	int cpu = (long)m->private;
+	struct xive_cpu *xc = per_cpu(xive_cpu, cpu);
+
+	if (xc)
+		xive_eq_debug_show_one(m, &xc->queue[xive_irq_priority],
+				       xive_irq_priority);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(xive_eq_debug);
+
 static void xive_core_debugfs_create(void)
 {
 	struct dentry *xive_dir;
+	struct dentry *xive_eq_dir;
+	long cpu;
+	char name[16];
 
 	xive_dir = debugfs_create_dir("xive", arch_debugfs_dir);
 	if (IS_ERR(xive_dir))
@@ -1787,6 +1818,12 @@ static void xive_core_debugfs_create(void)
 			    NULL, &xive_ipi_debug_fops);
 	debugfs_create_file("interrupts", 0400, xive_dir,
 			    NULL, &xive_irq_debug_fops);
+	xive_eq_dir = debugfs_create_dir("eqs", xive_dir);
+	for_each_possible_cpu(cpu) {
+		snprintf(name, sizeof(name), "cpu%ld", cpu);
+		debugfs_create_file(name, 0400, xive_eq_dir, (void *)cpu,
+				    &xive_eq_debug_fops);
+	}
 }
 
 #endif /* CONFIG_DEBUG_FS */
-- 
2.31.1

