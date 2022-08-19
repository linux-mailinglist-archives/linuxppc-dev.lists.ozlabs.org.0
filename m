Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B737259A77D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 23:13:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8ZHW5tpRz3dx9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 07:13:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qjQUXq8n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qjQUXq8n;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8ZGq6cxVz3bPP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 07:13:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB982616E4;
	Fri, 19 Aug 2022 21:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAA1C433B5;
	Fri, 19 Aug 2022 21:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660943583;
	bh=+Rvw9vn0HtDtyc7wIEhqRjcE8VcOb2fJ7652n66XI/k=;
	h=From:To:Cc:Subject:Date:From;
	b=qjQUXq8ne3MVJz1PvvEuCrv9H6+PbsCnaxvUgGkgZAX+3JDFxZW1i5pNAJLp6aDBN
	 Eix6ZeHtL9VxU26NZFGmg6S5JY+FzjdjJJGLCFljW0opnATM4vXm9LGRQr1IG95nRq
	 xwhFWEl24xKndOWF/L0QLHL8338BrCxjNyn3HcpU9JNAMb1VJEXMOLrtnPjIITyPPg
	 DmTyhmkTf6AuZkKe49lfaz2j4UZ+m+UjYdNSpZOlFAopXnI4xPsCFfqiKtJd82rl1z
	 3xTcXmH3quaUfsOetDSMeHHQ97EDal8/Ui8zV6NPnimLKXVBGv2ds5d4lYs1OuFEvA
	 DLg+S6zZWhXGw==
Received: by pali.im (Postfix)
	id E674B761; Fri, 19 Aug 2022 23:12:59 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Nick Child <nick.child@ibm.com>
Subject: [PATCH] powerpc: Add support for early debugging via Serial 16550 console
Date: Fri, 19 Aug 2022 23:12:54 +0200
Message-Id: <20220819211254.22192-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently powerpc early debugging contains lot of platform specific
options, but does not support standard UART / serial 16550 console.

Later legacy_serial.c code supports registering UART as early debug console
from device tree but it is not early during booting, but rather later after
machine description code finishes.

So for real early debugging via UART is current code unsuitable.

Add support for new early debugging option CONFIG_PPC_EARLY_DEBUG_16550
which enable Serial 16550 console on address defined by new option
CONFIG_PPC_EARLY_DEBUG_16550_PHYSADDR and by stride by option
CONFIG_PPC_EARLY_DEBUG_16550_STRIDE.

With this change it is possible to debug powerpc machine descriptor code.
For example this early debugging code can print on serial console also
"No suitable machine description found" error which is done before
legacy_serial.c code.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
Tested on P2020 board. It allowed me do debug and implement this patch series:
https://lore.kernel.org/linuxppc-dev/20220819191557.28116-1-pali@kernel.org/
---
 arch/powerpc/Kconfig.debug       | 14 ++++++++++++++
 arch/powerpc/include/asm/udbg.h  |  1 +
 arch/powerpc/kernel/udbg.c       |  2 ++
 arch/powerpc/kernel/udbg_16550.c | 33 ++++++++++++++++++++++++++++++++
 4 files changed, 50 insertions(+)

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 9f363c143d86..a4e7d90a45d2 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -276,6 +276,11 @@ config PPC_EARLY_DEBUG_OPAL_HVSI
 	  Select this to enable early debugging for the PowerNV platform
 	  using an "hvsi" console
 
+config PPC_EARLY_DEBUG_16550
+	bool "Serial 16550"
+	help
+	  Select this to enable early debugging via Serial 16550 console
+
 config PPC_EARLY_DEBUG_MEMCONS
 	bool "In memory console"
 	help
@@ -355,6 +360,15 @@ config PPC_EARLY_DEBUG_CPM_ADDR
 	  platform probing is done, all platforms selected must
 	  share the same address.
 
+config PPC_EARLY_DEBUG_16550_PHYSADDR
+	hex "Early debug Serial 16550 physical address"
+	depends on PPC_EARLY_DEBUG_16550
+
+config PPC_EARLY_DEBUG_16550_STRIDE
+	int "Early debug Serial 16550 stride"
+	depends on PPC_EARLY_DEBUG_16550
+	default 1
+
 config FAIL_IOMMU
 	bool "Fault-injection capability for IOMMU"
 	depends on FAULT_INJECTION
diff --git a/arch/powerpc/include/asm/udbg.h b/arch/powerpc/include/asm/udbg.h
index b4aa0d88ce2c..20b5a37ab772 100644
--- a/arch/powerpc/include/asm/udbg.h
+++ b/arch/powerpc/include/asm/udbg.h
@@ -53,6 +53,7 @@ extern void __init udbg_init_ehv_bc(void);
 extern void __init udbg_init_ps3gelic(void);
 extern void __init udbg_init_debug_opal_raw(void);
 extern void __init udbg_init_debug_opal_hvsi(void);
+extern void __init udbg_init_debug_16550(void);
 
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_UDBG_H */
diff --git a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
index b1544b2f6321..92b3fc258d11 100644
--- a/arch/powerpc/kernel/udbg.c
+++ b/arch/powerpc/kernel/udbg.c
@@ -67,6 +67,8 @@ void __init udbg_early_init(void)
 	udbg_init_debug_opal_raw();
 #elif defined(CONFIG_PPC_EARLY_DEBUG_OPAL_HVSI)
 	udbg_init_debug_opal_hvsi();
+#elif defined(CONFIG_PPC_EARLY_DEBUG_16550)
+	udbg_init_debug_16550();
 #endif
 
 #ifdef CONFIG_PPC_EARLY_DEBUG
diff --git a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel/udbg_16550.c
index d3942de254c6..46f2d831d7c9 100644
--- a/arch/powerpc/kernel/udbg_16550.c
+++ b/arch/powerpc/kernel/udbg_16550.c
@@ -8,6 +8,7 @@
 #include <asm/udbg.h>
 #include <asm/io.h>
 #include <asm/reg_a2.h>
+#include <asm/early_ioremap.h>
 
 extern u8 real_readb(volatile u8 __iomem  *addr);
 extern void real_writeb(u8 data, volatile u8 __iomem *addr);
@@ -335,3 +336,35 @@ void __init udbg_init_debug_microwatt(void)
 }
 
 #endif /* CONFIG_PPC_EARLY_DEBUG_MICROWATT */
+
+#ifdef CONFIG_PPC_EARLY_DEBUG_16550
+
+static void __iomem *udbg_uart_early_addr;
+
+void __init udbg_init_debug_16550(void)
+{
+	udbg_uart_early_addr = early_ioremap(CONFIG_PPC_EARLY_DEBUG_16550_PHYSADDR, 0x1000);
+	udbg_uart_init_mmio(udbg_uart_early_addr, CONFIG_PPC_EARLY_DEBUG_16550_STRIDE);
+}
+
+static int __init udbg_init_debug_16550_ioremap(void)
+{
+	void __iomem *addr;
+
+	if (!udbg_uart_early_addr)
+		return 0;
+
+	addr = ioremap(CONFIG_PPC_EARLY_DEBUG_16550_PHYSADDR, 0x1000);
+	if (WARN_ON(!addr))
+		return -ENOMEM;
+
+	udbg_uart_init_mmio(addr, CONFIG_PPC_EARLY_DEBUG_16550_STRIDE);
+	early_iounmap(udbg_uart_early_addr, 0x1000);
+	udbg_uart_early_addr = NULL;
+
+	return 0;
+}
+
+early_initcall(udbg_init_debug_16550_ioremap);
+
+#endif /* CONFIG_PPC_EARLY_DEBUG_16550 */
-- 
2.20.1

