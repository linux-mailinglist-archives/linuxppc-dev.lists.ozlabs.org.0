Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DB61CBDA1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 07:07:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JwDd2ZLdzDr9y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 15:07:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JwBH27BczDr2p
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 15:05:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=IAt+sbGW; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49JwBH09FFz9sT6; Sat,  9 May 2020 15:05:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 49JwBG2h18z9sSt; Sat,  9 May 2020 15:05:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1589000726; bh=Pb4GlTVyBO3ZbDiPQD2yApf8GXzqR8eKfxsf99d1p1U=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=IAt+sbGWKz4+smwgeJXmDZBQBmmRhtByXt/0HjaBwhJyZeolsMOMcORRpk583IKZ+
 isNsW2bT6/JdPdwclzUqUiVpf0Jovzo+/XMCdfZc3kRxQ24xfy/3Y7J41pJWPFIMTD
 sHoNld8Bzik2kR+u0iVqNvNk2Rcoy4befdaSAhYNpkM4eUg6Zwxdm7TW3MWhfOMs4d
 z+BfD8HBJ6XwCALUFQi3nxc2Ko7D2Zblqa3kNFspMFrYVjsVckpIx82tnUsCreQ/co
 +Pto0su5Ht8MB5rK3bwZdzQR3Z9hHiK4alBxE3x7GZ9uzfHQcuHsoeJH48aBgY2xxC
 30D0CaJ5sd30g==
Date: Sat, 9 May 2020 15:03:40 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org, Benjamin Herrenschmidt <benh@ozlabs.org>,
 Michael Neuling <mikey@neuling.org>, Anton Blanchard <anton@ozlabs.org>
Subject: [PATCH RFC 3/4] powerpc/microwatt: Add early debug UART support for
 Microwatt
Message-ID: <20200509050340.GD1464954@thinks.paulus.ozlabs.org>
References: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
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

Currently microwatt-based SoCs come with a "potato" UART.  This
adds udbg support for the potato UART, giving us both an early
debug console, and a runtime console using the hvc-udbg support.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/Kconfig.debug               |   6 ++
 arch/powerpc/include/asm/udbg.h          |   1 +
 arch/powerpc/kernel/udbg.c               |   2 +
 arch/powerpc/platforms/microwatt/setup.c | 108 +++++++++++++++++++++++
 4 files changed, 117 insertions(+)

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 0b063830eea8..399abc6d2af7 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -277,6 +277,12 @@ config PPC_EARLY_DEBUG_MEMCONS
 	  This console provides input and output buffers stored within the
 	  kernel BSS and should be safe to select on any system. A debugger
 	  can then be used to read kernel output or send input to the console.
+
+config PPC_EARLY_DEBUG_MICROWATT
+       bool "Microwatt potato UART"
+       help
+         Select this to enable early debugging using the potato UART
+	 included in the Microwatt SOC.
 endchoice
 
 config PPC_MEMCONS_OUTPUT_SIZE
diff --git a/arch/powerpc/include/asm/udbg.h b/arch/powerpc/include/asm/udbg.h
index 0ea9e70ed78b..2dbd2d3b0591 100644
--- a/arch/powerpc/include/asm/udbg.h
+++ b/arch/powerpc/include/asm/udbg.h
@@ -53,6 +53,7 @@ extern void __init udbg_init_ehv_bc(void);
 extern void __init udbg_init_ps3gelic(void);
 extern void __init udbg_init_debug_opal_raw(void);
 extern void __init udbg_init_debug_opal_hvsi(void);
+extern void __init udbg_init_debug_microwatt(void);
 
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_UDBG_H */
diff --git a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
index 01595e8cafe7..e614993021c6 100644
--- a/arch/powerpc/kernel/udbg.c
+++ b/arch/powerpc/kernel/udbg.c
@@ -67,6 +67,8 @@ void __init udbg_early_init(void)
 	udbg_init_debug_opal_raw();
 #elif defined(CONFIG_PPC_EARLY_DEBUG_OPAL_HVSI)
 	udbg_init_debug_opal_hvsi();
+#elif defined(CONFIG_PPC_EARLY_DEBUG_MICROWATT)
+	udbg_init_debug_microwatt();
 #endif
 
 #ifdef CONFIG_PPC_EARLY_DEBUG
diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
index 3cfc5955a6fe..a5145adeaae7 100644
--- a/arch/powerpc/platforms/microwatt/setup.c
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -10,8 +10,115 @@
 #include <linux/init.h>
 #include <linux/of.h>
 #include <asm/machdep.h>
+#include <asm/udbg.h>
+#include <asm/reg.h>
 #include <asm/time.h>
 
+static u64 potato_uart_base;
+
+#define PROC_FREQ 100000000
+#define UART_FREQ 115200
+#define UART_BASE 0xc0002000
+
+#define POTATO_CONSOLE_TX		0x00
+#define POTATO_CONSOLE_RX		0x08
+#define POTATO_CONSOLE_STATUS		0x10
+#define   POTATO_CONSOLE_STATUS_RX_EMPTY		0x01
+#define   POTATO_CONSOLE_STATUS_TX_EMPTY		0x02
+#define   POTATO_CONSOLE_STATUS_RX_FULL			0x04
+#define   POTATO_CONSOLE_STATUS_TX_FULL			0x08
+#define POTATO_CONSOLE_CLOCK_DIV	0x18
+#define POTATO_CONSOLE_IRQ_EN		0x20
+
+static u64 potato_uart_reg_read(int offset)
+{
+	u64 val, msr;
+
+	msr = mfmsr();
+	__asm__ volatile("mtmsrd %3,0; ldcix %0,%1,%2; mtmsrd %4,0"
+			 : "=r" (val) : "b" (potato_uart_base), "r" (offset),
+			   "r" (msr & ~MSR_DR), "r" (msr));
+
+	return val;
+}
+
+static void potato_uart_reg_write(int offset, u64 val)
+{
+	u64 msr;
+
+	msr = mfmsr();
+	__asm__ volatile("mtmsrd %3,0; stdcix %0,%1,%2; mtmsrd %4,0"
+			 : : "r" (val), "b" (potato_uart_base), "r" (offset),
+			   "r" (msr & ~MSR_DR), "r" (msr));
+}
+
+static int potato_uart_rx_empty(void)
+{
+	u64 val;
+
+	val = potato_uart_reg_read(POTATO_CONSOLE_STATUS);
+
+	if (val & POTATO_CONSOLE_STATUS_RX_EMPTY)
+		return 1;
+
+	return 0;
+}
+
+static int potato_uart_tx_full(void)
+{
+	u64 val;
+
+	val = potato_uart_reg_read(POTATO_CONSOLE_STATUS);
+
+	if (val & POTATO_CONSOLE_STATUS_TX_FULL)
+		return 1;
+
+	return 0;
+}
+
+static int potato_uart_read(void)
+{
+	while (potato_uart_rx_empty())
+		;
+	return potato_uart_reg_read(POTATO_CONSOLE_RX);
+}
+
+static int potato_uart_read_poll(void)
+{
+	if (potato_uart_rx_empty())
+		return -1;
+	return potato_uart_reg_read(POTATO_CONSOLE_RX);
+}
+
+static void potato_uart_write(char c)
+{
+	if (c == '\n')
+		potato_uart_write('\r');
+	while (potato_uart_tx_full())
+		;
+	potato_uart_reg_write(POTATO_CONSOLE_TX, c);
+}
+
+static unsigned long potato_uart_divisor(unsigned long proc_freq, unsigned long uart_freq)
+{
+	return proc_freq / (uart_freq * 16) - 1;
+}
+
+void potato_uart_init(void)
+{
+	potato_uart_base = UART_BASE;
+
+	potato_uart_reg_write(POTATO_CONSOLE_CLOCK_DIV, potato_uart_divisor(PROC_FREQ, UART_FREQ));
+}
+
+void udbg_init_debug_microwatt(void)
+{
+	potato_uart_init();
+	udbg_putc = potato_uart_write;
+	udbg_getc = potato_uart_read;
+	udbg_getc_poll = potato_uart_read_poll;
+}
+
 static void __init microwatt_calibrate_decr(void)
 {
 	ppc_tb_freq = 100000000;
@@ -36,5 +143,6 @@ define_machine(microwatt) {
 	.probe			= microwatt_probe,
 	.setup_arch		= microwatt_setup_arch,
 	.init_IRQ		= microwatt_init_IRQ,
+	.progress		= udbg_progress,
 	.calibrate_decr		= microwatt_calibrate_decr,
 };
-- 
2.25.3

