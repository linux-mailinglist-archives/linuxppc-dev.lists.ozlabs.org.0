Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF3F3A7253
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 01:07:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3nCM2bdZz3cBV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:07:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=i0YsfTWy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=i0YsfTWy; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3n9d2RYwz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 09:05:41 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G3n9b00bLz9sWF; Tue, 15 Jun 2021 09:05:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G3n9Z5sHrz9sXG; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623711938; bh=loA3ouzsUnukPpgdl7oIDfl7IffKwidAdQGPfG0YPyo=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=i0YsfTWyGc/IZm2zfprO+XR60j2d7P2VPJKamX135shuGuIqSyHXnQoHzkRcnkhGW
 4BYbP6SpYCyTQ3PFvBRfs9DbL67wsD1oaUKDiz26OFELgEesqt9pHBRGmLkqHpcX8I
 WoMRdoyHdIVTV+tUHr6cnM28InTG8R1RWqSlOU9cfQ2UqNDYtTh/IWYxVfwFUCUvWX
 BbZd89FZSb9pD5coVbOpmmd3iWyJ+XoaD7PoKw715+/O5Lc1irIXQgw5DL5qABNiWb
 SO4ya6OLQrTCZXxTejqXIjcXaoc5NeL3J7XEHgW0VSkBAYMqZ9UiLjaoJBmL9Dsl+/
 U0pPmHReUqmwQ==
Date: Tue, 15 Jun 2021 08:57:43 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 01/11] powerpc: Add Microwatt platform
Message-ID: <YMfe56vkKKqtc0tQ@thinks.paulus.ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Microwatt is a FPGA-based implementation of the Power ISA.  It
currently only implements little-endian 64-bit mode, and does
not (yet) support SMP, VMX, VSX or transactional memory.

This adds a new machine type to support FPGA-based SoCs with a
Microwatt core.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/Kconfig                      |  2 +-
 arch/powerpc/platforms/Kconfig            |  1 +
 arch/powerpc/platforms/Makefile           |  1 +
 arch/powerpc/platforms/microwatt/Kconfig  |  9 +++++++++
 arch/powerpc/platforms/microwatt/Makefile |  1 +
 arch/powerpc/platforms/microwatt/setup.c  | 23 +++++++++++++++++++++++
 6 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/platforms/microwatt/Kconfig
 create mode 100644 arch/powerpc/platforms/microwatt/Makefile
 create mode 100644 arch/powerpc/platforms/microwatt/setup.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 386ae12d8523..5ce51c38a346 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -422,7 +422,7 @@ config HUGETLB_PAGE_SIZE_VARIABLE
 
 config MATH_EMULATION
 	bool "Math emulation"
-	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE
+	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE || PPC_MICROWATT
 	select PPC_FPU_REGS
 	help
 	  Some PowerPC chips designed for embedded applications do not have
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index 7a5e8f4541e3..74be4d06afbf 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -20,6 +20,7 @@ source "arch/powerpc/platforms/embedded6xx/Kconfig"
 source "arch/powerpc/platforms/44x/Kconfig"
 source "arch/powerpc/platforms/40x/Kconfig"
 source "arch/powerpc/platforms/amigaone/Kconfig"
+source "arch/powerpc/platforms/microwatt/Kconfig"
 
 config KVM_GUEST
 	bool "KVM Guest support"
diff --git a/arch/powerpc/platforms/Makefile b/arch/powerpc/platforms/Makefile
index 143d4417f6cc..edcb54cdb1a8 100644
--- a/arch/powerpc/platforms/Makefile
+++ b/arch/powerpc/platforms/Makefile
@@ -22,3 +22,4 @@ obj-$(CONFIG_PPC_CELL)		+= cell/
 obj-$(CONFIG_PPC_PS3)		+= ps3/
 obj-$(CONFIG_EMBEDDED6xx)	+= embedded6xx/
 obj-$(CONFIG_AMIGAONE)		+= amigaone/
+obj-$(CONFIG_PPC_MICROWATT)	+= microwatt/
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
new file mode 100644
index 000000000000..3be01e78ce57
--- /dev/null
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+config PPC_MICROWATT
+	depends on PPC_BOOK3S_64 && !SMP
+	bool "Microwatt SoC platform"
+	select PPC_XICS
+	select PPC_NATIVE
+	help
+          This option enables support for FPGA-based Microwatt implementations.
+
diff --git a/arch/powerpc/platforms/microwatt/Makefile b/arch/powerpc/platforms/microwatt/Makefile
new file mode 100644
index 000000000000..e6885b3b2ee7
--- /dev/null
+++ b/arch/powerpc/platforms/microwatt/Makefile
@@ -0,0 +1 @@
+obj-y	+= setup.o
diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
new file mode 100644
index 000000000000..d80d52612672
--- /dev/null
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -0,0 +1,23 @@
+/*
+ * Microwatt FPGA-based SoC platform setup code.
+ *
+ * Copyright 2020 Paul Mackerras (paulus@ozlabs.org), IBM Corp.
+ */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/stddef.h>
+#include <linux/init.h>
+#include <asm/machdep.h>
+#include <asm/time.h>
+
+static int __init microwatt_probe(void)
+{
+	return of_machine_is_compatible("microwatt-soc");
+}
+
+define_machine(microwatt) {
+	.name			= "microwatt",
+	.probe			= microwatt_probe,
+	.calibrate_decr		= generic_calibrate_decr,
+};
-- 
2.31.1

