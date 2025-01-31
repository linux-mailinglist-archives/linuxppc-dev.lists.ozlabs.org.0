Return-Path: <linuxppc-dev+bounces-5729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38405A23987
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 07:30:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkmGl2XcGz30VX;
	Fri, 31 Jan 2025 17:30:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738305022;
	cv=none; b=IOQIa8TVc15/klbEYuR/tpbpvf5KFlQWItZpxiVO2nzwgnxHI18uDJCZkcKPvG2r0Rk2DGWBAgQlU7gae8A0QvxeA3uyM2L3vyqAnKp6fbrGmFWa7qYDNgjzNNUYzCE94/INVm+vycB2kUaWUqaPwL+Y+puJVR/tfWB1Mn6JIXTnzM8o+Xz37YWQ8AiU0RJUuT8MKR7UexMsyicSOx0B1oJlal10broXwU2AK5Btka/wVvSYzFzCsmC8KqhSshGe4srAdZtPNnGVC2RPHjYVoDLZeZQZyhNmieaEaf5ASAHS9vOvAW2WJHSLLMWyawOCtJYmOAx2QqOmys0VW0IpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738305022; c=relaxed/relaxed;
	bh=btM1dqsM0bQfpgMICr7Lsmytsg24vT3kTq7agVs7U18=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmBGlv2nSRXlg98Wv7XOjspLtaLnH43c5PtnnlB317rLDTUhu0Qotkfig59q5Wn95u5JQ3L0eXzHLpuzuMvfX4tW6bJltkm9ZaWfIt6JvT/WbR4LbVIudy8xPNGrFjlqFBx3YUGBElHhPJ0NqRbd0ycmAhQTOK3ysQLtokK9s1jJ56t+xvjk6cIBI3dN6FQYdl0qGSHl+bJqlivQ3O05Vo4VTQaraThqItsBfiS8S7yP74mTAgPjFwMBGWGRgCTetkrJz3ghBwOYsGG000PRQN37zveFk5DpkMxB0MVnQxGhwNzlMDqwosJP8dJE7iGoBMBHUsbDT2/EmIHKz39dxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=IzCzBOHX; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=IzCzBOHX;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkmGk0YpMz2ywS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 17:30:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738305012;
	bh=btM1dqsM0bQfpgMICr7Lsmytsg24vT3kTq7agVs7U18=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=IzCzBOHXq0qE1Z+F2Rn2QVDD46Aqthv2CIXtlmjgxmwG8asW3hpjya5M54iD76VCZ
	 JdY885MgjIsw4+Fh4nUab0BavnyFqDY/RUFcBkXWKoMam+knzLinxB6h7Vkn1h9c4G
	 m5njGXT9GpXB88KsPSmZt3cNwNcFNDMQTbXPucY1eSTQmW/kivFd7Puz+P5Jf+qWgE
	 HWpVWoUGjf2OOXoChy121nLWNcKJGawbXEMBioIFb2umziLD6FQUe8buRdnS/dHMwq
	 deyUI/iPVNGlzUm2IfzvvvJwFJLL2hqpjkLaOLjaf8YpUnIc7Pr/BzDQ36L7J9ZCkO
	 JHDiKmxyov++A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YkmGX1Xlzz4wgp; Fri, 31 Jan 2025 17:30:12 +1100 (AEDT)
Date: Fri, 31 Jan 2025 17:30:09 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/5] powerpc/microwatt: Add SMP support
Message-ID: <Z5xt8aooKyXZv6Kf@thinks.paulus.ozlabs.org>
References: <Z5xtIVa0y7lTDTU3@thinks.paulus.ozlabs.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5xtIVa0y7lTDTU3@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This adds support for Microwatt systems with more than one core, and
updates the device tree for a 2-core version.

The secondary CPUs are started and sent to spin in __secondary_hold
very early on, in the platform probe function.  The reason for doing
this is so that they are there when smp_release_cpus() gets called,
which is before the platform init_smp function or even the platform
setup_arch function gets called.

