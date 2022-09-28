Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 597B65EDDF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 15:42:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McyMt1pqFz3drM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 23:42:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i4YCUIZA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McyL85ffmz3bkb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 23:40:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i4YCUIZA;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4McyL65c8Zz4xGQ;
	Wed, 28 Sep 2022 23:40:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664372430;
	bh=/lNEJmTqE4KJ0mXO03cJ7YzFkVHxeI96IWFG2LDU56Q=;
	h=From:To:Subject:Date:From;
	b=i4YCUIZAaLz17ulYzn+SwmuNEJb67OYEjRJ4H2gghGsC5dBKT3EhaQ5URkuxxBxfN
	 YzNct5k9A8PnxZ3t2c1pdgTpPEdKOlluwjqny4c4GblxJG4FTIJ9tVTkb2qHMRwHCV
	 TYAghR7nbT0hhHAlLQQeYmHd785hZZNmHT76OxsT5qY6qFDNq3puAVlTVQp0qeWJZa
	 sIBNZrfDTLCv50dPcn4i2EiqTkQgAQdMLIQ2vvxegb2+QruvHBK+uOZ5YkuNnIXOp+
	 8YjY740MxFGFrSHrMiNCen7azpeRG35XRgQiV/Fcr5hc3/dwcE2A1LqbrGItGoD3Cz
	 oBvQddkXwT9oQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/6] powerpc: Add ppc_md.name to dump stack arch description
Date: Wed, 28 Sep 2022 23:40:20 +1000
Message-Id: <20220928134025.1739909-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As soon as we know the name of the machine description we're using,
add it to the dump stack arch description, which is printed in case of
an oops.

eg: Hardware name: ... machine:pSeries

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/setup.h   |  2 ++
 arch/powerpc/kernel/setup-common.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index 85143849a586..e29e83f8a89c 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -88,6 +88,8 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
 			       unsigned long pp, unsigned long r6,
 			       unsigned long r7, unsigned long kbase);
 
+extern struct seq_buf ppc_hw_desc;
+
 #endif /* !__ASSEMBLY__ */
 
 #endif	/* _ASM_POWERPC_SETUP_H */
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index dd98f43bd685..42279c3f1d31 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/initrd.h>
 #include <linux/platform_device.h>
+#include <linux/printk.h>
 #include <linux/seq_file.h>
 #include <linux/ioport.h>
 #include <linux/console.h>
@@ -25,6 +26,7 @@
 #include <linux/root_dev.h>
 #include <linux/cpu.h>
 #include <linux/unistd.h>
+#include <linux/seq_buf.h>
 #include <linux/serial.h>
 #include <linux/serial_8250.h>
 #include <linux/percpu.h>
@@ -588,6 +590,15 @@ static __init int add_pcspkr(void)
 device_initcall(add_pcspkr);
 #endif	/* CONFIG_PCSPKR_PLATFORM */
 
+static char ppc_hw_desc_buf[128] __initdata;
+
+struct seq_buf ppc_hw_desc __initdata = {
+	.buffer = ppc_hw_desc_buf,
+	.size = sizeof(ppc_hw_desc_buf),
+	.len = 0,
+	.readpos = 0,
+};
+
 static __init void probe_machine(void)
 {
 	extern struct machdep_calls __machine_desc_start;
@@ -628,6 +639,9 @@ static __init void probe_machine(void)
 		for (;;);
 	}
 
+	seq_buf_printf(&ppc_hw_desc,"machine:%s ", ppc_md.name);
+	dump_stack_set_arch_desc(ppc_hw_desc.buffer);
+
 	printk(KERN_INFO "Using %s machine description\n", ppc_md.name);
 }
 
-- 
2.37.3

