Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D58446255
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 11:43:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlxtp5hmzz3c8g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:43:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 977 seconds by postgrey-1.36 at boromir;
 Fri, 05 Nov 2021 21:43:04 AEDT
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlxtJ4zWFz2xDC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 21:43:04 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 796F0C9A156F;
 Fri,  5 Nov 2021 11:26:41 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 11:26:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0031e04f5d0-ada2-4a86-97cd-017a37843ec6,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 05/11] powerpc/xive: Change the debugfs file 'xive' into a
 directory
Date: Fri, 5 Nov 2021 11:26:30 +0100
Message-ID: <20211105102636.1016378-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105102636.1016378-1-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9a21ceb6-4b6c-4bd7-9a4f-6df428873584
X-Ovh-Tracer-Id: 495395961320082397
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

Use a 'cpus' file to dump CPU states and 'interrupts' to dump IRQ states.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 36 +++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index b71cc1020296..0b34ad5748ee 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1760,17 +1760,10 @@ static void xive_debug_show_irq(struct seq_file *m, struct irq_data *d)
 	seq_puts(m, "\n");
 }
 
-static int xive_core_debug_show(struct seq_file *m, void *private)
+static int xive_irq_debug_show(struct seq_file *m, void *private)
 {
 	unsigned int i;
 	struct irq_desc *desc;
-	int cpu;
-
-	if (xive_ops->debug_show)
-		xive_ops->debug_show(m, private);
-
-	for_each_possible_cpu(cpu)
-		xive_debug_show_cpu(m, cpu);
 
 	for_each_irq_desc(i, desc) {
 		struct irq_data *d = irq_domain_get_irq_data(xive_irq_domain, i);
@@ -1780,12 +1773,33 @@ static int xive_core_debug_show(struct seq_file *m, void *private)
 	}
 	return 0;
 }
-DEFINE_SHOW_ATTRIBUTE(xive_core_debug);
+DEFINE_SHOW_ATTRIBUTE(xive_irq_debug);
+
+static int xive_cpu_debug_show(struct seq_file *m, void *private)
+{
+	int cpu;
+
+	if (xive_ops->debug_show)
+		xive_ops->debug_show(m, private);
+
+	for_each_possible_cpu(cpu)
+		xive_debug_show_cpu(m, cpu);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(xive_cpu_debug);
 
 static void xive_core_debugfs_create(void)
 {
-	debugfs_create_file("xive", 0400, arch_debugfs_dir,
-			    NULL, &xive_core_debug_fops);
+	struct dentry *xive_dir;
+
+	xive_dir = debugfs_create_dir("xive", arch_debugfs_dir);
+	if (IS_ERR(xive_dir))
+		return;
+
+	debugfs_create_file("cpus", 0400, xive_dir,
+			    NULL, &xive_cpu_debug_fops);
+	debugfs_create_file("interrupts", 0400, xive_dir,
+			    NULL, &xive_irq_debug_fops);
 }
 
 #endif /* CONFIG_DEBUG_FS */
-- 
2.31.1

