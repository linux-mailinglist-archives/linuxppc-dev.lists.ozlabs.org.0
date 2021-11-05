Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B5444622F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 11:27:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlxX06RX3z3c59
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:27:12 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlxWW3fWYz2xtF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 21:26:46 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EAD48C9A156C;
 Fri,  5 Nov 2021 11:26:40 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 11:26:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0035d90eecd-48f9-43f3-b26e-2a140e980167,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 04/11] powerpc/xive: Introduce xive_core_debugfs_create()
Date: Fri, 5 Nov 2021 11:26:29 +0100
Message-ID: <20211105102636.1016378-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105102636.1016378-1-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 072d16d5-ac5c-43d9-bec2-1348a123ece9
X-Ovh-Tracer-Id: 495395962630802397
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

and fix some compile issues when !CONFIG_DEBUG_FS.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 3d558cad1f19..b71cc1020296 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -227,6 +227,7 @@ static void xive_esb_write(struct xive_irq_data *xd, u32 offset, u64 data)
 		out_be64(xd->eoi_mmio + offset, data);
 }
 
+#if defined(CONFIG_XMON) || defined(CONFIG_DEBUG_FS)
 static void xive_irq_data_dump(struct xive_irq_data *xd, char *buffer, size_t size)
 {
 	u64 val = xive_esb_read(xd, XIVE_ESB_GET);
@@ -239,6 +240,7 @@ static void xive_irq_data_dump(struct xive_irq_data *xd, char *buffer, size_t si
 		 val & XIVE_ESB_VAL_Q ? 'Q' : '-',
 		 xd->trig_page, xd->eoi_page);
 }
+#endif
 
 #ifdef CONFIG_XMON
 static notrace void xive_dump_eq(const char *name, struct xive_q *q)
@@ -1701,6 +1703,7 @@ static int __init xive_off(char *arg)
 }
 __setup("xive=off", xive_off);
 
+#ifdef CONFIG_DEBUG_FS
 static void xive_debug_show_cpu(struct seq_file *m, int cpu)
 {
 	struct xive_cpu *xc = per_cpu(xive_cpu, cpu);
@@ -1779,10 +1782,18 @@ static int xive_core_debug_show(struct seq_file *m, void *private)
 }
 DEFINE_SHOW_ATTRIBUTE(xive_core_debug);
 
+static void xive_core_debugfs_create(void)
+{
+	debugfs_create_file("xive", 0400, arch_debugfs_dir,
+			    NULL, &xive_core_debug_fops);
+}
+
+#endif /* CONFIG_DEBUG_FS */
+
 int xive_core_debug_init(void)
 {
-	if (xive_enabled())
-		debugfs_create_file("xive", 0400, arch_debugfs_dir,
-				    NULL, &xive_core_debug_fops);
+	if (xive_enabled() && IS_ENABLED(CONFIG_DEBUG_FS))
+		xive_core_debugfs_create();
+
 	return 0;
 }
-- 
2.31.1

