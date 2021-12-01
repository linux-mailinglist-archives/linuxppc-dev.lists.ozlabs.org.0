Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4BF465367
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 17:54:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J44vH2JFGz3cTn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 03:54:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J44ts4BK2z2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 03:54:27 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.179])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0EE2DCF3B2D0;
 Wed,  1 Dec 2021 17:54:20 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 1 Dec
 2021 17:54:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0025022e13d-74ca-4688-93a6-628411ca09a0,
 A214034E9EDAB49BEA2160BF49F8C38F118F2259) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/xive: Fix compile when !CONFIG_PPC_POWERNV.
Date: Wed, 1 Dec 2021 17:54:18 +0100
Message-ID: <20211201165418.1041842-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 364d482b-59c9-45db-9c14-0b962c5b54d4
X-Ovh-Tracer-Id: 12158593098004073440
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieefgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The automatic "save & restore" of interrupt context is a POWER10/XIVE2
feature exploited by KVM under the PowerNV platform. It is not
available under pSeries and the associated toggle should not be
exposed under the XIVE debugfs directory.

Introduce a platform handler for debugfs initialization and move the
'save-restore' entry under the native (PowerNV) backend to fix compile
when !CONFIG_PPC_POWERNV.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 1e7684dc4fc7 ("powerpc/xive: Add a debugfs toggle for save-restore")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/xive-internal.h |  1 +
 arch/powerpc/sysdev/xive/common.c        |  4 +++-
 arch/powerpc/sysdev/xive/native.c        | 11 +++++++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysdev/xive/xive-internal.h
index e0941bc64430..fe6d95d54af9 100644
--- a/arch/powerpc/sysdev/xive/xive-internal.h
+++ b/arch/powerpc/sysdev/xive/xive-internal.h
@@ -58,6 +58,7 @@ struct xive_ops {
 	void	(*put_ipi)(unsigned int cpu, struct xive_cpu *xc);
 #endif
 	int	(*debug_show)(struct seq_file *m, void *private);
+	int	(*debug_create)(struct dentry *xive_dir);
 	const char *name;
 };
 
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 43f7f7df6407..1ca5564bda9d 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1847,7 +1847,9 @@ static void xive_core_debugfs_create(void)
 				    &xive_eq_debug_fops);
 	}
 	debugfs_create_bool("store-eoi", 0600, xive_dir, &xive_store_eoi);
-	debugfs_create_bool("save-restore", 0600, xive_dir, &xive_has_save_restore);
+
+	if (xive_ops->debug_create)
+		xive_ops->debug_create(xive_dir);
 }
 #else
 static inline void xive_core_debugfs_create(void) { }
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index d6a091dc1bce..d4243dab230e 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -461,6 +461,14 @@ void xive_native_sync_queue(u32 hw_irq)
 }
 EXPORT_SYMBOL_GPL(xive_native_sync_queue);
 
+#ifdef CONFIG_DEBUG_FS
+static int xive_native_debug_create(struct dentry *xive_dir)
+{
+	debugfs_create_bool("save-restore", 0600, xive_dir, &xive_has_save_restore);
+	return 0;
+}
+#endif
+
 static const struct xive_ops xive_native_ops = {
 	.populate_irq_data	= xive_native_populate_irq_data,
 	.configure_irq		= xive_native_configure_irq,
@@ -478,6 +486,9 @@ static const struct xive_ops xive_native_ops = {
 	.get_ipi		= xive_native_get_ipi,
 	.put_ipi		= xive_native_put_ipi,
 #endif /* CONFIG_SMP */
+#ifdef CONFIG_DEBUG_FS
+	.debug_create		= xive_native_debug_create,
+#endif /* CONFIG_DEBUG_FS */
 	.name			= "native",
 };
 
-- 
2.31.1

