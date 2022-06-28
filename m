Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6EB55E2EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 15:36:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXQbk5BBsz3frk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 23:36:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=heyquark.com (client-ip=217.70.178.232; helo=relay12.mail.gandi.net; envelope-from=ash@heyquark.com; receiver=<UNKNOWN>)
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir; Tue, 28 Jun 2022 23:33:10 AEST
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXQX62HzBz3f3Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 23:33:10 +1000 (AEST)
Received: (Authenticated sender: ash@heyquark.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 802A2200004;
	Tue, 28 Jun 2022 13:33:00 +0000 (UTC)
From: Ash Logan <ash@heyquark.com>
To: krzysztof.kozlowski+dt@linaro.org,
	paulus@samba.org,
	mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	robh+dt@kernel.org,
	benh@kernel.crashing.org
Subject: [PATCH v3 10/12] powerpc: wiiu: platform support
Date: Tue, 28 Jun 2022 23:31:42 +1000
Message-Id: <20220628133144.142185-11-ash@heyquark.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628133144.142185-1-ash@heyquark.com>
References: <20220622131037.57604-1-ash@heyquark.com>
 <20220628133144.142185-1-ash@heyquark.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, rw-r-r-0644@protonmail.com, joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add platform support for the Nintendo Wii U console.

Signed-off-by: Ash Logan <ash@heyquark.com>
Co-developed-by: Roberto Van Eeden <rw-r-r-0644@protonmail.com>
Signed-off-by: Roberto Van Eeden <rw-r-r-0644@protonmail.com>
Co-developed-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
v2->v3: Use of_platform_default_populate instead of a custom match table.

 arch/powerpc/platforms/wiiu/Makefile |  2 +-
 arch/powerpc/platforms/wiiu/setup.c  | 60 ++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/platforms/wiiu/setup.c

diff --git a/arch/powerpc/platforms/wiiu/Makefile b/arch/powerpc/platforms/wiiu/Makefile
index fa16c60261e6..abcb7a1beebf 100644
--- a/arch/powerpc/platforms/wiiu/Makefile
+++ b/arch/powerpc/platforms/wiiu/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_WIIU) += espresso-pic.o latte-pic.o
+obj-$(CONFIG_WIIU) += setup.o espresso-pic.o latte-pic.o
 obj-$(CONFIG_LATTEIPC_UDBG) += udbg_latteipc.o
diff --git a/arch/powerpc/platforms/wiiu/setup.c b/arch/powerpc/platforms/wiiu/setup.c
new file mode 100644
index 000000000000..e3f07ce65cad
--- /dev/null
+++ b/arch/powerpc/platforms/wiiu/setup.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Nintendo Wii U board-specific support
+ *
+ * Copyright (C) 2022 The linux-wiiu Team
+ */
+#define DRV_MODULE_NAME "wiiu"
+#define pr_fmt(fmt) DRV_MODULE_NAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/of_platform.h>
+
+#include <asm/machdep.h>
+#include <asm/udbg.h>
+
+#include "espresso-pic.h"
+#include "latte-pic.h"
+#include "udbg_latteipc.h"
+
+static int __init wiiu_probe(void)
+{
+	if (!of_machine_is_compatible("nintendo,wiiu"))
+		return 0;
+
+	latteipc_udbg_init();
+
+	return 1;
+}
+
+static void __noreturn wiiu_halt(void)
+{
+	for (;;)
+		cpu_relax();
+}
+
+static void __init wiiu_init_irq(void)
+{
+	espresso_pic_init();
+	latte_pic_init();
+}
+
+static int __init wiiu_device_probe(void)
+{
+	if (!machine_is(wiiu))
+		return 0;
+
+	of_platform_default_populate(NULL, NULL, NULL);
+	return 0;
+}
+device_initcall(wiiu_device_probe);
+
+define_machine(wiiu) {
+	.name = "wiiu",
+	.probe = wiiu_probe,
+	.halt = wiiu_halt,
+	.progress = udbg_progress,
+	.calibrate_decr = generic_calibrate_decr,
+	.init_IRQ = wiiu_init_irq,
+	.get_irq = espresso_pic_get_irq,
+};
-- 
2.36.1

