Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE899446234
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 11:32:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlxfB5HZLz3c4c
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:32:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.49.222;
 helo=6.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 326 seconds by postgrey-1.36 at boromir;
 Fri, 05 Nov 2021 21:32:13 AEDT
Received: from 6.mo552.mail-out.ovh.net (6.mo552.mail-out.ovh.net
 [188.165.49.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlxdn0FCqz2xSH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 21:32:12 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BD81622D41;
 Fri,  5 Nov 2021 10:26:42 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 11:26:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003f7f03723-f5ea-4934-92e1-76ba58040151,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 09/11] powerpc/xive: Add a kernel parameter for StoreEOI
Date: Fri, 5 Nov 2021 11:26:34 +0100
Message-ID: <20211105102636.1016378-10-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105102636.1016378-1-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3571044e-ca71-485d-8da9-c2fa8c163fd4
X-Ovh-Tracer-Id: 495958912513706973
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

StoreEOI is activated by default on platforms supporting the feature
(POWER10) and will be used as soon as firmware advertises its
availability. The kernel parameter provides a way to deactivate its
use. It can be still be reactivated through debugfs.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c               | 13 +++++++++++++
 Documentation/admin-guide/kernel-parameters.txt |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 11e2aaa13965..67fd3a306369 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1713,6 +1713,19 @@ static int __init xive_off(char *arg)
 }
 __setup("xive=off", xive_off);
 
+static int __init xive_store_eoi_cmdline(char *arg)
+{
+	if (!arg)
+		return -EINVAL;
+
+	if (strncmp(arg, "off", 3) == 0) {
+		pr_info("StoreEOI disabled on kernel command line\n");
+		xive_store_eoi = false;
+	}
+	return 0;
+}
+__setup("xive.store-eoi=", xive_store_eoi_cmdline);
+
 #ifdef CONFIG_DEBUG_FS
 static void xive_debug_show_ipi(struct seq_file *m, int cpu)
 {
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 43dc35fe5bc0..10fa093251e8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6387,6 +6387,12 @@
 				  controller on both pseries and powernv
 				  platforms. Only useful on POWER9 and above.
 
+	xive.store-eoi=off	[PPC]
+			By default on POWER10 and above, the kernel will use
+			stores for EOI handling when the XIVE interrupt mode
+			is active. This option allows the XIVE driver to use
+			loads instead, as on POWER9.
+
 	xhci-hcd.quirks		[USB,KNL]
 			A hex value specifying bitmask with supplemental xhci
 			host controller quirks. Meaning of each bit can be
-- 
2.31.1

