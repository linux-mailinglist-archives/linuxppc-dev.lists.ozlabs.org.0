Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 630C4554ABB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 15:15:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSkQ92StTz3fVC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 23:15:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=heyquark.com (client-ip=2001:4b98:dc4:8::229; helo=relay9-d.mail.gandi.net; envelope-from=ash@heyquark.com; receiver=<UNKNOWN>)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSkLY3dTbz3c8V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 23:12:04 +1000 (AEST)
Received: (Authenticated sender: ash@heyquark.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7837BFF804;
	Wed, 22 Jun 2022 13:11:54 +0000 (UTC)
From: Ash Logan <ash@heyquark.com>
To: paulus@samba.org,
	mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	robh+dt@kernel.org,
	benh@kernel.crashing.org
Subject: [PATCH v2 10/12] powerpc: wiiu: platform support
Date: Wed, 22 Jun 2022 23:10:35 +1000
Message-Id: <20220622131037.57604-11-ash@heyquark.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622131037.57604-1-ash@heyquark.com>
References: <20220302044406.63401-1-ash@heyquark.com>
 <20220622131037.57604-1-ash@heyquark.com>
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
Cc: devicetree@vger.kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, rw-r-r-0644@protonmail.com, linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add platform support for the Nintendo Wii U console.

Signed-off-by: Ash Logan <ash@heyquark.com>
Co-developed-by: Roberto Van Eeden <rw-r-r-0644@protonmail.com>
Signed-off-by: Roberto Van Eeden <rw-r-r-0644@protonmail.com>
Co-developed-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 arch/powerpc/platforms/wiiu/Makefile |  2 +-
 arch/powerpc/platforms/wiiu/setup.c  | 67 ++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)
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
index 000000000000..279fa899a296
--- /dev/null
+++ b/arch/powerpc/platforms/wiiu/setup.c
@@ -0,0 +1,67 @@
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
+static const struct of_device_id wiiu_of_bus[] = {
+	{
+		.compatible = "nintendo,latte",
+	},
+	{},
+};
+
+static int __init wiiu_device_probe(void)
+{
+	if (!machine_is(wiiu))
+		return 0;
+
+	of_platform_populate(NULL, wiiu_of_bus, NULL, NULL);
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

