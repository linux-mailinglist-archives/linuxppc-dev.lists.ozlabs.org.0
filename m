Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C253F55E147
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 15:33:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXQXh4Z0Dz3fBB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 23:33:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=heyquark.com (client-ip=2001:4b98:dc4:8::232; helo=relay12.mail.gandi.net; envelope-from=ash@heyquark.com; receiver=<UNKNOWN>)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXQW85P54z3cg2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 23:32:20 +1000 (AEST)
Received: (Authenticated sender: ash@heyquark.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2CCBB20001C;
	Tue, 28 Jun 2022 13:32:11 +0000 (UTC)
From: Ash Logan <ash@heyquark.com>
To: krzysztof.kozlowski+dt@linaro.org,
	paulus@samba.org,
	mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	robh+dt@kernel.org,
	benh@kernel.crashing.org
Subject: [PATCH v3 03/12] powerpc: wiiu: bootwrapper support
Date: Tue, 28 Jun 2022 23:31:35 +1000
Message-Id: <20220628133144.142185-4-ash@heyquark.com>
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

Add support for the Nintendo Wii U game console to the powerpc
bootwrapper.

Signed-off-by: Ash Logan <ash@heyquark.com>
Co-developed-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 arch/powerpc/boot/Makefile    |   4 ++
 arch/powerpc/boot/wiiu-head.S | 103 ++++++++++++++++++++++++++++++++++
 arch/powerpc/boot/wiiu.c      |  73 ++++++++++++++++++++++++
 arch/powerpc/boot/wrapper     |   4 ++
 4 files changed, 184 insertions(+)
 create mode 100644 arch/powerpc/boot/wiiu-head.S
 create mode 100644 arch/powerpc/boot/wiiu.c

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index a9cd2ea4a861..6694f578c447 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -161,6 +161,7 @@ src-plat-$(CONFIG_EMBEDDED6xx) += cuboot-pq2.c cuboot-mpc7448hpc2.c \
 					gamecube-head.S gamecube.c \
 					wii-head.S wii.c holly.c \
 					fixed-head.S mvme5100.c
+src-plat-$(CONFIG_WIIU) += wiiu-head.S wiiu.c
 src-plat-$(CONFIG_AMIGAONE) += cuboot-amigaone.c
 src-plat-$(CONFIG_PPC_PS3) += ps3-head.S ps3-hvcall.S ps3.c
 src-plat-$(CONFIG_EPAPR_BOOT) += epapr.c epapr-wrapper.c
@@ -359,6 +360,9 @@ image-$(CONFIG_GAMECUBE)		+= dtbImage.gamecube
 image-$(CONFIG_WII)			+= dtbImage.wii
 image-$(CONFIG_MVME5100)		+= dtbImage.mvme5100
 
+# Board port in arch/powerpc/platform/wiiu/Kconfig
+image-$(CONFIG_WIIU)			+= dtbImage.wiiu
+
 # Board port in arch/powerpc/platform/amigaone/Kconfig
 image-$(CONFIG_AMIGAONE)		+= cuImage.amigaone
 
diff --git a/arch/powerpc/boot/wiiu-head.S b/arch/powerpc/boot/wiiu-head.S
new file mode 100644
index 000000000000..8586e2e992d5
--- /dev/null
+++ b/arch/powerpc/boot/wiiu-head.S
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Entrypoint head asm
+ * This code expects to be called directly after the Espresso BootROM, which implies certain MSR
+ * states.
+ *
+ * Nintendo Wii U bootwrapper support
+ * Copyright (C) 2022 The linux-wiiu Team
+ */
+
+#include "ppc_asm.h"
+
+.text
+.global _zimage_start
+_zimage_start:
+	/* Clear out all BATs. MMU is already off. */
+	li r8, 0
+
+	mtspr 0x210, r8 /* IBAT0U */
+	mtspr 0x212, r8 /* IBAT1U */
+	mtspr 0x214, r8 /* IBAT2U */
+	mtspr 0x216, r8 /* IBAT3U */
+	mtspr 0x218, r8 /* DBAT0U */
+	mtspr 0x21a, r8 /* DBAT1U */
+	mtspr 0x21c, r8 /* DBAT2U */
+	mtspr 0x21e, r8 /* DBAT3U */
+
+	mtspr 0x230, r8 /* IBAT4U */
+	mtspr 0x232, r8 /* IBAT5U */
+	mtspr 0x234, r8 /* IBAT6U */
+	mtspr 0x236, r8 /* IBAT7U */
+	mtspr 0x238, r8 /* DBAT4U */
+	mtspr 0x23a, r8 /* DBAT5U */
+	mtspr 0x23c, r8 /* DBAT6U */
+	mtspr 0x23e, r8 /* DBAT7U */
+
+	/* MEM1 */
+	/* 32MB, starting at 0x00000000... */
+	li r8, 0x000003ff@l
+	mtspr 0x21a, r8 /* DBAT1U */
+	mtspr 0x212, r8 /* IBAT1U */
+
+	/* mapped into phys 0x00000000; read-write; normal caching. */
+	li r8, 0x00000002@l
+	mtspr 0x21b, r8 /* DBAT1L */
+	mtspr 0x213, r8 /* IBAT1L */
+
+	/* Latte MMIO area */
+	/* 64MB, starting at 0x0d800000... */
+	lis r8, 0x0d8007ff@h
+	ori r8, r8,0x0d800007ff@l
+	mtspr 0x21c, r8 /* DBAT2U */
+
+	/* mapped into phys 0x0d800000; read-write; writethrough/nocache/guard*/
+	lis r8, 0x0d80006A@h
+	ori r8, r8,0x0d80006A@l
+	mtspr 0x21d, r8 /* DBAT2L */
+
+	/* Bootloader comms area (actually 0x89200000) */
+	/* 128MiB, starting at 0x88000000... */
+	lis r8, 0x88000fff@h
+	ori r8, r8, 0x88000fff@l
+	mtspr 0x21e, r8 /* DBAT3U */
+
+	/* mapped into phys 0x88000000; read-write; normal caching. */
+	lis r8, 0x88000002@h
+	ori r8, r8, 0x88000002@l
+	mtspr 0x21f, r8 /* DBAT3L */
+
+	/* Turn on BAT 4 through 7, configure CPU */
+	mfspr r8, 0x3f3 /* HID4 */
+	oris r8, r8, 0x3200 /* L2FM: 64-byte fetch, BPD: max depth is 4, SBE */
+	mtspr 0x3f3, r8
+
+	/* Turn on and invalidate caches */
+	mfspr r8, 0x3f0 /* HID0 */
+	/* HID0_ICE | HID0_ICFI | HID0_DCE | HID0_DCFI */
+	ori r8, r8, (1 << 15) | (1 << 11) | (1 << 14) | (1 << 10)
+	mtspr 0x3f0, r8
+	isync
+
+	li r3, 0
+	li r4, 0
+	li r5, 0
+
+	bl get_lr
+get_lr:
+	mflr r8
+	/* Get absolute address of done */
+	addi r8, r8, done - get_lr
+
+	/* Set up MSR */
+	/* MSR_DR | MSR_IR | MSR_FP */
+	/* Data/instruction MMUs, FPU because why not */
+	ori r9, r3, (1 << 4) | (1 << 5) | (1 << 13)
+
+	/* Apply our new MSR, starting execution at "done" */
+	mtsrr0 r8
+	mtsrr1 r9
+	sync
+	rfi
+done:
+	b _zimage_start_lib
diff --git a/arch/powerpc/boot/wiiu.c b/arch/powerpc/boot/wiiu.c
new file mode 100644
index 000000000000..fe88eb2c42ae
--- /dev/null
+++ b/arch/powerpc/boot/wiiu.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Platform support and IPC debug console to linux-loader (on Starbuck)
+ *
+ * Nintendo Wii U bootwrapper support
+ * Copyright (C) 2022 The linux-wiiu Team
+ */
+
+#include <stddef.h>
+#include "string.h"
+#include "stdio.h"
+#include "types.h"
+#include "io.h"
+#include "ops.h"
+
+BSS_STACK(8192);
+
+// Volatile is used here since the io.h routines require it
+#define LT_IPC_PPCMSG ((volatile u32 *)0x0d800000)
+#define LT_IPC_PPCCTRL ((volatile u32 *)0x0d800004)
+#define LT_IPC_PPCCTRL_X1 0x1
+
+#define WIIU_LOADER_CMD_PRINT 0x01000000
+
+static void wiiu_ipc_sendmsg(int msg)
+{
+	out_be32(LT_IPC_PPCMSG, msg);
+	out_be32(LT_IPC_PPCCTRL, LT_IPC_PPCCTRL_X1);
+	while (in_be32(LT_IPC_PPCCTRL) & LT_IPC_PPCCTRL_X1)
+		barrier();
+}
+
+/*
+ * Send logging string out over IPC to linux-loader for early printing.
+ * Packs 3 chars at a time where possible.
+ */
+static void wiiu_write_ipc(const char *buf, int len)
+{
+	int i = 0;
+
+	for (i = 0; i + 2 < len; i += 3) {
+		int msg = WIIU_LOADER_CMD_PRINT | (buf[i + 0] << 16) |
+			  (buf[i + 1] << 8) | buf[i + 2];
+
+		wiiu_ipc_sendmsg(msg);
+	}
+
+	if (i < len) {
+		for (; i < len; i++) {
+			int msg = WIIU_LOADER_CMD_PRINT | (buf[i] << 16);
+
+			wiiu_ipc_sendmsg(msg);
+		}
+	}
+}
+
+/*
+ * Note 32MiB heap - not ideal but seems fine for the bootwrapper
+ */
+void platform_init(unsigned int r3, unsigned int r4, unsigned int r5)
+{
+	u32 heapsize;
+
+	console_ops.write = wiiu_write_ipc;
+	printf("wiiu: bootwrapper ok\n");
+
+	heapsize = 32 * 1024 * 1024 - (u32)_end;
+	simple_alloc_init(_end, heapsize, 32, 64);
+	printf("wiiu: heap ok\n");
+
+	fdt_init(_dtb_start);
+	printf("wiiu: dtb ok\n");
+}
diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 55978f32fa77..83b74ffaae2b 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -344,6 +344,10 @@ gamecube|wii)
     link_address='0x600000'
     platformo="$object/$platform-head.o $object/$platform.o"
     ;;
+wiiu)
+    link_address='0x600000'
+    platformo="$object/wiiu-head.o $object/$platform.o"
+    ;;
 microwatt)
     link_address='0x500000'
     platformo="$object/fixed-head.o $object/$platform.o"
-- 
2.36.1

