Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D63D3AC19E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 05:52:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5lPM0NvNz3clQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 13:52:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=Lw07gTLL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=Lw07gTLL; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lML6d69z3c1J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 13:50:54 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G5lMK71F4z9s5R; Fri, 18 Jun 2021 13:50:53 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G5lMK6cqKz9sXN; Fri, 18 Jun 2021 13:50:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623988253; bh=pPeIwAYsFK5G6HHV5Zt1wR6C3P/KGMWQjO9rROVelYM=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Lw07gTLL+A6SqqL+Gq1TamB77faauT4OVn0j8LFpthmHJ/pIzl1K3upU8+ZGGYSMt
 Oi0tujJ4TBsdOuS+eW86WryiYAlVFz1yWqSCgT5McbF3tE1bCN4IuQSwWDH6edwfTj
 xOMYisvlZ8N1GgVfSEZcWUt9tUryZyso+YQ0agdNjCVbIbnQIy2U53Vj5GjZg7xx12
 OD2f1rHCArHje32Ou6EHg24N0bcdbx931rKrUo7cjzjp/+Jj05hJi48SiOLGRneWOh
 wwRb6p+S5NNwcXQcP67tIw2dJGJeo+38AXVEWM940ryAswFt/F1zv8KGnlbkxzc2Ev
 r1kodp4JN6AJg==
Date: Fri, 18 Jun 2021 13:46:32 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 5/9] powerpc/microwatt: Use standard 16550 UART for console
Message-ID: <YMwXGCTzedpQje7r@thinks.paulus.ozlabs.org>
References: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
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

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>

This adds support to the Microwatt platform to use the standard
16550-style UART which available in the standalone Microwatt FPGA.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/boot/dts/microwatt.dts      | 27 ++++++++++++----
 arch/powerpc/kernel/udbg_16550.c         | 39 ++++++++++++++++++++++++
 arch/powerpc/platforms/microwatt/Kconfig |  1 +
 arch/powerpc/platforms/microwatt/setup.c |  2 ++
 4 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index 04e5dd92270e..974abbdda249 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -6,6 +6,10 @@ / {
 	model-name = "microwatt";
 	compatible = "microwatt-soc";
 
+	aliases {
+		serial0 = &UART0;
+	};
+
 	reserved-memory {
 		#size-cells = <0x02>;
 		#address-cells = <0x02>;
@@ -89,12 +93,6 @@ PowerPC,Microwatt@0 {
 		};
 	};
 
-	chosen {
-		bootargs = "";
-		ibm,architecture-vec-5 = [19 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00
-					  00 00 00 00 00 00 00 00 40 00 40];
-	};
-
 	soc@c0000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -119,5 +117,22 @@ ICS: interrupt-controller@5000 {
 			#interrupt-cells = <2>;
 		};
 
+		UART0: serial@2000 {
+			device_type = "serial";
+			compatible = "ns16550";
+			reg = <0x2000 0x8>;
+			clock-frequency = <100000000>;
+			current-speed = <115200>;
+			reg-shift = <2>;
+			fifo-size = <16>;
+			interrupts = <0x10 0x1>;
+		};
+	};
+
+	chosen {
+		bootargs = "";
+		ibm,architecture-vec-5 = [19 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00
+					  00 00 00 00 00 00 00 00 40 00 40];
+		stdout-path = &UART0;
 	};
 };
diff --git a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel/udbg_16550.c
index 9356b60d6030..8513aa49614e 100644
--- a/arch/powerpc/kernel/udbg_16550.c
+++ b/arch/powerpc/kernel/udbg_16550.c
@@ -296,3 +296,42 @@ void __init udbg_init_40x_realmode(void)
 }
 
 #endif /* CONFIG_PPC_EARLY_DEBUG_40x */
+
+#ifdef CONFIG_PPC_EARLY_DEBUG_MICROWATT
+
+#define UDBG_UART_MW_ADDR	((void __iomem *)0xc0002000)
+
+static u8 udbg_uart_in_isa300_rm(unsigned int reg)
+{
+	uint64_t msr = mfmsr();
+	uint8_t  c;
+
+	mtmsr(msr & ~(MSR_EE|MSR_DR));
+	isync();
+	eieio();
+	c = __raw_rm_readb(UDBG_UART_MW_ADDR + (reg << 2));
+	mtmsr(msr);
+	isync();
+	return c;
+}
+
+static void udbg_uart_out_isa300_rm(unsigned int reg, u8 val)
+{
+	uint64_t msr = mfmsr();
+
+	mtmsr(msr & ~(MSR_EE|MSR_DR));
+	isync();
+	eieio();
+	__raw_rm_writeb(val, UDBG_UART_MW_ADDR + (reg << 2));
+	mtmsr(msr);
+	isync();
+}
+
+void __init udbg_init_debug_microwatt(void)
+{
+	udbg_uart_in = udbg_uart_in_isa300_rm;
+	udbg_uart_out = udbg_uart_out_isa300_rm;
+	udbg_use_uart();
+}
+
+#endif /* CONFIG_PPC_EARLY_DEBUG_MICROWATT */
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index b52c869c0eb8..50ed0cedb5f1 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -6,6 +6,7 @@ config PPC_MICROWATT
 	select PPC_ICS_NATIVE
 	select PPC_ICP_NATIVE
 	select PPC_NATIVE
+	select PPC_UDBG_16550
 	help
           This option enables support for FPGA-based Microwatt implementations.
 
diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
index 1c1b7791fa57..0b02603bdb74 100644
--- a/arch/powerpc/platforms/microwatt/setup.c
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -14,6 +14,7 @@
 #include <asm/machdep.h>
 #include <asm/time.h>
 #include <asm/xics.h>
+#include <asm/udbg.h>
 
 static void __init microwatt_init_IRQ(void)
 {
@@ -35,5 +36,6 @@ define_machine(microwatt) {
 	.name			= "microwatt",
 	.probe			= microwatt_probe,
 	.init_IRQ		= microwatt_init_IRQ,
+	.progress		= udbg_progress,
 	.calibrate_decr		= generic_calibrate_decr,
 };
-- 
2.31.1