Note that having two CPUs in the device tree doesn't preclude
operation with only one CPU.  The SYSCON_CPU_CTRL register has a
read-only field which indicates the number of CPU cores, so
microwatt_init_smp() will only start as many CPU cores as are present
in the system, and any extra CPU device-tree nodes will just be
ignored.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
v2: Addressed review comments
 - use IS_ENABLED()
 - define and use SYSCON_LENGTH
 - use PPC_RAW_MFSPR and PPC_RAW_BRANCH

 arch/powerpc/boot/dts/microwatt.dts          | 34 ++++++++-
 arch/powerpc/platforms/microwatt/Kconfig     |  2 +-
 arch/powerpc/platforms/microwatt/Makefile    |  1 +
 arch/powerpc/platforms/microwatt/microwatt.h |  1 +
 arch/powerpc/platforms/microwatt/setup.c     |  9 +++
 arch/powerpc/platforms/microwatt/smp.c       | 80 ++++++++++++++++++++
 6 files changed, 124 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/platforms/microwatt/smp.c

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index 833d22822189..c4e4d2a9b460 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -142,6 +142,36 @@ PowerPC,Microwatt@0 {
 			ibm,mmu-lpid-bits = <12>;
 			ibm,mmu-pid-bits = <20>;
 		};
+
+		PowerPC,Microwatt@1 {
+			i-cache-sets = <2>;
+			ibm,dec-bits = <64>;
+			reservation-granule-size = <64>;
+			clock-frequency = <100000000>;
+			timebase-frequency = <100000000>;
+			i-tlb-sets = <1>;
+			ibm,ppc-interrupt-server#s = <1>;
+			i-cache-block-size = <64>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <2>;
+			i-tlb-size = <64>;
+			cpu-version = <0x990000>;
+			status = "okay";
+			i-cache-size = <0x1000>;
+			ibm,processor-radix-AP-encodings = <0x0c 0xa0000010 0x20000015 0x4000001e>;
+			tlb-size = <0>;
+			tlb-sets = <0>;
+			device_type = "cpu";
+			d-tlb-size = <128>;
+			d-tlb-sets = <2>;
+			reg = <1>;
+			general-purpose;
+			64-bit;
+			d-cache-size = <0x1000>;
+			ibm,chip-id = <0>;
+			ibm,mmu-lpid-bits = <12>;
+			ibm,mmu-pid-bits = <20>;
+		};
 	};
 
 	soc@c0000000 {
@@ -154,8 +184,8 @@ soc@c0000000 {
 
 		interrupt-controller@4000 {
 			compatible = "openpower,xics-presentation", "ibm,ppc-xicp";
-			ibm,interrupt-server-ranges = <0x0 0x1>;
-			reg = <0x4000 0x100>;
+			ibm,interrupt-server-ranges = <0x0 0x2>;
+			reg = <0x4000 0x10 0x4010 0x10>;
 		};
 
 		ICS: interrupt-controller@5000 {
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index 5e41adadac1f..cb2aff635bb0 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 config PPC_MICROWATT
-	depends on PPC_BOOK3S_64 && !SMP
+	depends on PPC_BOOK3S_64
 	bool "Microwatt SoC platform"
 	select PPC_XICS
 	select PPC_ICS_NATIVE
diff --git a/arch/powerpc/platforms/microwatt/Makefile b/arch/powerpc/platforms/microwatt/Makefile
index 116d6d3ad3f0..d973b2ab4042 100644
--- a/arch/powerpc/platforms/microwatt/Makefile
+++ b/arch/powerpc/platforms/microwatt/Makefile
@@ -1 +1,2 @@
 obj-y	+= setup.o rng.o
+obj-$(CONFIG_SMP) += smp.o
diff --git a/arch/powerpc/platforms/microwatt/microwatt.h b/arch/powerpc/platforms/microwatt/microwatt.h
index 335417e95e66..891aa2800768 100644
--- a/arch/powerpc/platforms/microwatt/microwatt.h
+++ b/arch/powerpc/platforms/microwatt/microwatt.h
@@ -3,5 +3,6 @@
 #define _MICROWATT_H
 
 void microwatt_rng_init(void);
+void microwatt_init_smp(void);
 
 #endif /* _MICROWATT_H */
diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
index a942c446aeab..6af2ccef736c 100644
--- a/arch/powerpc/platforms/microwatt/setup.c
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -29,6 +29,14 @@ static int __init microwatt_populate(void)
 }
 machine_arch_initcall(microwatt, microwatt_populate);
 
+static int __init microwatt_probe(void)
+{
+	/* Main reason for having this is to start the other CPU(s) */
+	if (IS_ENABLED(CONFIG_SMP))
+		microwatt_init_smp();
+	return 1;
+}
+
 static void __init microwatt_setup_arch(void)
 {
 	microwatt_rng_init();
@@ -45,6 +53,7 @@ static void microwatt_idle(void)
 define_machine(microwatt) {
 	.name			= "microwatt",
 	.compatible		= "microwatt-soc",
+	.probe			= microwatt_probe,
 	.init_IRQ		= microwatt_init_IRQ,
 	.setup_arch		= microwatt_setup_arch,
 	.progress		= udbg_progress,
diff --git a/arch/powerpc/platforms/microwatt/smp.c b/arch/powerpc/platforms/microwatt/smp.c
new file mode 100644
index 000000000000..7dbf2ca73d47
--- /dev/null
+++ b/arch/powerpc/platforms/microwatt/smp.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/*
+ * SMP support functions for Microwatt
+ * Copyright 2025 Paul Mackerras <paulus@ozlabs.org>
+ */
+
+#include <linux/kernel.h>
+#include <linux/smp.h>
+#include <linux/io.h>
+#include <asm/early_ioremap.h>
+#include <asm/ppc-opcode.h>
+#include <asm/reg.h>
+#include <asm/smp.h>
+#include <asm/xics.h>
+
+#include "microwatt.h"
+
+static void __init microwatt_smp_probe(void)
+{
+	xics_smp_probe();
+}
+
+static void microwatt_smp_setup_cpu(int cpu)
+{
+	if (cpu != 0)
+		xics_setup_cpu();
+}
+
+static struct smp_ops_t microwatt_smp_ops = {
+	.probe		= microwatt_smp_probe,
+	.message_pass	= NULL,		/* Use smp_muxed_ipi_message_pass */
+	.kick_cpu	= smp_generic_kick_cpu,
+	.setup_cpu	= microwatt_smp_setup_cpu,
+};
+
+/* XXX get from device tree */
+#define SYSCON_BASE	0xc0000000
+#define SYSCON_LENGTH	0x100
+
+#define SYSCON_CPU_CTRL	0x58
+
+void __init microwatt_init_smp(void)
+{
+	volatile unsigned char __iomem *syscon;
+	int ncpus;
+	int timeout;
+
+	syscon = early_ioremap(SYSCON_BASE, SYSCON_LENGTH);
+	if (syscon == NULL) {
+		pr_err("Failed to map SYSCON\n");
+		return;
+	}
+	ncpus = (readl(syscon + SYSCON_CPU_CTRL) >> 8) & 0xff;
+	if (ncpus < 2)
+		goto out;
+
+	smp_ops = &microwatt_smp_ops;
+
+	/*
+	 * Write two instructions at location 0:
+	 * mfspr r3, PIR
+	 * b __secondary_hold
+	 */
+	*(unsigned int *)KERNELBASE = PPC_RAW_MFSPR(3, SPRN_PIR);
+	*(unsigned int *)(KERNELBASE+4) = PPC_RAW_BRANCH(&__secondary_hold - (char *)(KERNELBASE+4));
+
+	/* enable the other CPUs, they start at location 0 */
+	writel((1ul << ncpus) - 1, syscon + SYSCON_CPU_CTRL);
+
+	timeout = 10000;
+	while (!__secondary_hold_acknowledge) {
+		if (--timeout == 0)
+			break;
+		barrier();
+	}
+
+ out:
+	early_iounmap((void *)syscon, SYSCON_LENGTH);
+}
-- 
2.47.1



